// Get the reclamation link element
var reclamationLink = document.getElementById("reclamation-link");

// Handle the click event for the "Reclamation" link
reclamationLink.addEventListener("click", function(event) {
    event.preventDefault(); // Prevent the default link behavior (e.g., navigating to a new page)
    alert("Veuillez vous connecter"); // Display an alert message
    // You can add further logic here if needed
});
