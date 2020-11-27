

function toggleNav(){
  const navElements = document.querySelectorAll('.nav-item a');
const currentPath =  window.location.pathname;
console.log(navElements);
if (navElements) {
  for (let element of navElements){
 let elementPath = element.pathname;
 if (elementPath == currentPath){
  element.classList.add("active");
 }
}

}

}


export default toggleNav;
