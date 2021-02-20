window.addEventListener("DOMContentLoaded", () => {
const priceInput = document.getElementById("item-price")
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  console.log(addTaxDom);

  const profitFee = document.getElementById("profit");
  profitFee.innerHTML = (Math.floor(inputValue * 0.9));
  console.log(profitFee);
})
});