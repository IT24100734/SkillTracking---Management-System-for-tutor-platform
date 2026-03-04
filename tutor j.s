// models/Tutor.js
const mongoose = require('mongoose');

const TutorSchema = new mongoose.Schema({
    name: String,
    subjects: [String], // ["ICT", "Programming"]
    level: { type: String, enum: ['School', 'University'] },
    experience: Number,
    pricePerHour: Number,
    availability: [String], // ["Morning", "Evening"]
    qualification: String,
    bio: String
});

module.exports = mongoose.model('Tutor', TutorSchema);

// models/Progress.js
const ProgressSchema = new mongoose.Schema({
    studentId: { type: mongoose.Schema.Types.ObjectId, ref: 'Student' },
    completedLessons: { type: Number, default: 0 },
    skillImprovement: { type: Number, default: 0 }, // 0% - 100%
    history: [{ date: Date, lessonName: String }]
});

module.exports = mongoose.model('Progress', ProgressSchema);
