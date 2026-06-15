Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EE0CD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 13:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED3D10E42B;
	Mon, 15 Jun 2026 13:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+jJF54k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A8910E42B
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 13:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781530450; x=1813066450;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QpaR4qHyNLj41l03sQEn/tsxIHIvY/qUC0lxu0Te5hQ=;
 b=A+jJF54kBp1qmdwTt7BLQjPyM+64XsSB0LE38eFFy6Vqm1HBcXFZ8pzh
 aO64WGRCtezWx2nDmDGXRW1zkbytMo1QrItkkuC5szR3J9rht8leqiQuE
 agduH5+EjAkaU/mUnV3fTCQ0ybQ2pvYoH0QI/syD0dhGLeIKsDNKu1lOG
 BVXsYg0zd0c8tBvIUgxfbDxPbd+Z8+QwB9GeRszZau5NOBSyDlt5maVCZ
 wzEkmhCs8wfZPHR4k3Vto+tgdoxnOMz8v3AD/f4EMlkKSnr4dWxpre5e2
 npCS8PJ1uGopLi7j/690rMkAUn3YS7VnlkTIxcR1j7f49lARQLEV4pi43 w==;
X-CSE-ConnectionGUID: 6Vvlg4QpRguJ6N7X6SHTeQ==
X-CSE-MsgGUID: b0k59ZnOQZG0USWtP+gxJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82461646"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82461646"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 06:32:50 -0700
X-CSE-ConnectionGUID: WXaSOJnsQPu3HR98SvwlaQ==
X-CSE-MsgGUID: LZYNFSIkQQudqgsTDW6LqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246575749"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 06:32:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com, riana.tauro@intel.com,
 sk.anirban@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, ravi.kishore.koppuravuri@intel.com, Karthik Poosa
 <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe/pcode: add default timeout macro and pass read
 timeout
In-Reply-To: <20260611074355.3562414-1-karthik.poosa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260611074355.3562414-1-karthik.poosa@intel.com>
Date: Mon, 15 Jun 2026 16:32:11 +0300
Message-ID: <c719ed36144b24421141cfc12022e7f585bac88e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 11 Jun 2026, Karthik Poosa <karthik.poosa@intel.com> wrote:
> Introduce a default 1 ms pcode timeout macro in xe_pcode.h and modify
> xe_pcode_read() to accept a timeout value from its callers.
> Apply this shared default timeout macro across existing read/write call
> sites so that the mailbox timeout is centralized and defined in one place.
> This shall also allow callers to override the default timeout when needed,
> enabling explicit use of custom timeouts for specific commands.

Did you consider adding, say, xe_pcode_read_timeout() for the cases that
the caller has to use a different timeout?

Seems awfully verbose to have to pass XE_PCODE_DEFAULT_TIMEOUT_MS
everywhere.

BR,
Jani.


