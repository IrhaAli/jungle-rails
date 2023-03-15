describe('Product Page Tests', () => {
  it("Add item to cart and increase cart items by 1", () => {
    cy.visit('/')
    cy.contains("Add")
    .click({ force: true })
    cy.contains("Cart")
    .contains("1")
  });
})