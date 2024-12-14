/**
 * 
 */
// cartScript.js

document.addEventListener('DOMContentLoaded', () => {
    const confirmOrderBtn = document.getElementById('confirmOrderBtn');
    const paymentModal = document.getElementById('paymentModal');
    const closeButton = document.querySelector('.close-button');
    const paymentForm = document.getElementById('paymentForm');

    // Function to open the modal
    const openModal = () => {
        paymentModal.style.display = 'block';
    };

    // Function to close the modal
    const closeModal = () => {
        paymentModal.style.display = 'none';
    };

    // Event listener for the confirmation button
    confirmOrderBtn.addEventListener('click', openModal);

    // Event listener for the close button
    closeButton.addEventListener('click', closeModal);

    // Close the modal when clicking outside the modal content
    window.addEventListener('click', (event) => {
        if (event.target == paymentModal) {
            closeModal();
        }
    });

    // Handle form submission (you can integrate with your backend here)
    paymentForm.addEventListener('submit', (event) => {
        event.preventDefault();
        // Perform payment processing logic here
        alert('Paiement effectué avec succès!');
        closeModal();
        // Optionally, redirect to a confirmation page
        // window.location.href = 'confirmation.jsp';
    });
});