>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display_pcode.c |  2 +-
>  drivers/gpu/drm/xe/xe_device_sysfs.c          | 16 ++++++------
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 26 +++++++++++--------
>  drivers/gpu/drm/xe/xe_late_bind_fw.c          |  3 ++-
>  drivers/gpu/drm/xe/xe_pcode.c                 |  4 +--
>  drivers/gpu/drm/xe/xe_pcode.h                 |  9 ++++---
>  drivers/gpu/drm/xe/xe_vram_freq.c             |  4 +--
>  7 files changed, 36 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display_pcode.c b/drivers/gpu/drm/xe/display/xe_display_pcode.c
> index f6820ef7e666..aec4cbd25a75 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_pcode.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_pcode.c
> @@ -11,7 +11,7 @@ static int xe_display_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32
>  	struct xe_device *xe = to_xe_device(drm);
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>  
> -	return xe_pcode_read(tile, mbox, val, val1);
> +	return xe_pcode_read(tile, mbox, val, val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  }
>  
>  static int xe_display_pcode_write_timeout(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms)
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..02462dca68a2 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -86,18 +86,18 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
>  	guard(xe_pm_runtime)(xe);
>  
>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> -			    &cap, NULL);
> +			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		return ret;
>  
>  	if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
>  		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> -				    &ver_low, NULL);
> +				    &ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  		if (ret)
>  			return ret;
>  
>  		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> -				    &ver_high, NULL);
> +				    &ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  		if (ret)
>  			return ret;
>  
> @@ -123,18 +123,18 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>  	guard(xe_pm_runtime)(xe);
>  
>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> -			    &cap, NULL);
> +			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		return ret;
>  
>  	if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
>  		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> -				    &ver_low, NULL);
> +				    &ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  		if (ret)
>  			return ret;
>  
>  		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> -				    &ver_high, NULL);
> +				    &ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  		if (ret)
>  			return ret;
>  
> @@ -164,7 +164,7 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>  	int ret;
>  
>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> -			    &cap, NULL);
> +			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		return 0;
>  
> @@ -248,7 +248,7 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
>  	guard(xe_pm_runtime)(xe);
>  	ret = xe_pcode_read(xe_device_get_root_tile(xe),
>  			    PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_STATUS, 0),
> -			    &val, NULL);
> +			    &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  
>  	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_LINK_DOWNGRADE_STATUS, val));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..ddf3ba906d1a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -202,8 +202,9 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>  						  (channel == CHANNEL_CARD) ?
>  						  READ_PSYSGPU_POWER_LIMIT :
> -						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +					  READ_PACKAGE_POWER_LIMIT,
> +					  prepare_power_limit_param2(hwmon)),
> +				    &val0, &val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  
>  	if (ret) {
>  		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> @@ -235,8 +236,9 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>  						  (channel == CHANNEL_CARD) ?
>  						  READ_PSYSGPU_POWER_LIMIT :
> -						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +					  READ_PACKAGE_POWER_LIMIT,
> +					  prepare_power_limit_param2(hwmon)),
> +				    &val0, &val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> @@ -771,7 +773,8 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	int ret;
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> -			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +			    &hwmon->temp.data[0], &hwmon->temp.data[1],
> +			   XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		return ret;
>  
> @@ -779,7 +782,7 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  		hwmon->temp.data[0], hwmon->temp.data[1]);
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
> -			    &config, NULL);
> +			    &config, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		return ret;
>  
> @@ -798,7 +801,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  
>  	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> -				    (dword + i), NULL);
> +				    (dword + i), NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  		if (ret)
>  			return ret;
>  		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
> @@ -819,7 +822,7 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>  	int ret;
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> -						  PCIE_SENSOR_GROUP_ID), &data, NULL);
> +			    PCIE_SENSOR_GROUP_ID), &data, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		return ret;
>  
> @@ -844,7 +847,7 @@ static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>  
>  	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>  			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
> -			     uval, NULL);
> +			     uval, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  }
>  
>  static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
> @@ -853,7 +856,7 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>  
>  	return xe_pcode_write(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>  			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> -			      (uval & POWER_SETUP_I1_DATA_MASK));
> +			      (uval & POWER_SETUP_I1_DATA_MASK), XE_PCODE_DEFAULT_TIMEOUT_MS);
>  }
>  
>  static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> @@ -866,7 +869,8 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
>  		return 0;
>  	}
>  
> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL,
> +						 XE_PCODE_DEFAULT_TIMEOUT_MS);
>  }
>  
>  static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 768442ca7da6..2c8aef2b533b 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -190,7 +190,8 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  
>  	return xe_pcode_read(root_tile,
> -			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
> +			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0),
> +			     num_fans, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  }
>  
>  void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 866986694d9c..7d1e33bb5800 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -132,12 +132,12 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
>  	return err;
>  }
>  
> -int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
> +int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u16 timeout_ms)
>  {
>  	int err;
>  
>  	mutex_lock(&tile->pcode.lock);
> -	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
> +	err = pcode_mailbox_rw(tile, mbox, val, val1, timeout_ms, true, false);
>  	mutex_unlock(&tile->pcode.lock);
>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 18260c29e620..1b4319470b5f 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -12,19 +12,22 @@ struct drm_device;
>  struct xe_device;
>  struct xe_tile;
>  
> +#define XE_PCODE_DEFAULT_TIMEOUT_MS	(1)
> +
>  int xe_pcode_init_early(struct xe_tile *tile);
>  int xe_pcode_probe_early(struct xe_device *xe);
>  int xe_pcode_ready(struct xe_device *xe, bool locked);
>  int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>  				 u32 max_gt_freq);
> -int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> +int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1,
> +		  u16 timeout_ms);
>  int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>  			   int timeout_ms);
>  int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>  			     u32 data1, int timeout);
>  
> -#define xe_pcode_write(tile, mbox, val) \
> -	xe_pcode_write_timeout(tile, mbox, val, 1)
> +#define xe_pcode_write(tile, mbox, val, timeout_ms) \
> +	xe_pcode_write_timeout(tile, mbox, val, timeout_ms)
>  
>  int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>  		     u32 reply_mask, u32 reply, int timeout_ms);
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index 8717367ccd4c..ca52e25caef3 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -40,7 +40,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
>  		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>  		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>  
> -	err = xe_pcode_read(tile, mbox, &val, NULL);
> +	err = xe_pcode_read(tile, mbox, &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (err)
>  		return err;
>  
> @@ -62,7 +62,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>  		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>  		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>  
> -	err = xe_pcode_read(tile, mbox, &val, NULL);
> +	err = xe_pcode_read(tile, mbox, &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
>  	if (err)
>  		return err;

-- 
Jani Nikula, Intel
