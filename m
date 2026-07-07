Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9545AC43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 06:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44AB10E440;
	Tue,  7 Jul 2026 06:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMkXZ5lY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB47D10E440
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 06:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783405803; x=1814941803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zAohE8HbcBo2GaNV9jJDmQidWHqN45TsXUeyxQQ6vFA=;
 b=jMkXZ5lY9CI/KKUJtMi6wE3o+Djc5iwyIkQH0RMaTa6+0EeCITC69L+3
 NI1S7RshNMBnsApYfQNR6BSLD9WjwcuGYUeGRCijNyt6aWnOPBYosyp/V
 88K/ds5ztUCFlL7JpvXbGa621FyOp6Ytjb94xt8Vnvk7orGbcVM3nMeH9
 GuliQAufDvlFREnyehsAU6Hcsz8rpekRqQgfTKkU3kHptFVvprBmu2TSQ
 LL7GkwRgqhPWKdu/SpPT7x4fHjXR+qUr3cllU4JuFuZaacQbjWJ1Lbcft
 RU9sTlqp2o08TQGlVyyGiAigfUtGz8uYCDmbixuq76ufhDxjfH9twfETU g==;
X-CSE-ConnectionGUID: DReXpxoxRsqz63rSIPKhMg==
X-CSE-MsgGUID: NhyU4fTPRM6ikFgMKb7RMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83908674"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83908674"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 23:30:03 -0700
X-CSE-ConnectionGUID: yvAllvmoQtG5tQmrMQuOdg==
X-CSE-MsgGUID: MXZMfjGLTTiEbVjyPgQIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="258231761"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 23:30:00 -0700
Date: Tue, 7 Jul 2026 08:29:57 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, andi.shyti@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v6 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <akyc5T18qi2FZiGb@black.igk.intel.com>
References: <20260706165207.3773469-3-soham.purkait@intel.com>
 <20260706165207.3773469-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706165207.3773469-4-soham.purkait@intel.com>
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

On Mon, Jul 06, 2026 at 10:22:09PM +0530, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
> 
> The interface is a single read/write file at the device level:
> 
>   $ cat /sys/.../device/gpu_health
>   ok
> 
>   $ echo critical > /sys/.../device/gpu_health
> 
>   $ cat /sys/.../device/gpu_health
>   critical

...

> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"

'STATUS' is redundant and doesn't really add much to the meaning.

> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);
> +
>  static u8 drm_to_xe_ras_severity(u8 severity)
>  {
>  	switch (severity) {
> @@ -332,6 +339,150 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>  	return 0;
>  }
>  
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ras_get_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;

Does this need initialization?

> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send get health command %d\n", ret);

Make this consistent with existing logs, "failed to get health".

> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;

Looking at below code, it's just used as an array index. So does this
need to be an enum?

> +	xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);

Nit: Add a blank space after ':'

> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_set_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;

Does this need initialization?

> +	int ras_status;
> +	int state;
> +	int ret;
> +
> +	state = sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0) {
> +		xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
> +		       (int)strcspn(buf, "\n"), buf);

Why do we need this log? Doesn't user already get an error?

> +		return -EINVAL;
> +	}
> +
> +	request.new_health = (u8)state;

Is this cast needed? Doesn't this happen implicitly?

> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send set health command %d\n", ret);

Make this consistent with existing logs, "failed to set health".

> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ras_status = ras_status_to_errno(response.status);

Why not reuse 'ret' here?

> +	if (ras_status) {
> +		xe_err(xe, "sysctrl: set health command failed with status %d\n",

Use '%#x' format.

> +		       response.status);
> +		return ras_status;
> +	}
> +
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);

Does this need to be an error? Most likely the driver can't do much about
it anyway.

> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;

Same as above.

> +	xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);

Same as above.

> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static void gpu_health_sysfs_fini(void *arg)
> +{
> +	struct device *dev = arg;
> +
> +	device_remove_file(dev, &dev_attr_gpu_health);
> +}
> +
> +/**
> + * DOC: GPU Health Indicator
> + *
> + * On Intel Xe platforms that support the GPU health indicator interface,
> + * the driver exposes a sysfs attribute at the device level as:
> + *
> + *	``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``
> + *
> + * Reading the attribute returns a single line containing the current GPU
> + * health state. Writing one of the valid values updates the same. Reads
> + * are available to all users; writes are restricted to administrative
> + * users only (attribute permissions ``0644``).
> + *
> + * The valid values for the GPU health state are:
> + *
> + * - ``ok``:
> + *	The GPU is healthy and operating within normal parameters.
> + * - ``warning``:
> + *	The GPU is experiencing minor issues but remains operational.
> + * - ``critical``:
> + *	The GPU is in a critical state and may not be operational.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
> + * specification.
> + */
> +static int gpu_health_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, &dev_attr_gpu_health);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);

Why not use devm_device_add_group() and do away with manual cleanup?

> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_ras_init - Initialize Xe RAS
>   * @xe: xe device instance
> @@ -340,6 +491,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>   */
>  void xe_ras_init(struct xe_device *xe)
>  {
> +	int ret;
> +
>  	if (!xe->info.has_drm_ras)
>  		return;
>  
> @@ -350,4 +503,8 @@ void xe_ras_init(struct xe_device *xe)
>  
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
> +
> +	ret = gpu_health_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);

Is '[RAS]' appropriate here? This is not coming from any hardware
component.

>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 6688e11f57a8..dac0e6d2270c 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>  
>  #define XE_RAS_NUM_COUNTERS			16
>  
> +/**
> + * enum xe_ras_health_status - gpu health status values
> + *
> + * @XE_RAS_HEALTH_STATUS_OK: gpu is healthy and operating normally.
> + * @XE_RAS_HEALTH_STATUS_WARNING: gpu has minor issues but is still operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: gpu is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK = 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +	XE_RAS_HEALTH_STATUS_MAX
> +};
> +
>  /**
>   * struct xe_ras_error_common - Error fields that are common across all products
>   */
> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>  	/** @reserved1: Reserved for future use */
>  	u32 reserved1[3];
>  } __packed;
> +
> +/**
> + * struct xe_ras_get_health_request - Request structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_response {
> +	/** @current_health: Current gpu health, see &enum xe_ras_health_status */
> +	u8 current_health;

It's already part of get_health structure, so can be just 'health'.

> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for setting gpu health
> + */
> +struct xe_ras_set_health_request {
> +	/** @new_health: New gpu health to set, see &enum xe_ras_health_status */
> +	u8 new_health;

Ditto.

> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for setting gpu health
> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum xe_ras_response_status */
> +	u32 status;
> +	/** @current_health: Resulting current gpu health, see &enum xe_ras_health_status */
> +	u8 current_health;

Ditto.

Raag

> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 6e3753554510..d4da6e9ef774 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>   * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>   */
>  enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>  	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>  };
>  
>  /**
> -- 
> 2.43.0
> 
