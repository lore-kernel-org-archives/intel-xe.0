Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94E2CD98F6
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 07:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C21D10E47D;
	Wed, 11 Oct 2023 07:15:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA60B10E47D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697008524; x=1728544524;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aToMW77lbuE39kAMHb0adUOb7WMfa8QQ/dvV3FtVts0=;
 b=dvHn+/qwnq/Q9dwDlI1FazFoCk2yZaw1O2hVit041PA7eZuR2tircb82
 6yeGbog+ANL4s82f05KenFoFV7aVKrdRTKrl6jSRUsyEpq4qOc0BQ3cxP
 T7WgyD8pbnxIl6A6eDdzEIcF70tiBeBsUfl5l9YxmxPh/5XUx/hLeAWaV
 /KbvSJaORh7cgyBwMNf2kHI2PdEXqM/tEEcxQrs97UAM3U8uZOBc5KnjB
 Iqxm8exHe0WH/MHjrGXn+HnM1Q+maBOjf/ITNYytwq9+6p3Sc+E+QR9FP
 08hBNrwlBW+AdCfN02gxAiH1gZn/S9Yn3WU+i8eWmIRz69KjBjZL9988R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6159166"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6159166"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 00:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="927459499"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="927459499"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 00:15:21 -0700
Message-ID: <f62b6408-cc93-33eb-e8e9-18a7ced769b1@linux.intel.com>
Date: Wed, 11 Oct 2023 12:48:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-6-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230927114627.136925-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 05/11] drm/xe: Support GSC hardware error
 reporting for PVC.
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


