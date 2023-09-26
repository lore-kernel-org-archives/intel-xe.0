Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684A8E81817
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 04:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00910E34B;
	Tue, 26 Sep 2023 04:18:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E391610E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 04:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695701880; x=1727237880;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=flrJyrOJBEwvrPZTQtKt4haY+DGm7rPbAYl7A4iglDQ=;
 b=LOb3+XAhUO9dLQuNHYgDsP/rwThxguh+RpDDKExIEee5oGyeQdTgybuk
 RgotF8aNA0LWwbT7WlTiDrlNQfLpqO7HkhmPHWm1jDgEgSK95UJdlVWm3
 4Yn8J1/q0AYxXoxl3Qd9O8X27HrUSADVNvc4Kn8kD+IeouUvsxGlKYPVd
 vuFPqTy81koUxhrqFb/jlmFmJF91YU412nprBAPT+OFcx5Gku2Bobkk6S
 JT3TGMFdNUmMlWvLa8LQcbDK2P3P4lzIUcWwPbtApO0Z9i2U5MvJKSTvI
 KCO1Jd53cTBbMNXAPPoppVgYYenXkZ4n/2+2lHv3RTAkqF+7C1pFfaGfN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360857076"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="360857076"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="864261697"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="864261697"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:17:58 -0700
Message-ID: <e6c3dae0-0713-db9e-93ef-cffc24b3b8a3@linux.intel.com>
Date: Tue, 26 Sep 2023 09:50:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-3-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230823085842.1440523-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v5 2/4] drm/xe: Log and count the GT hardware
 errors.
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
> For the errors reported by GT unit, read the GT error register.
> Log and count these errors and clear the error register.
>
> Bspec: 53088, 53089, 53090
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_error_regs.h | 13 +++
>  drivers/gpu/drm/xe/xe_device_types.h       |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h           |  7 ++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 96 +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_error.h           | 24 ++++++
>  5 files changed, 140 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
> new file mode 100644
> index 000000000000..6180704a6149
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef XE_GT_ERROR_REGS_H_
> +#define XE_GT_ERROR_REGS_H_
> +
> +#define _ERR_STAT_GT_COR                0x100160
> +#define _ERR_STAT_GT_NONFATAL           0x100164
> +#define ERR_STAT_GT_REG(x)              XE_REG(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_COR, \
> +						_ERR_STAT_GT_NONFATAL))
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4e4184977709..96029d3348b3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -368,6 +368,7 @@ struct xe_device {
>  	/** @hardware_errors_regs: list of hw error regs*/
>  	struct hardware_errors_regs {
>  		const struct err_msg_cntr_pair *dev_err_stat[HARDWARE_ERROR_MAX];
> +		const struct err_msg_cntr_pair *err_stat_gt[HARDWARE_ERROR_MAX];

same here should we make it part of struct xe_gt?
>  	} hw_err_regs;
>  
>  	/* private: */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 35b8c19fa8bf..5daff5c434c7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -9,10 +9,12 @@
>  #include "xe_force_wake_types.h"
>  #include "xe_gt_idle_sysfs_types.h"
>  #include "xe_hw_engine_types.h"
> +#include "xe_hw_error.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
>  #include "xe_sa_types.h"
>  #include "xe_uc_types.h"
> +#include "regs/xe_gt_error_regs.h"
>  
>  struct xe_exec_queue_ops;
>  struct xe_migrate;
> @@ -346,6 +348,11 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @gt_hw_errors: hardware errors reported for the gt */
> +	struct gt_hw_errors {
> +		 unsigned long count[XE_GT_HW_ERROR_MAX];
> +	} errors;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 357d0f962d91..10aad0c396fb 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -118,14 +118,48 @@ static const struct err_msg_cntr_pair dev_err_stat_correctable_reg[] = {
>  	[1 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>  };
>  
> +static const struct err_msg_cntr_pair err_stat_gt_fatal_reg[] = {
> +	[0]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[1]         =  {"Array BIST",		XE_GT_HW_ERR_ARR_BIST_FATAL},
> +	[2]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[3]         =  {"FPU",			XE_GT_HW_ERR_FPU_FATAL},
> +	[4]         =  {"L3 Double",		XE_GT_HW_ERR_L3_DOUB_FATAL},
> +	[5]         =  {"L3 ECC Checker",	XE_GT_HW_ERR_L3_ECC_CHK_FATAL},
> +	[6]         =  {"GUC SRAM",		XE_GT_HW_ERR_GUC_FATAL},
> +	[7]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[8]         =  {"IDI PARITY",		XE_GT_HW_ERR_IDI_PAR_FATAL},
> +	[9]	    =  {"SQIDI",		XE_GT_HW_ERR_SQIDI_FATAL},
> +	[10 ... 11] =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[12]        =  {"SAMPLER",		XE_GT_HW_ERR_SAMPLER_FATAL},
> +	[13]        =  {"SLM",			XE_GT_HW_ERR_SLM_FATAL},
> +	[14]        =  {"EU IC",		XE_GT_HW_ERR_EU_IC_FATAL},
> +	[15]        =  {"EU GRF",		XE_GT_HW_ERR_EU_GRF_FATAL},
> +	[16 ... 31] =  {"Undefined",            XE_GT_HW_ERR_UNKNOWN_FATAL},
> +};

as the fatal error path is different, these shall be enabled in the patch that enables
fatal error processing.
> +
> +static const struct err_msg_cntr_pair err_stat_gt_correctable_reg[] = {
> +	[0]         = {"L3 SINGLE",		XE_GT_HW_ERR_L3_SNG_CORR},
> +	[1]         = {"SINGLE BIT GUC SRAM",	XE_GT_HW_ERR_GUC_CORR},
> +	[2 ... 11]  = {"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
> +	[12]        = {"SINGLE BIT SAMPLER",	XE_GT_HW_ERR_SAMPLER_CORR},
> +	[13]        = {"SINGLE BIT SLM",	XE_GT_HW_ERR_SLM_CORR},
> +	[14]        = {"SINGLE BIT EU IC",	XE_GT_HW_ERR_EU_IC_CORR},
> +	[15]        = {"SINGLE BIT EU GRF",	XE_GT_HW_ERR_EU_GRF_CORR},
> +	[16 ... 31] = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
> +};
> +
>  void xe_assign_hw_err_regs(struct xe_device *xe)
>  {
>  	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
> +	const struct err_msg_cntr_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
>  
>  	if (xe->info.platform == XE_DG2) {
>  		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
>  		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
>  		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
> +
> +		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = err_stat_gt_correctable_reg;
> +		err_stat_gt[HARDWARE_ERROR_FATAL] = err_stat_gt_fatal_reg;
>  	} else if (xe->info.platform == XE_PVC) {
>  		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
>  		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
> @@ -135,9 +169,67 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
>  		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dev_err_stat_correctable_reg;
>  		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dev_err_stat_nonfatal_reg;
>  		dev_err_stat[HARDWARE_ERROR_FATAL] = dev_err_stat_fatal_reg;
> +
> +		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = err_stat_gt_correctable_reg;
> +		err_stat_gt[HARDWARE_ERROR_FATAL] = err_stat_gt_fatal_reg;
what platforms are targeted as part of else?
>  	}
>  }
>  
> +static void
> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)

the function is defined here and changed in next patch can't we have a
common one between these.
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	const struct err_msg_cntr_pair *errstat;
> +	struct hardware_errors_regs *err_regs;
> +	unsigned long errsrc;
> +	const char *errmsg;
> +	u32 indx;
> +	u32 errbit;
> +
> +	if (gt_to_xe(gt)->info.platform == XE_PVC)
> +		return;
> +
> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> +	err_regs = &gt_to_xe(gt)->hw_err_regs;
> +	errsrc = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err));
> +	if (!errsrc) {
> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
> +				    "GT%d detected ERR_STAT_GT_REG_%s blank!\n",
> +				    gt->info.id, hw_err_str);
> +		return;
> +	}
> +
> +	drm_info(&gt_to_xe(gt)->drm, HW_ERR "GT%d ERR_STAT_GT_REG_%s=0x%08lx\n",
> +		 gt->info.id, hw_err_str, errsrc);
will drm_dbg makes more sense here and everywhere else to dump the register contents
> +
> +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> +		/*  The GT Non Fatal Error Status Register has only reserved bits
> +		 *  Nothing to service.
> +		 */
> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected %s error\n",
> +				    gt->info.id, hw_err_str);
> +		goto clear_reg;
> +	}
> +
> +	errstat = err_regs->err_stat_gt[hw_err];
> +	for_each_set_bit(errbit, &errsrc, 32) {
> +		errmsg = errstat[errbit].errmsg;
> +		indx = errstat[errbit].cntr_indx;
> +
> +		if (hw_err == HARDWARE_ERROR_FATAL)
> +			drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
> +					    "GT%d detected %s %s error, bit[%d] is set\n",
> +					    gt->info.id, errmsg, hw_err_str, errbit);

