Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE8FD7495D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 07:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDDA10ECBE;
	Fri, 19 Dec 2025 07:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOIdwJlu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120BB10ECBE
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766130933; x=1797666933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xbAYnnbA4d0bNX0cyljHSqhKFki74SZPcidDVvPSMTU=;
 b=HOIdwJlux6z+u1uDfeUK0L3+0fa3U2kLY3exmf+SFeGIM/y2qQ+I2X31
 Bh8b977ORUcCarHY+Jk44att99Ng41m8hrY91t5tIluJZPmB/eLqdZafI
 XzxBiI8HoBHvR6GLkpYrmbuVz2RofwLSEFzgIvLR756PfluEkEQqPpO/o
 gSQPbCcgi6Fc6csDGOd/isvb2oXXQQKjGxQY9jI0tIVLAdm9ROK2m7UNv
 GjGdRCHVP1k17trWzCjrjOMzHehvk/b+uWHIUR/k/OL4zHi8U+5Iaui9f
 mJ4DZSvBrSRVVNWpkl1ZwgoCmvKxtxnp7k72t/THpBiNVzL8XX+ZcJuH3 Q==;
X-CSE-ConnectionGUID: V/Z5InpEQMiw50uZcTaLOg==
X-CSE-MsgGUID: 6NDpUC67TrayCekMFc4F5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68166201"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68166201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:55:29 -0800
X-CSE-ConnectionGUID: pI1z7pzBSQu7qPPyrrmjvQ==
X-CSE-MsgGUID: 9WiX0k9bRFWmPMvNPYem/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203889867"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:55:27 -0800
Date: Fri, 19 Dec 2025 08:55:24 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v3 2/4] drm/xe/hwmon: Expose memory controller temperature
Message-ID: <aUUE7IXfU2zxyRLz@black.igk.intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-3-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216114030.226399-3-karthik.poosa@intel.com>
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

On Tue, Dec 16, 2025 at 05:10:28PM +0530, Karthik Poosa wrote:
> Expose GPU memory controller average temperature and its limits
> under temp4_xxx.
> Update Xe hwmon documentation for this.
> 
> v2:
>  - Rephrase commit message. (Badal)
>  - Update kernel version in Xe hwmon documentation. (Raag)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 94 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  4 +
>  3 files changed, 118 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index c8f211c336be..81f9b5d58850 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -236,3 +236,27 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. VRAM critical temperature in millidegree Celsius.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_input
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Memory controller average temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_emergency
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Memory controller shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_crit
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Memory controller critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.

Same as patch 1. These attributes defer from ABI definition so not my call.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 66a8c3e40027..6d31ad74cd0e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -43,6 +43,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_CARD,
>  	CHANNEL_PKG,
>  	CHANNEL_VRAM,
> +	CHANNEL_MCTRL,
>  	CHANNEL_MAX,
>  };
>  
> @@ -99,6 +100,11 @@ enum sensor_attr_power {
>   */
>  #define PL_WRITE_MBX_TIMEOUT_MS	(1)
>  
> +/*
> + * Number of thermal sensors.
> + */
> +#define MAX_THERMAL_SENSORS    (255)
> +
>  /**
>   * struct xe_hwmon_energy_info - to accumulate energy
>   */
> @@ -129,6 +135,10 @@ struct xe_hwmon_thermal_info {
>  		/** @data: temperature limits in dwords */
>  		u32 data[2];
>  	};
> +	/** @count: no of temperature sensors */
> +	u8 count;
> +	/** @value: value from each sensors S1.7 format. */
> +	u8 value[MAX_THERMAL_SENSORS];
>  };
>  
>  /**
> @@ -702,6 +712,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_LABEL,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>  			   HWMON_T_MAX,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -717,6 +728,7 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	int ret = 0;
> +	u32 val = 0;
>  
>  	if (!hwmon->xe->info.has_mbx_power_limits)
>  		return -EOPNOTSUPP;
> @@ -727,9 +739,54 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
>  		hwmon->temp.data[0], hwmon->temp.data[1]);
>  
> +	/* Read thermal config */

Comments are usually helpful for something that's not obvious from the code,
so no need for tautology (and also in all other places where applicable).

> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
> +			    &val, NULL);
> +	drm_dbg(&hwmon->xe->drm, "thermal config read ret %d, count %d\n", ret, val);

