document.addEventListener('DOMContentLoaded', function () {
  /* ── Navbar scroll effect ── */
  const navbar = document.querySelector('.navbar');
  window.addEventListener('scroll', () => {
    navbar.classList.toggle('scrolled', window.scrollY > 50);
  });

  /* ── Mobile menu ── */
  const hamburger = document.querySelector('.hamburger');
  const navLinks = document.querySelector('.nav-links');
  hamburger.addEventListener('click', () => {
    navLinks.classList.toggle('open');
    hamburger.classList.toggle('active');
  });
  navLinks.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      navLinks.classList.remove('open');
      hamburger.classList.remove('active');
    });
  });

  /* ── Smooth scroll ── */
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
  });

  /* ── Active nav on scroll ── */
  const sections = document.querySelectorAll('section[id]');
  const navAnchors = document.querySelectorAll('.nav-links a[href^="#"]');
  window.addEventListener('scroll', () => {
    let current = '';
    sections.forEach(sec => {
      if (window.scrollY >= sec.offsetTop - 120) current = sec.id;
    });
    navAnchors.forEach(a => {
      a.classList.toggle('active', a.getAttribute('href') === '#' + current);
    });
  });

  /* ── Portfolio filter ── */
  const filterBtns = document.querySelectorAll('.filter-btn');
  const portfolioItems = document.querySelectorAll('.portfolio-item');

  filterBtns.forEach(btn => {
    btn.addEventListener('click', function () {
      filterBtns.forEach(b => b.classList.remove('active'));
      this.classList.add('active');
      const filter = this.dataset.filter;

      portfolioItems.forEach(item => {
        if (filter === 'all' || item.dataset.category === filter) {
          item.classList.remove('hidden');
          item.classList.add('show');
        } else {
          item.classList.remove('show');
          item.classList.add('hidden');
        }
      });
    });
  });

  /* ── Scroll reveal ── */
  const reveals = document.querySelectorAll('.reveal');
  const observer = new IntersectionObserver(
    entries => entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); }),
    { threshold: 0.15, rootMargin: '0px 0px -40px 0px' }
  );
  reveals.forEach(el => observer.observe(el));

  /* ── Stat counter animation ── */
  const stats = document.querySelectorAll('.stat h3');
  const statObserver = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = parseInt(el.dataset.count, 10);
        let current = 0;
        const step = Math.max(1, Math.floor(target / 60));
        const timer = setInterval(() => {
          current += step;
          if (current >= target) { current = target; clearInterval(timer); }
          el.textContent = current + (el.dataset.suffix || '');
        }, 25);
        statObserver.unobserve(el);
      }
    });
  }, { threshold: 0.5 });
  stats.forEach(s => statObserver.observe(s));

  /* ── Typed effect for hero subtitle ── */
  const typed = document.querySelector('.typed-text');
  if (typed) {
    const words = ['Logo Designer', 'Brand Strategist', 'Visual Storyteller', 'Creative Director'];
    let wordIndex = 0, charIndex = 0, isDeleting = false;
    function typeLoop() {
      const word = words[wordIndex];
      typed.textContent = word.substring(0, charIndex);
      if (!isDeleting) {
        charIndex++;
        if (charIndex > word.length) { isDeleting = true; setTimeout(typeLoop, 1800); return; }
      } else {
        charIndex--;
        if (charIndex === 0) { isDeleting = false; wordIndex = (wordIndex + 1) % words.length; }
      }
      setTimeout(typeLoop, isDeleting ? 40 : 90);
    }
    typeLoop();
  }
});
