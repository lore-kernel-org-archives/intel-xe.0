Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0195BD711D6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 08:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83E510E647;
	Fri, 19 Dec 2025 08:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABp7Y+5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8A010E647
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766132632; x=1797668632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A22vLhVpBUtQ/QbNCnKBA7d7B508iYY9ikSQ/mLa7Kc=;
 b=ABp7Y+5py8INiIXuP2DfdGcg3/fz17sgrDWCyeNEPXvjiGPxYV2QkmnO
 1RzHvedDa70mIaPa1uVncIIRcodJBUXdIvc7Lo2RUgpYvqQHJwkw8lZKk
 qeCM6aBWCtCb7I86rIle6sEwO3bgHAj8NJ2dLJT5apCnJL5npBbi4Twjj
 PcaN8KoLfunhEA6aRsw8q4LkV1fjM4icAHHA84hk8T6mLTgNyU0dyfLKL
 ADsQf8qQRC5w/cNB734jTM/IMrtbb/lvgUhE29VU0fNvmrGbGG34peVps
 edP0B28RzqcO229tsbK+eSoNQ26u71iZwuJOy8XD3qCyJffxVb1OSf5xw A==;
X-CSE-ConnectionGUID: yY07NYotT46yAoRGbyGzHA==
X-CSE-MsgGUID: mk/BKVLNRV+7ok3SMUifvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68066838"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68066838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:23:51 -0800
X-CSE-ConnectionGUID: YardrQvMS/6/WT7VucmMng==
X-CSE-MsgGUID: MPGFDTCESVaCcAr6v+AdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197956929"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:23:49 -0800
Date: Fri, 19 Dec 2025 09:23:46 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v3 3/4] drm/xe/hwmon: Expose GPU pcie temperature
Message-ID: <aUULkuevhVvQy6A3@black.igk.intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-4-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216114030.226399-4-karthik.poosa@intel.com>
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

On Tue, Dec 16, 2025 at 05:10:29PM +0530, Karthik Poosa wrote:
> Expose GPU PCIe average temperature and its limits via hwmon

Use consistent upper/lower cases in subject.

> sysfs temp5_xxx.
> Update Xe hwmon sysfs documentation for this.
> 
> v2: Update kernel version in Xe hwmon documentation. (Raag)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 36 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 81f9b5d58850..51a35fcfb393 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -260,3 +260,27 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Memory controller critical temperature in millidegree Celsius.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_input
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. GPU PCIe temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_emergency
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. GPU PCIe shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_crit
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.

Same as patch 1. These attributes defer from ABI definition so not my call.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 6d31ad74cd0e..b8519c734b4e 100644
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
> @@ -713,6 +714,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>  			   HWMON_T_MAX,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>  			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -787,6 +789,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  	return 0;
>  }
>  
> +static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0;
> +	u32 data = 0;
> +
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, 2),
> +			    &data, NULL);
> +	drm_dbg(&hwmon->xe->drm, "thermal data for pcie ret %d, val 0x%x\n", ret, data);

Same comments as last patch (and also in all other places where applicable).

> +	if (ret)
> +		return ret;
> +
> +	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
> +		data >>= 8;

I'm a bit lost here. How is data format different per subplatform?
Shouldn't this be a pcode bug?

> +	*val = (data & TEMP_MASK_MAILBOX) * MILLIDEGREE_PER_DEGREE;
> +
> +	if (data & 0x80)
> +		*val = *val * -1;
> +
> +	return 0;
> +}
> +
>  /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>  static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>  {
> @@ -895,6 +919,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> +		case CHANNEL_PCIE:
> +			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;

Same comments as last patch.

>  		default:
>  			return 0;
>  		}
> @@ -907,6 +933,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> +		case CHANNEL_PCIE:
> +			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;

Ditto.

>  		default:
>  			return 0;
>  		}
> @@ -928,6 +956,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  					       channel)) ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> +		case CHANNEL_PCIE:
> +			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;

Ditto.

Raag

>  		default:
>  			return 0;
>  		}
> @@ -954,6 +984,8 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  			break;
>  		case CHANNEL_MCTRL:
>  			return get_mc_temp(hwmon, val);
> +		case CHANNEL_PCIE:
> +			return get_pcie_temp(hwmon, val);
>  		default:
>  			*val = 0;
>  			return -EOPNOTSUPP;
> @@ -962,6 +994,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	case hwmon_temp_emergency:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> +		case CHANNEL_PCIE:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		case CHANNEL_VRAM:
> @@ -976,6 +1009,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	case hwmon_temp_crit:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> +		case CHANNEL_PCIE:
>  			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>  			break;
>  		case CHANNEL_VRAM:
> @@ -1360,6 +1394,8 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "vram";
>  		else if (channel == CHANNEL_MCTRL)
>  			*str = "mctrl_avg";
> +		else if (channel == CHANNEL_PCIE)
> +			*str = "pcie";
>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> -- 
> 2.25.1
> 
