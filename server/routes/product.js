const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");

productRouter.get("/api/products/", auth, async (req, res) => {
  try {
    console.log(req.query.category);
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/product/", auth, async (req, res) => {
  try {
    console.log(req.query.shopId);
    const products = await Product.find({ shopId: req.query.shopId });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


productRouter.get("/api/products/search/:productName", auth, async (req, res) => {
  try {
    const products = await Product.find({
      productName: { $regex: req.params.productName, $options: "i" },
    });

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = productRouter;