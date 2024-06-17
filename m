Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A910C2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0290710E4D4;
	Mon, 17 Jun 2024 19:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlyDUkSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57FF10E4D4
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718653747; x=1750189747;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A78Vs5XAsYHqP2DcD/0nljf7tez3xSpN5I6nAbb4gQs=;
 b=JlyDUkSvvszCrPFvbzXUZPYhIkD+luyTriSJ09nYUIZPzGEQ1/evL4Ad
 YxNhrQbkHvA/dVAGhY/mrB7MupElIzZXi0j93DcT1NfFwAtcZqBDujV6h
 ttR5WpG4D1EnV271e2KNFSWtsnJpxN74o4tsf8J/yEZUQT1s4RydmnQBV
 0dncl3qRdKqoWf99jZFYmfJ2TZS/goSuoFvkZQsSoZ1iCJWbzQiKxR4iM
 vWmUIdq6/z8I7qSO9UWw/XKeP2Ub+8O7k6wBg4rAugSq/w7C6/U9NYrX8
 XXULK2pK/n1FAMUgdkK5iGQz8SVG+TItyuKp17eC4qYdS7OyZn76Ohy9v A==;
X-CSE-ConnectionGUID: i1AaQEjPQI62sxXi5RDN4w==
X-CSE-MsgGUID: cP6LhpVySqWthgW8ftnl9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15332349"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15332349"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:49:07 -0700
X-CSE-ConnectionGUID: jwBb+mq1Qne5l08XyrGxBw==
X-CSE-MsgGUID: ZJidvuTERFacgsslVTyXzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41163506"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2024 12:49:04 -0700
Received: from [10.245.119.62] (unknown [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 65BFA3372E;
 Mon, 17 Jun 2024 20:48:47 +0100 (IST)
Message-ID: <729c1f1e-9e4e-480c-97ac-1c686afab8bd@intel.com>
Date: Mon, 17 Jun 2024 21:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
 <20240617081051.3340442-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240617081051.3340442-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 17.06.2024 10:10, Vinay Belgaumkar wrote:
> This WA requires us to limit media GT frequency requests to a certain
> cap value during driver load. Freq limits are restored after load
> completes, so perf will not be affected during normal operations.
> 
> During normal driver operation, this WA requires dummy writes to media
> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
> of the LMEM writes originating from Gunit.
> 
> During driver unload(before FLR), the WA requires that we set requested
> frequency to the cap value again.
> 
> v3: Do not use WA number in function name. Call WA wrapper from xe_device.
> Rename some variables, check for locks in the correct function (Rodrigo).
> Ensure reset path is also covered for this WA.
> 
> v4: Fix BAT failure
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  2 +
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_ggtt.c         | 22 +++++++++
>  drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
>  drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
>  drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  2 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  11 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1905a80e61e3..8c72fe38edfd 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  	$(call cmd,wa_oob)
>  
>  uses_generated_oob := \
> +	$(obj)/xe_ggtt.o \
>  	$(obj)/xe_gsc.o \
>  	$(obj)/xe_guc.o \
>  	$(obj)/xe_guc_ads.o \
> +	$(obj)/xe_guc_pc.o \
>  	$(obj)/xe_migrate.o \
>  	$(obj)/xe_ring_ops.o \
>  	$(obj)/xe_vm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 94dbfe5cf19c..fee90f66246f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -668,6 +668,9 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_hwmon_register(xe);
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_sanitize_freq(gt);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..e3fddd59fd9f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/intel/i915_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_gtt_defs.h"
> @@ -23,8 +24,10 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> @@ -69,12 +72,31 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  	return ggms ? SZ_1M << ggms : 0;
>  }
>  
> +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> +{
> +	/*
> +	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit
> +	 * to wait for completion of prior GTT writes before letting this through.
> +	 */
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	++ggtt->access_count;
> +
> +	if (ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487)) {
> +		if ((ggtt->access_count % 63) == 0) {
> +			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
> +			ggtt->access_count = 0;
> +		}
> +	}
> +}
> +
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>  	xe_tile_assert(ggtt->tile, addr < ggtt->size);
>  
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +	ggtt_update_access_counter(ggtt);

this doesn't seem a perfect solution as now it augments the generic
function used by all platforms with unnecessary logic (that triggers
extra step just for specific WA)

maybe it's time to extend struct xe_ggtt_pt_ops with:

	void (*pte_write)(struct xe_ggtt *, u64, u64);

and setup that ops only where applicable:

