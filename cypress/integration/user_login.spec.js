describe('Product Page Tests', () => {
  it("Sucessfully sign in with a user", () => {
    cy.visit('/login')
    cy.get("input[name=email]").type("bobanderson@gmail.com");
    cy.get("input[name=password]").type("12345678");
    cy.get('.button')
    .last()
    .click()
    cy.contains('Bob');
  });
})