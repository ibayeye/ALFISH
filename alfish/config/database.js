const mongoose = require('mongoose');


mongoose.connect('mongodb://localhost:27017/alfish', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => {
  console.log('Connected to MongoDB');
})
.catch((err) => {
  console.error('Error connecting to MongoDB', err);
});

module.exports = mongoose;