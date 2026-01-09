Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC64D232FF
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3925F10E848;
	Fri,  9 Jan 2026 09:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpS27WXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CC110E848
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767950945; x=1799486945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+8NevxuDdD+1qfuUzgwPyu+DrMXvM/9aLrqf1j3rhKE=;
 b=YpS27WXl4MZtpgMWoyORxB4FL0MTjjiGAvvnIGnpjKzJL8e+hy9wbNpm
 tGbTTU6JN5aCLrwuRxNurtk8tTPfPUMr5HcDze5HZdfErFstca9Booy/q
 9yNUAxRD9wn0LK1ceAgfJdCpzIKW1CQNUi2jglN0nRx4vIlRDT7BuC1RD
 wsuojgfF6V28N1ir5M3X46by1fdVb8z64bTtCxA7L03K/jNZqKeSEgCHw
 8LU6esyo7qqzFCcu2zDDcRyZO5ssZ3qeXCuydFaVuDPR/pcIamKEI+Pvg
 UK71LoQ99TKyRZZ4MA/SD6k8u6vvJCNooLZgnojMsKpbSArePFS4hC6Ki w==;
X-CSE-ConnectionGUID: b8Zo+VFuQKK+isbv9nPwhA==
X-CSE-MsgGUID: N5JRYGQ7QR2wSl8tUfq6zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69243963"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69243963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:29:05 -0800
X-CSE-ConnectionGUID: fAKHIgc7TzmTcaJeV+cUfQ==
X-CSE-MsgGUID: SEE2cRH8TKiPJ9BQft2JlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203206915"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:29:03 -0800
Date: Fri, 9 Jan 2026 10:29:00 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v4 1/4] drm/xe/hwmon: Expose temperature limits
Message-ID: <aWDKXG14vg-7Ajza@black.igk.intel.com>
References: <20260108130323.426531-1-karthik.poosa@intel.com>
 <20260108130323.426531-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108130323.426531-2-karthik.poosa@intel.com>
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

On Thu, Jan 08, 2026 at 06:33:20PM +0530, Karthik Poosa wrote:
> Read temperature limits using pcode mailbox and
> expose shutdown temperature limit as tempX_emergency,
> critical temperature limit of as tempX_crit and
> GPU average temperature limit as tempX_max.

Looks like this can be less lines, please utilize the remaining space.

> Update Xe hwmon documentation for these entries.
> 
> v2:
>  - Resolve a documentation warning.
>  - Address below review comments from Raag.
>  - Update date and kernel version in Xe hwmon documentation.
>  - Remove explicit disable of has_mbx_thermal_info for unsupported
>    platforms.
>  - Remove unnecessary default case in switches.
>  - Remove obvious comments.
>  - Use TEMP_LIMIT_MAX to compute number of dwords needed in
>    xe_hwmon_thermal_info.
>  - Remove THERMAL_LIMITS_DWORDS macro.
>  - Use has_mbx_thermal_info for checking thermal mailbox support.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 +++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 107 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pci.c                   |   3 +
>  drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>  drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>  6 files changed, 152 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index d9e2b17c6872..c3b367c42741 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>  		milliseconds over which sustained power is averaged.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package average temperature limit in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.

Group these with existing temperature entries as per channel index in
alphabetic order.

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7d46d5ecda91..e359889b4378 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -322,6 +322,8 @@ struct xe_device {
>  		 * pcode mailbox commands.
>  		 */
>  		u8 has_mbx_power_limits:1;
> +		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox commands */

Nit: "supports thermal ..."

> +		u8 has_mbx_thermal_info:1;
>  		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>  		u8 has_mem_copy_instr:1;
>  		/** @info.has_mert: Device has standalone MERT */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index ff2aea52ef75..db00728c89e4 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -53,6 +53,15 @@ enum xe_fan_channel {
>  	FAN_MAX,
>  };
>  
> +enum xe_temp_limit {
> +	TEMP_LIMIT_PKG_SHUTDOWN,
> +	TEMP_LIMIT_PKG_TJMAX,
> +	TEMP_LIMIT_MEM_SHUTDOWN,
> +	TEMP_LIMIT_PKG_CRIT,
> +	TEMP_LIMIT_MEM_TJMAX,
> +	TEMP_LIMIT_MAX,

This is guaranteed last member so redundant comma.

> +};
> +
>  /* Attribute index for powerX_xxx_interval sysfs entries */
>  enum sensor_attr_power {
>  	SENSOR_INDEX_PSYS_PL1,
> @@ -111,6 +120,18 @@ struct xe_hwmon_fan_info {
>  	u64 time_prev;
>  };
>  
> +/**
> + * struct xe_hwmon_thermal_info - to store temperature data
> + */
> +struct xe_hwmon_thermal_info {
> +	union {
> +		/** @limit: temperatures limits */
> +		u8 limit[TEMP_LIMIT_MAX];
> +		/** @data: temperature limits in dwords */
> +		u32 data[(TEMP_LIMIT_MAX / sizeof(u32)) + ((TEMP_LIMIT_MAX % sizeof(u32)) ? 1 : 0)];

I think this can be (((TEMP_LIMIT_MAX - 1) / sizeof(u32)) + 1) but please
double check.

> +	};
> +};
> +
>  /**
>   * struct xe_hwmon - xe hwmon data structure
>   */
> @@ -137,7 +158,8 @@ struct xe_hwmon {
>  	u32 pl1_on_boot[CHANNEL_MAX];
>  	/** @pl2_on_boot: power limit PL2 on boot */
>  	u32 pl2_on_boot[CHANNEL_MAX];
> -
> +	/** @temp: Temperature info */
> +	struct xe_hwmon_thermal_info temp;
>  };
>  
>  static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -677,8 +699,11 @@ static const struct attribute_group *hwmon_groups[] = {
>  };
>  
>  static const struct hwmon_channel_info * const hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_LABEL,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |

Let's make this alphabetic order.

> +			   HWMON_T_MAX,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),

Ditto.

>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
>  			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
> @@ -689,6 +714,19 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  	NULL
>  };
>  
> +static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0;

