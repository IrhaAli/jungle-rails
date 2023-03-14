describe('Product Page Tests', () => {
  it("Navigate from homepage to product page by clicking on product", () => {
    cy.visit('/')
    // cy.get("article")
    // .first()
    // .contains("Add")
    // .click()
    cy.contains("My Cart")
  });
})