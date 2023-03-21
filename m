Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0B3C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 09:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66B910E081;
	Tue, 21 Mar 2023 09:46:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA68F10E081
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679391990; x=1710927990;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=N7IyOBrTzmTTW4qJl0nh3W+auvnFqY65AR4H+EeqAlQ=;
 b=cvYOvIvuy8QALaI+R/6+FrksSxVlsAyoYDudGU4B9YmTDDkH6odcmCQO
 Ab6UuWXVw9Fax0YozhVgxQBxWH0yxwfPL6PXXT478L7h/X585LyZlQV18
 2M3txoTZj+oh79xjg42s6szRR7nJTAPqsiBf+88+EClQKxs75qgQbfVOo
 pZOEVcucICLwM5vaK7qs+9MfKazcP68BHTTSXsxKne2pS05etaXVJEwQe
 u7E6QUC0Db2JKKeVm+pOsQpRP0VtPn5hkAE7ERI45qUXm822r1hG0koCl
 rGRToz0Vt7T5qta89i8oVwvPHdWTmPyQbg66AXW/ga2AuxK/zOK33LhZE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366624398"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="366624398"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770566304"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="770566304"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:46:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230315091740.1580755-2-himal.prasad.ghimiray@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230315091740.1580755-1-himal.prasad.ghimiray@intel.com>
 <20230315091740.1580755-2-himal.prasad.ghimiray@intel.com>
