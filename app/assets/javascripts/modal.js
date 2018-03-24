$(document).on("turbolinks:load", function(){
  
  // Modal for Edit
  // Get the modal
  const modalEdit = $('#editProfileModal')[0];
  // Get the button that opens the modal
  const btnEdit = $('#editProfile')[0];
  // Get the <span> element that closes the modal
  const span = $('#close');
  // When the user clicks the button, open the modal 
  btnEdit.onclick = function() {
      modalEdit.style.display = "block";
  }
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = (event) => {
      if (event.target == modalEdit) {
          modalEdit.style.display = "none";
      }
  }

})