On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
> Add support to report GSC hw errors and counter update in case
> of correctable errors.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  8 ++
>  drivers/gpu/drm/xe/xe_hw_error.c             | 96 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_error.h             | 16 ++++
>  3 files changed, 117 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> index db78d6687213..fa16eaf9436b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> @@ -12,4 +12,12 @@
>  #define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
>  								_DEV_ERR_STAT_CORRECTABLE, \
>  								_DEV_ERR_STAT_NONFATAL))
> +
> +#define PVC_GSC_HECI1_BASE                             0x00284000
> +#define PVC_GSC_HECI2_BASE                             0x00285000
please maintain the order of register definition as per address in this file.
> +#define _GSC_HEC_CORR_ERR_STATUS                       0x128
> +#define _GSC_HEC_UNCOR_ERR_STATUS                     0x118
> +#define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
> +								(base) + _GSC_HEC_CORR_ERR_STATUS, \
> +								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 9595e3369656..eb76b8e6a338 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -183,6 +183,28 @@ static const struct err_msg_cntr_pair err_stat_gt_correctable_vectr_reg[] = {
>  	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR},
>  };
>  
> +static const struct err_msg_cntr_pair gsc_nonfatal_err_reg[] = {
> +	[0]         = {"MinuteIA Unexpected Shutdown",		XE_GSC_HW_ERR_MIA_SHUTDOWN_UNCOR},
> +	[1]         = {"MinuteIA Internal Error",		XE_GSC_HW_ERR_MIA_INTERNAL_UNCOR},
> +	[2]         = {"Double bit error on SRAM",		XE_GSC_HW_ERR_SRAM_UNCOR},
> +	[3]         = {"WDT 2nd Timeout",			XE_GSC_HW_ERR_WDG_UNCOR},
> +	[4]         = {"ROM has a parity error",		XE_GSC_HW_ERR_ROM_PARITY_UNCOR},
> +	[5]         = {"Ucode has a parity error",		XE_GSC_HW_ERR_UCODE_PARITY_UNCOR},
> +	[6]         = {"Errors Reported to and Detected by FW",	XE_GSC_HW_ERR_FW_UNCOR},
> +	[7]         = {"Glitch is detected on voltage rail",	XE_GSC_HW_ERR_VLT_GLITCH_UNCOR},
> +	[8]         = {"Fuse Pull Error",			XE_GSC_HW_ERR_FUSE_PULL_UNCOR},
> +	[9]         = {"Fuse CRC Check Failed on Fuse Pull",	XE_GSC_HW_ERR_FUSE_CRC_UNCOR},
> +	[10]        = {"Self Mbist Failed",			XE_GSC_HW_ERR_SELF_MBIST_UNCOR},
> +	[11]        = {"AON RF has parity error",		XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR},
> +	[12 ... 31] = {"Undefined",				XE_GSC_HW_ERR_UNKNOWN_UNCOR},
> +};
> +
> +static const struct err_msg_cntr_pair gsc_correctable_err_reg[] = {
> +	[0]        = {"Single bit error on SRAM",			XE_GSC_HW_ERR_SRAM_CORR},
> +	[1]        = {"Errors Reported to FW and Detected by FW",	XE_GSC_HW_ERR_FW_CORR},
> +	[2 ... 31] = {"Undefined",					XE_GSC_HW_ERR_UNKNOWN_CORR},
> +};
> +
>  static void xe_assign_hw_err_regs(struct xe_device *xe)
>  {
>  	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
> @@ -344,6 +366,71 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>  		xe_gt_hw_error_status_reg_handler(gt, hw_err);
>  }
>  
> +static void
> +xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	const struct err_msg_cntr_pair *errstat;
> +	struct xe_gt *mmio;
better name this as gt, as it really holds a struct xe_gt and not a struct mmio in tile
> +	unsigned long errsrc;
> +	const char *errmsg;
> +	u32 indx;
> +	u32 errbit;
> +	u32 base;
> +
> +	if ((tile_to_xe(tile)->info.platform != XE_PVC))
> +		return;
> +
> +	/* GSC errors are valid only on root tile and for NONFATAL and
> +	 * CORRECTABLE type.For non root tiles or FATAL type it should
> +	 * be categorized as undefined GSC HARDWARE ERROR
> +	 */
> +	base = PVC_GSC_HECI1_BASE;
> +
> +	if (tile->id || hw_err == HARDWARE_ERROR_FATAL) {
> +		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
> +				    "Undefined GSC %s error on tile%d\n", hw_err_str, tile->id);
> +		return;
> +	}
> +
> +	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
> +		errstat = gsc_correctable_err_reg;
> +	else
> +		errstat = gsc_nonfatal_err_reg;
let's have one common design of initializing all error registers at once during driver load.
> +
> +	mmio = tile->primary_gt;
> +	errsrc = xe_mmio_read32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err));
> +	if (!errsrc) {
> +		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
> +				    "GSC detected GSC_HEC_ERR_STAT_REG_%s blank!\n",  hw_err_str);
> +		goto clear_reg;
> +	}
> +
> +	drm_info(&tile_to_xe(tile)->drm, HW_ERR
> +		 "GSC_HEC_ERR_STAT_REG_%s=0x%08lx\n", hw_err_str, errsrc);
> +
> +	for_each_set_bit(errbit, &errsrc, 32) {
> +		errmsg = errstat[errbit].errmsg;
> +		indx = errstat[errbit].cntr_indx;
> +
> +		if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
> +			drm_warn(&tile_to_xe(tile)->drm,
> +				 HW_ERR "GSC detected %s %s error, bit[%d] is set\n",
> +				 errmsg, hw_err_str, errbit);
the message should have common convention , like "TileN reported XXX" for all the errors we log
> +
> +		} else {
> +			drm_err_ratelimited(&tile_to_xe(tile)->drm,
> +					    HW_ERR "GSC detected %s %s error, bit[%d] is set\n",
> +					    errmsg, hw_err_str, errbit);
> +		}
may be you want to skip FW_ERR here, see below.
> +		tile->errors.count[indx]++;
> +	}
> +
> +clear_reg:
> +	xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
> +}
> +
>  static void
>  xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  {
> @@ -385,10 +472,13 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>  					    HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
>  					    tile->id, errmsg, hw_err_str, errbit);
>  		tile->errors.count[indx]++;
> -	}
>  
> -	if (errsrc & REG_BIT(0))
> -		xe_gt_hw_error_handler(tile->primary_gt, hw_err);
> +		if (errbit == 0)
> +			xe_gt_hw_error_handler(tile->primary_gt, hw_err);
> +
> +		if (errbit == 8)
> +			xe_gsc_hw_error_handler(tile, hw_err);
please define what 0 and 8 are.
> +	}
>  
>  	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>  unlock:
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 2812407dd4bf..155722a0af4c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -48,6 +48,22 @@ enum xe_tile_hw_errors {
>  	XE_TILE_HW_ERR_GSC_CORR,
>  	XE_TILE_HW_ERR_SOC_CORR,
>  	XE_TILE_HW_ERR_UNKNOWN_CORR,
> +	XE_GSC_HW_ERR_SRAM_CORR,
> +	XE_GSC_HW_ERR_FW_CORR,
I don't think counting FW_CORR is correct as the acutal count is maintained and reported by CSC via HECI
> +	XE_GSC_HW_ERR_UNKNOWN_CORR,
> +	XE_GSC_HW_ERR_MIA_SHUTDOWN_UNCOR,
> +	XE_GSC_HW_ERR_MIA_INTERNAL_UNCOR,
> +	XE_GSC_HW_ERR_SRAM_UNCOR,
> +	XE_GSC_HW_ERR_WDG_UNCOR,
> +	XE_GSC_HW_ERR_ROM_PARITY_UNCOR,
> +	XE_GSC_HW_ERR_UCODE_PARITY_UNCOR,
> +	XE_GSC_HW_ERR_FW_UNCOR,
> +	XE_GSC_HW_ERR_VLT_GLITCH_UNCOR,
> +	XE_GSC_HW_ERR_FUSE_PULL_UNCOR,
> +	XE_GSC_HW_ERR_FUSE_CRC_UNCOR,
> +	XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
> +	XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
we shall maintain uniform naming,
everywhere it is mentioned as NONFATAL, here is just UNCOR
> +	XE_GSC_HW_ERR_UNKNOWN_UNCOR,
>  	XE_TILE_HW_ERROR_MAX,
>  };
Thanks,
Aravind,
>  
