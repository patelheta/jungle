describe("Navigation from home", () => {
  beforeEach(() => {
    cy.visit("/")
      .contains("Scented Blade")
      .click();
  });

  it("clicking on add to cart increases cart count", () => {
    cy.contains(" My Cart (0) ").should("exist");
    cy.contains("Add").click({ force: true });
    cy.contains(" My Cart (1) ").should("exist");
  });
});