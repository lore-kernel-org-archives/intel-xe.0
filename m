Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6CCD277C1
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 16:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2DB10E1BE;
	Sat, 10 Jan 2026 16:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afGQG/hM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D897410E1BE
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768062229; x=1799598229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W+0PeQMBgn1RiBUMXCtblagr7xUgt6UwnTzBYEtGpKY=;
 b=afGQG/hM+odZe8Zw+4iq3QR0wyA67I5g0/X2TUPhGFSCP1ys3GHkTSCo
 7gyJdOOpFZNjyTih6cEFZh/0Z0qNMrupyc61yJi5WTCF37AOtrZNo8HLz
 fQpEXkA1p4rdhWGkgymI3RvC7BbNPTUfHUyyBiwEK3nAW1CqSTuLwm+5Y
 xCLITmmg2YG31Lmy1lbRGyD8BMM7S6q/P69/N7CikIaJwQBTGcH8ObBn7
 pXHbd7iWmNWDG0kirPmB/XieX2Kx+JXHSOSSd9afFn3tJF/hmO9gqbHI/
 0Wb13DDeorPT92hLfORsgP5UJg7MWyZ1K5LrYfGODtI3FaSScULWoqTFK g==;
X-CSE-ConnectionGUID: cJWlbI5xSAWfSGTpxtQ9qQ==
X-CSE-MsgGUID: 9TWmWQZsQxu07DNsCrKlwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="79704845"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="79704845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 08:23:49 -0800
X-CSE-ConnectionGUID: KTgmS5gsQ+uIDPRU8WpdIQ==
X-CSE-MsgGUID: dqO8x6adS+G0FYtqzdkwxg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 08:23:46 -0800
Date: Sat, 10 Jan 2026 17:23:44 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v5 4/4] drm/xe/hwmon: Expose individual vram channel
 temperature
Message-ID: <aWJ9EK0bi7f6WNRH@black.igk.intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-5-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109201644.736483-5-karthik.poosa@intel.com>
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

On Sat, Jan 10, 2026 at 01:46:44AM +0530, Karthik Poosa wrote:
> Expose individual VRAM temperature attributes.

Please also use 'VRAM' in caps in patch subject.

...

> @@ -257,6 +264,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> +			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
> +				return BMG_VRAM_TEMPERATURE_N(((channel - CHANNEL_VRAM_N) *
> +								sizeof(u32)));

Make (n * sizeof(u32)) as part of BMG_VRAM_TEMPERATURE_N(). With that
perhaps this'll be a single line.

...

> @@ -890,6 +916,21 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>  	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>  }
>  
> +static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> +{
> +	struct xe_reg vram_ch_temp;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +
> +	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> +	if (xe_reg_is_valid(vram_ch_temp) && xe_mmio_read32(mmio, vram_ch_temp)) {
> +		/* Create label only for available vram channel */
> +		sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], "vram_ch_%d",
> +			(channel - CHANNEL_VRAM_N));
> +		return 1;
> +	}
> +	return 0;
> +}

I'd write this as

static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
{
        struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
        int vram_id = channel - CHANNEL_VRAM_N;
        struct xe_reg vram_reg;

        vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
        if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
                return false;

        /* Create label only for available vram channel */
        sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
        return true;
}

>  static umode_t
>  xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> @@ -903,6 +944,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
>  			return hwmon->temp.count ? 0444 : 0;
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;

Shouldn't we also check hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]?

>  		default:
>  			return 0;
>  		}
> @@ -915,6 +958,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
>  			return hwmon->temp.count ? 0444 : 0;
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;

Ditto, hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]?

>  		default:
>  			return 0;
>  		}
> @@ -935,6 +980,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
>  			return hwmon->temp.count ? 0444 : 0;
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -963,6 +1010,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			return get_mc_temp(hwmon, val);
>  		case CHANNEL_PCIE:
>  			return get_pcie_temp(hwmon, val);
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> +			/*
> +			 * This temperature format is bit 31 for sign, bits [30:8] for whole number
> +			 * and bits [7:0] for fraction

Nit: "Temperature format is 24 bits [31:8] signed integer and
8 bits [7:0] fraction."

> +			 */
> +			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
> +				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *

Since you're already casting it, I'm wondering if you need to check
for sign?

> +				 MILLIDEGREE_PER_DEGREE;
> +			return 0;
>  		default:
>  			return -EOPNOTSUPP;
>  		}
> @@ -974,6 +1031,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>  			return 0;
>  		case CHANNEL_VRAM:
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>  			return 0;
>  		default:
> @@ -987,6 +1045,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>  			return 0;
>  		case CHANNEL_VRAM:
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
>  			return 0;
>  		default:
> @@ -1356,16 +1415,20 @@ static int xe_hwmon_read_label(struct device *dev,
>  			       enum hwmon_sensor_types type,
>  			       u32 attr, int channel, const char **str)
>  {
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +
>  	switch (type) {
>  	case hwmon_temp:
>  		if (channel == CHANNEL_PKG)
>  			*str = "pkg";
>  		else if (channel == CHANNEL_VRAM)
> -			*str = "vram";
> +			*str = "vram_avg";

If you look at the readings this is actually not average, so it's a bit
misleading.

Raag

>  		else if (channel == CHANNEL_MCTRL)
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> -- 
> 2.25.1
> 
