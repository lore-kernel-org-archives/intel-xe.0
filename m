Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D36D65C7C
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 17:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9EF10E8B4;
	Wed, 17 Dec 2025 17:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8vi/pm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F7B10E8B4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765991117; x=1797527117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rfPfFzUpULZP0uI4R00RcsdKtLX7zOfgTdA3nHBknQ8=;
 b=j8vi/pm39eENbdsAG/fI8XhsVxzJEixx10JG9gmVjmxcEU/KgWcjky30
 1q/IGi5fvXtP1wHF+jnJl+Cscxm5WGB5qXsBxy1i2vkzW/xNYaxkxJDrI
 JFbyHAuHzLDyNomoR/KOTf8mJ+R9unTbs9oFjxYpc9NOEJezJp+LRM40A
 tiiWZsXPvHtOnfVU6erGfg8gtSSf165iH0eek8VTE2wPAVP9HkAKSNobb
 8Y6izRJGhOO5HmO31aaYiLJcI30z3bAricCCBN3RRKqxR8iCAJ52JbeHz
 eWNEfI6DxEA5mI3YOM73BS0vopd1ON4KhyShpCnQwk4bEil6aVUkXNr1+ A==;
X-CSE-ConnectionGUID: hx1KfXd1QNuKjPO6w8EjNQ==
X-CSE-MsgGUID: w60RFNaaQlSESySaL1x9pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85354912"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="85354912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:05:17 -0800
X-CSE-ConnectionGUID: Uaz4/AEBQimNRGG2PCldIg==
X-CSE-MsgGUID: pNfILwp5QGCEqL8hHBvcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221742510"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:05:15 -0800
Date: Wed, 17 Dec 2025 18:05:12 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v3 1/4] drm/xe/hwmon: Expose temperature limits
Message-ID: <aULiyK1tWOxKZLI8@black.igk.intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216114030.226399-2-karthik.poosa@intel.com>
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

On Tue, Dec 16, 2025 at 05:10:27PM +0530, Karthik Poosa wrote:
> Read temperature limits using pcode mailbox and
> expose shutdown temperature limit as tempX_emergency,
> critical temperature limit of as tempX_crit and
> GPU average temperature limit as tempX_max.
> 
> Update Xe hwmon documentation for these entries.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 ++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |   3 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 116 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pci.c                   |   5 +
>  drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>  drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>  6 files changed, 164 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index d9e2b17c6872..c8f211c336be 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>  		milliseconds over which sustained power is averaged.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package average temperature limit in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.

As per hwmon documentation all these attributes are RW so they don't
match with ABI expectations.

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 413ba4c8b62e..8e6dd2665596 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -321,6 +321,9 @@ struct xe_device {
>  		 * pcode mailbox commands.
>  		 */
>  		u8 has_mbx_power_limits:1;
> +		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox commands.
> +		 */

Can be one line.

> +		u8 has_mbx_thermal_info:1;
>  		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>  		u8 has_mem_copy_instr:1;
>  		/** @info.has_mert: Device has standalone MERT */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index ff2aea52ef75..66a8c3e40027 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -53,6 +53,14 @@ enum xe_fan_channel {
>  	FAN_MAX,
>  };
>  
> +enum xe_temp_limit {
> +	TEMP_LIMIT_PKG_SHUTDOWN,
> +	TEMP_LIMIT_PKG_TJMAX,
> +	TEMP_LIMIT_MEM_SHUTDOWN,
> +	TEMP_LIMIT_PKG_CRIT,
> +	TEMP_LIMIT_MEM_TJMAX,
> +};
> +
>  /* Attribute index for powerX_xxx_interval sysfs entries */
>  enum sensor_attr_power {
>  	SENSOR_INDEX_PSYS_PL1,
> @@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
>  	u64 time_prev;
>  };
>  
> +/**
> + * struct xe_hwmon_thermal_info - to store temperature data
> + */
> +struct xe_hwmon_thermal_info {
> +	union {
> +		/** @limits: temperatures limits */
> +		u8 limit[8];

What are the magic numbers? Can we have proper defines?

> +		/** @data: temperature limits in dwords */
> +		u32 data[2];
> +	};
> +};
> +
>  /**
>   * struct xe_hwmon - xe hwmon data structure
>   */
> @@ -137,7 +157,8 @@ struct xe_hwmon {
>  	u32 pl1_on_boot[CHANNEL_MAX];
>  	/** @pl2_on_boot: power limit PL2 on boot */
>  	u32 pl2_on_boot[CHANNEL_MAX];
> -
> +	/** @temp: Temperature info */
> +	struct xe_hwmon_thermal_info temp;
>  };
>  
>  static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -677,8 +698,11 @@ static const struct attribute_group *hwmon_groups[] = {
>  };
>  
>  static const struct hwmon_channel_info * const hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_LABEL,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
> +			   HWMON_T_MAX,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
>  			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
> @@ -689,6 +713,23 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  	NULL
>  };
>  
> +static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0;
> +
> +	if (!hwmon->xe->info.has_mbx_power_limits)
> +		return -EOPNOTSUPP;
> +
> +	/* Read thermal info */
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
> +		hwmon->temp.data[0], hwmon->temp.data[1]);
> +
> +	return ret;
> +}
> +
>  /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>  static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>  {
> @@ -787,6 +828,34 @@ static umode_t
>  xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
>  	switch (attr) {
> +	case hwmon_temp_emergency:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
> +		case CHANNEL_VRAM:
> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
> +		default:
> +			return 0;
> +		}
> +		break;
> +	case hwmon_temp_crit:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
> +		case CHANNEL_VRAM:
> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
> +		default:
> +			return 0;
> +		}
> +		break;
> +	case hwmon_temp_max:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
> +		default:
> +			return 0;
> +		}
> +		break;
>  	case hwmon_temp_input:
>  	case hwmon_temp_label:
>  		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> @@ -807,10 +876,46 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  
>  		/* HW register value is in degrees Celsius, convert to millidegrees. */
>  		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> -		return 0;
> +		break;
> +	case hwmon_temp_emergency:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		case CHANNEL_VRAM:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		default:
> +			*val = 0;