static const struct xe_ggtt_pt_ops ops_wa = {
	.pte_encode_bo = ...,
	.pte_write = set_and_track_pte,
};

	if (XE_WA(gt, 22019338487))
		ggtt->ops = ops_wa;
	else
		ggtt->ops = ...;
	

>  }
>  
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..73fe6837b9cd 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -34,6 +34,8 @@ struct xe_ggtt {
>  	const struct xe_ggtt_pt_ops *pt_ops;
>  
>  	struct drm_mm mm;
> +
> +	unsigned int access_count;

missing kernel-doc

>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 80a61934decc..f8239a13fa2b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> +#include "xe_guc_pc.h"
>  #include "xe_huc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  		return ret;
>  
>  	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +
> +	/* GSC load is done, restore expected GT frequencies */
> +	xe_gt_sanitize_freq(gt);
> +
>  	xe_gt_dbg(gt, "GSC FW async load completed\n");
>  
>  	/* HuC auth failure is not fatal */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..301594d1e7a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_mi_commands.h"
> @@ -54,6 +55,7 @@
>  #include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc.h"
> +#include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
>  
> +	/* Restore GT freq to expected values */
> +	xe_gt_sanitize_freq(gt);
> +
>  	return 0;
>  }
>  
> @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sanitize_freq() - Restore saved freuencies if necessary.

typo

> + * @gt: the GT object
> + *
> + * Called after driver init/GSC load completes to restore GT frequencies if we
> + * limited them for any WAs.
> + */
> +int xe_gt_sanitize_freq(struct xe_gt *gt)
> +{
> +	int ret = 0;
> +
> +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
> +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
> +	    XE_WA(gt, 22019338487))
> +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
> +
> +	return ret;
> +}
> +
>  int xe_gt_resume(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9073ac68a777..1123fdfc4ebc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
> +int xe_gt_sanitize_freq(struct xe_gt *gt);
>  void xe_gt_remove(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 666a37106bc5..d9194328b495 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "regs/xe_gt_regs.h"
> @@ -24,6 +25,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> +#include "xe_wa.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -41,6 +43,8 @@
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GT_FREQUENCY_SCALER	3
>  
> +#define LNL_MERT_FREQ_CAP	800
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -673,6 +677,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  		tgl_init_fused_rp_values(pc);
>  }
>  
> +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	if (XE_WA(gt, 22019338487))
> +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> +	else
> +		return pc->rp0_freq;
> +}
> +
>  /**
>   * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>   * frequency to allow faster GuC load times
> @@ -684,7 +698,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  	pc_init_fused_rp_values(pc);
> -	pc_set_cur_freq(pc, pc->rp0_freq);
> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>  }
>  
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> @@ -740,6 +754,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +		/*
> +		 * Get updated min/max and stash them.
> +		 */
> +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
> +		if (!ret)
> +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> +		 */
> +		mutex_lock(&pc->freq_lock);
> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +		if (!ret)
> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> +		mutex_unlock(&pc->freq_lock);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
> + * @pc: The GuC PC
> + *
> + * Returns: 0 on success,
> + *          error code on failure
> + */
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&pc->freq_lock);
> +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> +	if (!ret)
> +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
> +	mutex_unlock(&pc->freq_lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_gucrc_disable - Disable GuC RC
>   * @pc: Xe_GuC_PC instance
> @@ -854,6 +915,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
>  
> +	ret = pc_set_mert_freq_cap(pc);
> +	if (ret)
> +		goto out;
> +
>  	if (xe->info.platform == XE_PVC) {
>  		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
> @@ -902,6 +967,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> +
> +	/* Bind requested freq to mert_freq_cap before unload */
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 532cac985a6d..7ba875c3613b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +struct xe_device;

why this ?

>  struct xe_guc_pc;
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
> @@ -29,5 +30,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2afd0dbc3542..13810be015db 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>  	u32 user_requested_min;
>  	/** @user_requested_max: Stash the maximum requested freq by user */
>  	u32 user_requested_max;
> +	/** @stashed_min_freq: Stash the current minimum freq */
> +	u32 stashed_min_freq;
> +	/** @stashed_max_freq: Stash the current maximum freq */
> +	u32 stashed_max_freq;
>  	/** @freq_lock: Let's protect the frequencies */
>  	struct mutex freq_lock;
>  	/** @freq_ready: Only handle freq changes, if they are really ready */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 12fe88796a49..a6b897030fde 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,3 +27,4 @@
>  16022287689	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
> +22019338487	MEDIA_VERSION(2000)
