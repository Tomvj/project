<style>
body{
    background: -webkit-linear-gradient(left, #00547E, #00c6ff);
}
.contact-form{
    background: #fff;
    margin-top: 12%;
    margin-bottom: 5%;
	margin-right:5%;
    width: 40%;

	
	
}
.contact-form .form-control{
    border-radius:1rem;
}
.contact-image{
    text-align: center;
}
.contact-image img{
    border-radius: 6rem;
    width: 11%;
    margin-top: -3%;
    transform: rotate(29deg);
}
.contact-form form{
    padding:10%;
}
.contact-form form .row{
    margin-bottom: -10%;
}
.contact-form h3{
    margin-bottom: 8%;
    margin-top: -10%;
    text-align: center;
    color: #0062cc;
}
.contact-form .btnContact {
    width: 80%;
    border: none;
    border-radius: 1rem;
    padding: 3% ;
    background: #00547E;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
	margin-top:35px;
	margin-left:60%;
}
.btnContactSubmit
{
    width: 50%;
    border-radius: 1rem;
	position:center;
    padding: 1.5%;
    color: #fff;
    background-color: #0062cc;
    border: none;
    cursor: pointer;
	
}
</style>
<div class="container contact-form">
            <div class="contact-image" style="margin-top:20%">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
            <form method="post">
                <h3>Drop Us a Message</h3>
               <div class="row" >
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="txtName" class="form-control" placeholder="Your Name *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="txtEmail" class="form-control" placeholder="Your Email *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="txtPhone" class="form-control" placeholder="Your Phone Number *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" name="btnSubmit" class="btnContact" value="Send Message" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="txtMsg" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
                        </div>
                    </div>
                </div>
            </form>
</div>