Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6979BC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219FC10E29F;
	Wed, 26 Aug 2026 14:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUG0e9hS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF0410E29F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787754448; x=1819290448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dOUkJ4ZiLIqB6x05K2fRutwvvIOuWMUInjsroCNsaWQ=;
 b=eUG0e9hSMd+CcuOgb0NbAGF94/AU2liwHJh6QGv7gaXWdTwdaA8zqJoj
 q11MhRvUDQd+tKXRGSRWR24MlEBXkEgx9t3ii2xiswwKqcbUCHrIXCezC
 wXkahp8xtmyXY4Dl1LsDqyq2UoBtX5xQ+pSr4e40XLey9Ze2ckS7bFLr+
 hAwp6sN3U40hpp0kuX3lcCEtMtoTHEfqVx9gYvmkKvOB3GojOu20R8PTn
 HDQ8AmhwInKaVmBvbV8vARy2/Q767bUv3gT+bpehLcxZg7FRXMypAPkd9
 y7HRcQVCjRsDFMKSz4/jRzvg3DZSAWRiXhfb2dJn4musoISdkesI6Spc2 Q==;
X-CSE-ConnectionGUID: kn5xy5b9STCgfV5m5cGcFA==
X-CSE-MsgGUID: HZo4yKWgSr6DSc1FCIKcbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91918445"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="91918445"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 07:27:20 -0700
X-CSE-ConnectionGUID: g0qIaV2ETVW5hXE7XI5KZQ==
X-CSE-MsgGUID: hWVC4TqySTaGRViMAhLZMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264321992"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 07:27:17 -0700
Date: Wed, 26 Aug 2026 16:27:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
Message-ID: <ao73w-lIBkSnYtot@black.igk.intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824184137.2164727-2-karthik.poosa@intel.com>
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

On Tue, Aug 25, 2026 at 12:11:31AM +0530, Karthik Poosa wrote:
> Add is_temp_valid() to validate sensor presence.

Please utilize the full 75 character space where possible.

> A temperature reading of 0xFF on CRI platforms indicates that the
> corresponding sensor is not present and should be treated as unavailable.
> 
> Use this check from xe_hwmon_temp_is_visible() callback so that attributes
> for unavailable sensors are not exposed during hwmon device registration.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 79 +++++++++++++++++++++++++++++------
>  1 file changed, 66 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..2c4eba4b8f8f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -813,12 +813,21 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	return ret;
>  }
>  
> +static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> +{
> +	/* Value of 0xFF indicates unavailable sensor for platforms from CRI. */
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)

Let's not solve a problem that doesn't exist. This kind of checks create
problem in internal repos where the expected platform isn't quite often
the last one. If this is needed for multiple platforms, just add a feature
flag.

> +		return value != U8_MAX;
> +	else

Redundant else.

> +		return value != 0;
> +}
> +
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	u32 *dword = (u32 *)hwmon->temp.value;
> +	int ret, i, count = 0;
>  	s32 average = 0;
> -	int ret, i;
>  
>  	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> @@ -828,11 +837,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
>  	}
>  
> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> -		average += hwmon->temp.value[i];
> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> +		if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
> +			average += hwmon->temp.value[i];
> +			count++;
> +		} else {
> +			drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not available, val 0x%x\n",
> +				i, hwmon->temp.value[i]);
> +		}

Rather,

	if (!is_temp_valid())
		continue;
		
	average += ...
	
Tidy? ;)

> +	}
> +
> +	if (!count) {
> +		drm_warn(&hwmon->xe->drm, "no memory temp sensors available!\n");

This is a bit misleading as it is exposed as a single channel to the user.
I'd rephrase this to something like "Memory temperature not available".

> +		return -ENXIO;
> +	}
> +
> +	average /= count;

Blank line please!

> +	if (val)
> +		*val = average * MILLIDEGREE_PER_DEGREE;
>  
> -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
> -	*val = average * MILLIDEGREE_PER_DEGREE;
>  	return 0;
>  }
>  
> @@ -852,7 +875,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>  		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>  
>  	data = REG_FIELD_GET(TEMP_MASK, data);
> -	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> +	if (!is_temp_valid(hwmon, data)) {
> +		drm_warn(&hwmon->xe->drm, "pcie temp sensor not available, val 0x%x\n", data);

Same as above, "PCIe temperature not available".
I'm also unsure why do we need to log the value?

> +		return -ENXIO;
> +	}
> +
> +	if (val)
> +		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>  
>  	return 0;
>  }
> @@ -956,11 +985,21 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	int vram_id = channel - CHANNEL_VRAM_N;
>  	struct xe_reg vram_reg;
> +	u32 reg_val;
> +	u8 temp;
>  
>  	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> +	if (!xe_reg_is_valid(vram_reg))
>  		return false;
>  
> +	reg_val = xe_mmio_read32(mmio, vram_reg);
> +	temp = REG_FIELD_GET(TEMP_MASK, reg_val);
> +	if (!is_temp_valid(hwmon, temp)) {

Hm, see below[1].

> +		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vram_id,
> +			reg_val);
> +		return false;
> +	}
> +
>  	/* Create label only for available vram channel */
>  	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>  	return true;
> @@ -977,8 +1016,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			return (is_vram_ch_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
> @@ -992,8 +1032,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			return (is_vram_ch_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
> @@ -1011,12 +1052,24 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_label:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -		case CHANNEL_VRAM:
> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> -								channel)) ? 0444 : 0;
> +		case CHANNEL_VRAM: {
> +			struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +			struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> +			u32 reg_val;
> +			u8 temp;
> +
> +			if (!xe_reg_is_valid(reg))
> +				return 0;
> +
> +			reg_val = xe_mmio_read32(mmio, reg);
> +			temp = REG_FIELD_GET(TEMP_MASK, reg_val);
> +
> +			return is_temp_valid(hwmon, temp) ? 0444 : 0;

[1] This looks like something similar to what's happening in
is_vram_ch_available() and can be consolidated into something like
is_vram_temp_valid().

Raag

> +		}
>  		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>  		default:
> -- 
> 2.25.1
> 
