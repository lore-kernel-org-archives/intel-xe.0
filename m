Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86666FF886D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 13:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C7210E32A;
	Tue, 28 Apr 2026 13:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IZILYbaS";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A97A10E32A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 13:47:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B28B160008;
 Tue, 28 Apr 2026 13:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B856FC2BCAF;
 Tue, 28 Apr 2026 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777384061;
 bh=/BMZZMeppyQkyoT2cWaTE1/+/84UTkPiyG6v2Z2pdJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZILYbaSU2BGlTyqcFlCmvZVegcatxjG+9l3XBwc1aGLIlM9nFW3DBlnmCSY6h8BO
 VizmpOzken0vmRq+tiGD3jq7roiabzdn4OTNWVjGJHG/oNGzKfIEuN6X71+7YNqg9X
 BkV1UHWRs4fg3NJTCWC+MBPbhhrjMrSvAfsWHB7FmoVwO07PyjZRk1gun/TzhjLw/S
 rnAjUVwije149bXb3xfxHB1v+OkjPs6ahux0/tPhp4CdB6XHuOcmvLiqeE9uTxaSMx
 crpn5aEOzyzmu5CpmgLcvG+yCmGmdHmZgB0nSwxn9twK0XnIQE3IKNAb5SHZ5gStgc
 SPtPUDwKq7nKA==
Date: Tue, 28 Apr 2026 15:47:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com, 
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, 
 andi.shyti@intel.com, rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v2 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <afC1NX-PvO6qqBU6@zenone.zhora.eu>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423173925.699486-3-soham.purkait@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Soham,

...

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..085cb79a6e00
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras

Thanks for adding the documentation!

> @@ -0,0 +1,33 @@
> +What:		/sys/bus/pci/drivers/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current GPU health state and, for Physical
> +		Functions (PFs), allows GPU health state to be updated.
> +
> +		This sysfs file is only accessible to administrative users and is
> +		present only on Intel Xe platforms that support the GPU health
> +		indicator interface for RAS.
> +
> +		For Physical Functions (PFs), the file is read-write, while for
> +		Virtual Functions (VFs), it is read-only and does not support GPU
> +		health state updates.
> +
> +		Read return a single line containing one of the valid values for

/Read/Reads/ or /Read return/A read returns/

> +		the current device health state. Only for PFs, writing one of the
> +		valid values updates the current device health state.

...

> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
> +};

Thanks for making it one word, it makes much more sense to me.

...

> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_get_response response = {0};
> +	struct xe_ras_health_get_input request = {0};
> +	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_GET_HEALTH;

do we need 'cmd' here?

> +	enum xe_ras_health_status health;
> +	int ret;
> +	size_t rlen = 0;
> +
> +	prepare_sysctrl_command(&command, cmd, &request,
> +				sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret)
> +		return ret;
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS][GET_HEALTH]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EPROTO;
> +	}
> +	if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
> +		xe_err(xe, "[RAS][GET_HEALTH]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EPROTO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS][GET_HEALTH]: current GPU health state = %d (%s)\n",
> +	       health, gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_set_input request = {0};
> +	struct xe_ras_health_set_response response = {0};
> +	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_SET_HEALTH;

do we need 'cmd' here?

Andi

> +	enum xe_ras_health_status health;
> +	int ret;
> +	size_t rlen = 0;
> +	int state;
> +	int ras_status;
> +
> +	state = sysfs_match_string(gpu_health_states,
> +				   buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.new_health = (u8)state;
> +
> +	prepare_sysctrl_command(&command, cmd, &request,
> +				sizeof(request), &response, sizeof(response));
