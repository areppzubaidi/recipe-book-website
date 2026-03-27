// Recipe data
const recipes = [
    {
        name: "Spaghetti Carbonara",
        description: "Classic Italian pasta with eggs, cheese, and pancetta",
        image: "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500"
    },
    {
        name: "Chicken Tikka Masala",
        description: "Creamy spiced curry with tender chicken pieces",
        image: "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500"
    },
    {
        name: "Chocolate Lava Cake",
        description: "Decadent chocolate cake with a molten center",
        image: "https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500"
    }
];

// Function to display recipes
function displayRecipes() {
    const recipeGrid = document.getElementById('recipeGrid');
    
    if (!recipeGrid) return;
    
    recipeGrid.innerHTML = recipes.map(recipe => `
        <div class="recipe-card">
            <div class="recipe-image" style="background-image: url('${recipe.image}')"></div>
            <h3>${recipe.name}</h3>
            <p>${recipe.description}</p>
            <a href="#" class="recipe-link" onclick="alert('Recipe coming soon!'); return false;">View Recipe</a>
        </div>
    `).join('');
}

// Function to scroll to recipes section
function scrollToRecipes() {
    const recipesSection = document.getElementById('recipes');
    if (recipesSection) {
        recipesSection.scrollIntoView({ behavior: 'smooth' });
    }
}

// Function to add smooth scrolling for navigation links
function setupNavigation() {
    const navLinks = document.querySelectorAll('.nav-links a');
    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = link.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    displayRecipes();
    setupNavigation();
});

// Add scroll effect for header
window.addEventListener('scroll', () => {
    const header = document.querySelector('header');
    if (window.scrollY > 100) {
        header.style.background = '#ff5252';
    } else {
        header.style.background = '#ff6b6b';
    }
});
