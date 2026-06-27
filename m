Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4A8C43458
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jun 2026 07:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FA210E46C;
	Sat, 27 Jun 2026 07:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ieNgJdJu";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0810E46C
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jun 2026 07:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1782543720;
 bh=g8N+XBf2h/veyRrEkQZeS6N0t63msFOJ3K5JXbdW6/s=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ieNgJdJuyWJYw3bGZBmhnHVJpVk+6plJkywdVH5yF1wXAKFIazZ2y6GMVS9XEr+X5
 IAAYXUFH7UEDIrFFJpJ/XOblf2kFebtEjUpW+jvz24uxtdRYipC7+K4BWTJaaXX82V
 pQdyhxItPLnjYUilkdMYIQU/Y9yxpt4E2yne/cPuZ+rpN7iO0FZTFov/EoXKlvEhLZ
 ssvfPabwIJxjLWFlXpfKpemKLAW1pmSduC/9bpLMI5hFMn7bAxVgCyZAoULBmD3lK6
 Bunt9Kn4Qc9+2ZrUNSL5uT/PgboFwbMjBkkQHN2MuGxXKukONoCvR1Bn6gKQ+BGE5D
 j9QHQBrOSsZTw==
Message-ID: <cc7c7b9a-7c41-465f-bb1b-75898c2cfd21@lankhorst.se>
Date: Sat, 27 Jun 2026 09:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Drop 'force_execlist' module parameter
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20260626-remove_execlists-v1-1-2584d8c4a6f2@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260626-remove_execlists-v1-1-2584d8c4a6f2@intel.com>
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

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

On 6/26/26 23:39, Matt Roper wrote:
> During very early development of the Xe driver the force_execlist module
> parameter could be used to exercise some parts of the driver in a
> GuC-less manner.  This was primarily intended to ensure that the driver
> was being designed and developed with proper modularity and layering;
> use of the GuC firmware has always been considered mandatory for any
> real Xe driver operation.  The "execlist" implementation in the driver
> was never completed, and has further bitrotted over time to the point
> where it hangs during execution of even the simplest IGT tests like
> xe_exec_store now.
> 
> Drop the force_execlist parameter; it's broken and isn't going to get
> fixed.  In the (very unlikely) event that we decide to bring something
> like this back in the future, it would need to be as a per-device
> configfs setting rather than a driver-wide module parameter.
> 
> The "execlist" implementation is now dead code, so it will probably also
> be removed sometime in the near future.  There's a bit more general
> refactoring we might want to do first before we take that step, so for
> now we're just removing the module parameter.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c       | 1 -
>  drivers/gpu/drm/xe/xe_device.h        | 2 +-
>  drivers/gpu/drm/xe/xe_device_types.h  | 2 --
>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 3 +--
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 6 ------
>  drivers/gpu/drm/xe/xe_module.c        | 3 ---
>  drivers/gpu/drm/xe/xe_module.h        | 1 -
>  drivers/gpu/drm/xe/xe_pci.c           | 1 -
>  8 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..3c018dbccc07 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -117,7 +117,6 @@ static int info(struct seq_file *m, void *data)
>  	drm_printf(&p, "revid %d\n", xe->info.revid);
>  	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
>  	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
> -	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
>  	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
>  	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
>  	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 975768a6a9c8..8056d8bd7d6d 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -116,7 +116,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>  
>  static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  {
> -	return !xe->info.force_execlist;
> +	return true;
>  }
>  
>  #define for_each_tile(tile__, xe__, id__) \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4e2f115f14e2..46a9e9fad7a9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -144,8 +144,6 @@ struct xe_device {
>  		 * Keep all flags below alphabetically sorted
>  		 */
>  
> -		/** @info.force_execlist: Forced execlist submission */
> -		u8 force_execlist:1;
>  		/** @info.has_access_counter: Device supports access counter */
>  		u8 has_access_counter:1;
>  		/** @info.has_asid: Has address space ID */
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index d11cc9e25cdb..a97b236dab7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -404,8 +404,7 @@ static unsigned int dss_per_group(struct xe_gt *gt)
>  	 * Some older platforms don't have tables or don't have complete tables.
>  	 * Newer platforms should always have the required info.
>  	 */
> -	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000 &&
> -	    !gt_to_xe(gt)->info.force_execlist)
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
>  		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
>  
>  	if (gt_to_xe(gt)->info.platform == XE_PVC)
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index cf6d106e6036..046d0655122f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -208,9 +208,6 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
>  
>  	lockdep_assert_held(&tlb_inval->seqno_lock);
>  
> -	if (guc_to_xe(guc)->info.force_execlist)
> -		return -ECANCELED;
> -
>  	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
>  				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE, prl_sa);
>  }
> @@ -228,9 +225,6 @@ static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
>  
>  	lockdep_assert_held(&tlb_inval->seqno_lock);
>  
> -	if (xe->info.force_execlist)
> -		return -ECANCELED;
> -
>  	vm = xe_device_asid_to_vm(xe, asid);
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 4cb578182912..39e4fc85f019 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -36,9 +36,6 @@ module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600)
>  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
>  		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
>  
> -module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
> -MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> -
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>  MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 79cb9639c0f3..c75153471248 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -10,7 +10,6 @@
>  
>  /* Module modprobe variables */
>  struct xe_modparam {
> -	bool force_execlist;
>  	bool probe_display;
>  	int force_vram_bar_size;
>  	int guc_log_level;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9c249454cc95..15020df6937a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -793,7 +793,6 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
>  				 desc->has_display;
> -	xe->info.force_execlist = xe_modparam.force_execlist;
>  
>  	xe_assert(xe, desc->max_gt_per_tile > 0);
>  	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
> 
> ---
> base-commit: 4020469e425c12c543a21904da37735c392223a3
> change-id: 20260626-remove_execlists-45f82839fc8a
> 
> Best regards,

