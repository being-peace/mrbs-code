$(document).ready(function() {
    document.getElementsByClassName("table_container")[0].scrollTop=263;    
});

document.addEventListener("DOMContentLoaded", function() {
    // Überprüfen, ob die aktuelle Seite "edit_entry.php" ist
    if (window.location.pathname.endsWith("edit_entry.php")) {
        function checkFields() {
            const destinationField = document.getElementById("name");
            const kmField = document.getElementById("f_custom_km");
            const zielLabel = document.querySelector("label[for='name']");
            const kmLabel = document.querySelector("label[for='f_custom_km']");
            const destinationValue = destinationField.value.trim().toLowerCase();
            const kmValue = kmField.value;
            
            const destinations = ["göttingen", "goettingen", "goe", "gö", "hannover", "h", "eschwege", "rosdorf", "witzenhausen", "bad nenndorf", "hildesheim", "springe"];
            const kmValueCheck = "0-1";
            
            if (destinations.includes(destinationValue) && kmValue === kmValueCheck) {
                kmLabel.textContent = "Fahrtziel und KM Wert passen nicht zusammen!!! - Kilometer pro Tag";
                zielLabel.textContent = "Fahrtziel und KM Wert passen nicht zusammen!!! - Fahrtziel";
		zielLabel.style.backgroundColor="red";
		kmLabel.style.backgroundColor="red";
            } else {
                kmLabel.textContent = "Kilometer pro Tag";
                zielLabel.textContent = "Fahrtziel";
		zielLabel.style.backgroundColor="";
		kmLabel.style.backgroundColor="";
            }
        }
        
        // Event Listener für das Verlassen des Textfeldes
        document.getElementById("name").addEventListener("blur", checkFields);
        
        // Event Listener für die Änderung des Dropdown-Menüs
        document.getElementById("f_custom_km").addEventListener("change", checkFields);
    }
});
