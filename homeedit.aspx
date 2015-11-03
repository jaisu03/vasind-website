<%@ Page Title="" Language="C#" MasterPageFile="~/headfooteredit.master" AutoEventWireup="true" CodeFile="homeedit.aspx.cs" Inherits="edit_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- Banner -->
			<section id="banner">
				<h2>Hi. This is Transit.</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
				<ul class="actions">
					<li>
						<a href="#" class="button big">Lorem ipsum dolor</a>
					</li>
				</ul>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1 special">
				<div class="container">
					<header class="major">
						<h2>Our services</h2>
						<p>Best Service Provider are selected by judges who review the entered website using the three criteria below: </p>
					</header>
					<div class="row 150%">
						<div class="4u 12u$(medium)">
							<section class="box">
                            <a href="job.aspx">
								<i class="icon big rounded color1 fa-suitcase"></i>
								<h3>Jobs</h3>
                                </a>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim quam consectetur quibusdam magni minus aut modi aliquid.</p>
							</section>
						</div>
						<div class="4u 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color9 fa-calendar"></i>
								<h3>Events</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium ullam consequatur repellat debitis maxime.</p>
							</section>
						</div>
						<div class="4u$ 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color6 fa-cogs"></i>
								<h3>Services</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque eaque eveniet, nesciunt molestias. Ipsam, voluptate vero.</p>
							</section>
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2 special">
				<div class="container">
					<header class="major">
						<h2>Lorem ipsum dolor sit</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio, autem.</p>
					</header>
					<section class="profiles">
						<div class="row">
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="images/profile_placeholder.gif" alt="" />
								<h4>Lorem ipsum</h4>
								<p>Lorem ipsum dolor</p>
							</section>
							<section class="3u 6u$(medium) 12u$(xsmall) profile">
								<img src="images/profile_placeholder.gif" alt="" />
								<h4>Voluptatem dolores</h4>
								<p>Ullam nihil repudi</p>
							</section>
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="images/profile_placeholder.gif" alt="" />
								<h4>Doloremque quo</h4>
								<p>Harum corrupti quia</p>
							</section>
							<section class="3u$ 6u$(medium) 12u$(xsmall) profile">
								<img src="images/profile_placeholder.gif" alt="" />
								<h4>Voluptatem dicta</h4>
								<p>Et natus sapiente</p>
							</section>
						</div>
					</section>
					<footer>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam dolore illum, temporibus veritatis eligendi, aliquam, dolor enim itaque veniam aut eaque sequi qui quia vitae pariatur repudiandae ab dignissimos ex!</p>
						<ul class="actions">
							<li>
								<a href="#" class="button big">Lorem ipsum dolor sit</a>
							</li>
						</ul>
					</footer>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style3 special">
				<div class="container">
					<header class="major">
						<h2>Thank you for visiting our website. </h2>
						<p>If you have questions, or need additional information, please contact us on the form below. We will respond shortly.</p>
					</header>
				</div>
				<div class="container 50%">
					<form action="#" method="post">
						<div class="row uniform">
							<div class="6u 12u$(small)">
								<input name="name" id="name" value="" placeholder="Name" type="text" required="required">
							</div>
							<div class="6u$ 12u$(small)">
								<input name="email" id="email" value="" placeholder="Mobile no." type="text">
							</div>
							<div class="12u$ 12u$(small)">
								<input name="email" id="email" value="" placeholder="Email" type="email">
							</div>
							<div class="12u$">
								<textarea name="message" id="message" placeholder="Message" rows="6"></textarea>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input value="Send Message" class="special big" type="submit"></li>
								</ul>
							</div>
						</div>
					</form>
				</div>
			</section>

</asp:Content>

