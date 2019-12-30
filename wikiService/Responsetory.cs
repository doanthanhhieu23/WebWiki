﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using wikiService.Business;
using wikiService.Dao;
using wikiService.EF;
using wikiService.Models.ModelViewContract;


namespace wikiService
{
    public class Responsetory
    {

        #region user

        public int LoginUser(UserContract userCaContract)
        {
            var result = new LoginBus().UserLogin(userCaContract);
            return result;
        }

        public UserContract CheckRoleUser(UserContract userContract)
        {
            var result = new LoginBus().CheckRoleUser(userContract);
            return result;

        }

        public bool AdminRegister(UserContract userContract)
        {
            return new LoginBus().Register(userContract);
        }

        public bool CheckUserExist(string email)
        {
            return new UserDao().CheckUserExist(email);
        }
        #endregion

        #region category

        public List<CategoryContract> listCategories()
        {
            var data = new CategoryBus().ListCategories();
            return data;

        }
        public bool checkCategoryExist(string categoryName)
        {
            return new CategoryBus().CheckCategoryExist(categoryName);
        }

        public CategoryContract GetDetailCategory(int idCategory)
        {
            return new CategoryBus().GetDetailCategory(idCategory);
        }

        public bool EditCategory(CategoryContract category)
        {
            return new CategoryBus().EditCategory(category);
        }

        public bool DeleteCategory(int id)
        {
            return new CategoryDao().DeleteCategory(id);
        }
        public bool CreateCategory(CategoryContract category)
        {
            return new CategoryBus().CreateCategory(category);
        }
        #endregion
        
        #region product

        public IEnumerable<ProductViewContract> GetAllListProduct()
        {
            return new ProductBus().getAllListProduct();
        }

        public bool checkProductTitleExist(string title)
        {
            return new ProductBus().CheckProductTitleExist(title);
        }

        public bool CreateNewProduct(ProductViewContract product)
        {
            return new ProductBus().CreateProduct(product);
        }

        public ProductViewContract GetDetailProductById(int id)
        {
            return new ProductBus().GetDetailProductById(id);
        }
        public bool DeleteProduct(int id)
        {
            return new ProductBus().DeleteProduct(id);
        }

        public bool EditProduct(ProductViewContract product)
        {
            return new ProductBus().EditProduct(product);
        }
        #endregion



    }
}