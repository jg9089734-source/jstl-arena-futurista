<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Inicio" />
<c:set var="arenaNivel" value="0" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass hero">
    <span class="hero-eyebrow">// Bienvenido, jugador</span>
    <h1 class="hero-title glitch" data-text="ELIGE TU NIVEL">ELIGE TU NIVEL</h1>
    <p class="hero-sub">
      Ocho desaf&iacute;os de <b>JSP + JSTL</b> para dominar los tags
      <span class="text-cyan">&lt;c:out&gt;</span>,
      <span class="text-cyan">&lt;c:if&gt;</span>,
      <span class="text-cyan">&lt;c:choose&gt;</span>,
      <span class="text-cyan">&lt;c:catch&gt;</span>,
      <span class="text-cyan">&lt;c:forEach&gt;</span>,
      <span class="text-cyan">&lt;c:forTokens&gt;</span> y
      <span class="text-cyan">&lt;sql:*&gt;</span>.
      Completa cada nivel y sube de rango.
    </p>
  </section>

  <h2 class="section-title"><i class="bi bi-grid-3x3-gap-fill text-cyan"></i> Niveles disponibles</h2>

  <div class="nivel-grid">

    <%-- Nivel 1: modal --%>
    <a class="glass nivel-card" data-nivel="1" href="${ctx}/ejercicios/1/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 01</span>
      <span class="nivel-tag">&lt;c:out&gt;</span>
      <h3 class="nivel-nombre">La primera salida</h3>
      <p class="nivel-desc">Diferencia entre texto literal y expresi&oacute;n EL con <code>&lt;c:out&gt;</code>.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

    <a class="glass nivel-card" data-nivel="2" href="${ctx}/ejercicios/2/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 02</span>
      <span class="nivel-tag">&lt;c:out&gt; + \${param.*}</span>
      <h3 class="nivel-nombre">Recibir jugador</h3>
      <p class="nivel-desc">Env&iacute;a tus datos por formulario e impr&iacute;melos con JSTL.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

    <a class="glass nivel-card" data-nivel="3" href="${ctx}/ejercicios/3/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 03</span>
      <span class="nivel-tag">&lt;c:if&gt; + &lt;c:redirect&gt;</span>
      <h3 class="nivel-nombre">Validaci&oacute;n de acceso</h3>
      <p class="nivel-desc">Campos obligatorios: redirige con error si falta algo.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

    <a class="glass nivel-card" data-nivel="4" href="${ctx}/ejercicios/4/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 04</span>
      <span class="nivel-tag">&lt;c:choose&gt;</span>
      <h3 class="nivel-nombre">Elige tu lenguaje</h3>
      <p class="nivel-desc">Un <code>switch</code> con <code>when</code> / <code>otherwise</code>.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

    <a class="glass nivel-card" data-nivel="5" href="${ctx}/ejercicios/5/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 05</span>
      <span class="nivel-tag">&lt;c:catch&gt;</span>
      <h3 class="nivel-nombre">Par&aacute;metro peligroso</h3>
      <p class="nivel-desc">Captura excepciones al convertir un n&uacute;mero.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

    <a class="glass nivel-card" data-nivel="6" href="${ctx}/ejercicios/6/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 06</span>
      <span class="nivel-tag">&lt;c:forEach&gt;</span>
      <h3 class="nivel-nombre">Bucle de reloj</h3>
      <p class="nivel-desc">Itera con <code>begin</code>, <code>end</code>, <code>step</code> y <code>varStatus</code>.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

    <a class="glass nivel-card" data-nivel="7" href="${ctx}/ejercicios/7/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 07</span>
      <span class="nivel-tag">&lt;c:forTokens&gt;</span>
      <h3 class="nivel-nombre">Separa el c&oacute;digo</h3>
      <p class="nivel-desc">Divide un texto en tokens seg&uacute;n un delimitador.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

    <a class="glass nivel-card" data-nivel="8" href="${ctx}/ejercicios/8/index.jsp">
      <span class="card-check"><i class="bi bi-patch-check-fill"></i></span>
      <span class="nivel-num">NIVEL 08</span>
      <span class="nivel-tag">&lt;sql:update&gt; + &lt;sql:query&gt;</span>
      <h3 class="nivel-nombre">Jefe final: base de datos</h3>
      <p class="nivel-desc">Inserta un registro y lista la tabla <code>empleados</code>.</p>
      <span class="card-cta">Jugar <i class="bi bi-arrow-right"></i></span>
    </a>

  </div>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
