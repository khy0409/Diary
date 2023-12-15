<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script>
</script>
<link rel="stylesheet" href="../CSS/Join.css">
</head>
<body>
	<div id="container" class="container">
		<div class="row">
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
					<form method="post" action="Process.jsp" name="JoinForm">
						<div class="input-group">
							<i class='bx bxs-user'></i>
								<input type="text" placeholder="아이디" name="JoinID">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="비밀번호" name="JoinPass">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="비밀번호 확인" name="PassCheck">
						</div>
						<button type="submit" class="submit">제출</button>
						</form>
						<p>
							<span> 계정이 이미 있으신가요? &nbsp; </span> <b onclick="toggle()"
								class="pointer"> 로그인하기 </b>
						</p>
					</div>
				</div>

			</div>

			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
					<div class="form sign-in">
					<form method="post" action="LoginProcess.jsp" name="LoginForm">
						<div class="input-group">
							<i class='bx bxs-user'></i>
								<input type="text" placeholder="아이디" name="LoginID">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="비밀번호" name="LoginPass">
						</div>
						<button type="submit" class="submit">제출</button>
						</form>
						<p>
							<span> 계정이 없으신가요? &nbsp; </span> <b onclick="toggle()"
								class="pointer"> 회원가입하기 </b>
						</p>
					</div>
				</div>
				<div class="form-wrapper"></div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>로그인</h2>

				</div>
				<div class="img sign-in"></div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up"></div>
				<div class="text sign-up">
					<h2>회원가입</h2>

				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>
	<script>let container = document.getElementById('container')

  toggle = () => {
    container.classList.toggle('sign-in')
    container.classList.toggle('sign-up')
  }

  setTimeout(() => {
    container.classList.add('sign-in')
  }, 200)</script>
</body>
</html>