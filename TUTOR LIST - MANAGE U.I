<!DOCTYPE html>
<html>
<head>
    <title>Find Tutors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">

    <h2 class="mb-4">Tutor Discovery</h2>

    <div class="row mb-4">
        <div class="col-md-3">
            <input type="text" class="form-control" placeholder="Search Subject">
        </div>
        <div class="col-md-2">
            <select class="form-select">
                <option>Level</option>
                <option>School</option>
                <option>University</option>
            </select>
        </div>
        <div class="col-md-2">
            <select class="form-select">
                <option>Availability</option>
                <option>Morning</option>
                <option>Evening</option>
            </select>
        </div>
        <div class="col-md-2">
            <input type="number" class="form-control" placeholder="Max Price">
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary w-100">Filter</button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">John Silva</h5>
                    <p class="card-text">ICT | 5 Years Experience</p>
                    <p>Rs. 2000 / hour</p>
                    <a href="tutor-profile.html" class="btn btn-outline-primary">View Profile</a>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
