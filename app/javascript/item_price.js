window.addEventListener('load', ()=>{
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", ()=>{
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);

    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(inputValue - inputValue * 0.1);
  });
});