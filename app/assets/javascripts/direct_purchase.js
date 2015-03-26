$(document).ready(function(){

	//auto-fill unit cost of product in direct purchase
  $("#direct_purchase_product").change(function() {
  	$("#direct_purchase_unit_cost").val($(this).val());
  	alert($(this).val());
	});

  //compute for total unit cost when unit cost is changed
	$("#direct_purchase_unit_cost").change(function() {
		var unit_cost = parseFloat($("#direct_purchase_unit_cost").val()),
				commission_rate = parseFloat($("#direct_purchase_commission_rate").val()),
				total_unit_cost = unit_cost + commission_rate;

  	$("#direct_purchase_total_unit_cost").val(total_unit_cost)
	});

	//compute for total unit cost and commission amount when commission rate is changed
	$("#direct_purchase_commission_rate").change(function() {
		var unit_cost = parseFloat($("#direct_purchase_unit_cost").val()),
				commission_rate = parseFloat($("#direct_purchase_commission_rate").val()),
				quantity = parseFloat($("#direct_purchase_quantity").val()),
				total_unit_cost = unit_cost + commission_rate;
				commission_amount = quantity * commission_rate;

  	$("#direct_purchase_total_unit_cost").val(total_unit_cost);
  	$("#direct_purchase_commission_amount").val(commission_amount);
	});

	//compute for commission amount and payable gross when quantity is changed
	$("#direct_purchase_quantity").change(function() {
		var quantity = parseFloat($("#direct_purchase_quantity").val()),
				commission_rate = parseFloat($("#direct_purchase_commission_rate").val()),
				total_unit_cost = parseFloat($("#direct_purchase_total_unit_cost").val()),
				commission_amount = quantity * commission_rate,
				payable_gross = quantity * total_unit_cost;

  	$("#direct_purchase_commission_amount").val(commission_amount);
  	$("#direct_purchase_payable_gross").val(payable_gross);
	});

	//compute for total unit cost when total unit cost is hovered
	$("#direct_purchase_total_unit_cost").mouseenter(function() {
		var unit_cost = parseFloat($("#direct_purchase_unit_cost").val()),
				commission_rate = parseFloat($("#direct_purchase_commission_rate").val()),
				total_unit_cost = unit_cost + commission_rate;

  	$("#direct_purchase_total_unit_cost").val(total_unit_cost);
	});

	//compute for total unit cost when total unit cost is focused
	$("#direct_purchase_total_unit_cost").focus(function() {
		var unit_cost = parseFloat($("#direct_purchase_unit_cost").val()),
				commission_rate = parseFloat($("#direct_purchase_commission_rate").val()),
				total_unit_cost = unit_cost + commission_rate;

  	$("#direct_purchase_total_unit_cost").val(total_unit_cost);
	});

	//compute for commission amount when commission amount is hovered
	$("#direct_purchase_commission_amount").mouseenter(function() {
		var quantity = parseFloat($("#direct_purchase_quantity").val()),
				commission_rate = parseFloat($("#direct_purchase_commission_rate").val()),
				commission_amount = quantity * commission_rate;

  	$("#direct_purchase_commission_amount").val(commission_amount);
	});

	//compute for commission amount when commission amount is focused
	$("#direct_purchase_commission_amount").focus(function() {
		var quantity = parseFloat($("#direct_purchase_quantity").val()),
				commission_rate = parseFloat($("#direct_purchase_commission_rate").val()),
				commission_amount = quantity * commission_rate;

  	$("#direct_purchase_commission_amount").val(commission_amount);
	});

  //compute for payable gross when payable gross is hovered
	$("#direct_purchase_payable_gross").mouseenter(function() {
		var quantity = parseFloat($("#direct_purchase_quantity").val()),
				total_unit_cost = parseFloat($("#direct_purchase_total_unit_cost").val()),
				payable_gross = quantity * total_unit_cost;

  	$("#direct_purchase_payable_gross").val(payable_gross);
	});

	//compute for payable gross when payable gross is focused
	$("#direct_purchase_payable_gross").focus(function() {
		var quantity = parseFloat($("#direct_purchase_quantity").val()),
				total_unit_cost = parseFloat($("#direct_purchase_total_unit_cost").val()),
				payable_gross = quantity * total_unit_cost;

  	$("#direct_purchase_payable_gross").val(payable_gross);
	});

	//compute for payable net when payable net is hovered
	$("#direct_purchase_payable_net").mouseenter(function() {
		var witholding_tax = parseFloat($("#direct_purchase_witholding_tax").val()),
				misc_fees = parseFloat($("#direct_purchase_liens_cost").val()) + parseFloat($("#direct_purchase_storage_cost").val()) + 
				parseFloat($("#direct_purchase_insurance_cost").val()) + parseFloat($("#direct_purchase_penalty_cost").val()),
				payable_gross = parseFloat($("#direct_purchase_payable_gross").val())
				payable_net = payable_gross - (witholding_tax + misc_fees);
				
  	$("#direct_purchase_payable_net").val(payable_net);
  });

  //compute for payable net when payable net is focused
	$("#direct_purchase_payable_net").focus(function() {
		var witholding_tax = parseFloat($("#direct_purchase_witholding_tax").val()),
				misc_fees = parseFloat($("#direct_purchase_liens_cost").val()) + parseFloat($("#direct_purchase_storage_cost").val()) + 
				parseFloat($("#direct_purchase_insurance_cost").val()) + parseFloat($("#direct_purchase_penalty_cost").val()),
				payable_gross = parseFloat($("#direct_purchase_payable_gross").val())
				payable_net = payable_gross - (witholding_tax + misc_fees);
				
  	$("#direct_purchase_payable_net").val(payable_net);
  });

	// compute for payable net when witholding tax is changed
	$("#direct_purchase_witholding_tax").change(function() {
		var witholding_tax = parseFloat($("#direct_purchase_witholding_tax").val()),
				misc_fees = parseFloat($("#direct_purchase_liens_cost").val()) + parseFloat($("#direct_purchase_storage_cost").val()) + 
				parseFloat($("#direct_purchase_insurance_cost").val()) + parseFloat($("#direct_purchase_penalty_cost").val()),
				payable_gross = parseFloat($("#direct_purchase_payable_gross").val())
				payable_net = payable_gross - (witholding_tax + misc_fees);
				
  	$("#direct_purchase_payable_net").val(payable_net);
  });

  // compute for payable net when liens cost is changed
	$("#direct_purchase_liens_cost").change(function() {
		var witholding_tax = parseFloat($("#direct_purchase_witholding_tax").val()),
				misc_fees = parseFloat($("#direct_purchase_liens_cost").val()) + parseFloat($("#direct_purchase_storage_cost").val()) + 
				parseFloat($("#direct_purchase_insurance_cost").val()) + parseFloat($("#direct_purchase_penalty_cost").val()),
				payable_gross = parseFloat($("#direct_purchase_payable_gross").val())
				payable_net = payable_gross - (witholding_tax + misc_fees);
				
  	$("#direct_purchase_payable_net").val(payable_net);
  });

  // compute for payable net when storage cost is changed
	$("#direct_purchase_storage_cost").change(function() {
		var witholding_tax = parseFloat($("#direct_purchase_witholding_tax").val()),
				misc_fees = parseFloat($("#direct_purchase_liens_cost").val()) + parseFloat($("#direct_purchase_storage_cost").val()) + 
				parseFloat($("#direct_purchase_insurance_cost").val()) + parseFloat($("#direct_purchase_penalty_cost").val()),
				payable_gross = parseFloat($("#direct_purchase_payable_gross").val())
				payable_net = payable_gross - (witholding_tax + misc_fees);
				
  	$("#direct_purchase_payable_net").val(payable_net);
  });

  // compute for payable net when insurance cost is changed
	$("#direct_purchase_insurance_cost").change(function() {
		var witholding_tax = parseFloat($("#direct_purchase_witholding_tax").val()),
				misc_fees = parseFloat($("#direct_purchase_liens_cost").val()) + parseFloat($("#direct_purchase_storage_cost").val()) + 
				parseFloat($("#direct_purchase_insurance_cost").val()) + parseFloat($("#direct_purchase_penalty_cost").val()),
				payable_gross = parseFloat($("#direct_purchase_payable_gross").val())
				payable_net = payable_gross - (witholding_tax + misc_fees);
				
  	$("#direct_purchase_payable_net").val(payable_net);
  });

  // compute for payable net when penalty cost is changed
	$("#direct_purchase_penalty_cost").change(function() {
		var witholding_tax = parseFloat($("#direct_purchase_witholding_tax").val()),
				misc_fees = parseFloat($("#direct_purchase_liens_cost").val()) + parseFloat($("#direct_purchase_storage_cost").val()) + 
				parseFloat($("#direct_purchase_insurance_cost").val()) + parseFloat($("#direct_purchase_penalty_cost").val()),
				payable_gross = parseFloat($("#direct_purchase_payable_gross").val())
				payable_net = payable_gross - (witholding_tax + misc_fees);
				
  	$("#direct_purchase_payable_net").val(payable_net);
  });

}); 