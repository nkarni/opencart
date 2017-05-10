<?php echo $header; ?>
<div class="contact-us container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php if($sent){ ?>
      <h2>You enquiry was sent, we will be in touch shortly.</h2><br>
      <?php } ?>
      <div class="contact-us-info">
        <?php echo isset($article) ? $article : ''; ?>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_contact; ?></legend>
          <div class="form-group required">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>Enquiry Type *</label>
              <select name="enquiry_type" value="<?php echo $enquiry_type; ?>">
                <option value="">Please select:</option>
                <option>General Enquiry</option>
                <option>New Product</option>
                <option>Trial Product</option>
                <option>Other</option>
              </select>
              <?php if ($error_enquiry_type) { ?>
              <div class="text-danger"><?php echo $error_enquiry_type; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>First Name *</label>
              <input type="text" name="first_name" value="<?php echo $first_name; ?>" id="input-first-name" />
              <?php if ($error_first_name) { ?>
              <div class="text-danger"><?php echo $error_first_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>Last Name *</label>
              <input type="text" name="last_name" value="<?php echo $last_name; ?>" id="input-last-name" />
              <?php if ($error_last_name) { ?>
              <div class="text-danger"><?php echo $error_last_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>Email *</label>
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>Postcode *</label>
              <input type="text" name="postcode" value="<?php echo $postcode; ?>" id="input-postcode" />
              <?php if ($error_postcode) { ?>
              <div class="text-danger"><?php echo $error_postcode; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>Country *</label>
              <select name="country" id="country" class="form-control" value="<?php echo $country;?>">
                <?php foreach ($countries as $c) { ?>
                <?php if ($c['name'] == $country) { ?>
                <option value="<?php echo $c['name']; ?>" selected="selected"><?php echo $c['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $c['name']; ?>"><?php echo $c['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if ($error_country) { ?>
              <div class="text-danger"><?php echo $error_country; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>Company</label>
              <input type="text" name="company" value="<?php echo $company; ?>" id="input-company" />
            </div>
          </div>
          <div class="form-group required">
            <div class="col-md-4 col-sm-6 col-xs-12">
              <label>Enquiry *</label>
              <textarea name="enquiry" rows="10" id="input-enquiry" placeholder="Please provide some information about the nature of your enquiry"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
        </fieldset>
        <div class="buttons">
          <button class="btn btn-primary" type="submit"><?php echo $button_submit; ?></button>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
$(function() {
  $('.contact-us form select').each(function(idx, el) {
    $(el).val($(el).attr('value'));
  })
});
</script>
<?php echo $footer; ?>
