var checkout_corp = checkout_corp || {}

checkout_corp.paginate = (function() {
  'use script';

  function init() {
    $("#per_page_options").on({change: changePerPage});
  }

  function changePerPage() {
    var target = $(this).data('target');
    var form   = $("form");

    if (target !== undefined)
      form = $(target)

    $("#per_page").val($(this).val());
    form.submit();
  }

  return {
    init: init
  }
}());

checkout_corp.paginate.init();
