const mongoose = require("mongoose");


const productSchema = mongoose.Schema({
  shopName: {
    type: String,
    // required: true,
    trim: true,
  },

  shopDescription: {
    type: String,
    // required: true,
    trim: true,
  },

  shopId:{
    type: String,
    // required:true,
    trim:true,
  },

  productName: {
    type: String,
    // required: true,
    trim: true,
  },

  
  productDescription: {
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
  quantity: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
//   ratings: [ratingSchema],
});

const Product = mongoose.model("Product", productSchema);
module.exports = { Product, productSchema };