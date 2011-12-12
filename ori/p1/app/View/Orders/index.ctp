<div class="orders index">
	<h2><?php echo __('Orders');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('status');?></th>
			<th><?php echo $this->Paginator->sort('customer_id');?></th>
			<th><?php echo $this->Paginator->sort('terminal_id');?></th>
			<th><?php echo $this->Paginator->sort('carrier_id');?></th>
			<th><?php echo $this->Paginator->sort('zone');?></th>
			<th><?php echo $this->Paginator->sort('split');?></th>
			<th><?php echo $this->Paginator->sort('requested_delivery_time');?></th>
			<th><?php echo $this->Paginator->sort('actual_delivery_time');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th class="actions"><?php echo __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($orders as $order): ?>
	<tr>
		<td><?php echo h($order['Order']['id']); ?>&nbsp;</td>
		<td><?php echo h($order['Order']['status']); ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($order['Customer']['name'], array('controller' => 'customers', 'action' => 'view', $order['Customer']['id'])); ?>
		</td>
		<td>
			<?php echo $this->Html->link($order['Terminal']['name'], array('controller' => 'terminals', 'action' => 'view', $order['Terminal']['id'])); ?>
		</td>
		<td>
			<?php echo $this->Html->link($order['Carrier']['name'], array('controller' => 'carriers', 'action' => 'view', $order['Carrier']['id'])); ?>
		</td>
		<td><?php echo h($order['Order']['zone']); ?>&nbsp;</td>
		<td><?php echo h($order['Order']['split']); ?>&nbsp;</td>
		<td><?php echo h($order['Order']['requested_delivery_time']); ?>&nbsp;</td>
		<td><?php echo h($order['Order']['actual_delivery_time']); ?>&nbsp;</td>
		<td><?php echo h($order['Order']['created']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View'), array('action' => 'view', $order['Order']['id'])); ?>
			<?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $order['Order']['id'])); ?>
			<?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $order['Order']['id']), null, __('Are you sure you want to delete # %s?', $order['Order']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
	));
	?>	</p>

	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('previous'), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ''));
		echo $this->Paginator->next(__('next') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Order'), array('action' => 'add')); ?></li>
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