Redundant initialization.

> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
> +		hwmon->temp.data[0], hwmon->temp.data[1]);
> +
> +	return ret;
> +}
> +
>  /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>  static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>  {
> @@ -787,6 +825,34 @@ static umode_t
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

I don't believe we'll ever reach here, so please drop the dead code.

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

Ditto.

> +	case hwmon_temp_max:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
> +		default:
> +			return 0;
> +		}
> +		break;

Ditto.

>  	case hwmon_temp_input:
>  	case hwmon_temp_label:
>  		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> @@ -807,10 +873,38 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  
>  		/* HW register value is in degrees Celsius, convert to millidegrees. */
>  		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> -		return 0;
> +		break;

and we don't have a reason to continue here, so let's try to return where
possible.

> +	case hwmon_temp_emergency:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			break;

Ditto.

> +		case CHANNEL_VRAM:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			break;

Ditto.

> +		}
> +		break;

Ditto.

> +	case hwmon_temp_crit:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
> +			break;

Ditto.

> +		case CHANNEL_VRAM:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
> +			break;

Ditto.

> +		}
> +		break;

Ditto.

> +	case hwmon_temp_max:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
> +			break;

Ditto.

> +		}
> +		break;

Ditto.

>  	default:
>  		return -EOPNOTSUPP;
>  	}
> +	return 0;

With above in place, this won't be needed.

>  }
>  
>  static umode_t
> @@ -1263,6 +1357,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  	for (channel = 0; channel < FAN_MAX; channel++)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>  			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +
> +	if (hwmon->xe->info.has_mbx_thermal_info)
> +		if (xe_hwmon_pcode_read_thermal_info(hwmon))

These can be a single if condition with && operation.

> +			drm_dbg(&hwmon->xe->drm,
> +				"Thermal mailbox support not present in firmware\n");

Nit: "not supported by firmware"

>  }
>  
>  int xe_hwmon_register(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a1fdca451ce0..776ed4bd538b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_fan_control = true,
>  	.has_flat_ccs = 1,
>  	.has_mbx_power_limits = true,
> +	.has_mbx_thermal_info = true,
>  	.has_gsc_nvm = 1,
>  	.has_heci_cscfi = 1,
>  	.has_i2c = true,
> @@ -421,6 +422,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_gsc_nvm = 1,
>  	.has_i2c = true,
>  	.has_mbx_power_limits = true,
> +	.has_mbx_thermal_info = true,
>  	.has_mert = true,
>  	.has_pre_prod_wa = 1,
>  	.has_soc_remapper_sysctrl = true,
> @@ -686,6 +688,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> +	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>  	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 5f20f56571d1..20acc5349ee6 100644
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
> index 975892d6b230..6c84c1780fe9 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -65,6 +65,9 @@
>  #define       FAN_TABLE				1
>  #define       VR_CONFIG				2
>  
> +#define   PCODE_THERMAL_INFO			0x25
> +#define     READ_THERMAL_LIMITS			0x0

This file is full of randomly ordered commands so at some point
we might want to order them correctly. For now just add this above
PCODE_LATE_BINDING.

Raag

>  #define   PCODE_FREQUENCY_CONFIG		0x6e
>  /* Frequency Config Sub Commands (param1) */
>  #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> -- 
> 2.25.1
> 
