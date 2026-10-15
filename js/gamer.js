/* =====================================================================
   JSTL//ARENA - Motor de la experiencia (partículas, HUD, XP, toasts)
   ===================================================================== */
(function () {
  "use strict";

  var STORE_KEY = "arena_done";
  var TOTAL_NIVELES = 8;
  var XP_POR_NIVEL = 100;

  var reduceMotion = window.matchMedia &&
    window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  /* -------------------- Progreso (localStorage) -------------------- */
  function leerProgreso() {
    try {
      var raw = window.localStorage.getItem(STORE_KEY);
      if (!raw) return [];
      var arr = JSON.parse(raw);
      if (!Array.isArray(arr)) return [];
      return arr
        .map(function (n) { return parseInt(n, 10); })
        .filter(function (n) { return !isNaN(n) && n >= 1 && n <= TOTAL_NIVELES; });
    } catch (e) {
      return [];
    }
  }

  function guardarProgreso(arr) {
    try {
      window.localStorage.setItem(STORE_KEY, JSON.stringify(arr));
    } catch (e) { /* almacenamiento no disponible: se ignora */ }
  }

  var progreso = leerProgreso();

  function estaCompletado(nivel) {
    return progreso.indexOf(nivel) !== -1;
  }

  function marcarCompletado(nivel) {
    if (isNaN(nivel) || nivel < 1 || nivel > TOTAL_NIVELES) return false;
    if (estaCompletado(nivel)) return false;
    progreso.push(nivel);
    progreso.sort(function (a, b) { return a - b; });
    guardarProgreso(progreso);
    return true;
  }

  /* -------------------- HUD -------------------- */
  function actualizarHUD() {
    var completados = progreso.length;
    var lvlEl = document.getElementById("arena-lvl");
    var xpEl = document.getElementById("arena-xp");
    var xpTxt = document.getElementById("arena-xp-txt");

    if (lvlEl) lvlEl.textContent = String(completados);
    var pct = Math.round((completados / TOTAL_NIVELES) * 100);
    if (xpEl) xpEl.style.width = pct + "%";
    if (xpTxt) xpTxt.textContent = String(completados * XP_POR_NIVEL);
  }

  /* -------------------- Toasts -------------------- */
  function mostrarToast(mensaje, tipo) {
    var cont = document.getElementById("arena-toasts");
    if (!cont) return;
    var esError = tipo === "error";

    var wrap = document.createElement("div");
    wrap.className = "toast arena-toast " + (esError ? "toast-error" : "toast-ok");
    wrap.setAttribute("role", "alert");
    wrap.setAttribute("aria-live", "assertive");
    wrap.setAttribute("aria-atomic", "true");

    var flex = document.createElement("div");
    flex.className = "d-flex";

    var body = document.createElement("div");
    body.className = "toast-body";
    body.textContent = mensaje;

    var btn = document.createElement("button");
    btn.type = "button";
    btn.className = "btn-close btn-close-white me-2 m-auto";
    btn.setAttribute("data-bs-dismiss", "toast");
    btn.setAttribute("aria-label", "Cerrar");

    flex.appendChild(body);
    flex.appendChild(btn);
    wrap.appendChild(flex);
    cont.appendChild(wrap);

    if (window.bootstrap && window.bootstrap.Toast) {
      var t = new window.bootstrap.Toast(wrap, { delay: 4200 });
      t.show();
      wrap.addEventListener("hidden.bs.toast", function () {
        if (wrap.parentNode) wrap.parentNode.removeChild(wrap);
      });
    } else {
      setTimeout(function () {
        if (wrap.parentNode) wrap.parentNode.removeChild(wrap);
      }, 4200);
    }
  }
  window.arenaToast = mostrarToast;

  /* -------------------- Marcar nivel completado -------------------- */
  function procesarCompletado() {
    var marca = document.getElementById("arena-complete");
    if (!marca) return;
    var nivel = parseInt(marca.getAttribute("data-nivel"), 10);
    var esNuevo = marcarCompletado(nivel);
    actualizarHUD();
    if (esNuevo) {
      mostrarToast("+100 XP  \u00b7  Nivel " + nivel + " completado", "ok");
    }
  }

  /* -------------------- Marcar tarjetas del index -------------------- */
  function pintarTarjetas() {
    var cards = document.querySelectorAll(".nivel-card[data-nivel]");
    for (var i = 0; i < cards.length; i++) {
      var n = parseInt(cards[i].getAttribute("data-nivel"), 10);
      if (estaCompletado(n)) cards[i].classList.add("completado");
    }
  }

  /* -------------------- Ripple en botones -------------------- */
  function activarRipple() {
    document.addEventListener("click", function (ev) {
      var btn = ev.target.closest ? ev.target.closest(".btn-neon") : null;
      if (!btn || reduceMotion) return;
      var rect = btn.getBoundingClientRect();
      var size = Math.max(rect.width, rect.height);
      var span = document.createElement("span");
      span.className = "ripple";
      span.style.width = span.style.height = size + "px";
      span.style.left = (ev.clientX - rect.left - size / 2) + "px";
      span.style.top = (ev.clientY - rect.top - size / 2) + "px";
      btn.appendChild(span);
      setTimeout(function () {
        if (span.parentNode) span.parentNode.removeChild(span);
      }, 650);
    });
  }

  /* -------------------- Tilt en tarjetas -------------------- */
  function activarTilt() {
    if (reduceMotion) return;
    var cards = document.querySelectorAll(".nivel-card");
    for (var i = 0; i < cards.length; i++) {
      (function (card) {
        card.addEventListener("mousemove", function (ev) {
          var r = card.getBoundingClientRect();
          var px = (ev.clientX - r.left) / r.width - 0.5;
          var py = (ev.clientY - r.top) / r.height - 0.5;
          card.style.transform =
            "translateY(-6px) rotateX(" + (-py * 6) + "deg) rotateY(" + (px * 8) + "deg)";
        });
        card.addEventListener("mouseleave", function () {
          card.style.transform = "";
        });
      })(cards[i]);
    }
  }

  /* -------------------- Partículas (canvas) -------------------- */
  function iniciarParticulas() {
    var canvas = document.getElementById("arena-particles");
    if (!canvas || reduceMotion) return;
    var ctx = canvas.getContext("2d");
    if (!ctx) return;

    var W, H, puntos = [];
    var COLORES = ["0,229,255", "255,46,154", "124,58,237", "182,255,59"];

    function resize() {
      W = canvas.width = window.innerWidth;
      H = canvas.height = window.innerHeight;
      var cantidad = Math.min(90, Math.floor((W * H) / 22000));
      puntos = [];
      for (var i = 0; i < cantidad; i++) {
        puntos.push({
          x: Math.random() * W,
          y: Math.random() * H,
          vx: (Math.random() - 0.5) * 0.45,
          vy: (Math.random() - 0.5) * 0.45,
          r: Math.random() * 1.8 + 0.6,
          c: COLORES[Math.floor(Math.random() * COLORES.length)]
        });
      }
    }

    function dibujar() {
      ctx.clearRect(0, 0, W, H);

      for (var i = 0; i < puntos.length; i++) {
        var p = puntos[i];
        p.x += p.vx; p.y += p.vy;
        if (p.x < 0 || p.x > W) p.vx *= -1;
        if (p.y < 0 || p.y > H) p.vy *= -1;

        ctx.beginPath();
        ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
        ctx.fillStyle = "rgba(" + p.c + ",0.85)";
        ctx.shadowBlur = 8;
        ctx.shadowColor = "rgba(" + p.c + ",0.9)";
        ctx.fill();
      }
      ctx.shadowBlur = 0;

      for (var a = 0; a < puntos.length; a++) {
        for (var b = a + 1; b < puntos.length; b++) {
          var dx = puntos[a].x - puntos[b].x;
          var dy = puntos[a].y - puntos[b].y;
          var dist = dx * dx + dy * dy;
          if (dist < 16000) {
            var alpha = (1 - dist / 16000) * 0.28;
            ctx.strokeStyle = "rgba(0,229,255," + alpha + ")";
            ctx.lineWidth = 0.7;
            ctx.beginPath();
            ctx.moveTo(puntos[a].x, puntos[a].y);
            ctx.lineTo(puntos[b].x, puntos[b].y);
            ctx.stroke();
          }
        }
      }
      requestAnimationFrame(dibujar);
    }

    window.addEventListener("resize", resize);
    resize();
    dibujar();
  }

  /* -------------------- Nivel 1 (modal) -------------------- */
  function activarNivel1() {
    var modal = document.getElementById("modalNivel1");
    if (!modal || !window.bootstrap || !window.bootstrap.Modal) return;
    modal.addEventListener("shown.bs.modal", function () {
      if (marcarCompletado(1)) {
        actualizarHUD();
        pintarTarjetas();
        mostrarToast("+100 XP  \u00b7  Nivel 1 completado", "ok");
      }
    });
  }

  /* -------------------- Init -------------------- */
  function init() {
    actualizarHUD();
    pintarTarjetas();
    procesarCompletado();
    activarRipple();
    activarTilt();
    activarNivel1();
    iniciarParticulas();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
