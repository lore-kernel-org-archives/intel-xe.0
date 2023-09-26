Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED71E81817
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 04:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B1F10E34C;
	Tue, 26 Sep 2023 04:18:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFC710E34C
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 04:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695701894; x=1727237894;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DgJEMA67UeJr7nSUadGptX6MP1wMMk0NBCMhp99I4pg=;
 b=f3bCMhsbeAczyA+mn6n4sqVye84T86AKPxYlzxAjAA0rpMkSzk+QOn6H
 6QWHz2QrMBfmdE77Y7iCUQVeTjGskTlrALBD+QJWGvrzpwRYJU1Z93OKs
 hgyGGJ0GMz2vvUj62+gbWENBsSq1nKedb3u1qwB5cTcniZS3pZwAGxtD3
 a1gFLAyZq6sgME93JiGqR98fuuf+pRIAsbV4DQKlENY8Lq3UVDPI+agSk
 E2BHhFKo1ugtFSNVVnrcq2ASsiV9uMz7ZLiRHg4IwpWe1h/uCvO0EThIN
 zPfSFIhm07+oJTGVxB85mEdwsbVCbpGc+5AAN/QQsgMljtjHJ8HVJAGdW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360857156"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="360857156"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="864261873"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="864261873"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:18:12 -0700
Message-ID: <63c64b22-501c-d6e1-669e-b85822d88819@linux.intel.com>
Date: Tue, 26 Sep 2023 09:51:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-4-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230823085842.1440523-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v5 3/4] drm/xe: Support GT hardware error
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
> PVC supports GT error reporting via vector registers alongwith
> error status register. Add support to report these errors and
> update respective counters.
> Incase of Subslice error reported by vector register, process the
> error status register for applicable bits.
>
> Bspec: 54179, 54177, 53088, 53089
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_error_regs.h |  16 +++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 122 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_error.h           |  20 ++++
>  3 files changed, 154 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
> index 6180704a6149..39ea87914465 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
> @@ -10,4 +10,20 @@
>  #define ERR_STAT_GT_REG(x)              XE_REG(_PICK_EVEN((x), \
>  						_ERR_STAT_GT_COR, \
>  						_ERR_STAT_GT_NONFATAL))
> +
> +#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
> +#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
> +#define ERR_STAT_GT_COR_VCTR_REG(x)     XE_REG(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_COR_VCTR_0, \
> +						_ERR_STAT_GT_COR_VCTR_1))
> +
> +#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
> +#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264

the registers shall be defined in the ascending order of their addresses.
> +#define ERR_STAT_GT_FATAL_VCTR_REG(x)   XE_REG(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_FATAL_VCTR_0, \
> +						_ERR_STAT_GT_FATAL_VCTR_1))
> +
> +#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
> +						ERR_STAT_GT_COR_VCTR_REG(x) : \
> +						ERR_STAT_GT_FATAL_VCTR_REG(x))
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 10aad0c396fb..deb020a509d2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -148,6 +148,41 @@ static const struct err_msg_cntr_pair err_stat_gt_correctable_reg[] = {
>  	[16 ... 31] = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
>  };
>  
> +static const struct err_msg_cntr_pair pvc_err_stat_gt_fatal_reg[] = {
> +	[0 ... 2]   =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[3]         =  {"FPU",			XE_GT_HW_ERR_FPU_FATAL},
> +	[4 ... 5]   =  {"Undefined",            XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[6]         =  {"GUC SRAM",		XE_GT_HW_ERR_GUC_FATAL},
> +	[7 ... 12]  =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[13]        =  {"SLM",			XE_GT_HW_ERR_SLM_FATAL},
> +	[14]        =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[15]        =  {"EU GRF",		XE_GT_HW_ERR_EU_GRF_FATAL},
> +	[16 ... 31] =  {"Undefined",            XE_GT_HW_ERR_UNKNOWN_FATAL},
> +};

let all fatal definitions be moved into the patch in which fatal is processed
> +
> +static const struct err_msg_cntr_pair pvc_err_stat_gt_correctable_reg[] = {
> +	[0]         = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
> +	[1]         = {"SINGLE BIT GUC SRAM",	XE_GT_HW_ERR_GUC_CORR},
> +	[2 ... 12]  = {"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
> +	[13]        = {"SINGLE BIT SLM",	XE_GT_HW_ERR_SLM_CORR},
> +	[14]        = {"SINGLE BIT EU IC",	XE_GT_HW_ERR_EU_IC_CORR},
> +	[15]        = {"SINGLE BIT EU GRF",	XE_GT_HW_ERR_EU_GRF_CORR},
> +	[16 ... 31] = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
> +};
> +
> +static const struct err_msg_cntr_pair err_stat_gt_fatal_vectr_reg[] = {
> +	[0 ... 1]         = {"SUBSLICE",	XE_GT_HW_ERR_SUBSLICE_FATAL},
> +	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_FATAL},
> +	[4 ... 5]         = {"Undefined",	XE_GT_HW_ERR_UNKNOWN_FATAL},
> +	[6]               = {"TLB",		XE_GT_HW_ERR_TLB_FATAL},
> +	[7]               = {"L3 FABRIC",	XE_GT_HW_ERR_L3_FABRIC_FATAL},
> +};
> +
> +static const struct err_msg_cntr_pair err_stat_gt_correctable_vectr_reg[] = {
> +	[0 ... 1]         = {"SUBSLICE",	XE_GT_HW_ERR_SUBSLICE_CORR},
> +	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR},
> +};
> +
>  void xe_assign_hw_err_regs(struct xe_device *xe)
>  {
>  	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
> @@ -164,6 +199,8 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
>  		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
>  		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
>  		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
> +		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_gt_correctable_reg;
> +		err_stat_gt[HARDWARE_ERROR_FATAL] = pvc_err_stat_gt_fatal_reg;
>  	} else {
>  		/* For other platforms report only GT errors */
>  		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dev_err_stat_correctable_reg;
> @@ -176,7 +213,7 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
>  }
>  
>  static void
> -xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> +xe_gt_hw_error_status_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)

