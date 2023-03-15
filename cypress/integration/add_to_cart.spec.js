describe('Product Page Tests', () => {
  it("Add item to cart and increase cart items by 1", () => {
    cy.visit('/')
    cy.get(':nth-child(1) > div > .button_to > .btn')
    .click()
    // cy.contains("My Cart")
  });
})