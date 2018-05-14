<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="jumbotron">
	<form action="<c:url value="/login" />" method="post" name="login">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />

		<table border="0" bgcolor=#ffffff style="margin: auto">
			<tr>
				<td align=center>
					<table border="0" cellpadding="0" cellspacing="0" width=90%>
						<tr>
							<td width=500 align=center>
								<table border="0" cellSpacing=0 cellPadding=0
									bgcolor=#ffffff class="logintable">

									<tr>
										<td width="100%" height="30px" colspan="5" />
									</tr>

									<tr>
										<td width="10%"></td>
										<td class="TEXTFONT-BLACK"
											style="padding-left: 30px; padding-right: 0px; border-bottom: 1px solid #808080; color: #808080;">아이디</td>
										<td align="left" colspan="2"
											style="border-bottom: 1px solid #808080;">
												<input
												size="16" maxLength="6" type="text" id="username" name="username"
												onFocus="this.value=''" class="input_login" tabindex="2"></td>
										<td width="10%"></td>
									</tr>
									<tr>
										<td height="20px" colspan="5" />
									</tr>

									<tr>
										<td width="10%"></td>
										<td class="TEXTFONT-BLACK"
											style="padding-left: 30px; padding-right: 0px; border-bottom: 1px solid #808080; color: #808080;">패스워드</td>
										<td align="left" colspan="2"
											style="border-bottom: 1px solid #808080;">
												<input
												size="16" maxLength="16" type="password" id="password"
												name="password" onFocus="this.select()" class="input_login"
												tabindex="3"></td>
										<td width="10%"></td>
									</tr>
									<tr>
										<td height="20px" colspan="5"></td>
									</tr>

									<c:if test="${not empty errorMsg }">
										<tr>
											<td width="10%"></td>
											<td class="error" colspan="3" align="center">${errorMsg }</td>
											<td width="10%"></td>
										</tr>
									</c:if>

									<c:if test="${not empty logoutMsg }">
										<tr>
											<td width="10%"></td>
											<td class="logout" colspan="3" align="center">${logoutMsg }</td>
											<td width="10%"></td>
										</tr>
									</c:if>

									<tr>
										<td height="20px" colspan="5"></td>
									</tr>
									<tr>
										<td width="10%"></td>
										<td align=center colspan="3">
											<input class="Button-LOGIN"
												type="submit" id="login" name="login" value="로그인"
												tabindex="4" /></td>
										<td width="10%"></td>
									</tr>
								</table> <br />
							</td>
						</tr>
					</table> <br />
				</td>
			</tr>
		</table>
	</form>
</div>