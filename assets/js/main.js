const savedTheme = localStorage.getItem("theme");
const aaa = savedTheme === "dark" ? "dark" : "light";
document.documentElement.classList.toggle(aaa);

document.addEventListener("DOMContentLoaded", (event) => {
    const btn = document.querySelector("#toggle-theme");
    btn.className = savedTheme === "dark" ? "fa-solid fa-sun" : "fa-solid fa-moon";

    btn.addEventListener("click", function() {
        const newTheme = document.documentElement.className === "dark" ? "light" : "dark";
        document.documentElement.className = newTheme;
	btn.className = newTheme === "dark" ? "fa-solid fa-sun" : "fa-solid fa-moon";
        localStorage.setItem("theme", newTheme);
    });
});

