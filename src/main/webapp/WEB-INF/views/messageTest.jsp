<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="bg">
	<form action="<c:url value="/sendMessage" />" method="post"
		name="message">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />

		<table border="0" bgcolor=#ffffff style="margin: auto; border-radius: 25px">
			<tr>
				<td align=center>
					<table border="0" cellpadding="0" cellspacing="0" width=90%>
						<tr>
							<td width=1000 align=center>
								<table border="0" cellSpacing=0 cellPadding=0 bgcolor=#ffffff
									class="logintable">

									<tr>
										<td width="100%" height="30px" colspan="5" />
									</tr>

									<tr>
										<td width="10%"></td>
										<td class="TEXTFONT-BLACK"
											colspan="3"
											style="font-size: 2em; padding-bottom: 10px; border-bottom: 1px solid #808080; color: #808080; text-align: center">메시지</td>
										<td width="10%"></td>
									</tr>
									<tr>
										<td width="10%"></td>
										<td align="left" colspan="3"
											style="border-bottom: 1px solid #808080;">
											<textarea
												rows="8" cols="60%" id="msg" name="msg" class="input_msg container-fluid"
												tabindex="1" onFocus="this.select()"></textarea></td>
										<td width="10%"></td>
									</tr>
									<tr>
										<td height="20px" colspan="5" />
									</tr>
									<tr>
										<td width="10%"></td>
										<td align=center colspan="3"><input class="Button-LOGIN"
											type="submit" id="login" name="login" value="보내기"
											tabindex="2" /></td>
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