is xe_gt_hw_error_log_status_reg sounding better ? and have this in the earlier patch
>  {
>  	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>  	const struct err_msg_cntr_pair *errstat;
> @@ -186,9 +223,6 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>  	u32 indx;
>  	u32 errbit;
>  
> -	if (gt_to_xe(gt)->info.platform == XE_PVC)
> -		return;
> -
>  	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>  	err_regs = &gt_to_xe(gt)->hw_err_regs;
>  	errsrc = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err));
> @@ -230,6 +264,86 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>  clear_reg: xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err), errsrc);
>  }
>  
> +static void
> +xe_gt_hw_error_vectr_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)

similarly, xe_gt_hw_error_log_vector_reg
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	const struct err_msg_cntr_pair *errvctr;
> +	const char *errmsg;
> +	bool errstat_read;
> +	u32 num_vctr_reg;
> +	u32 indx;
> +	u32 vctr;
> +	u32 i;
> +
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_FATAL:
> +		num_vctr_reg = ERR_STAT_GT_FATAL_VCTR_LEN;
> +		errvctr = err_stat_gt_fatal_vectr_reg;
why don't we define registers once like it's done  in  xe_assign_hw_err_regs.
> +		break;
> +	case HARDWARE_ERROR_NONFATAL:
> +		/*  The GT Non Fatal Error Status Register has only reserved bits
> +		 *  Nothing to service.
> +		 */
> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected %s error\n",
> +				    gt->info.id, hw_err_str);
> +		return;
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		num_vctr_reg = ERR_STAT_GT_COR_VCTR_LEN;
> +		errvctr = err_stat_gt_correctable_vectr_reg;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	errstat_read = false;
> +
> +	for (i = 0 ; i < num_vctr_reg; i++) {
> +		vctr = xe_mmio_read32(gt, ERR_STAT_GT_VCTR_REG(hw_err, i));
> +		if (!vctr)
> +			continue;
> +
> +		errmsg = errvctr[i].errmsg;
> +		indx = errvctr[i].cntr_indx;
> +
> +		if (hw_err == HARDWARE_ERROR_FATAL)
> +			drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
> +					    "GT%d detected %s %s error. ERR_VECT_GT_%s[%d]:0x%08x\n",
> +					    gt->info.id, errmsg, hw_err_str, hw_err_str, i, vctr);
> +		else
> +			drm_warn(&gt_to_xe(gt)->drm, HW_ERR
> +				 "GT%d detected %s %s error. ERR_VECT_GT_%s[%d]:0x%08x\n",
> +				 gt->info.id, errmsg, hw_err_str, hw_err_str, i, vctr);
> +
> +		if (i < ERR_STAT_GT_VCTR4)
> +			gt->errors.count[indx] += hweight32(vctr);
> +
> +		if (i == ERR_STAT_GT_VCTR6)
> +			gt->errors.count[indx] += hweight16(vctr);
> +
> +		if (i == ERR_STAT_GT_VCTR7)
> +			gt->errors.count[indx] += hweight8(vctr);
> +
> +		if (i < ERR_STAT_GT_VCTR2 && !errstat_read) {
> +			xe_gt_hw_error_status_reg_handler(gt, hw_err);
> +			errstat_read = true;

what is the need of errstat_read, isn't i < ERR_STAT_GT_VCTR2 sufficient

and also instead of if check for every i we can have switch case

switch (i) {

case ERR_STAT_GT_VCTR0:
case ERR_STAT_GT_VCTR1:
case ERR_STAT_GT_VCTR2:
case ERR_STAT_GT_VCTR3:

   gt->errors.count[indx] += hweight32(vctr);

    if ( i < ERR_STAT_GT_VCTR2)

        xe_gt_hw_error_status_reg_handler(gt, hw_err);

    break;

case ERR_STAT_GT_VCTR6:
case ERR_STAT_GT_VCTR7:

    gt->errors.count[indx] += (i == ERR_STAT_GT_VCTR6) ? hweight16(vctr) : hweight8(vctr);
    break;

default:

}

> +		}
> +
> +		xe_mmio_write32(gt, ERR_STAT_GT_VCTR_REG(hw_err, i), vctr);
> +	}
> +}
> +
> +static void
> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> +{
> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> +
> +	if (gt_to_xe(gt)->info.platform == XE_PVC)
> +		xe_gt_hw_error_vectr_reg_handler(gt, hw_err);
> +	else
> +		xe_gt_hw_error_status_reg_handler(gt, hw_err);
> +}
> +
>  static void
>  xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 82c947247c27..3fcbbcc338fe 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -51,8 +51,21 @@ enum xe_tile_hw_errors {
>  	XE_TILE_HW_ERROR_MAX,
>  };
>  
> +enum gt_vctr_registers {
> +	ERR_STAT_GT_VCTR0 = 0,
> +	ERR_STAT_GT_VCTR1,
> +	ERR_STAT_GT_VCTR2,
> +	ERR_STAT_GT_VCTR3,
> +	ERR_STAT_GT_VCTR4,
> +	ERR_STAT_GT_VCTR5,
> +	ERR_STAT_GT_VCTR6,
> +	ERR_STAT_GT_VCTR7,
> +};
> +
>  /* Count of GT Correctable and FATAL HW ERRORS */
>  enum xe_gt_hw_errors {
> +	XE_GT_HW_ERR_SUBSLICE_CORR,
> +	XE_GT_HW_ERR_L3BANK_CORR,
>  	XE_GT_HW_ERR_L3_SNG_CORR,
>  	XE_GT_HW_ERR_GUC_CORR,
>  	XE_GT_HW_ERR_SAMPLER_CORR,
> @@ -60,6 +73,8 @@ enum xe_gt_hw_errors {
>  	XE_GT_HW_ERR_EU_IC_CORR,
>  	XE_GT_HW_ERR_EU_GRF_CORR,
>  	XE_GT_HW_ERR_UNKNOWN_CORR,
> +	XE_GT_HW_ERR_SUBSLICE_FATAL,
> +	XE_GT_HW_ERR_L3BANK_FATAL,
>  	XE_GT_HW_ERR_ARR_BIST_FATAL,
>  	XE_GT_HW_ERR_FPU_FATAL,
>  	XE_GT_HW_ERR_L3_DOUB_FATAL,
> @@ -71,10 +86,15 @@ enum xe_gt_hw_errors {
>  	XE_GT_HW_ERR_SLM_FATAL,
>  	XE_GT_HW_ERR_EU_IC_FATAL,
>  	XE_GT_HW_ERR_EU_GRF_FATAL,
> +	XE_GT_HW_ERR_TLB_FATAL,
> +	XE_GT_HW_ERR_L3_FABRIC_FATAL,
>  	XE_GT_HW_ERR_UNKNOWN_FATAL,
>  	XE_GT_HW_ERROR_MAX,
>  };
>  
> +#define ERR_STAT_GT_COR_VCTR_LEN (4)
> +#define ERR_STAT_GT_FATAL_VCTR_LEN (8)
> +
>  struct err_msg_cntr_pair {
>  	const char *errmsg;
>  	const u32 cntr_indx;
Thanks,
Aravind.
