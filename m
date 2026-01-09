Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEF2D1A61E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949D210E8C2;
	Fri,  9 Jan 2026 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8McY1re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583B410E8C2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767965210; x=1799501210;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Egk+ZI8RZezOag/dTMBiKv/XD91Zla90YEJItbLgX1g=;
 b=G8McY1recPGcVfqGY/2T7DB0aKmuBTA14l4aCiIIqhMj4vQPYOV19JgI
 YBzUJxJnYzcLk59Bnhwe6Ab5PfYdV16wMRKrbFYnhVNxUmxXfkWPTD6J3
 VoqRBSJD8jsCMtJmir3xsSxoEAazSBg7WHItkqkP0J/AHmSfqWfX/NmZ8
 85SqHMVvBoDFFUSGJyYQEDj8FfM9KJ/dHbxOrbXaLPGvoXMEYvi9ohYcq
 vj2ffKcAGLXzavF+0hCdYbcAR5CMxpHTGQGoWP9YvIYbpTfOqNz1tc7oD
 3gBNC5ewlT5wk2W8CMfUudESrXCorcJK00QiNYJ5EiTwX+E2090lh/5yE g==;
X-CSE-ConnectionGUID: iaWvY5nTRXyNuEVFXo1mKg==
X-CSE-MsgGUID: VyFNsVkEQ6Onmyxk+TRjcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73203411"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="73203411"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 05:26:50 -0800
X-CSE-ConnectionGUID: uP4QVg2/RziNpFKR79CpYw==
X-CSE-MsgGUID: EfCOXUDDSd+MplDC5D1rhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202678797"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 05:26:49 -0800
Date: Fri, 9 Jan 2026 14:26:45 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v4 3/4] drm/xe/hwmon: Expose GPU pcie temperature
Message-ID: <aWECFeIZ_64ZHBaV@black.igk.intel.com>
References: <20260108130323.426531-1-karthik.poosa@intel.com>
 <20260108130323.426531-4-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108130323.426531-4-karthik.poosa@intel.com>
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

On Thu, Jan 08, 2026 at 06:33:22PM +0530, Karthik Poosa wrote:
> Expose GPU PCIe average temperature and its limits via hwmon
> sysfs temp5_xxx.

Same comments as last patch. Also, use PCIe in subject.

> Update Xe hwmon sysfs documentation for this.
> 
> v2: Update kernel version in Xe hwmon documentation. (Raag)
> 
> v3:
>  - Address review comments from Raag.
>  - Remove redundant debug log.
>  - Update kernel version in Xe hwmon documentation. (Raag)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 ++++++++++++++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 32 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  4 ++-
>  3 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index a9fcfa6f11b9..6041805a5efc 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -260,3 +260,27 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Memory controller critical temperature in millidegree Celsius.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_input
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. GPU PCIe temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_emergency
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. GPU PCIe shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_crit
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.

Same comments as last patch.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2bf5c9ac948a..317e30c4e1f1 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -44,6 +44,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_PKG,
>  	CHANNEL_VRAM,
>  	CHANNEL_MCTRL,
> +	CHANNEL_PCIE,
>  	CHANNEL_MAX,
>  };
>  
> @@ -714,6 +715,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>  			   HWMON_T_MAX,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,

Alphabetic order please!

>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -781,6 +783,27 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  	return 0;
>  }
>  
> +static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0;

Redundant initialization.

> +	u32 data = 0;
> +
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> +						  PCIE_SENSOR_GROUP_ID), &data, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Sensor offset is different for G21 */
> +	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
> +		data >>= PCIE_SENSOR_SHIFT;

Rather,

#define PCIE_SENSOR_MASK		REG_GENMASK(30, 16)

	data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);

> +	data &= TEMP_MASK_MAILBOX;

Don't we already have TEMP_MASK?

> +	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> +
> +	return 0;
> +}
> +
>  /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>  static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>  {
> @@ -886,6 +909,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
> +		case CHANNEL_PCIE:
>  			return hwmon->temp.count ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -898,6 +922,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
> +		case CHANNEL_PCIE:
>  			return hwmon->temp.count ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -919,6 +944,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>  					       channel)) ? 0444 : 0;
>  		case CHANNEL_MCTRL:
> +		case CHANNEL_PCIE:
>  			return hwmon->temp.count ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -946,12 +972,15 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			break;
>  		case CHANNEL_MCTRL:
>  			return get_mc_temp(hwmon, val);
> +		case CHANNEL_PCIE:
> +			return get_pcie_temp(hwmon, val);
>  		}
>  		break;
>  	case hwmon_temp_emergency:
>  		switch (channel) {
>  		case CHANNEL_PKG:
>  		case CHANNEL_MCTRL:
> +		case CHANNEL_PCIE:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		case CHANNEL_VRAM:
> @@ -963,6 +992,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  		switch (channel) {
>  		case CHANNEL_PKG:
>  		case CHANNEL_MCTRL:
> +		case CHANNEL_PCIE:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		case CHANNEL_VRAM:
> @@ -1341,6 +1371,8 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "vram";
>  		else if (channel == CHANNEL_MCTRL)
>  			*str = "mctrl";
> +		else if (channel == CHANNEL_PCIE)
> +			*str = "pcie";
>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index fc8811a87741..dd7635bbc4e7 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -70,7 +70,9 @@
>  #define     READ_THERMAL_CONFIG			0x1
>  #define     READ_THERMAL_DATA			0x2
>  #define      TEMP_INDEX_MCTRL			0x2
> -#define      TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
> +#define      TEMP_MASK_MAILBOX			REG_GENMASK8(7, 0)
> +#define      PCIE_SENSOR_GROUP_ID		0x2

The convention for submacros is double space here, so let's make
it consistent.

Raag

> +#define      PCIE_SENSOR_SHIFT			16
>  
>  #define   PCODE_FREQUENCY_CONFIG		0x6e
>  /* Frequency Config Sub Commands (param1) */
> -- 
> 2.25.1
> 
