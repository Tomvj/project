
<script
	src="https://jssors8.azureedge.net/script/jssor.slider-27.5.0.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	jssor_1_slider_init = function() {

		var jssor_1_SlideshowTransitions = [ {
			$Duration : 600,
			$Delay : 60,
			$Cols : 8,
			$Rows : 4,
			$Opacity : 2
		}, {
			$Duration : 800,
			x : -0.2,
			$Delay : 40,
			$Cols : 12,
			$During : {
				$Left : [ 0.4, 0.6 ]
			},
			$SlideOut : true,
			$Formation : $JssorSlideshowFormations$.$FormationStraight,
			$Assembly : 260,
			$Easing : {
				$Left : $Jease$.$InOutExpo,
				$Opacity : $Jease$.$InOutQuad
			},
			$Opacity : 2,
			$Outside : true,
			$Round : {
				$Top : 0.5
			},
			$Brother : {
				$Duration : 800,
				x : 0.2,
				$Delay : 40,
				$Cols : 12,
				$Formation : $JssorSlideshowFormations$.$FormationStraight,
				$Assembly : 1028,
				$Easing : {
					$Left : $Jease$.$InOutExpo,
					$Opacity : $Jease$.$InOutQuad
				},
				$Opacity : 2,
				$Round : {
					$Top : 0.5
				},
				$Shift : -200
			}
		}, {
			$Duration : 800,
			x : 0.2,
			$Delay : 40,
			$Cols : 12,
			$During : {
				$Left : [ 0.4, 0.6 ]
			},
			$SlideOut : true,
			$Formation : $JssorSlideshowFormations$.$FormationStraight,
			$Easing : {
				$Left : $Jease$.$InOutExpo,
				$Opacity : $Jease$.$InOutQuad
			},
			$Opacity : 2,
			$Outside : true,
			$Round : {
				$Top : 0.5
			},
			$Brother : {
				$Duration : 800,
				x : 0.2,
				$Delay : 40,
				$Cols : 12,
				$Formation : $JssorSlideshowFormations$.$FormationStraight,
				$Assembly : 1028,
				$Easing : {
					$Left : $Jease$.$InOutExpo,
					$Opacity : $Jease$.$InOutQuad
				},
				$Opacity : 2,
				$Round : {
					$Top : 0.5
				},
				$Shift : -200
			}
		}, {
			$Duration : 500,
			$Delay : 12,
			$Cols : 10,
			$Rows : 5,
			$Opacity : 2,
			$Clip : 15,
			$SlideOut : true,
			$Formation : $JssorSlideshowFormations$.$FormationStraightStairs,
			$Assembly : 2049,
			$Easing : $Jease$.$OutQuad
		}, {
			$Duration : 500,
			$Delay : 50,
			$Cols : 10,
			$Rows : 5,
			$Opacity : 2,
			$Clip : 15,
			$SlideOut : true,
			$Formation : $JssorSlideshowFormations$.$FormationRectangleCross,
			$Easing : $Jease$.$OutQuad
		}, {
			$Duration : 500,
			$Delay : 12,
			$Cols : 10,
			$Rows : 5,
			$Opacity : 2,
			$Clip : 15,
			$Formation : $JssorSlideshowFormations$.$FormationStraightStairs,
			$Assembly : 2050,
			$Easing : {
				$Clip : $Jease$.$InSine
			}
		}, {
			$Duration : 600,
			x : -1,
			$Delay : 12,
			$Cols : 10,
			$Rows : 5,
			$SlideOut : true,
			$Formation : $JssorSlideshowFormations$.$FormationZigZag,
			$Assembly : 513,
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$OutQuad
			},
			$Opacity : 2
		}, {
			$Duration : 500,
			x : 1,
			$Delay : 40,
			$Cols : 10,
			$Rows : 5,
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Opacity : $Jease$.$OutQuad
			},
			$Opacity : 2
		}, {
			$Duration : 400,
			$Delay : 50,
			$Cols : 10,
			$Clip : 2,
			$Formation : $JssorSlideshowFormations$.$FormationStraight
		}, {
			$Duration : 400,
			$Rows : 6,
			$Clip : 4
		}, {
			$Duration : 400,
			$Delay : 40,
			$Rows : 10,
			$Formation : $JssorSlideshowFormations$.$FormationStraight,
			$Opacity : 2
		}, {
			$Duration : 400,
			$Delay : 40,
			$Rows : 10,
			$Formation : $JssorSlideshowFormations$.$FormationStraight,
			$Opacity : 2,
			$Assembly : 260
		}, {
			$Duration : 400,
			$Delay : 40,
			$Cols : 16,
			$Formation : $JssorSlideshowFormations$.$FormationStraight,
			$Opacity : 2,
			$Assembly : 260
		}, {
			$Duration : 400,
			$Delay : 40,
			$Cols : 16,
			$Formation : $JssorSlideshowFormations$.$FormationStraight,
			$Opacity : 2
		} ];

		var jssor_1_options = {
			$AutoPlay : 1,
			$SlideshowOptions : {
				$Class : $JssorSlideshowRunner$,
				$Transitions : jssor_1_SlideshowTransitions
			},
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$
			},
			$BulletNavigatorOptions : {
				$Class : $JssorBulletNavigator$
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		/*#region responsive code begin*/

		var MAX_WIDTH = 980;

		function ScaleSlider() {
			var containerElement = jssor_1_slider.$Elmt.parentNode;
			var containerWidth = containerElement.clientWidth;

			if (containerWidth) {

				var expectedWidth = Math.min(MAX_WIDTH || containerWidth,
						containerWidth);

				jssor_1_slider.$ScaleWidth(expectedWidth);
			} else {
				window.setTimeout(ScaleSlider, 30);
			}
		}

		ScaleSlider();

		$Jssor$.$AddEvent(window, "load", ScaleSlider);
		$Jssor$.$AddEvent(window, "resize", ScaleSlider);
		$Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
		/*#endregion responsive code end*/
	};
