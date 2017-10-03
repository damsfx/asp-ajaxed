var AxdDT = function(tID, sorted) {
	this.table = $('#'+tID)[0];
	this.sorted = '';
	this.lastSelectedRow = null;
	this.fullsearchQuery = '';
	this.page = 1;
	$this = this;


	this.goTo = function(pageNr) {
		this.callback('goTo', {axd_dt_page: pageNr}, function(trans) {
			$this.page = pageNr;
		});
	};
	this.setSorted = function(col) {
		this.sorted = col.toLowerCase();
		$('#' + this.table.id + ' th').each( function(i, el) {
			$(el).removeClass("sortedASC sortedDESC");
		});
		
		$(this.sorted.split(',')).each( function(i, c) {
			c = $.trim(c);
			var name = $.trim(c.replace(/ desc$| asc$/ig, ''));
			var dir = "ASC";
			if (c.match(/ desc$/i)) dir = "DESC";
			$("#" + $this.table.id + ' th.axdCol_' + name).addClass('sorted' + dir);
		});
	};
	this.callback = function(method, params, onCompleted, container) {
		//we pass all other criterias as well, so that everything is remembered
		//on the callback the actual params are merged and thus the existing one overriden
		var allParams = {
			axd_dt_id: this.table.id,
			axd_dt_sort: this.sorted,
			axd_dt_fullsearch: this.fullsearchQuery,
			axd_dt_page: this.page
		};
		//also add the record selections
		var selected = [];
		$('#' + this.table.id + " .axdDTColSelection input:checked").each(function(i, el){
			selected.push(el.value);
		});
		allParams[this.table.id] = selected;
		ajaxed.callback(
			"axd_dt_" + method, 
			(container) ? container : $this.table.id + "_body", 
			// allParams.merge(params), 
			$.extend( allParams, params ),
			null,
			function(trans) {
				//the trick with paging is that the last row of the body is the paging row
				//we take it and move it into the footer.
				// $('#' + $this.table.id + ' tfoot')[0].update();
				foot = $('#' + $this.table.id + '_body > tr:last-child')
					.detach();
				$('#' + $this.table.id + ' tfoot').html(foot);
				onCompleted();
			}
		);
	};
	this.toggleRow = function(rowID, selected, unselectLast) {
		var row = $('#' + rowID);
		var css = "axdDTRowSelected";
		if (unselectLast && this.lastSelectedRow) this.lastSelectedRow.removeClass(css);
		if (selected) row.addClass(css);
		else row.removeClass(css);
		this.lastSelectedRow = row;
	};
	this.sort = function(col) {
		var dir = "ASC";
		col = $.trim(col).toLowerCase();
		$(this.sorted.split(',')).each( function(i, c) {
			c = $.trim(c).toLowerCase();
			var name = c.replace(/ desc$| asc$/ig, '').toLowerCase();
			if (name == col) {
				if (c.match(/ desc$/i)) dir = "ASC";
				else if (c.match(/ asc$/i)) dir = "DESC";
				else dir = "DESC";
			}
		});
		var sort = col + ' ' + dir;
		this.callback('sort', {axd_dt_sort: sort}, function(trans) {
			$this.setSorted(sort);
		});
	};	
	this.search = function(query) {
		//when fullsearch is used we need to reset it to page 1.
		this.page = 1;
		this.callback('fullsearch', {axd_dt_fullsearch: query}, function(trans) {
			$this.fullsearchQuery = query;
		});
	};

	this.setSorted(sorted);
	return this;
}