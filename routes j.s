routes/tutorRoutes.js
router.get('/search', async (req, res) => {
    const { subject, level, availability, maxPrice } = req.query;
    let query = {};

    if (subject) query.subjects = { $in: [new RegExp(subject, 'i')] };
    if (level) query.level = level;
    if (availability) query.availability = { $in: [availability] };
    if (maxPrice) query.pricePerHour = { $lte: maxPrice };

    const tutors = await Tutor.find(query);
    res.json(tutors);
});
router.get('/progress/:studentId', async (req, res) => {
    const progress = await Progress.findOne({ studentId: req.params.studentId });
    res.json(progress);
});

router.post('/complete-lesson', async (req, res) => {
    const { studentId, lessonName } = req.body;
    await Progress.findOneAndUpdate(
        { studentId },
        { 
            $inc: { completedLessons: 1 },
            $push: { history: { date: new Date(), lessonName } }
        }
    );
    res.send("Success");
});

router.post('/add-profile', async (req, res) => {
    const newTutor = new Tutor(req.body);
    await newTutor.save();
    res.json(newTutor);
});

router.put('/update/:id', async (req, res) => {
    const updated = await Tutor.findByIdAndUpdate(req.params.id, req.body, { new: true });
    res.json(updated);
});

router.delete('/delete/:id', async (req, res) => {
    await Tutor.findByIdAndDelete(req.params.id);
    res.send("Deleted");
});

const mongoose = require('mongoose');

const tutorSchema = new mongoose.Schema({
    name: { type: String, required: true },
    subjects: [String], 
    level: { type: String, enum: ['School', 'University'] },
    experience: Number,
    pricePerHour: Number,
    availability: { type: String, enum: ['Morning', 'Evening'] },
    qualification: String
});

const progressSchema = new mongoose.Schema({
    studentId: String,
    completedLessons: { type: Number, default: 0 },
    skillImprovement: { type: Number, default: 0 },
    history: [{ lessonName: String, date: { type: Date, default: Date.now } }]
});

const Tutor = mongoose.model('Tutor', tutorSchema);
const Progress = mongoose.model('Progress', progressSchema);

module.exports = { Tutor, Progress };
