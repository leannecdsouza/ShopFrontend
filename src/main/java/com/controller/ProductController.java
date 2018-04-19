package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.leanne.backend.daoimpl.CategoryImpl;
import com.leanne.backend.daoimpl.ProductImpl;
import com.leanne.backend.model.Category;
import com.leanne.backend.model.Product;

@Controller
public class ProductController {

	@Autowired
	private CategoryImpl categoryImpl;

	@Autowired
	private ProductImpl productImpl;

	// Category
	@RequestMapping("/getCategoryForm")
	public String getaddcategory(Model model) {
		model.addAttribute("Category", new Category());
		return "categoryForm";
	}

	@RequestMapping("/saveCategory")
	public String savecategory(@ModelAttribute(name = "category") Category category) {
		categoryImpl.saveCategory(category);
		System.out.println(category.getCategoryName());
		return "redirect:/viewCategory";
	}

	@RequestMapping("/viewCategory")
	public String viewCategory(Model model) {
		List<Category> categories = categoryImpl.listCategory();
		model.addAttribute("categoryList", categories);

		return "viewCategory";
	}

	@RequestMapping("/deleteCategory")
	public String deleteCategory(@RequestParam("categoryId") int categoryId) {
		categoryImpl.deleteCategoryById(categoryId);
		return "redirect:/viewCategory";
	}

	@RequestMapping("/editCategory")
	public String editCategory(@RequestParam("categoryId") int categoryId, Model model) {
		Category category = categoryImpl.getCategoryById(categoryId);
		model.addAttribute("Category", category);
		model.addAttribute("editCategoryClicked", true);
		return "categoryForm";
	}

	// Product
	@RequestMapping("/viewProduct")
	public String viewProduct(Model model) {
		List<Product> products = productImpl.getAllProducts();
		model.addAttribute("productList", products);
		return "viewProduct";
	}

	@RequestMapping("/getproductform")
	public String getaddproduct(Model model) {
		List<Category> categories = categoryImpl.listCategory();
		model.addAttribute("categories", categories);
		model.addAttribute("Product", new Product());
		return "productForm";
	}

	@RequestMapping("/saveproduct")
	public String saveproduct(@ModelAttribute(name = "product") Product product) {
		productImpl.saveProduct(product);
		MultipartFile image = product.getImage();
		Path path = Paths.get(
				"C:\\Users\\Leanne Dsouza\\Documents\\University\\eclipse-workspace\\frontend\\src\\main\\webapp\\resources\\images\\"
						+ product.getProductId() + ".png");
		try {
			image.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(product.getProductName());
		return "redirect:/home";
	}

	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("productId") int productId) {
		productImpl.deleteProductById(productId);
		return "redirect:viewProduct";
	}

	@RequestMapping("/editProduct")
	public String editProduct(@RequestParam("productId") int productId, Model model) {
		Product product = productImpl.getProductById(productId);
		model.addAttribute("Product", product);
		List<Category> categories = categoryImpl.listCategory();
		model.addAttribute("categories", categories);

		model.addAttribute("editProductClicked", true);
		return "productForm";

	}

	// Single Product
	@RequestMapping("/singleProduct")
	public String singleProduct(@RequestParam("productId") int productId, Model model) {
		Product product = productImpl.getProductById(productId);
		model.addAttribute("product", product);
		return "singleProduct";
	}

	// Shop
	@RequestMapping("/shop")
	public String shop(Model model) {
		List<Product> products = productImpl.getAllProducts();
		model.addAttribute("productList", products);
		return "shop";
	}

}
