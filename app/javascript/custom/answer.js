document.addEventListener("turbo:load", function(){
  let select_id = document.querySelector("#answer_btn");
  select_id.addEventListener("click", function(e){
    e.preventDefault();
    let answer = document.querySelector(".answer");
    answer.classList.toggle("active");
  });
});