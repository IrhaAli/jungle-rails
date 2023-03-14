describe('Homepage Tests', () => {
  it('Should visit', () => {
    cy.visit('/')
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})