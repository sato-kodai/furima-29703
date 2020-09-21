function profit_fee() {
  const itemPrice = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

    itemPrice.addEventListener("input", () => {
      const input_Price = document.getElementById("item-price").value;
      tax.innerHTML = Math.floor(input_Price * 0.1).toLocaleString();
      profit.innerHTML = Math.floor(input_Price * 0.9).toLocaleString();
    });
}
window.addEventListener("load", profit_fee);