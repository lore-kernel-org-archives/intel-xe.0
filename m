Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC5CC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 18:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7EF10EC60;
	Wed, 26 Aug 2026 18:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwzrQfcz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA1910EDA3
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787768388; x=1819304388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hB09cBXTDB8YFBMBMrcfwW+8gjNDfuBAKlmMULF5avE=;
 b=IwzrQfcznRSNtXjDIkl+4jlhUqYI5M21tBBcSuVq8+Cc5D+ctaXqSZ2x
 FbK3i7eFSGpNxdrOJCxrPpg+jiSd2hZjg1MJ6FFMgYg6/6zAMGtfBfuO5
 Vrb471VDgEYpEtWRkt3UDJG5G1uqGKrH9mxG5kpoegdOLX8pY5wkeHqpB
 HsCsCZoQUfZrzi9B1EHR0jlaeU7Vfav0bRhbQsZdjCM/Il17156yrMY2y
 iUK3M9QNm0WJevNexki3tRuwEiMtTyjdbTM30jilN8BGQy7r+1N91QhwO
 MR0h9BW60bplwc29a2+PU375YSkFGr4lJpHaRgCGo9Q7fT/zl6Q3sHtB4 w==;
X-CSE-ConnectionGUID: 734nQ6VNRAq/DtD4J9CPcQ==
X-CSE-MsgGUID: y0iaX1ODQvauiykFV4x6ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92121044"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="92121044"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:19:48 -0700
X-CSE-ConnectionGUID: nY1inNenS36DxJhjtf4HxQ==
X-CSE-MsgGUID: TExuPTqzT9Odi/rt6YHf+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="265052788"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:19:46 -0700
Date: Wed, 26 Aug 2026 20:19:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
Message-ID: <ao8uP1ykIgCjkUvF@black.igk.intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-3-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824184137.2164727-3-karthik.poosa@intel.com>
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

On Tue, Aug 25, 2026 at 12:11:32AM +0530, Karthik Poosa wrote:
> Read the number of VRAM temperature sensor channels from the second byte
> of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
> exposing hwmon attributes for unavailable VRAM temperature sensors, while
> retaining the maximum supported channel count on non-CRI platforms.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c     | 35 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
>  2 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2c4eba4b8f8f..6e7cb250e628 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
>  
> -#define MAX_VRAM_CHANNELS      (16)
> +/* Maximum number of VRAM channels supported by Xe */
> +#define MAX_VRAM_CHANNELS      (80)

Why?

>  enum xe_hwmon_channel {
>  	CHANNEL_CARD,
> @@ -48,6 +49,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
>  	CHANNEL_VRAM_N,
> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>  	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>  	CHANNEL_MAX,
>  };
> @@ -144,10 +146,12 @@ struct xe_hwmon_thermal_info {
>  	};
>  	/** @count: no of temperature sensors available for the platform */

So now this can be "total number of temperature sensors"?

>  	u8 count;
> +	/** @vram_count: number of VRAM temperature sensors available for the platform */
> +	u8 vram_count;
>  	/** @value: signed value from each sensor */
>  	s8 value[U8_MAX];
> -	/** @vram_label: vram label names */
> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
> +	char (*vram_label)[MAX_LABEL_SIZE];
>  };
>  
>  /**
> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
> @@ -810,6 +814,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>  	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>  
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {

Same as last patch. Don't solve problems that don't exist.

> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_count) {

Isn't the first condition sufficient? What am I missing?

> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",

Can this be invalid? i.e. 0xff? And should we clamp it in that case?

> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;

So perhaps CRI_MAX_VRAM_CHANNELS?

> +		}
> +	} else {
> +		hwmon->temp.vram_count = 16; /* For older platforms, max is 16 VRAM channels */

BMG_MAX_VRAM_CHANNELS?

> +	}
> +
>  	return ret;
>  }
>  
> @@ -988,6 +1003,9 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>  	u32 reg_val;
>  	u8 temp;
>  
> +	if (vram_id >= hwmon->temp.vram_count)
> +		return false;
> +
>  	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>  	if (!xe_reg_is_valid(vram_reg))
>  		return false;
> @@ -1516,7 +1534,7 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>  		return 0;
>  	case hwmon_power:
> @@ -1645,6 +1663,13 @@ int xe_hwmon_register(struct xe_device *xe)
>  
>  	xe_hwmon_get_preregistration_info(hwmon);
>  
> +	hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,

What if vram_count is 0?

Raag

> +					      MAX_LABEL_SIZE, GFP_KERNEL);
> +	if (!hwmon->temp.vram_label) {
> +		xe->hwmon = NULL;
> +		return -ENOMEM;
> +	}
> +
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>  
>  	/*  hwmon_dev points to device hwmon<i> */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..e1079eff72c6 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -57,6 +57,7 @@
>  #define   PCODE_THERMAL_INFO			0x25
>  #define     READ_THERMAL_LIMITS			0x0
>  #define     READ_THERMAL_CONFIG			0x1
> +#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
>  #define     READ_THERMAL_DATA			0x2
>  #define       PCIE_SENSOR_GROUP_ID		0x2
>  #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
> -- 
> 2.25.1
> 