Do you need this?

> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_temp_crit:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		case CHANNEL_VRAM:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		default:
> +			*val = 0;

Ditto.

> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_temp_max:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		default:
> +			return 0;
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> +	return 0;
>  }
>  
>  static umode_t
> @@ -1263,6 +1368,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  	for (channel = 0; channel < FAN_MAX; channel++)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>  			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +
> +	if (xe_hwmon_pcode_read_thermal_info(hwmon))
> +		drm_dbg(&hwmon->xe->drm, "Thermal mailbox support not present in firmware\n");
>  }
>  
>  int xe_hwmon_register(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 673761c8623e..a47637900e84 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -311,6 +311,7 @@ static const struct xe_device_desc dg2_desc = {
>  	.has_display = true,
>  	.has_fan_control = true,
>  	.has_mbx_power_limits = false,
> +	.has_mbx_thermal_info = false,

Why?

>  };
>  
>  static const __maybe_unused struct xe_device_desc pvc_desc = {
> @@ -328,6 +329,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	.vm_max_level = 4,
>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>  	.has_mbx_power_limits = false,
> +	.has_mbx_thermal_info = false,

Ditto.

>  };
>  
>  static const struct xe_device_desc mtl_desc = {
> @@ -365,6 +367,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_fan_control = true,
>  	.has_flat_ccs = 1,
>  	.has_mbx_power_limits = true,
> +	.has_mbx_thermal_info = true,
>  	.has_gsc_nvm = 1,
>  	.has_heci_cscfi = 1,
>  	.has_i2c = true,
> @@ -418,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_flat_ccs = false,
>  	.has_i2c = true,
>  	.has_mbx_power_limits = true,
> +	.has_mbx_thermal_info = true,
>  	.has_mert = true,
>  	.has_pre_prod_wa = 1,
>  	.has_sriov = true,
> @@ -681,6 +685,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> +	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>  	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 3bb51d155951..34d2b66188e4 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -48,6 +48,7 @@ struct xe_device_desc {
>  	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
> +	u8 has_mbx_thermal_info:1;
>  	u8 has_mem_copy_instr:1;
>  	u8 has_mert:1;
>  	u8 has_pre_prod_wa:1;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 975892d6b230..a3bff76a074d 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -65,6 +65,9 @@
>  #define       FAN_TABLE				1
>  #define       VR_CONFIG				2
>  
> +#define	PCODE_THERMAL_INFO			0x25
> +#define	READ_THERMAL_LIMITS			0x0

Does this match with spacing convention and ordering?

Raag

>  #define   PCODE_FREQUENCY_CONFIG		0x6e
>  /* Frequency Config Sub Commands (param1) */
>  #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> -- 
> 2.25.1
> 
