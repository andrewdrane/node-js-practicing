<div class="orders form">
<?php echo $this->Form->create('Order');?>
	<fieldset>
		<legend><?php echo __('Add Order'); ?></legend>
	<?php
		echo $this->Form->input('status');
		echo $this->Form->input('customer_id');
		echo $this->Form->input('terminal_id');
		echo $this->Form->input('carrier_id');
		echo $this->Form->input('zone');
		echo $this->Form->input('split');
		echo $this->Form->input('requested_delivery_time');
		echo $this->Form->input('actual_delivery_time');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit'));?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Orders'), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Customers'), array('controller' => 'customers', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Customer'), array('controller' => 'customers', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Terminals'), array('controller' => 'terminals', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Terminal'), array('controller' => 'terminals', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Carriers'), array('controller' => 'carriers', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Carrier'), array('controller' => 'carriers', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Invoices'), array('controller' => 'invoices', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Invoice'), array('controller' => 'invoices', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Order Details'), array('controller' => 'order_details', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Order Detail'), array('controller' => 'order_details', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Order Splits'), array('controller' => 'order_splits', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Order Split'), array('controller' => 'order_splits', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Trucking Details'), array('controller' => 'trucking_details', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Trucking Detail'), array('controller' => 'trucking_details', 'action' => 'add')); ?> </li>
	</ul>
</div>
