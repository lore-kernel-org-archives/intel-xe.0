Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEAFE66886
	for <intel-xe@archiver.kernel.org>; Sun, 21 Dec 2025 18:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ED910E048;
	Sun, 21 Dec 2025 18:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYSBZWaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B39F10E048
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Dec 2025 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766343138; x=1797879138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oQvVvyzBY6i3uw0rP7/hvYOz6RDa0GGMKy89IkUnM0k=;
 b=PYSBZWaOHNS0QyCbArH8MlpIeYiGikP+Zs1FRW+2cApwKBPfe2OKZK5D
 g2XZ66+7Bd9va6F8yW56s5QSRJM/NK+E4tQVnWmnnfSHF0oTSbFpfUAhB
 U+TEWK4V4fQpFHNtGeV2WHxTnnh2ZF+nSnLQEPLdWrm7w0C464lrnJYW3
 +13TihAM51VrtNp5YloErCmZhDc98PRB2wTxXVBTZtu5cA+0PwDoiNwco
 e5+YKx6gXN+kP4Jpxm5oWaP4PjavnC0Yl6dJM1gTjgyQ4L58R69iavry7
 kK9cZVszN4kbmduiOGfsZxDYc0GnkBoGH20sEGR8u5W/fm21nNURTpp50 Q==;
X-CSE-ConnectionGUID: tBmXxobLTbaFox2NgcIZxg==
X-CSE-MsgGUID: 5gZh6YYfT3qkJ5AA6mDJ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68369537"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; d="scan'208";a="68369537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 10:52:17 -0800
X-CSE-ConnectionGUID: 67Mu8VseT2SFlQl3+PHHSw==
X-CSE-MsgGUID: cW5ZRhmXTP2Ls5z0Lqu0Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; d="scan'208";a="204284896"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 10:52:15 -0800
Date: Sun, 21 Dec 2025 19:52:12 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v3 4/4] drm/xe/hwmon: Expose individual vram temperature
Message-ID: <aUhB3E2JyXQDY_kI@black.igk.intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-5-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216114030.226399-5-karthik.poosa@intel.com>
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

On Tue, Dec 16, 2025 at 05:10:30PM +0530, Karthik Poosa wrote:
> Expose individual VRAM temperature attributes.
> Update Xe hwmon documentation for this entry.
> 
> v2:
>  - Avoid using default switch case for VRAM individual temperatures.
>  - Append labels with vram number.
>  - Update kernel version in Xe hwmon documentation.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 47 ++++++++++++++++++-
>  3 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 51a35fcfb393..b58a96b1857d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -284,3 +284,27 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_input

Brace around channel range with '[]'.

> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Individual VRAM temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_emergency

Ditto.

> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Individual VRAM shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp6-21_crit

Ditto.

> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Individual VRAM critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index fb097607b86c..7c35e2605d2f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -23,5 +23,7 @@
>  #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>  #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> +#define BMG_VRAM_TEMPERATURE_N(n)		XE_REG(0x138260 + (n))

Is this the correct ordering?

> +#define TEMP_MASK_VRAM_N			REG_GENMASK(31, 8)

We usually have spacing for masks and bitfields. Please refer to
xe_mchbar_regs.h.

>  #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b8519c734b4e..8eb1dd8f4b2f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,12 +39,16 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
>  
> +#define MAX_VRAM_CHANNELS      (16)
> +
>  enum xe_hwmon_channel {
>  	CHANNEL_CARD,
>  	CHANNEL_PKG,
>  	CHANNEL_VRAM,
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
> +	CHANNEL_VRAM_N,
> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,

Please consider the future prospects (or risks) of this approach. We're
writing ourselves into a corner here, because now any new component will
be id'ed after CHANNEL_VRAM_N_MAX and with that we can potentially hit
scaling problem with MAX_VRAM_CHANNELS.

I have already mentioned it once[1] but again, not my call.

[1] https://lore.kernel.org/intel-xe/Z5SPWwiB15ptK4hR@black.fi.intel.com/


>  	CHANNEL_MAX,
>  };
>  
> @@ -256,6 +260,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> +			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
> +				return BMG_VRAM_TEMPERATURE_N(((channel % CHANNEL_VRAM_N) * 4));
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
>  				return PCU_CR_PACKAGE_TEMPERATURE;
> @@ -715,6 +721,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_MAX,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -921,6 +943,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>  		case CHANNEL_PCIE:
>  			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:

So this means we're exposing them all but do we really have 16 VRAMs?

> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> +					       channel)) ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -935,6 +960,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>  		case CHANNEL_PCIE:
>  			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:

Ditto.

> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> +					       channel)) ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -958,6 +986,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>  		case CHANNEL_PCIE:
>  			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:

Ditto.

> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> +					       channel)) ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -986,6 +1017,12 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			return get_mc_temp(hwmon, val);
>  		case CHANNEL_PCIE:
>  			return get_pcie_temp(hwmon, val);
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> +			/* Temperature format here is S 31.23.8 */

I'm not confident if this is translatable to human beings, could you
please elaborate?

> +			*val = REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
> +					     ((reg_val >> 31) ? -1 : 1) * MILLIDEGREE_PER_DEGREE;
> +			break;
>  		default:
>  			*val = 0;
>  			return -EOPNOTSUPP;
> @@ -999,6 +1036,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			break;
>  		case CHANNEL_VRAM:
>  		case CHANNEL_MCTRL:
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		default:
> @@ -1014,6 +1052,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			break;
>  		case CHANNEL_VRAM:
>  		case CHANNEL_MCTRL:
> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		default:
> @@ -1386,16 +1425,22 @@ static int xe_hwmon_read_label(struct device *dev,
>  			       enum hwmon_sensor_types type,
>  			       u32 attr, int channel, const char **str)
>  {
> +	char temp[16] = {0};
> +
>  	switch (type) {
>  	case hwmon_temp:
>  		if (channel == CHANNEL_PKG)
>  			*str = "pkg";
>  		else if (channel == CHANNEL_VRAM)
> -			*str = "vram";
> +			*str = "vram_avg";
>  		else if (channel == CHANNEL_MCTRL)
>  			*str = "mctrl_avg";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX) {
> +			sprintf(temp, "vram_%d", (channel - CHANNEL_VRAM_N));
> +			*str = temp;

Can this be done without temp?

Raag

> +		}
>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> -- 
> 2.25.1
> 
