<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />

<c:catch var="error01">
  <%
    int numero = Integer.parseInt(request.getParameter("parametro"));
    pageContext.setAttribute("numero", numero);
  %>
</c:catch>

<c:if test="${empty error01 and not empty numero}">
  <c:set var="arenaCompletar" value="5" />
</c:if>

<c:set var="arenaTitulo" value="Nivel 5 - Parametro peligroso" />
<c:set var="arenaNivel" value="5" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 05</span>
      <h1>Par&aacute;metro peligroso</h1>
      <p>Convertimos un par&aacute;metro a <span class="text-cyan">int</span> dentro de
        <span class="text-cyan">&lt;c:catch&gt;</span> para atrapar la excepci&oacute;n.</p>
    </div>

    <div class="terminal mb-4">
      <div class="terminal-bar">
        <span class="terminal-dot r"></span>
        <span class="terminal-dot y"></span>
        <span class="terminal-dot g"></span>
        <span class="terminal-title">ARENA://consola</span>
      </div>
      <div class="terminal-body">
        <p class="mb-1"><span class="prompt">arena&gt;</span> parseando valor del par&aacute;metro "parametro"...</p>

        <c:choose>
          <c:when test="${not empty error01}">
            <p class="err mb-0">Se produjo un error: <c:out value="${error01}" /></p>
          </c:when>
          <c:otherwise>
            <p class="ok mb-0 blink">Valor recibido: <c:out value="${numero}" /></p>
          </c:otherwise>
        </c:choose>
      </div>
    </div>

    <p class="text-cyan mb-2"><i class="bi bi-hand-index-thumb-fill"></i> Prueba estas entradas:</p>
    <div class="acciones">
      <a class="btn-neon btn-neon-alt" href="${ctx}/ejercicios/5/index.jsp?parametro=prueba">
        <i class="bi bi-bug-fill"></i> parametro=prueba
      </a>
      <a class="btn-neon" href="${ctx}/ejercicios/5/index.jsp?parametro=1234">
        <i class="bi bi-check-circle-fill"></i> parametro=1234
      </a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/ejercicios/5/index.jsp">
        <i class="bi bi-slash-circle"></i> Sin par&aacute;metro
      </a>
    </div>

    <div class="acciones mt-arena">
      <a class="btn-neon" href="${ctx}/ejercicios/6/index.jsp">Siguiente nivel <i class="bi bi-arrow-right"></i></a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
