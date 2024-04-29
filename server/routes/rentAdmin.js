const express = require("express");
const rentAdminRouter = express.Router();
const rentAdmin = require("../middlewares/rent_admin");
const { RentProduct } = require("../models/rentProduct");


// Add product
rentAdminRouter.post("/rentAdmin/add-product", rentAdmin, async (req, res) => {
  try {
    const { ownerName, mobileNo, houseName , rent , deposit, images, gender, furnish, date , wifi , security , parking, category } = req.body;
    let rentProduct = new RentProduct({
      ownerName,
      mobileNo,
      houseName,
      rent,
      deposit,
      images,
      gender,
      furnish,
      category,
      date,
      wifi,
      security,
      parking,
    });
    rentProduct = await rentProduct.save();
    res.json(rentProduct);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get all your products
rentAdminRouter.get("/rentAdmin/get-products", rentAdmin, async (req, res) => {
  try {
    const rentProduct = await RentProduct.find({});
    res.json(rentProduct);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete the product
rentAdminRouter.post("/rentAdmin/delete-product", rentAdmin, async (req, res) => {
  try {
    const { id } = req.body;
    let rentProduct = await RentProduct.findByIdAndDelete(id);
    res.json(rentProduct);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = rentAdminRouter;