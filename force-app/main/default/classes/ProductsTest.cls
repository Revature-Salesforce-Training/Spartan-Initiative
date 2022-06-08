/* Author: Trenton Teasdale
  Last Modified: 6/7/22
	Controller test for product visualforce page
*/
@isTest
public class ProductsTest {
    @isTest public static void controllerTest(){
        PageReference pageref = Page.ProductPage;
        Test.setCurrentPage(pageref);
        
        ProductController controller = new ProductController();
        List<Droid__c> page = controller.getProducts();
}
}