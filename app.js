const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const cookieParser = require('cookie-parser');
const cors = require('cors');

const { getHomePage } = require('./routes/index');
const { getLoginPage, loginUser, addAdmin, getAdminHomePage, logout } = require('./routes/user');
const { getAddDonorPage, addDonorDetails } = require('./routes/donor');
const { getAddRequirementPage, addRequirement, getAssignDonorPage, assignDonor, closeRequirement, getRequirementDetailsPage } = require('./routes/requirement');
const { getClosedRequirementsPage }  = require('./routes/requirement');
const { getAddHospitalPage, addHospital } = require('./routes/hospital');

const { verifyAdmin } = require('./middlewares');

// const { addUser } = require('./addUser');

require('dotenv').config();

const app = express();

// for(let i = 10; i <= 66; i++) {
//     addUser('TVE18CS0' + i, 'cse18' + i);
// }

app.use(cookieParser());
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended : true }));
app.use(express.static(path.join(__dirname, 'public')));

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.get('/', getHomePage);

app.get('/login', getLoginPage);
app.post('/login', loginUser);

app.get('/admin', verifyAdmin, getAdminHomePage);

app.get('/admin/adddonor', verifyAdmin, getAddDonorPage);
app.post('/admin/adddonor', verifyAdmin, addDonorDetails);

app.get('/admin/addrequirement', verifyAdmin, getAddRequirementPage);
app.post('/admin/addrequirement', verifyAdmin, addRequirement);

app.get('/admin/addhospital', verifyAdmin, getAddHospitalPage);
app.post('/admin/addhospital', verifyAdmin, addHospital);

app.get('/admin/closederequirements', verifyAdmin, getClosedRequirementsPage);

app.get('/admin/:requirementid/details', verifyAdmin, getRequirementDetailsPage);


app.get('/admin/:requirementid/assigndonor', verifyAdmin, getAssignDonorPage);
app.get('/admin/:requirementid/assigndonor/:donorid', verifyAdmin, assignDonor);

app.get('/admin/:requirementid/close', verifyAdmin, closeRequirement);

app.post('/student/:username/adddetails', addDonorDetails);

app.get('/logout', logout);

// app.post('/add/admin', addAdmin);


app.listen(process.env.PORT, (err) => {
    if(!err) {
        console.log('Server is running...');
        console.log('Listening to port ' + process.env.PORT);
    } else {
        console.log(err);
    }
})



