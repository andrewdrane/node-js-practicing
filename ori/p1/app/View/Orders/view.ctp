<div class="orders view">
<h2><?php  echo __('Order');?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($order['Order']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Status'); ?></dt>
		<dd>
			<?php echo h($order['Order']['status']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Customer'); ?></dt>
		<dd>
			<?php echo $this->Html->link($order['Customer']['name'], array('controller' => 'customers', 'action' => 'view', $order['Customer']['id'])); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Terminal'); ?></dt>
		<dd>
			<?php echo $this->Html->link($order['Terminal']['name'], array('controller' => 'terminals', 'action' => 'view', $order['Terminal']['id'])); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Carrier'); ?></dt>
		<dd>
			<?php echo $this->Html->link($order['Carrier']['name'], array('controller' => 'carriers', 'action' => 'view', $order['Carrier']['id'])); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Zone'); ?></dt>
		<dd>
			<?php echo h($order['Order']['zone']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Split'); ?></dt>
		<dd>
			<?php echo h($order['Order']['split']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Requested Delivery Time'); ?></dt>
		<dd>
			<?php echo h($order['Order']['requested_delivery_time']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Actual Delivery Time'); ?></dt>
		<dd>
			<?php echo h($order['Order']['actual_delivery_time']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Created'); ?></dt>
		<dd>
			<?php echo h($order['Order']['created']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Order'), array('action' => 'edit', $order['Order']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Order'), array('action' => 'delete', $order['Order']['id']), null, __('Are you sure you want to delete # %s?', $order['Order']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Orders'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Order'), array('action' => 'add')); ?> </li>
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
<div class="related">
	<h3><?php echo __('Related Invoices');?></h3>
	<?php if (!empty($order['Invoice'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Order Id'); ?></th>
		<th><?php echo __('Customer Id'); ?></th>
		<th><?php echo __('Manifest No'); ?></th>
		<th><?php echo __('Carrier Id'); ?></th>
		<th><?php echo __('Trucking Cost'); ?></th>
		<th><?php echo __('Total'); ?></th>
		<th><?php echo __('Is Paid'); ?></th>
		<th><?php echo __('Paid Date'); ?></th>
		<th><?php echo __('Payment Type'); ?></th>
		<th><?php echo __('Payment Ref No'); ?></th>
		<th><?php echo __('Updated'); ?></th>
		<th><?php echo __('Created'); ?></th>
		<th class="actions"><?php echo __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($order['Invoice'] as $invoice): ?>
		<tr>
			<td><?php echo $invoice['id'];?></td>
			<td><?php echo $invoice['order_id'];?></td>
			<td><?php echo $invoice['customer_id'];?></td>
			<td><?php echo $invoice['manifest_no'];?></td>
			<td><?php echo $invoice['carrier_id'];?></td>
			<td><?php echo $invoice['trucking_cost'];?></td>
			<td><?php echo $invoice['total'];?></td>
			<td><?php echo $invoice['is_paid'];?></td>
			<td><?php echo $invoice['paid_date'];?></td>
			<td><?php echo $invoice['payment_type'];?></td>
			<td><?php echo $invoice['payment_ref_no'];?></td>
			<td><?php echo $invoice['updated'];?></td>
			<td><?php echo $invoice['created'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View'), array('controller' => 'invoices', 'action' => 'view', $invoice['id'])); ?>
				<?php echo $this->Html->link(__('Edit'), array('controller' => 'invoices', 'action' => 'edit', $invoice['id'])); ?>
				<?php echo $this->Form->postLink(__('Delete'), array('controller' => 'invoices', 'action' => 'delete', $invoice['id']), null, __('Are you sure you want to delete # %s?', $invoice['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Invoice'), array('controller' => 'invoices', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
<div class="related">
	<h3><?php echo __('Related Order Details');?></h3>
	<?php if (!empty($order['OrderDetail'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Order Id'); ?></th>
		<th><?php echo __('Vendor Id'); ?></th>
		<th><?php echo __('Product Id'); ?></th>
		<th><?php echo __('Product Quantity'); ?></th>
		<th class="actions"><?php echo __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($order['OrderDetail'] as $orderDetail): ?>
		<tr>
			<td><?php echo $orderDetail['id'];?></td>
			<td><?php echo $orderDetail['order_id'];?></td>
			<td><?php echo $orderDetail['vendor_id'];?></td>
			<td><?php echo $orderDetail['product_id'];?></td>
			<td><?php echo $orderDetail['product_quantity'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View'), array('controller' => 'order_details', 'action' => 'view', $orderDetail['id'])); ?>
				<?php echo $this->Html->link(__('Edit'), array('controller' => 'order_details', 'action' => 'edit', $orderDetail['id'])); ?>
				<?php echo $this->Form->postLink(__('Delete'), array('controller' => 'order_details', 'action' => 'delete', $orderDetail['id']), null, __('Are you sure you want to delete # %s?', $orderDetail['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Order Detail'), array('controller' => 'order_details', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
<div class="related">
	<h3><?php echo __('Related Order Splits');?></h3>
	<?php if (!empty($order['OrderSplit'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Order Id'); ?></th>
		<th><?php echo __('Split Order Id'); ?></th>
		<th class="actions"><?php echo __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($order['OrderSplit'] as $orderSplit): ?>
		<tr>
			<td><?php echo $orderSplit['id'];?></td>
			<td><?php echo $orderSplit['order_id'];?></td>
			<td><?php echo $orderSplit['split_order_id'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View'), array('controller' => 'order_splits', 'action' => 'view', $orderSplit['id'])); ?>
				<?php echo $this->Html->link(__('Edit'), array('controller' => 'order_splits', 'action' => 'edit', $orderSplit['id'])); ?>
				<?php echo $this->Form->postLink(__('Delete'), array('controller' => 'order_splits', 'action' => 'delete', $orderSplit['id']), null, __('Are you sure you want to delete # %s?', $orderSplit['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Order Split'), array('controller' => 'order_splits', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
<div class="related">
	<h3><?php echo __('Related Trucking Details');?></h3>
	<?php if (!empty($order['TruckingDetail'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Invoice Id'); ?></th>
		<th><?php echo __('Order Id'); ?></th>
		<th><?php echo __('Carrier Id'); ?></th>
		<th><?php echo __('Total Gallons'); ?></th>
		<th><?php echo __('Per Gallon Rate'); ?></th>
		<th><?php echo __('Surcharge'); ?></th>
		<th><?php echo __('Split Charge'); ?></th>
		<th><?php echo __('Terminal Change Fee'); ?></th>
		<th><?php echo __('Downtime Fee'); ?></th>
		<th class="actions"><?php echo __('Actions');?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($order['TruckingDetail'] as $truckingDetail): ?>
		<tr>
			<td><?php echo $truckingDetail['id'];?></td>
			<td><?php echo $truckingDetail['invoice_id'];?></td>
			<td><?php echo $truckingDetail['order_id'];?></td>
			<td><?php echo $truckingDetail['carrier_id'];?></td>
			<td><?php echo $truckingDetail['total_gallons'];?></td>
			<td><?php echo $truckingDetail['per_gallon_rate'];?></td>
			<td><?php echo $truckingDetail['surcharge'];?></td>
			<td><?php echo $truckingDetail['split_charge'];?></td>
			<td><?php echo $truckingDetail['terminal_change_fee'];?></td>
			<td><?php echo $truckingDetail['downtime_fee'];?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View'), array('controller' => 'trucking_details', 'action' => 'view', $truckingDetail['id'])); ?>
				<?php echo $this->Html->link(__('Edit'), array('controller' => 'trucking_details', 'action' => 'edit', $truckingDetail['id'])); ?>
				<?php echo $this->Form->postLink(__('Delete'), array('controller' => 'trucking_details', 'action' => 'delete', $truckingDetail['id']), null, __('Are you sure you want to delete # %s?', $truckingDetail['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Trucking Detail'), array('controller' => 'trucking_details', 'action' => 'add'));?> </li>
		</ul>
	</div>
</div>
