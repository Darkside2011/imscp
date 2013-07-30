<script language="JavaScript" type="text/JavaScript">
	/*<![CDATA[*/
	$(document).ready(function () {
		$("input[name=ndomain_name]").bind("blur", function () {
			imscp.AjaxCall(
				{
					type: "POST",
					data: "domain=" + $("#ndomain_name").val() + "&uaction=toASCII",
					success: function(data) { $("#ndomain_mpoint").val(data) }
				}
			);
		});
	});

	function setForwardReadonly(obj) {
		if (obj.value == 1) {
			document.forms[0].elements['forward'].readOnly = false;
			document.forms[0].elements['forward_prefix'].disabled = false;
		} else {
			document.forms[0].elements['forward'].readOnly = true;
			document.forms[0].elements['forward'].value = '';
			document.forms[0].elements['forward_prefix'].disabled = true;
		}
	}
	/* ]]> */
</script>

<form name="add_alias_frm" method="post" action="alias_add.php">
	<table class="firstColFixed">
		<thead class="ui-widget-header">
		<tr>
			<th colspan="2">{TR_ALIAS_DATA}</th>
		</tr>
		</thead>
		<tbody class="ui-widget-content">
		<tr>
			<td><label for="user_domain_account">{TR_DOMAIN_ACCOUNT}</label></td>
			<td>
				<select id="user_domain_account" name="user_domain_account">
					<!-- BDP: user_entry -->
					<option value="{USER}" {SELECTED}>{USER_DOMAIN_ACCOUNT}</option>
					<!-- EDP: user_entry -->
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label for="ndomain_name">{TR_DOMAIN_NAME}</label>
				<span class="icon i_help" id="dmn_help" title="{TR_DMN_HELP}">Help</span>
			</td>
			<td><input id="ndomain_name" name="ndomain_name" type="text" value="{DOMAIN}"/></td>
		</tr>
		<tr>
			<td><label for="ndomain_mpoint">{TR_MOUNT_POINT}</label></td>
			<td><input name="ndomain_mpoint" type="text" class="textinput" id="ndomain_mpoint" value="{MP}"/></td>
		</tr>
		<tr>
			<td>{TR_ENABLE_FWD}</td>
			<td>
				<input type="radio" name="status" id="status_enable"{CHECK_EN} value="1" onChange="setForwardReadonly(this);"/>
				<label for="status_enable">{TR_ENABLE}</label><br/>
				<input type="radio" name="status" id="status_disable"{CHECK_DIS} value="0" onChange="setForwardReadonly(this);"/>
				<label for="status_disable">{TR_DISABLE}</label>
			</td>
		</tr>
		<tr>
			<td><label for="forward">{TR_FORWARD}</label></td>
			<td>
				<select name="forward_prefix" style="vertical-align:middle"{DISABLE_FORWARD}>
					<option value="{TR_PREFIX_HTTP}"{HTTP_YES}>{TR_PREFIX_HTTP}</option>
					<option value="{TR_PREFIX_HTTPS}"{HTTPS_YES}>{TR_PREFIX_HTTPS}</option>
					<option value="{TR_PREFIX_FTP}"{FTP_YES}>{TR_PREFIX_FTP}</option>
				</select>
				<input name="forward" type="text" class="textinput" id="forward" value="{FORWARD}"{READONLY_FORWARD} />
			</td>
		</tr>
		</tbody>
	</table>
	<div class="buttons">
		<input type="hidden" name="uaction" value="add_alias"/>
		<input name="submit" type="submit" value="{TR_ADD}"/>
	</div>
</form>
