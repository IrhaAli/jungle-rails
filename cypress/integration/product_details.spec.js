describe('Product Page Tests', () => {
  it("Navigate from homepage to product page by clicking on product", () => {
    cy.visit('/')
    cy.contains("Giant Tea").click();
    cy.url().should('eq', 'http://127.0.0.1:61707/products/1')
  });
})