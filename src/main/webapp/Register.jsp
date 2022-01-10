<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/register.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    

    


</head>
<script>
    function match() {
        
        let psd1 = document.getElementById("pwd1");
        let psd2 = document.getElementById("pwd2");
        if (psd1.value.trim() != psd2.value.trim()) {
            document.getElementById("pws").innerHTML = "Password must be same";
            // alert()
            return false;
        } else {

            return true;
        }
    }
</script>


<body >
    <div class="fullbody">

        <div class="containe">
            <form action="reg" onsubmit="return match()" method="post">

                <h2 class="c_register" style="position: absolute;left: 120px;" >Register </h2><br><br><br>
                <label for="">Name:</label><br>
                <input autofocus  autocomplete="off" class="c_user2"  name="name1" type="text" pattern="[A-Za-z]{3,40}" 
                title="Only enter A-Z ,a-z and enter  min 3 to max 40 " required><br>
                
                <label for="">Email:</label><br>
                <input  autocomplete="off" class="c_user2"  name="email"  
                pattern="[a-z][a-z0-9_.]+@[a-z0-9.]+[.][a-z]+" type="email"   title="Enter valid email ex(example12@gmail.com)" required><br>
                
              	<label for="">Phone number:</label><br>
                <input  autocomplete="off" class="c_user2" name="phone_number" type="text"
                pattern="[6789]{1}[0-9]{9}" maxlength="10"  title="Enter only 10 digit number" required><br>
                
                <label for="">Password:</label><br>
                <input  autocomplete="off" class="c_user2" id="pwd1" name="password" type="password"
                pattern="(?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                title="Enter atleast one upper case and one lower case and one number ,and atleast 8 or more character" required><br>
               
                <label for="">Confirm Password:</label><br>
                <input  autocomplete="off" class="c_user2" id="pwd2" name="confirm_password" type="password"
                pattern="((?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                title="Enter atleast one upper case and one lower case and one number ,and atleast 8 or more character" required>
                <p id="pws" style="color:red;"></p><br>
                  <%String regError=(String)session.getAttribute("regError"); 
                if(regError!=null){%>
                <h6 style="color: red;position: absolute;left:90px;"><%=regError %></h6><br><br>
                <% }%>
                <button style="position: absolute;left: 140px;" class="btn btn-primary	">Register</button>
                
            </form>
        </div>
        <br><br>
	<%session.removeAttribute("regError"); %>


    </div>







</body>



</html>