</script>
<style>
/*jssor slider loading skin spin css*/
.jssorl-009-spin img {
	animation-name: jssorl-009-spin;
	animation-duration: 1.6s;
	animation-iteration-count: infinite;
	animation-timing-function: linear;
}

@
keyframes jssorl-009-spin {from { transform:rotate(0deg);
	
}

to {
	transform: rotate(360deg);
}

}

/*jssor slider bullet skin 053 css*/
.jssorb053 .i {
	position: absolute;
	cursor: pointer;
}

.jssorb053 .i .b {
	fill: #fff;
	fill-opacity: 0.5;
}

.jssorb053 .i:hover .b {
	fill-opacity: .7;
}

.jssorb053 .iav .b {
	fill-opacity: 1;
}

.jssorb053 .i.idn {
	opacity: .3;
}

/*jssor slider arrow skin 093 css*/
.jssora093 {
	display: block;
	position: absolute;
	cursor: pointer;
}

.jssora093 .c {
	fill: none;
	stroke: #fff;
	stroke-width: 400;
	stroke-miterlimit: 10;
}

.jssora093 .a {
	fill: none;
	stroke: #fff;
	stroke-width: 400;
	stroke-miterlimit: 10;
}

.jssora093:hover {
	opacity: .8;
}

.jssora093.jssora093dn {
	opacity: .6;
}

.jssora093.jssora093ds {
	opacity: .3;
	pointer-events: none;
}
</style>
<div id="jssor_1" 
	style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 980px; height: 380px; overflow: hidden; visibility: hidden;">
	<!-- Loading Screen -->
	<div data-u="loading" class="jssorl-009-spin" style="margin-top:15%"
		style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; text-align: center; background-color: rgba(0, 0, 0, 0.7);">
		<img
			style="margin-top: -19px; position: relative; top: 50%; width: 38px; height: 38px;"
			src="https://jssorcdn7.azureedge.net/theme/svg/loading/static-svg/spin.svg" />
	</div>
	<div data-u="slides"
		style="cursor: default; position: relative; top: 0px; left: 0px; width: 980px; height: 380px; overflow: hidden;">
		<div>
			<img data-u="image" src="resources/images/slide2.jpg" />
		</div>
		<div>
			<img data-u="image" src="resources/images/slide3.jpg" />
		</div>
		<div>
			<img data-u="image" src="resources/images/slide4.jpg" />
		</div>
		<div>
			<img data-u="image" src="resources/images/slide5.jpg" />
		</div>
		<div>
			<img data-u="image" src="resources/images/slider6.jpg" />
		</div>
		<div>
			<img data-u="image" src="resources/images/slide1.jpg" />
		</div>
	</div>
	<!-- Bullet Navigator -->
	<div data-u="navigator" class="jssorb053"
		style="position: absolute; bottom: 12px; right: 12px;"
		data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
		<div data-u="prototype" class="i" style="width: 16px; height: 16px;">
			<svg viewbox="0 0 16000 16000"
				style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                    <path class="b"
					d="M11400,13800H4600c-1320,0-2400-1080-2400-2400V4600c0-1320,1080-2400,2400-2400h6800 c1320,0,2400,1080,2400,2400v6800C13800,12720,12720,13800,11400,13800z"></path>
                </svg>
		</div>
	</div>
	<!-- Arrow Navigator -->
	<div data-u="arrowleft" class="jssora093"
		style="width: 50px; height: 50px; top: 0px; left: 30px;"
		data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
		<svg viewbox="0 0 16000 16000"
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <circle class="c" cx="8000" cy="8000" r="5920"></circle>
                <polyline class="a"
				points="7777.8,6080 5857.8,8000 7777.8,9920 "></polyline>
                <line class="a" x1="10142.2" y1="8000" x2="5857.8"
				y2="8000"></line>
            </svg>
	</div>
	<div data-u="arrowright" class="jssora093"
		style="width: 50px; height: 50px; top: 0px; right: 30px;"
		data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
		<svg viewbox="0 0 16000 16000"
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <circle class="c" cx="8000" cy="8000" r="5920"></circle>
                <polyline class="a"
				points="8222.2,6080 10142.2,8000 8222.2,9920 "></polyline>
                <line class="a" x1="5857.8" y1="8000" x2="10142.2"
				y2="8000"></line>
            </svg>
	</div>
</div>
<script type="text/javascript">
	jssor_1_slider_init();
</script>
