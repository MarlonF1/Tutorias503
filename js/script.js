(function ($) {
    'use strict';

    // Preloader js    
    $(window).on('load', function () {
        $('.preloader').fadeOut(700);
    });

    // Sticky Menu
    $(window).scroll(function () {
        if ($('header').offset().top > 10) {
            $('.top-header').addClass('hide');
            $('.navigation').addClass('nav-bg');
        } else {
            $('.top-header').removeClass('hide');
            $('.navigation').removeClass('nav-bg');
        }
    });

    // Background-images
    $('[data-background]').each(function () {
        $(this).css({
            'background-image': 'url(' + $(this).data('background') + ')'
        });
    });

    //Hero Slider
    $('.hero-slider').slick({
        autoplay: true,
        autoplaySpeed: 7500,
        pauseOnFocus: false,
        pauseOnHover: false,
        infinite: true,
        arrows: true,
        fade: true,
        prevArrow: '<button type=\'button\' class=\'prevArrow\'><i class=\'ti-angle-left\'></i></button>',
        nextArrow: '<button type=\'button\' class=\'nextArrow\'><i class=\'ti-angle-right\'></i></button>',
        dots: true
    });
    $('.hero-slider').slickAnimation();

    // venobox popup
    $(document).ready(function () {
        $('.venobox').venobox();
    });


    // filter
    $(document).ready(function () {
        var containerEl = document.querySelector('.filtr-container');
        var filterizd;
        if (containerEl) {
            filterizd = $('.filtr-container').filterizr({});
        }
        //Active changer
        $('.filter-controls li').on('click', function () {
            $('.filter-controls li').removeClass('active');
            $(this).addClass('active');
        });
    });

    //  Count Up
    function counter() {
        var oTop;
        if ($('.count').length !== 0) {
            oTop = $('.count').offset().top - window.innerHeight;
        }
        if ($(window).scrollTop() > oTop) {
            $('.count').each(function () {
                var $this = $(this),
                    countTo = $this.attr('data-count');
                $({
                    countNum: $this.text()
                }).animate({
                    countNum: countTo
                }, {
                    duration: 1000,
                    easing: 'swing',
                    step: function () {
                        $this.text(Math.floor(this.countNum));
                    },
                    complete: function () {
                        $this.text(this.countNum);
                    }
                });
            });
        }
    }
    $(window).on('scroll', function () {
        counter();
    });

    
    // Aos js
    AOS.init({
        once: true
    });

    //prueba carrito

    $(document).ready(function(){

    
        load_cart_data();
        
        function load_cart_data()
        {
            $.ajax({
                url:"fetch_cart.php",
                method:"POST",
                dataType:"json",
                success:function(data)
                {
                    $('#cart_details').html(data.cart_details);
                    $('.total_price').text(data.total_price);
                    $('.badge').text(data.total_item);
                }
            });
        }
    
        $('#cart-popover').popover({
            html : true,
            container: 'body',
            content:function(){
                return $('#popover_content_wrapper').html();
            }
        });
    
        $(document).on('click', '.add_to_cart', function(){
            var product_id = $(this).attr("id");
            var product_name = $('#name'+product_id+'').val();
            var product_price = $('#price'+product_id+'').val();
            var product_quantity = $('#quantity'+product_id).val();
            var action = "add";
            if(product_quantity > 0)
            {
                $.ajax({
                    url:"action.php",
                    method:"POST",
                    data:{product_id:product_id, product_name:product_name, product_price:product_price, product_quantity:product_quantity, action:action},
                    success:function(data)
                    {
                        load_cart_data();
                        alert("Compra añadida con exito");
                    }
                });
            }
            else
            {
                alert("");
            }
        });
    
        $(document).on('click', '.delete', function(){
            var product_id = $(this).attr("id");
            var action = 'remove';
            if(confirm("Esta seguro que desea remover este servicio?"))
            {
                $.ajax({
                    url:"action.php",
                    method:"POST",
                    data:{product_id:product_id, action:action},
                    success:function()
                    {
                        load_cart_data();
                        $('#cart-popover').popover('hide');
                        alert("Servicio removido exitosamente del carrito");
                    }
                })
            }
            else
            {
                return false;
            }
        });
    
        $(document).on('click', '#clear_cart', function(){
            var action = 'empty';
            $.ajax({
                url:"action.php",
                method:"POST",
                data:{action:action},
                success:function()
                {
                    load_cart_data();
                    $('#cart-popover').popover('hide');
                    alert("El carrito a sido limpiado con exito");
                }
            });
        });
        
    });

    // Animation
    $(document).ready(function() {
        $('.has-animation').each(function(index) {
          $(this).delay($(this).data('delay')).queue(function(){
            $(this).addClass('animate-in');
          });
        });
      });
      
})(jQuery);