This is redundant in error cases because the pcode helper already prints the
error code and count won't be present.

> +	if (ret)
> +		return ret;
> +
> +	hwmon->temp.count = val & TEMP_MASK;
> +	if (hwmon->temp.count > MAX_THERMAL_SENSORS) {

How does a u8 variable exceed the value of 255? ...

> +		drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds supported limit %d\n",
> +			 hwmon->temp.count, MAX_THERMAL_SENSORS);
> +		ret = -ENOMEM;

... and how does it translate to 'out of memory'?

> +	}
>  	return ret;
>  }
>  
> +static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0, i = 0;
> +
> +	for (i = 0; i < (hwmon->temp.count / 4); i++) {

Magic 4.

> +		/* Read thermal data */
> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);

Let's not solve a problem that doesn't exist and try to work without
a cast.

> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
> +			(u32)hwmon->temp.value[i * 4]);

Ditto. And you're using both uint32_t and u32, make it consistent.

> +		if (ret)
> +			return ret;
> +	}
> +	if (hwmon->temp.count % 4) {
> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);

Ditto.

> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
> +			(u32)hwmon->temp.value[i * 4]);

Ditto.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	*val = 0;
> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count; i++) {
> +		*val += (hwmon->temp.value[i] & TEMP_MASK_MAILBOX) *
> +			((hwmon->temp.value[i] & 0x80) ? -1 : 1);

Now, this is something that needs an explanation but doesn't have it ...

> +	}
> +	*val = (*val / hwmon->temp.count) * MILLIDEGREE_PER_DEGREE;

... and the math is independent of the assignment so let's do them
separately.

> +	return 0;
> +}
> +
>  /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>  static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>  {
> @@ -827,6 +884,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>  static umode_t
>  xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> +	long val = 0;
> +
>  	switch (attr) {
>  	case hwmon_temp_emergency:
>  		switch (channel) {
> @@ -834,6 +893,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
> +		case CHANNEL_MCTRL:
> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;

Do we really need to read it all here?

>  		default:
>  			return 0;
>  		}
> @@ -844,6 +905,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
> +		case CHANNEL_MCTRL:
> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;

Ditto.

>  		default:
>  			return 0;
>  		}
> @@ -858,7 +921,16 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		break;
>  	case hwmon_temp_input:
>  	case hwmon_temp_label:
> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> +					       channel)) ? 0444 : 0;
> +		case CHANNEL_MCTRL:
> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;

Ditto.

> +		default:
> +			return 0;
> +		}
>  	default:
>  		return 0;
>  	}
> @@ -872,10 +944,20 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  
>  	switch (attr) {
>  	case hwmon_temp_input:
> -		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>  
> -		/* HW register value is in degrees Celsius, convert to millidegrees. */
> -		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +			/* HW register value is in degrees Celsius, convert to millidegrees. */
> +			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		case CHANNEL_MCTRL:
> +			return get_mc_temp(hwmon, val);
> +		default:
> +			*val = 0;

Do you need this?

> +			return -EOPNOTSUPP;
> +		}
>  		break;
>  	case hwmon_temp_emergency:
>  		switch (channel) {
> @@ -883,6 +965,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		case CHANNEL_VRAM:
> +		case CHANNEL_MCTRL:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		default:
> @@ -896,6 +979,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		case CHANNEL_VRAM:
> +		case CHANNEL_MCTRL:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		default:
> @@ -1274,6 +1358,8 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "pkg";
>  		else if (channel == CHANNEL_VRAM)
>  			*str = "vram";
> +		else if (channel == CHANNEL_MCTRL)
> +			*str = "mctrl_avg";

The rest of the channels also signify the average so no need to spell
it out.

Raag

>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index a3bff76a074d..91e232834482 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -67,6 +67,10 @@
>  
>  #define	PCODE_THERMAL_INFO			0x25
>  #define	READ_THERMAL_LIMITS			0x0
> +#define	READ_THERMAL_CONFIG			0x1
> +#define	READ_THERMAL_DATA			0x2
> +#define TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
> +#define TEMP_INDEX_MCTRL			0x2
>  
>  #define   PCODE_FREQUENCY_CONFIG		0x6e
>  /* Frequency Config Sub Commands (param1) */
> -- 
> 2.25.1
> 
