function tax() {
  const onInput = document.getElementById("item-price")
  console.log(onInput)
 
  onInput.addEventListener('input', function(){
    const Input = document.getElementById("item-price")
    const fee = document.getElementById("add-tax-price")
    const income = document.getElementById("profit")

    console.log(Input)
     // ①入力された値を取得して変数に入れる
    
     const inputPrice = Input.value;
    console.log(inputPrice)
    let taxPrice = inputPrice * 0.1;
    let incomeGain = inputPrice - taxPrice;
    fee.textContent = taxPrice
    income.textContent = incomeGain
    
    // if (inputPrice >= 300 &&  inputPrice <= 9999999){
    //   let taxPrice = inputPrice * 0.1;
    //   console.log(taxPrice)
    //   let income = inputPrice - taxPrice;
    //   console.log(income)
    //   add_tax_price.textContent = taxPrice;
    //   profit.textContent = income;
    // } else{
      

    // }
  })
  }

window.addEventListener("load", tax);


 // ①入力された値を取得して変数に入れる
  // ②取得した変数を使って手数料と利益を計算し、計算結果を変数に入れる Math.floor
  // ③計算結果の変数を画面上に表示させる
