<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php }

$class = 'col-sm-12';
?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <h5>Created On :<?php echo $created_on; ?></h5>        
      <?php if(!$is_owner){ ?>
      <h5>Created By :<?php echo $created_by; ?></h5>
      <?php } ?>      
        
          <!-- Content for Popover #1 -->
          <div class="hidden wishlist-container-confirm" id="a1" style="position:absolute;">
              <div class="popover-heading">
                  <span class="close">close &times;</span>
              </div>

              <div class="popover-body-text">
                  <div class="popover-body1">
                 <span>Are you sure to purchase for <?php echo $created_by; ?>?</span>
				  </div>
              </div>
              <div class="input-group"> <input type="text" class="form-control" name="wishlist_name" id="wishlist_name"  ><span class="input-group-btn"><button type="button" product="" class="addlist btn btn-default" >ADD</button></span></div>
          </div>
          <!-- Popover container ends here -->


        <?php if($visiblity) { ?>
        <div syle="width:100%;">

            <div class="goodshare-color row" style="float:right;padding:10px;">
                <?php if($wishlists_copy_url_status) { ?>
                    <span class="show-copy-link btn btn-primary btn-small"  onclick="js:CopyToClipboard('<?php echo $mysharelink; ?>');" style="padding:none !important;line-height:0.5 !important;">Copy URL</span>
                <?php } ?>
                    <a class="show-copy-link btn btn-primary btn-small" href="mailto:?body=<?php echo str_replace("&amp;","%26", $mysharelink); ?>" style="padding:none !important;line-height:0.5 !important;">Email URL</a>
            </div>

        </div>

        <?php } ?>


        <?php if ($wishlistitems) { ?>

      <table class="table table-hover my-wishlist-table">
		  <!--
        <thead>			
          <tr>
            <td class="text-left"></td>

            <td class="text-left"><?php echo $column_name; ?></td>

            <td class="text-right"><?php echo $column_status; ?></td>

            <td class="text-right"><?php echo $column_action; ?></td>            
          </tr>          
        </thead>
        -->
        <thead>
        <tr>
          <td class="text-left" width="15%"></td>

          <td class="text-left" width="45%">Product</td>

          <td class="text-left" width="15%">Selected Options</td>

          <td class="text-right" width="10%">Price</td>

          <td class="text-right" width="15%"></td>
        </tr>
        </thead>
        <tbody>
          <?php foreach ($wishlistitems as $wishlistitem) { ?>
          <tr id="tr-<?php echo $wishlistitem['wishlist_item_id']; ?>">
              <td class="text-center"><?php if ($wishlistitem['thumb']) { ?>

                  <a href="<?php echo $wishlistitem['href']; ?>"><img src="<?php echo $wishlistitem['thumb']; ?>" alt="<?php echo $wishlistitem['product_name']; ?>" title="<?php echo $wishlistitem['product_name']; ?>" /></a>
                  <?php } ?></td>
            <td class="text-left"><a href="<?php echo $wishlistitem['href']; ?>"><?php echo $wishlistitem['product_name']; ?></a><br><small><?php echo $wishlistitem['short_description'] ; ?></small></td>
              <td  class="text-left">
              <?php
                foreach ($wishlistitem['full_product_data'][0]['option'] as $option) {
                  echo '<small>' . $option['name'] . ': ' . $option['value'] . '</small><br>';
                }
              ?>
              </td>
              <td class="text-right">

                            <p class="price">
                              <?php if ($wishlistitem['price_num'] && $wishlistitem['price_num'] > 0) {
                                 echo $wishlistitem['formatted_price'];
                              }else{
                                echo 'TBA';
                              } ?>
                            </p>
              </td>

              <td class="text-right">

                <div class="input-group btn-block" style="max-width: 200px;">
                  <input type="text" name="quantity[<?php echo $wishlistitem['wishlist_item_id']; ?>]" value="<?php echo $wishlistitem['quantity']; ?>" size="1" class="input-number form-control" />
                  <input type="hidden" id="itemname_<?php echo $wishlistitem['wishlist_item_id']; ?>" value="<?php echo $wishlistitem['product_name']; ?>"/>
                  <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" data-item-id="<?php echo $wishlistitem['wishlist_item_id']; ?>" title="<?php echo $button_update; ?>" class="btn btn-primary update-qty"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" data-item-id="<?php echo $wishlistitem['wishlist_item_id']; ?>" title="<?php echo $button_remove; ?>" class="btn btn-danger remove-wishlist-item"><i class="fa fa-times-circle"></i></button>
                  </span>
                </div>

                <button class="btn btn-primary bt-text add-to-order"  title="" tabindex="0" data-item-id="<?php echo $wishlistitem['wishlist_item_id']; ?>" ><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add to Order&nbsp;&nbsp;&nbsp;</button>
              </td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>

      <?php echo $content_bottom; ?></div>
    <?php // echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">

    function updateListItem(itemId, quantity, action){
        $.ajax({
            url: 'index.php?route=account/wishlists/' + action,
            type: 'post',
            data: {
                'wishlist_item_id': itemId,
                'quantity' : quantity,
                'action': action
            },
            dataType: 'json',
            beforeSend: function() {
                $(".table").find("[data-item-id='" + itemId + "']").addClass('disabled');
            },
            complete: function() {
                $(".table").find("[data-item-id='" + itemId + "']").removeClass('disabled');
            },
            success: function (json) {
                $return = '';
                if (json.success) {
                    $return = json.success;
                    window.location.reload();
                }
                else if (json.info) {
                    $return = json.info;
                }
                //close popover widget
                $('.popover').popover('hide');
            }
        });
    }

    $(document).on('click', '.update-qty', function() {
        var itemId = $(this).data('item-id');
        var qty = $('[name="quantity[' + itemId + ']"]').val();
        if(isNaN(qty)){
            alert('Quantity must be a number');
        }else{
            updateListItem(itemId, qty, 'updateWishlistitemQty' );
        }
    });

    $(document).on('click', '.remove-wishlist-item', function() {
        if(confirm('Are you sure?')){
            var itemId = $(this).data('item-id');
            updateListItem(itemId, '0', 'updateWishlistitemQty' );
        }
    });

    $(document).ready(function(){

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

        $(".show-copy-link").click(function(){
            $(".share-copy-link").css("display","block");
        });

    });
    function popitup(url,share) {
        shareurl = '';
        if(url != ''){

            if(share == "facebook"){
                shareurl = "https://facebook.com/sharer.php?u="+url;
            }
            else if(share == "google+"){
                shareurl = "https://plus.google.com/share?url="+url;
            }
            else if(share == "twitter"){
                shareurl = "https://twitter.com/intent/tweet?url="+url;
            }

        //    alert(shareurl);

            newwindow=window.open(url,'name','height=300,width=350');
            if (window.focus) {newwindow.focus()}
                return false;
        }
    }

    function CopyToClipboard(text) {
        window.prompt("Copy to clipboard: Ctrl+C, Enter", text);
    }
         
    $('.wishlist-add-form').click(function () {
		
        $currentproduct = $(this).attr('product');  
        $minimum = $(this).attr('minimum');  
		
		$buttontext = '<div class="buttons">';
		
		$buttontext += '<span id="addtoorder" product="'+$currentproduct+'" minimum="'+$minimum+'" class="btn btn-success">Yes</span>';
		
		$buttontext += '&nbsp;&nbsp;&nbsp;&nbsp;<span class="wishlist-close btn btn-danger">No</span>';   
		
		$buttontext += '</div>';   
		
        
       // $addbuttonhtml = 'test';

        $(this).popover({
            html: true,
            trigger: 'manual',
            placement: 'top',

            content: function () {
                $buttons = $('.popover-body1').html();
               // $activeproductrow = 'test';
                return $buttons+$buttontext;
                
            }
            
        }).popover('toggle');

    });


    $(document).on('click', '.add-to-order', function() {
        var itemId = $(this).data('item-id');
        var qty = $('[name="quantity[' + itemId + ']"]').val();
        var itemName = $('#itemname_' + itemId).val();


        if($.isNumeric(itemId) && $.isNumeric(qty)){
            $.ajax({
                url: 'index.php?route=account/wishlists/addItemToOrder',
                type: 'post',
                data: {
                    'wishlist_item_id': itemId,
                    'wishlist_item_name': itemName,
                    'quantity': qty
                },
                dataType: 'json',
                beforeSend: function() {
                    $('#cart > button').button('loading');
                },
                complete: function() {
                    $('#cart > button').button('reset');
                },
                success: function(json) {
                    if (json.success) {
                        $return = json.success;
                        $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + $return + ' <button type="button" class="close" data-dismiss="alert">&times;</button> <div>');
                    }
                    else if (json.info) {
                        $return = json.info;
                        $('#content').parent().before('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + $return + ' <button type="button" class="close" data-dismiss="alert">&times;</button> <div>');
                    }
                }
            });
        }
        $('.popover').popover('hide');
    });
		
   $(document).on('click', '.wishlist-close', function() { 
		$('.popover').popover('hide');
	});

</script>
