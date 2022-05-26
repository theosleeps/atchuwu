/*
** Credit : w3schools.com
** Diaporama de l'accueil
*/



let slideIndex = 0;

diaporama();

function diaporama() {

  let i;
  
  let slides = document.getElementsByClassName("imagesDiapo");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  slides[slideIndex-1].style.display = "block";  
  setTimeout(diaporama, 3800);

}