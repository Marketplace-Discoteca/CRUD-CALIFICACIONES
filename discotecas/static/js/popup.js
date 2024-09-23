document.addEventListener('DOMContentLoaded', function() {
    const popup = document.getElementById('popup');
    const closePopup = document.getElementById('close-popup');
    const popupName = document.getElementById('popup-name');
    const ratingForm = document.getElementById('rating-form');
    const comment = document.getElementById('comment');

    const ratings = new Map();

    document.querySelectorAll('.calificar-btn').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            
            const nombre = this.getAttribute('data-nombre');
            popupName.value = nombre;

            updateStars();

            popup.style.display = 'flex';
        });
    });

    closePopup.addEventListener('click', function() {
        hidePopup();
    });

    window.addEventListener('click', function(event) {
        if (event.target === popup) {
            hidePopup();
        }
    });

    ratingForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const results = [];
        document.querySelectorAll('.rating-stars').forEach((group, index) => {
            const stars = ratings.get(group) || 0;
            results.push({
                nombre: popupName.value, 
                calificacion: stars,
                comentario: comment.value
            });
        });

        console.log('Resultados:', results);
    });

    function updateStars() {
        document.querySelectorAll('.rating-stars').forEach(group => {
            const stars = group.querySelectorAll('.star');
            const rating = ratings.get(group) || 0;
            stars.forEach(star => {
                const value = parseInt(star.getAttribute('data-value'));
                if (value <= rating) {
                    star.classList.add('selected');
                } else {
                    star.classList.remove('selected');
                }
            });
        });
    }

    function setupStars() {
        document.querySelectorAll('.rating-stars').forEach(group => {
            const stars = group.querySelectorAll('.star');
            ratings.set(group, 0);

            stars.forEach(star => {
                star.addEventListener('mouseover', function() {
                    const value = parseInt(this.getAttribute('data-value'));
                    stars.forEach(s => {
                        if (parseInt(s.getAttribute('data-value')) <= value) {
                            s.classList.add('hover');
                        } else {
                            s.classList.remove('hover');
                        }
                    });
                });

                star.addEventListener('mouseout', function() {
                    stars.forEach(s => {
                        s.classList.remove('hover');
                    });
                });

                star.addEventListener('click', function() {
                    const value = parseInt(this.getAttribute('data-value'));
                    ratings.set(group, value);
                    updateStars();
                });
            });
        });
    }

    function hidePopup() {
        popup.style.display = 'none';
        popupName.value = '';
        comment.value = '';
        ratings.clear();
        updateStars();
    }

    setupStars();
});
