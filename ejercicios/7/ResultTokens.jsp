<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<c:set var="arenaTitulo" value="Nivel 7 - Resultado" />
<c:set var="arenaNivel" value="7" />
<c:set var="arenaCompletar" value="7" />
<%@ include file="/WEB-INF/jspf/header.jspf" %>

  <section class="glass nivel-panel">
    <div class="nivel-head">
      <span class="badge-nivel">NIVEL 07 &middot; COMPLETADO</span>
      <h1>Tokens separados</h1>
      <p>Resultado de <span class="text-cyan">&lt;c:forTokens&gt;</span>.</p>
    </div>

    <div class="dato mb-3">
      <span class="dato-key">Texto original</span>
      <span class="dato-val"><c:out value="${param.delimText}" /></span>
    </div>
    <div class="dato mb-4">
      <span class="dato-key">Delimitador</span>
      <span class="dato-val"><c:out value="${param.delim}" /></span>
    </div>

    <p class="text-cyan mb-2"><i class="bi bi-list-ol"></i> Tokens encontrados:</p>
    <div class="inventario">
      <c:forTokens items="${param.delimText}" delims="${param.delim}" var="myToken" varStatus="st">
        <span class="item-inv">
          <span class="rank-badge"><c:out value="${st.count}" /></span>
          <c:out value="${myToken}" />
        </span>
      </c:forTokens>
    </div>

    <c:if test="${empty param.delimText}">
      <div class="alerta-error mt-3" role="alert">
        <i class="bi bi-exclamation-triangle-fill ae-icon"></i>
        <span>No enviaste ning&uacute;n texto para dividir.</span>
      </div>
    </c:if>

    <div class="acciones mt-arena">
      <a class="btn-neon" href="${ctx}/ejercicios/8/index.jsp">Jefe final <i class="bi bi-arrow-right"></i></a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/ejercicios/7/index.jsp"><i class="bi bi-arrow-repeat"></i> Repetir</a>
      <a class="btn-neon btn-neon-ghost" href="${ctx}/index.jsp"><i class="bi bi-house-door-fill"></i> Inicio</a>
    </div>
  </section>

<%@ include file="/WEB-INF/jspf/footer.jspf" %>
