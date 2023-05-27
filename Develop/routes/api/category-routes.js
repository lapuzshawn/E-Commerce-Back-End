const router = require('express').Router();
const { Category, Product } = require('../../models');

// The `/api/categories` endpoint

router.get('/', (req, res) => {
  // find all categories
  // be sure to include its associated Products cd
  Category.findAll({
    include: [
      {
        model: Product,
        attributes: ['id', 'product_name', 'price', 'stock', 'category_id'],
      },
    ],
  })
});

router.get('/:id', (req, res) => {
  // find one category by its `id` value
  // be sure to include its associated Products
  Category.findOne({
    where: {
      id: req.params.id,
    }, 
    include: [
      {
        model: Product,
        attributes: ['id', 'product_name', 'price', 'stock', 'category_id'],
      }
    ]
  })
});

router.post('/', (req, res) => {
  // create a new category
  Category.create(req.body)
  .then((category) => res.status(201).json(category))
  .catch((err) => {
    console.log(err);
    res.status(400).json(err);
  });

});

router.put('/:id', (req, res) => {
  // update a category by its `id` value
  Category.update(req.body, {
    where: {
      id: req.params.id,
      category_name: req.body.category_name,
    },
  })
    .then((category) => {
      if (!category[0]) {
        res.status(404).json({ message: 'No category found with this id' });
        return;
      }
      res.json(category);
    })
  
});

router.delete('/:id', (req, res) => {
  // delete a category by its `id` value
  Category.destroy({
    where: {
      id: req.params.id,
    },    
  }) 
    .then((category) => {
      if (!category) {
        res.status(404).json({ message: 'No category found with this id' });
        return;
      }
      res.json(category);
    })
});

module.exports = router;