this shall be part of last patch in the series, where the fatal errors are processed.
> +		else
> +			drm_warn(&gt_to_xe(gt)->drm, HW_ERR
> +				 "GT%d detected %s %s error, bit[%d] is set\n",
> +				 gt->info.id, errmsg, hw_err_str, errbit);
> +
> +		gt->errors.count[indx]++;
> +	}
> +clear_reg: xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err), errsrc);
a new line after a label is preferred.
> +}
> +
>  static void
>  xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  {
> @@ -174,7 +266,6 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>  			drm_warn(&tile_to_xe(tile)->drm,
>  				 HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
>  				 tile->id, errmsg, hw_err_str, errbit);
> -
>  		else
>  			drm_err_ratelimited(&tile_to_xe(tile)->drm,
>  					    HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
> @@ -182,6 +273,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>  		tile->errors.count[indx]++;
>  	}
>  
> +	if (errsrc & REG_BIT(0))

define the BIT and use it here.
> +		xe_gt_hw_error_handler(tile->primary_gt, hw_err);
> +
>  	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>  unlock:
>  	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index c0c05b9130eb..82c947247c27 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -51,6 +51,30 @@ enum xe_tile_hw_errors {
>  	XE_TILE_HW_ERROR_MAX,
>  };
>  
> +/* Count of GT Correctable and FATAL HW ERRORS */
> +enum xe_gt_hw_errors {
> +	XE_GT_HW_ERR_L3_SNG_CORR,
> +	XE_GT_HW_ERR_GUC_CORR,
> +	XE_GT_HW_ERR_SAMPLER_CORR,
> +	XE_GT_HW_ERR_SLM_CORR,
> +	XE_GT_HW_ERR_EU_IC_CORR,
> +	XE_GT_HW_ERR_EU_GRF_CORR,
> +	XE_GT_HW_ERR_UNKNOWN_CORR,
> +	XE_GT_HW_ERR_ARR_BIST_FATAL,
> +	XE_GT_HW_ERR_FPU_FATAL,
> +	XE_GT_HW_ERR_L3_DOUB_FATAL,
> +	XE_GT_HW_ERR_L3_ECC_CHK_FATAL,
> +	XE_GT_HW_ERR_GUC_FATAL,
> +	XE_GT_HW_ERR_IDI_PAR_FATAL,
> +	XE_GT_HW_ERR_SQIDI_FATAL,
> +	XE_GT_HW_ERR_SAMPLER_FATAL,
> +	XE_GT_HW_ERR_SLM_FATAL,
> +	XE_GT_HW_ERR_EU_IC_FATAL,
> +	XE_GT_HW_ERR_EU_GRF_FATAL,
> +	XE_GT_HW_ERR_UNKNOWN_FATAL,
> +	XE_GT_HW_ERROR_MAX,
> +};
same here, define all fatals where they are actually used.
> +
>  struct err_msg_cntr_pair {
>  	const char *errmsg;
>  	const u32 cntr_indx;
Thanks,
Aravind.