Date: Tue, 21 Mar 2023 11:46:26 +0200
Message-ID: <87wn3a8mj1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe/ras: Log the GT hw errors.
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 15 Mar 2023, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> Count the CORRECTABLE and FATAL GT hardware errors as
> signaled by relevant interrupt and respective registers.
>
> For non relevant interrupts count them as driver interrupt error.
>
> For platform supporting error vector registers count and report
> the respective vector errors.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    | 105 ++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_gt.c           |  30 +++
>  drivers/gpu/drm/xe/xe_gt.h           |   2 +
>  drivers/gpu/drm/xe/xe_gt_types.h     |  43 ++++
>  drivers/gpu/drm/xe/xe_irq.c          | 346 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |   3 +
>  7 files changed, 531 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index c1c829c23df1..fb772c8b12f5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -92,6 +92,10 @@
>  #define   GEN11_GU_MISC_IRQ			(1 << 29)
>  #define   GEN11_DISPLAY_IRQ			(1 << 16)
>  #define   GEN11_GT_DW_IRQ(x)			(1 << (x))
> +#define   GEN12_FATAL_ERROR_IRQ                 REG_BIT(28)
> +#define   GEN12_NON_FATAL_ERROR_IRQ             REG_BIT(27)
> +#define   GEN12_CORRECTABLE_ERROR_IRQ           REG_BIT(26)
> +#define   GEN12_ERROR_IRQ(x)                    REG_BIT(26 + (x))
>  
>  #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
>  #define   DG1_MSTR_IRQ				REG_BIT(31)
> @@ -111,4 +115,105 @@
>  #define GEN12_DSMBASE				_MMIO(0x1080C0)
>  #define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
>  
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,
> +	HARDWARE_ERROR_MAX,
> +};
> +
> +#define DEV_PCIEERR_STATUS              _MMIO(0x100180)
> +#define DEV_PCIEERR_TILE_STATUS_MASK    REG_GENMASK(2, 0)
> +#define DEV_PCIEERR_TILE_STATUS(x)      (DEV_PCIEERR_TILE_STATUS_MASK << (x * 4))
> +#define DEV_PCIEERR_IS_FATAL(x)         (REG_BIT(2) << (x * 4))
> +#define _DEV_ERR_STAT_FATAL             0x100174
> +#define _DEV_ERR_STAT_NONFATAL          0x100178
> +#define _DEV_ERR_STAT_CORRECTABLE       0x10017c
> +#define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
> +						_DEV_ERR_STAT_CORRECTABLE, \
> +						_DEV_ERR_STAT_NONFATAL))
> +#define  DEV_ERR_STAT_SOC_ERROR         REG_BIT(16)
> +#define  DEV_ERR_STAT_SGUNIT_ERROR      REG_BIT(12)
> +#define  DEV_ERR_STAT_GSC_ERROR         REG_BIT(8)
> +#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
> +
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
> +#define ERR_STAT_GT_COR_VCTR_LEN        (4)
> +#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
> +#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
> +#define _ERR_STAT_GT_COR_VCTR_2         0x1002a8
> +#define _ERR_STAT_GT_COR_VCTR_3         0x1002ac
> +#define ERR_STAT_GT_COR_VCTR_REG(x)     _MMIO(_PICK_EVEN((x), \
> +						_ERR_STAT_GT_COR_VCTR_0, \
> +						_ERR_STAT_GT_COR_VCTR_1))
> +
> +#define ERR_STAT_GT_FATAL_VCTR_LEN      (8)
> +#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
> +#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
> +#define _ERR_STAT_GT_FATAL_VCTR_2       0x100268
> +#define _ERR_STAT_GT_FATAL_VCTR_3       0x10026c
> +#define _ERR_STAT_GT_FATAL_VCTR_4       0x100270
> +#define _ERR_STAT_GT_FATAL_VCTR_5       0x100274
> +#define _ERR_STAT_GT_FATAL_VCTR_6       0x100278
> +#define _ERR_STAT_GT_FATAL_VCTR_7       0x10027c
> +#define ERR_STAT_GT_FATAL_VCTR_REG(x)   _MMIO(_PICK_EVEN((x), \
> +					_ERR_STAT_GT_FATAL_VCTR_0, \
> +					_ERR_STAT_GT_FATAL_VCTR_1))
> +
> +#define _ERR_STAT_GT_COR                0x100160
> +#define _ERR_STAT_GT_NONFATAL           0x100164
> +#define _ERR_STAT_GT_FATAL              0x100168
> +#define ERR_STAT_GT_REG(x)              _MMIO(_PICK_EVEN((x), \
> +					_ERR_STAT_GT_COR, \
> +					_ERR_STAT_GT_NONFATAL))
> +
> +#define  EU_GRF_COR_ERR                 (15)
> +#define  EU_IC_COR_ERR                  (14)
> +#define  SLM_COR_ERR                    (13)
> +#define  SAMPLER_COR_ERR                (12)
> +#define  GUC_COR_ERR                    (1)
> +#define  L3_SNG_COR_ERR                 (0)
> +
> +#define PVC_COR_ERR_MASK \
> +		(REG_BIT(GUC_COR_ERR) | \
> +		 REG_BIT(SLM_COR_ERR) | \
> +		 REG_BIT(EU_IC_COR_ERR) | \
> +		 REG_BIT(EU_GRF_COR_ERR))
> +
> +#define EU_GRF_FAT_ERR                  (15)
> +#define EU_IC_FAT_ERR                   (14)
> +#define SLM_FAT_ERR                     (13)
> +#define SAMPLER_FAT_ERR                 (12)
> +#define SQIDI_FAT_ERR                   (9)
> +#define IDI_PAR_FAT_ERR                 (8)
> +#define GUC_FAT_ERR                     (6)
> +#define L3_ECC_CHK_FAT_ERR              (5)
> +#define L3_DOUBLE_FAT_ERR               (4)
> +#define FPU_UNCORR_FAT_ERR              (3)
> +#define ARRAY_BIST_FAT_ERR              (1)
> +
> +#define PVC_FAT_ERR_MASK \
> +		(REG_BIT(FPU_UNCORR_FAT_ERR) | \
> +		 REG_BIT(GUC_FAT_ERR)  | \
> +		 REG_BIT(SLM_FAT_ERR)  | \
> +		 REG_BIT(EU_GRF_FAT_ERR))
> +
> +#define GT_HW_ERROR_MAX_ERR_BITS        16
> +
> +#define _SLM_ECC_ERROR_CNT              0xe7f4
> +#define _SLM_UNCORR_ECC_ERROR_CNT       0xe7c0
> +#define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
> +						_SLM_ECC_ERROR_CNT : \
> +						_SLM_UNCORR_ECC_ERROR_CNT)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 199bd37fce9a..146bb6445c45 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -97,6 +97,8 @@ struct xe_device {
>  		bool has_range_tlb_invalidation;
>  		/** @enable_display: display enabled */
>  		bool enable_display;
> +		/** @has_gt_error_vectors: whether platform supports ERROR VECTORS */
> +		bool has_gt_error_vectors;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct xe_device_display_info {
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 343370b44506..e943810eeb53 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -42,6 +42,35 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char *xe_gt_driver_errors_to_str[] = {

This means you have a mutable array of const pointers. It'll need to be

	static const char * const xe_gt_driver_errors_to_str[]

to be a const array of const pointers, and get stored in rodata.

> +	[INTEL_GT_DRIVER_ERROR_INTERRUPT] = "INTERRUPT",
> +};
> +
> +void xe_gt_log_driver_error(struct xe_gt *gt,
> +			    const enum xe_gt_driver_errors error,
> +			    const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=
> +		     INTEL_GT_DRIVER_ERROR_COUNT);
> +
> +	BUG_ON(error >= INTEL_GT_DRIVER_ERROR_COUNT);

Absolutely no BUG_ON() anywhere. There is no reason to oops here.

> +
> +	gt->errors.driver[error]++;
> +
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
> +			    gt->info.id,
> +			    xe_gt_driver_errors_to_str[error],
> +			    &vaf);
> +	va_end(args);
> +}
> +
>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>  {
>  	struct xe_gt *search;
> @@ -576,6 +605,7 @@ int xe_gt_init(struct xe_gt *gt)
>  	int err;
>  	int i;
>  
> +	spin_lock_init(&gt->irq_lock);
>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 5635f2803170..19b9c0e4e62c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -11,6 +11,8 @@
>  #include "xe_device_types.h"
>  #include "xe_hw_engine.h"
>  
> +#define HAS_GT_ERROR_VECTORS(xe) ((xe)->info.has_gt_error_vectors)
> +
>  #define for_each_hw_engine(hwe__, gt__, id__) \
>  	for ((id__) = 0; (id__) < ARRAY_SIZE((gt__)->hw_engines); (id__)++) \
>  	     for_each_if (((hwe__) = (gt__)->hw_engines + (id__)) && \
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 74b4e6776bf1..d15724792082 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -33,6 +33,42 @@ enum xe_gt_type {
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>  
> +/* Count of GT Correctable and FATAL HW ERRORS */
> +enum intel_gt_hw_errors {
> +	INTEL_GT_HW_ERROR_COR_SUBSLICE = 0,
> +	INTEL_GT_HW_ERROR_COR_L3BANK,
> +	INTEL_GT_HW_ERROR_COR_L3_SNG,
> +	INTEL_GT_HW_ERROR_COR_GUC,
> +	INTEL_GT_HW_ERROR_COR_SAMPLER,
> +	INTEL_GT_HW_ERROR_COR_SLM,
> +	INTEL_GT_HW_ERROR_COR_EU_IC,
> +	INTEL_GT_HW_ERROR_COR_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
> +	INTEL_GT_HW_ERROR_FAT_L3BANK,
> +	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
> +	INTEL_GT_HW_ERROR_FAT_FPU,
> +	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
> +	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
> +	INTEL_GT_HW_ERROR_FAT_GUC,
> +	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
> +	INTEL_GT_HW_ERROR_FAT_SQIDI,
> +	INTEL_GT_HW_ERROR_FAT_SAMPLER,
> +	INTEL_GT_HW_ERROR_FAT_SLM,
> +	INTEL_GT_HW_ERROR_FAT_EU_IC,
> +	INTEL_GT_HW_ERROR_FAT_EU_GRF,
> +	INTEL_GT_HW_ERROR_FAT_TLB,
> +	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
> +	INTEL_GT_HW_ERROR_COUNT
> +};
> +
> +enum xe_gt_driver_errors {
> +	INTEL_GT_DRIVER_ERROR_INTERRUPT = 0,
> +	INTEL_GT_DRIVER_ERROR_COUNT
> +};
> +
> +void xe_gt_log_driver_error(struct xe_gt *gt,
> +				const enum xe_gt_driver_errors error,
> +				const char *fmt, ...);
>  struct xe_mmio_range {
>  	u32 start;
>  	u32 end;
> @@ -347,6 +383,13 @@ struct xe_gt {
>  	 *    of a steered operation
>  	 */
>  	spinlock_t mcr_lock;
> +	spinlock_t irq_lock;
> +
> +	struct intel_hw_errors {
> +		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
> +		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
> +	} errors;
> +
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index ae2f65c00fa6..4a3b3ff99db1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -344,6 +344,351 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>  		dg1_intr_enable(xe, true);
>  }
>  
> +static const char *
> +hardware_error_type_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "CORRECTABLE";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "NONFATAL";
> +	case HARDWARE_ERROR_FATAL:
> +		return "FATAL";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +#define xe_gt_hw_err(gt, fmt, ...) \
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, \
> +			(gt)->info.id, ##__VA_ARGS__)

So are we now adding custom logging macros nilly willy all over the
place?!

> +
> +static void
> +gen12_gt_correctable_hw_error_stats_update(struct xe_gt  *gt,
> +					   unsigned long errstat)
> +{
> +	u32 errbit, cnt;
> +
> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		return;
> +
> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_COR_ERR_MASK)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "UNKNOWN CORRECTABLE error\n");
> +			continue;
> +		}
> +
> +	switch (errbit) {
> +	case L3_SNG_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_L3_SNG]++;
> +		xe_gt_hw_err(gt, "L3 SINGLE CORRECTABLE error\n");
> +		break;
> +	case GUC_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_GUC]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT GUC SRAM CORRECTABLE error\n");
> +		break;
> +	case SAMPLER_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SAMPLER]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT SAMPLER CORRECTABLE error\n");
> +		break;
> +	case SLM_COR_ERR:
> +		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_CORRECTABLE).reg);
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SLM] = cnt;
> +		xe_gt_hw_err(gt, "%u SINGLE BIT SLM CORRECTABLE error\n", cnt);
> +		break;
> +	case EU_IC_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_IC]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT EU IC CORRECTABLE error\n");
> +		break;
> +	case EU_GRF_COR_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_GRF]++;
> +		xe_gt_hw_err(gt, "SINGLE BIT EU GRF CORRECTABLE error\n");
> +		break;
> +	default:
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN CORRECTABLE error\n");
> +		break;
> +	}
> +	}
> +}
> +
> +static void gen12_gt_fatal_hw_error_stats_update(struct xe_gt *gt,
> +						 unsigned long errstat)
> +{
> +	u32 errbit, cnt;
> +
> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		return;
> +
> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_FAT_ERR_MASK)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "UNKNOWN FATAL error\n");
> +			continue;
> +		}
> +
> +	switch (errbit) {
> +	case ARRAY_BIST_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_ARR_BIST]++;
> +		xe_gt_hw_err(gt, "Array BIST FATAL error\n");
> +		break;
> +	case FPU_UNCORR_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_FPU]++;
> +		xe_gt_hw_err(gt, "FPU FATAL error\n");
> +		break;
> +	case L3_DOUBLE_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_DOUB]++;
> +		xe_gt_hw_err(gt, "L3 Double FATAL error\n");
> +		break;
> +	case L3_ECC_CHK_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK]++;
> +		xe_gt_hw_err(gt, "L3 ECC Checker FATAL error\n");
> +		break;
> +	case GUC_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_GUC]++;
> +		xe_gt_hw_err(gt, "GUC SRAM FATAL error\n");
> +		break;
> +	case IDI_PAR_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_IDI_PAR]++;
> +		xe_gt_hw_err(gt, "IDI PARITY FATAL error\n");
> +		break;
> +	case SQIDI_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SQIDI]++;
> +		xe_gt_hw_err(gt, "SQIDI FATAL error\n");
> +		break;
> +	case SAMPLER_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SAMPLER]++;
> +		xe_gt_hw_err(gt, "SAMPLER FATAL error\n");
> +		break;
> +	case SLM_FAT_ERR:
> +		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_FATAL).reg);
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SLM] = cnt;
> +		xe_gt_hw_err(gt, "%u SLM FATAL error\n", cnt);
> +		break;
> +	case EU_IC_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_IC]++;
> +		xe_gt_hw_err(gt, "EU IC FATAL error\n");
> +		break;
> +	case EU_GRF_FAT_ERR:
> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_GRF]++;
> +		xe_gt_hw_err(gt, "EU GRF FATAL error\n");
> +		break;
> +	default:
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +				       "UNKNOWN FATAL error\n");
> +		break;
> +	}
> +	}
> +}
> +
> +static void
> +gen12_gt_hw_error_handler(struct xe_gt *gt,
> +			  const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	unsigned long errstat;
> +
> +	lockdep_assert_held(&gt->irq_lock);
> +
> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +		errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +		if (unlikely(!errstat)) {
> +			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +					       "ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
> +			return;
> +		}
> +	}
> +
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +			bool error = false;
> +			int i;
> +
> +			errstat = 0;
> +			for (i = 0; i < ERR_STAT_GT_COR_VCTR_LEN; i++) {
> +				u32 err_type = ERR_STAT_GT_COR_VCTR_LEN;
> +				unsigned long vctr;
> +				const char *name;
> +
> +				vctr = xe_mmio_read32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg);
> +				if (!vctr)
> +					continue;
> +
> +				switch (i) {
> +				case ERR_STAT_GT_VCTR0:
> +				case ERR_STAT_GT_VCTR1:
> +					err_type = INTEL_GT_HW_ERROR_COR_SUBSLICE;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "SUBSLICE";
> +
> +					/* Avoid second read/write to error status register*/
> +					if (errstat)
> +						break;
> +
> +					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +					xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n",
> +						     errstat);
> +					gen12_gt_correctable_hw_error_stats_update(gt, errstat);
> +					if (errstat)
> +						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> +								errstat);
> +					break;
> +
> +				case ERR_STAT_GT_VCTR2:
> +				case ERR_STAT_GT_VCTR3:
> +					err_type = INTEL_GT_HW_ERROR_COR_L3BANK;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "L3 BANK";
> +					break;
> +				default:
> +					name = "UNKNOWN";
> +					break;
> +				}
> +				xe_mmio_write32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg, vctr);
> +				xe_gt_hw_err(gt, "%s CORRECTABLE error, ERR_VECT_GT_CORRECTABLE_%d:0x%08lx\n",
> +					     name, i, vctr);
> +				error = true;
> +			}
> +
> +			if (!error)
> +				xe_gt_hw_err(gt, "UNKNOWN CORRECTABLE error\n");
> +		} else {
> +			gen12_gt_correctable_hw_error_stats_update(gt, errstat);
> +			xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n", errstat);
> +		}
> +		break;
> +	case HARDWARE_ERROR_NONFATAL:
> +	      /*
> +	       * TODO: The GT Non Fatal Error Status Register
> +	       * only has reserved bitfields defined.
> +	       * Remove once there is something to service.
> +	       */
> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "detected Non-Fatal error\n");
> +		break;
> +	case HARDWARE_ERROR_FATAL:
> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> +			bool error = false;
> +			int i;
> +
> +			errstat = 0;
> +			for (i = 0; i < ERR_STAT_GT_FATAL_VCTR_LEN; i++) {
> +				u32 err_type = ERR_STAT_GT_FATAL_VCTR_LEN;
> +				unsigned long vctr;
> +				const char *name;
> +
> +				vctr = xe_mmio_read32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg);
> +				if (!vctr)
> +					continue;
> +
> +				/* i represents the vector register index */
> +				switch (i) {
> +				case ERR_STAT_GT_VCTR0:
> +				case ERR_STAT_GT_VCTR1:
> +					err_type = INTEL_GT_HW_ERROR_FAT_SUBSLICE;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "SUBSLICE";
> +
> +					/*Avoid second read/write to error status register.*/
> +					if (errstat)
> +						break;
> +
> +					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> +					xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> +					gen12_gt_fatal_hw_error_stats_update(gt, errstat);
> +					if (errstat)
> +						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> +								errstat);
> +					break;
> +
> +				case ERR_STAT_GT_VCTR2:
> +				case ERR_STAT_GT_VCTR3:
> +					err_type = INTEL_GT_HW_ERROR_FAT_L3BANK;
> +					gt->errors.hw[err_type] += hweight32(vctr);
> +					name = "L3 BANK";
> +					break;
> +				case ERR_STAT_GT_VCTR6:
> +					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_TLB] += hweight16(vctr);
> +					name = "TLB";
> +					break;
> +				case ERR_STAT_GT_VCTR7:
> +					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_FABRIC] += hweight8(vctr);
> +					name = "L3 FABRIC";
> +					break;
> +				default:
> +					name = "UNKNOWN";
> +					break;
> +				}
> +				xe_mmio_write32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg, vctr);
> +				xe_gt_hw_err(gt, "%s FATAL error, ERR_VECT_GT_FATAL_%d:0x%08lx\n",
> +					     name, i, vctr);
> +				error = true;
> +			}
> +			if (!error)
> +				xe_gt_hw_err(gt, "UNKNOWN FATAL error\n");
> +		} else {
> +			gen12_gt_fatal_hw_error_stats_update(gt, errstat);
> +			xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> +}
> +
> +static void
> +gen12_hw_error_source_handler(struct xe_gt *gt,
> +			      const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	unsigned long flags;
> +	u32 errsrc;
> +
> +	spin_lock_irqsave(&gt->irq_lock, flags);
> +	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> +	if (unlikely(!errsrc)) {
> +		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
> +				       "DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
> +		goto out_unlock;
> +	}
> +
> +	if (errsrc & DEV_ERR_STAT_GT_ERROR)
> +		gen12_gt_hw_error_handler(gt, hw_err);
> +
> +	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&gt->irq_lock, flags);
> +}
> +
> +/*
> + * GEN12+ adds three Error bits to the Master Interrupt
> + * Register to support dgfx card error handling.
> + * These three bits are used to convey the class of error:
> + * FATAL, NONFATAL, or CORRECTABLE.
> + *
> + * To process an interrupt:
> + *      1. Determine source of error (IP block) by reading
> + *	 the Device Error Source Register (RW1C) that
> + *	 corresponds to the class of error being serviced.
> + *      2. For GT as the generating IP block, read and log
> + *	 the GT Error Register (RW1C) that corresponds to
> + *	 the class of error being serviced.
> + */
> +static void
> +gen12_hw_error_irq_handler(struct xe_gt *gt, const u32 master_ctl)
> +{
> +	enum hardware_error hw_err;
> +
> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> +		if (master_ctl & GEN12_ERROR_IRQ(hw_err))
> +			gen12_hw_error_source_handler(gt, hw_err);
> +	}
> +}
> +
>  static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  {
>  	struct xe_device *xe = arg;
> @@ -382,6 +727,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		if (!xe_gt_is_media_type(gt))
>  			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
>  		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> +		gen12_hw_error_irq_handler(gt, master_ctl);
>  	}
>  
>  	xe_display_irq_handler(xe, master_ctl);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c4d9fd2e7b2b..f3ff64d12da9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -72,6 +72,7 @@ struct xe_device_desc {
>  	bool has_4tile;
>  	bool has_range_tlb_invalidation;
>  	bool has_asid;
> +	bool has_gt_error_vectors;
>  };
>  
>  __diag_push();
> @@ -224,6 +225,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.vm_max_level = 4,
>  	.supports_usm = true,
>  	.has_asid = true,
> +	.has_gt_error_vectors = true,
>  };
>  
>  #define MTL_MEDIA_ENGINES \
> @@ -410,6 +412,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	xe->info.vm_max_level = desc->vm_max_level;
>  	xe->info.supports_usm = desc->supports_usm;
>  	xe->info.has_asid = desc->has_asid;
> +	xe->info.has_gt_error_vectors = desc->has_gt_error_vectors;
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_4tile = desc->has_4tile;
>  	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;

-- 
Jani Nikula, Intel Open Source Graphics Center
