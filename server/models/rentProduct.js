const mongoose = require("mongoose");


const rentProductSchema = mongoose.Schema({
  ownerName: {
    type: String,
    // required: true,
    trim: true,
  },

  mobileNo: {
    // required: true,
    trim: true,
    type:Number,
  },

  houseName:{
    type: String,
    // required:true,
    trim:true,
  },

  rent: {
    type: Number,
    // required: true,
    trim: true,
  },

  
  deposit: {
    type: Number,
    // required: true,
    trim: true,
  },

  wifi: {
    type: String,
    // required: true,
    trim: true,
  },


  security: {
    type: String,
    // required: true,
    trim: true,
  },


  parking: {
    type: String,
    // required: true,
    trim: true,
  },

  furnish: {
    type: String,
    // required: true,
    trim: true,
  },


  gender: {
    type: String,
    // required: true,
    trim: true,
  },

  date: {
    type: String,
    // required: true,
    trim: true,
  },
  
  images: [
    {
      type: String,
      required: true,
    },
  ],
  
  category: {
    type: String,
    required: true,
  },
//   ratings: [ratingSchema],
});

const RentProduct = mongoose.model("RentProduct", rentProductSchema);
module.exports = { RentProduct, rentProductSchema };