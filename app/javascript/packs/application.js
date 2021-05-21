// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("jquery")
require("jquery-ui")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import $ from 'jquery';
import 'jquery-ui/ui/core';
import 'jquery-ui/ui/widgets/sortable';
global.$ = jQuery;

// pasted from gem rails_sortable
(function($) {

  $.fn.railsSortable = function(options) {
    options = options || {};
    var settings = $.extend({}, options);

    settings.update = function(event, ui) {
      if (typeof options.update === 'function') {
        options.update(event, ui);
      }

      $.ajax({
        type: 'POST',
        url: '/sortable/reorder',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify({
          rails_sortable: $(this).sortable('toArray'),
        }),
      });
    }

    this.sortable(settings);
  };
})($);
