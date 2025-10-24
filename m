Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA135CCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 08:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888B010E0DB;
	Fri, 24 Oct 2025 08:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VW+efX7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BE310E0DB
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761294537; x=1792830537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HZXwRK+Dmnpi2xYpVX1Diglus9vpilnoUS1ss2zQDjg=;
 b=VW+efX7Vl52/w7drCUBQr1Vn2QzSI/Z/hiUBbQhUj0WugQOAjx+emCyn
 HVLGxFc1FUhNyX5pwGeUuLs5AVkKcqhGaCKKIz3tKDl//l1Iu3NAdeN0Q
 u0rTcoTLActp6401PFCtR59nTrVMY/RFWidoUVvrYIDGjO5GKHzjItFhF
 CMzUBZOESVnX1IYf59UWnvhnZq0G8t3HQvEEH4eGPoQosYiS2xURUFJRV
 KhmFL+hEa/LPkb5ZrEGk53wVgxxZgfew4mYRXI0hkh2v5LIYQrUWMxh1D
 Wn7s/H9uBoPbco4F2In7IMFMAN12d+kqXqXdFW8rI8tGkkP7vmbhlLmgB w==;
X-CSE-ConnectionGUID: TbA7MBBTQTSKQHSmN7ac2g==
X-CSE-MsgGUID: AxOCbHLsQTOKwxdbbGWfbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51051893"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="51051893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:28:57 -0700
X-CSE-ConnectionGUID: 2MhtMIdyTguZAvUha0mC0A==
X-CSE-MsgGUID: x/Roe3BFReyNFKG2uM7n5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="208023141"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.97])
 ([10.245.245.97])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:28:55 -0700
Message-ID: <ee70f765-2991-48c4-89a8-60c88aa2ddb9@intel.com>
Date: Fri, 24 Oct 2025 09:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Fix spelling and typos across Xe driver files
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, stuart.summers@intel.com,
 michael.j.ruhl@intel.com, Michal.Wajdeczko@intel.com
References: <20251023121453.1182035-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251023121453.1182035-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 23/10/2025 13:14, Sanjay Yadav wrote:
> Corrected various spelling mistakes and typos in multiple
> files under the Xe directory. These fixes improve clarity
> and maintain consistency in documentation.
> 
> v2
> - Replaced all instances of "XE" with "Xe" where it referred
>    to the driver name
> - of -> for
> - Typical -> Typically
> 
> v3
> - Revert "Xe" to "XE" for macro prefix reference
> 
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c                  |  4 ++--
>   drivers/gpu/drm/xe/xe_bo_doc.h              |  8 ++++----
>   drivers/gpu/drm/xe/xe_configfs.c            |  2 +-
>   drivers/gpu/drm/xe/xe_device.c              |  2 +-
>   drivers/gpu/drm/xe/xe_device_types.h        |  8 ++++----
>   drivers/gpu/drm/xe/xe_exec.c                |  2 +-
>   drivers/gpu/drm/xe/xe_force_wake_types.h    |  4 ++--
>   drivers/gpu/drm/xe/xe_gt_freq.c             |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  2 +-
>   drivers/gpu/drm/xe/xe_guc_ads_types.h       |  2 +-
>   drivers/gpu/drm/xe/xe_guc_ct_types.h        |  2 +-
>   drivers/gpu/drm/xe/xe_guc_log_types.h       |  2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c          |  2 +-
>   drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |  2 +-
>   drivers/gpu/drm/xe/xe_map.h                 |  4 ++--
>   drivers/gpu/drm/xe/xe_migrate.c             |  4 ++--
>   drivers/gpu/drm/xe/xe_migrate_doc.h         |  2 +-
>   drivers/gpu/drm/xe/xe_pm.c                  |  2 +-
>   drivers/gpu/drm/xe/xe_preempt_fence_types.h |  2 +-
>   drivers/gpu/drm/xe/xe_range_fence.h         |  4 ++--
>   drivers/gpu/drm/xe/xe_sched_job.c           |  6 +++---
>   drivers/gpu/drm/xe/xe_sched_job.h           | 12 ++++++------
>   drivers/gpu/drm/xe/xe_sched_job_types.h     |  2 +-
>   drivers/gpu/drm/xe/xe_svm.c                 |  2 +-
>   drivers/gpu/drm/xe/xe_tlb_inval.h           |  2 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h  |  4 ++--
>   drivers/gpu/drm/xe/xe_uc_fw_types.h         |  6 +++---
>   drivers/gpu/drm/xe/xe_uc_types.h            |  2 +-
>   drivers/gpu/drm/xe/xe_validation.h          |  6 +++---
>   drivers/gpu/drm/xe/xe_vm.c                  | 10 +++++-----
>   drivers/gpu/drm/xe/xe_vm_doc.h              |  8 ++++----
>   drivers/gpu/drm/xe/xe_vm_types.h            |  4 ++--
>   32 files changed, 63 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7b6502081873..e4378b4dfcc7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2105,7 +2105,7 @@ void xe_bo_free(struct xe_bo *bo)
>    * if the function should allocate a new one.
>    * @tile: The tile to select for migration of this bo, and the tile used for
>    * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> - * @resv: Pointer to a locked shared reservation object to use fo this bo,
> + * @resv: Pointer to a locked shared reservation object to use for this bo,
>    * or NULL for the xe_bo to use its own.
>    * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
>    * @size: The storage size to use for the bo.
> @@ -2629,7 +2629,7 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>    * @size: The storage size to use for the bo.
>    * @type: The TTM buffer object type.
>    * @flags: XE_BO_FLAG_ flags.
> - * @intr: Whether to execut any waits for backing store interruptible.
> + * @intr: Whether to execute any waits for backing store interruptible.
>    *
>    * Create a pinned and mapped bo. The bo will be external and not associated
>    * with a VM.
> diff --git a/drivers/gpu/drm/xe/xe_bo_doc.h b/drivers/gpu/drm/xe/xe_bo_doc.h
> index 25a884c64bf1..401e7dd26ef3 100644
> --- a/drivers/gpu/drm/xe/xe_bo_doc.h
> +++ b/drivers/gpu/drm/xe/xe_bo_doc.h
> @@ -12,7 +12,7 @@
>    * BO management
>    * =============
>    *
> - * TTM manages (placement, eviction, etc...) all BOs in XE.
> + * TTM manages (placement, eviction, etc...) all BOs in Xe.
>    *
>    * BO creation
>    * ===========
> @@ -29,7 +29,7 @@
>    * a kernel BO (e.g. engine state, memory for page tables, etc...). These BOs
>    * are typically mapped in the GGTT (any kernel BOs aside memory for page tables
>    * are in the GGTT), are pinned (can't move or be evicted at runtime), have a
> - * vmap (XE can access the memory via xe_map layer) and have contiguous physical
> + * vmap (Xe can access the memory via xe_map layer) and have contiguous physical
>    * memory.
>    *
>    * More details of why kernel BOs are pinned and contiguous below.
> @@ -40,7 +40,7 @@
>    * A user BO is created via the DRM_IOCTL_XE_GEM_CREATE IOCTL. Once it is
>    * created the BO can be mmap'd (via DRM_IOCTL_XE_GEM_MMAP_OFFSET) for user
>    * access and it can be bound for GPU access (via DRM_IOCTL_XE_VM_BIND). All
> - * user BOs are evictable and user BOs are never pinned by XE. The allocation of
> + * user BOs are evictable and user BOs are never pinned by Xe. The allocation of
>    * the backing store can be deferred from creation time until first use which is
>    * either mmap, bind, or pagefault.
>    *
> @@ -84,7 +84,7 @@
>    * ====================
>    *
>    * All eviction (or in other words, moving a BO from one memory location to
> - * another) is routed through TTM with a callback into XE.
> + * another) is routed through TTM with a callback into Xe.
>    *
>    * Runtime eviction
>    * ----------------
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index c1419a270fa4..1b86f5d505f6 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -27,7 +27,7 @@
>    * Overview
>    * ========
>    *
> - * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
> + * Configfs is a filesystem-based manager of kernel objects. Xe KMD registers a
>    * configfs subsystem called ``xe`` that creates a directory in the mounted
>    * configfs directory. The user can create devices under this directory and
>    * configure them as necessary. See Documentation/filesystems/configfs.rst for
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5f6a412b571c..47f5391ad8e9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1217,7 +1217,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>    *
>    *   /sys/bus/pci/devices/<device>/survivability_mode
>    *
> - * - Admin/userpsace consumer can use firmware flashing tools like fwupd to flash
> + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
>    *   firmware and restore device to normal operation.
>    */
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e..2a817ba1882d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -222,7 +222,7 @@ struct xe_tile {
>   };
>   
>   /**
> - * struct xe_device - Top level struct of XE device
> + * struct xe_device - Top level struct of Xe device
>    */
>   struct xe_device {
>   	/** @drm: drm device */
> @@ -250,9 +250,9 @@ struct xe_device {
>   		u32 media_verx100;
>   		/** @info.mem_region_mask: mask of valid memory regions */
>   		u32 mem_region_mask;
> -		/** @info.platform: XE platform enum */
> +		/** @info.platform: Xe platform enum */
>   		enum xe_platform platform;
> -		/** @info.subplatform: XE subplatform enum */
> +		/** @info.subplatform: Xe subplatform enum */
>   		enum xe_subplatform subplatform;
>   		/** @info.devid: device ID */
>   		u16 devid;
> @@ -653,7 +653,7 @@ struct xe_device {
>   };
>   
>   /**
> - * struct xe_file - file handle for XE driver
> + * struct xe_file - file handle for Xe driver
>    */
>   struct xe_file {
>   	/** @xe: xe DEVICE **/
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 0dc27476832b..521467d976f7 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -33,7 +33,7 @@
>    * - Binding at exec time
>    * - Flow controlling the ring at exec time
>    *
> - * In XE we avoid all of this complication by not allowing a BO list to be
> + * In Xe we avoid all of this complication by not allowing a BO list to be
>    * passed into an exec, using the dma-buf implicit sync uAPI, have binds as
>    * separate operations, and using the DRM scheduler to flow control the ring.
>    * Let's deep dive on each of these.
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 899fbbcb3ea9..12d6e2367455 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -52,7 +52,7 @@ enum xe_force_wake_domains {
>   };
>   
>   /**
> - * struct xe_force_wake_domain - XE force wake domains
> + * struct xe_force_wake_domain - Xe force wake domains
>    */
>   struct xe_force_wake_domain {
>   	/** @id: domain force wake id */
> @@ -70,7 +70,7 @@ struct xe_force_wake_domain {
>   };
>   
>   /**
> - * struct xe_force_wake - XE force wake
> + * struct xe_force_wake - Xe force wake
>    */
>   struct xe_force_wake {
>   	/** @gt: back pointers to GT */
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 701349251bbc..e88f113226bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -36,7 +36,7 @@
>    * - act_freq: The actual resolved frequency decided by PCODE.
>    * - cur_freq: The current one requested by GuC PC to the PCODE.
>    * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> - * - rpa_freq: The Render Performance (RP) A level, which is the achiveable one.
> + * - rpa_freq: The Render Performance (RP) A level, which is the achievable one.
>    *   Calculated by PCODE at runtime based on multiple running conditions
>    * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
>    *   Calculated by PCODE at runtime based on multiple running conditions
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba3..382083675021 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -739,7 +739,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>   		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> -		smp_wmb();	/* Ensure above writes visable before wake */
> +		smp_wmb();	/* Ensure above writes visible before wake */
>   
>   		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> index 70c132458ac3..48a8e092023f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> @@ -14,7 +14,7 @@ struct xe_bo;
>    * struct xe_guc_ads - GuC additional data structures (ADS)
>    */
>   struct xe_guc_ads {
> -	/** @bo: XE BO for GuC ads blob */
> +	/** @bo: Xe BO for GuC ads blob */
>   	struct xe_bo *bo;
>   	/** @golden_lrc_size: golden LRC size */
>   	size_t golden_lrc_size;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 8b03b50313d9..09d7ff1ef42a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -126,7 +126,7 @@ struct xe_fast_req_fence {
>    * for the H2G and G2H requests sent and received through the buffers.
>    */
>   struct xe_guc_ct {
> -	/** @bo: XE BO for CT */
> +	/** @bo: Xe BO for CT */
>   	struct xe_bo *bo;
>   	/** @lock: protects everything in CT layer */
>   	struct mutex lock;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
> index b3d5c72ac752..02851b924aa4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -44,7 +44,7 @@ struct xe_guc_log_snapshot {
>   struct xe_guc_log {
>   	/** @level: GuC log level */
>   	u32 level;
> -	/** @bo: XE BO for GuC log */
> +	/** @bo: Xe BO for GuC log */
>   	struct xe_bo *bo;
>   	/** @stats: logging related stats */
>   	struct {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0ef67d3523a7..d4ffdb71ef3d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1920,7 +1920,7 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>   }
>   
>   /*
> - * All of these functions are an abstraction layer which other parts of XE can
> + * All of these functions are an abstraction layer which other parts of Xe can
>    * use to trap into the GuC backend. All of these functions, aside from init,
>    * really shouldn't do much other than trap into the DRM scheduler which
>    * synchronizes these operations.
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 6bf2103602f8..a80175c7c478 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -207,7 +207,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
>    * @guc: GuC object
>    * @tlb_inval: TLB invalidation client
>    *
> - * Inititialize GuC TLB invalidation by setting back pointer in TLB invalidation
> + * Initialize GuC TLB invalidation by setting back pointer in TLB invalidation
>    * client to the GuC and setting GuC backend ops.
>    */
>   void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> index f62e0c8b67ab..c44777125691 100644
> --- a/drivers/gpu/drm/xe/xe_map.h
> +++ b/drivers/gpu/drm/xe/xe_map.h
> @@ -14,9 +14,9 @@
>    * DOC: Map layer
>    *
>    * All access to any memory shared with a device (both sysmem and vram) in the
> - * XE driver should go through this layer (xe_map). This layer is built on top
> + * Xe driver should go through this layer (xe_map). This layer is built on top
>    * of :ref:`driver-api/device-io:Generalizing Access to System and I/O Memory`
> - * and with extra hooks into the XE driver that allows adding asserts to memory
> + * and with extra hooks into the Xe driver that allows adding asserts to memory
>    * accesses (e.g. for blocking runtime_pm D3Cold on Discrete Graphics).
>    */
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3112c966c67d..7d60c7c09f33 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1981,7 +1981,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>    *
>    * Copy from an array dma addresses to a VRAM device physical address
>    *
> - * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
> + * Return: dma fence for migrate to signal completion on success, ERR_PTR on
>    * failure
>    */
>   struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> @@ -2002,7 +2002,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>    *
>    * Copy from a VRAM device physical address to an array dma addresses
>    *
> - * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
> + * Return: dma fence for migrate to signal completion on success, ERR_PTR on
>    * failure
>    */
>   struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
> index 63c7d67b5b62..c082bc0b7068 100644
> --- a/drivers/gpu/drm/xe/xe_migrate_doc.h
> +++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
> @@ -9,7 +9,7 @@
>   /**
>    * DOC: Migrate Layer
>    *
> - * The XE migrate layer is used generate jobs which can copy memory (eviction),
> + * The Xe migrate layer is used generate jobs which can copy memory (eviction),
>    * clear memory, or program tables (binds). This layer exists in every GT, has
>    * a migrate engine, and uses a special VM for all generated jobs.
>    *
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 210298c4bcb1..4f8688fd3f00 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -102,7 +102,7 @@ static void xe_pm_block_end_signalling(void)
>   /**
>    * xe_pm_might_block_on_suspend() - Annotate that the code might block on suspend
>    *
> - * Annotation to use where the code might block or sieze to make
> + * Annotation to use where the code might block or seize to make
>    * progress pending resume completion.
>    */
>   void xe_pm_might_block_on_suspend(void)
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence_types.h b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
> index 312c3372a49f..ac125c697a41 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence_types.h
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
> @@ -12,7 +12,7 @@
>   struct xe_exec_queue;
>   
>   /**
> - * struct xe_preempt_fence - XE preempt fence
> + * struct xe_preempt_fence - Xe preempt fence
>    *
>    * hardware and triggers a callback once the xe_engine is complete.
>    */
> diff --git a/drivers/gpu/drm/xe/xe_range_fence.h b/drivers/gpu/drm/xe/xe_range_fence.h
> index edd58b34f5c0..4934729dd904 100644
> --- a/drivers/gpu/drm/xe/xe_range_fence.h
> +++ b/drivers/gpu/drm/xe/xe_range_fence.h
> @@ -13,13 +13,13 @@
>   struct xe_range_fence_tree;
>   struct xe_range_fence;
>   
> -/** struct xe_range_fence_ops - XE range fence ops */
> +/** struct xe_range_fence_ops - Xe range fence ops */
>   struct xe_range_fence_ops {
>   	/** @free: free range fence op */
>   	void (*free)(struct xe_range_fence *rfence);
>   };
>   
> -/** struct xe_range_fence - XE range fence (address conflict tracking) */
> +/** struct xe_range_fence - Xe range fence (address conflict tracking) */
>   struct xe_range_fence {
>   	/** @rb: RB tree node inserted into interval tree */
>   	struct rb_node rb;
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..6ae4cc6a3802 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -160,11 +160,11 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   }
>   
>   /**
> - * xe_sched_job_destroy - Destroy XE schedule job
> - * @ref: reference to XE schedule job
> + * xe_sched_job_destroy - Destroy Xe schedule job
> + * @ref: reference to Xe schedule job
>    *
>    * Called when ref == 0, drop a reference to job's xe_engine + fence, cleanup
> - * base DRM schedule job, and free memory for XE schedule job.
> + * base DRM schedule job, and free memory for Xe schedule job.
>    */
>   void xe_sched_job_destroy(struct kref *ref)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> index 3dc72c5c1f13..b467131b6d5f 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -23,10 +23,10 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   void xe_sched_job_destroy(struct kref *ref);
>   
>   /**
> - * xe_sched_job_get - get reference to XE schedule job
> - * @job: XE schedule job object
> + * xe_sched_job_get - get reference to Xe schedule job
> + * @job: Xe schedule job object
>    *
> - * Increment XE schedule job's reference count
> + * Increment Xe schedule job's reference count
>    */
>   static inline struct xe_sched_job *xe_sched_job_get(struct xe_sched_job *job)
>   {
> @@ -35,10 +35,10 @@ static inline struct xe_sched_job *xe_sched_job_get(struct xe_sched_job *job)
>   }
>   
>   /**
> - * xe_sched_job_put - put reference to XE schedule job
> - * @job: XE schedule job object
> + * xe_sched_job_put - put reference to Xe schedule job
> + * @job: Xe schedule job object
>    *
> - * Decrement XE schedule job's reference count, call xe_sched_job_destroy when
> + * Decrement Xe schedule job's reference count, call xe_sched_job_destroy when
>    * reference count == 0.
>    */
>   static inline void xe_sched_job_put(struct xe_sched_job *job)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 13e7a12b03ad..d26612abb4ca 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -32,7 +32,7 @@ struct xe_job_ptrs {
>   };
>   
>   /**
> - * struct xe_sched_job - XE schedule job (batch buffer tracking)
> + * struct xe_sched_job - Xe schedule job (batch buffer tracking)
>    */
>   struct xe_sched_job {
>   	/** @drm: base DRM scheduler job */
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 129e7818565c..13af589715a7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -633,7 +633,7 @@ static int xe_svm_copy(struct page **pages,
>   
>   	/*
>   	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> -	 * compute always uses the primary GT so accumlate stats on the likely
> +	 * compute always uses the primary GT so accumulate stats on the likely
>   	 * GT of the fault.
>   	 */
>   	if (gt)
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 554634dfd4e2..05614915463a 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -33,7 +33,7 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
>    * xe_tlb_inval_fence_wait() - TLB invalidiation fence wait
>    * @fence: TLB invalidation fence to wait on
>    *
> - * Wait on a TLB invalidiation fence until it signals, non interruptable
> + * Wait on a TLB invalidiation fence until it signals, non interruptible
>    */
>   static inline void
>   xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence *fence)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 1144f9232ebb..a71e14818ec2 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -10,7 +10,7 @@
>   #include <drm/ttm/ttm_device.h>
>   
>   /**
> - * struct xe_ttm_vram_mgr - XE TTM VRAM manager
> + * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
>    *
>    * Manages placement of TTM resource in VRAM.
>    */
> @@ -32,7 +32,7 @@ struct xe_ttm_vram_mgr {
>   };
>   
>   /**
> - * struct xe_ttm_vram_mgr_resource - XE TTM VRAM resource
> + * struct xe_ttm_vram_mgr_resource - Xe TTM VRAM resource
>    */
>   struct xe_ttm_vram_mgr_resource {
>   	/** @base: Base TTM resource */
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 77a1dcf8b4ed..2ebe8c9db6ce 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -62,7 +62,7 @@ enum xe_uc_fw_type {
>   };
>   
>   /**
> - * struct xe_uc_fw_version - Version for XE micro controller firmware
> + * struct xe_uc_fw_version - Version for Xe micro controller firmware
>    */
>   struct xe_uc_fw_version {
>   	/** @branch: branch version of the FW (not always available) */
> @@ -84,7 +84,7 @@ enum xe_uc_fw_version_types {
>   };
>   
>   /**
> - * struct xe_uc_fw - XE micro controller firmware
> + * struct xe_uc_fw - Xe micro controller firmware
>    */
>   struct xe_uc_fw {
>   	/** @type: type uC firmware */
> @@ -112,7 +112,7 @@ struct xe_uc_fw {
>   	/** @size: size of uC firmware including css header */
>   	size_t size;
>   
> -	/** @bo: XE BO for uC firmware */
> +	/** @bo: Xe BO for uC firmware */
>   	struct xe_bo *bo;
>   
>   	/** @has_gsc_headers: whether the FW image starts with GSC headers */
> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
> index 9924e4484866..1708379dc834 100644
> --- a/drivers/gpu/drm/xe/xe_uc_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
> @@ -12,7 +12,7 @@
>   #include "xe_wopcm_types.h"
>   
>   /**
> - * struct xe_uc - XE micro controllers
> + * struct xe_uc - Xe micro controllers
>    */
>   struct xe_uc {
>   	/** @guc: Graphics micro controller */
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index fec331d791e7..1ef181c90434 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -108,7 +108,7 @@ struct xe_val_flags {
>    * @request_exclusive: Whether to lock exclusively (write mode) the next time
>    * the domain lock is locked.
>    * @exec_flags: The drm_exec flags used for drm_exec (re-)initialization.
> - * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
> + * @nr: The drm_exec nr parameter used for drm_exec (re-)initialization.
>    */
>   struct xe_validation_ctx {
>   	struct drm_exec *exec;
> @@ -137,7 +137,7 @@ bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
>    * @_ret: The current error value possibly holding -ENOMEM
>    *
>    * Use this in way similar to drm_exec_retry_on_contention().
> - * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
> + * If @_ret contains -ENOMEM the transaction is restarted once in a way that
>    * blocks other transactions and allows exhastive eviction. If the transaction
>    * was already restarted once, Just return the -ENOMEM. May also set
>    * _ret to -EINTR if not retrying and waits are interruptible.
> @@ -180,7 +180,7 @@ static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
>    * @_val: The xe_validation_device.
>    * @_exec: The struct drm_exec object
>    * @_flags: Flags for the xe_validation_ctx initialization.
> - * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
> + * @_ret: Return in / out parameter. May be set by this macro. Typically 0 when called.
>    *
>    * This macro is will initiate a drm_exec transaction with additional support for
>    * exhaustive eviction.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 10d77666a425..00f3520dec38 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -824,7 +824,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
>    *
>    * (re)bind SVM range setting up GPU page tables for the range.
>    *
> - * Return: dma fence for rebind to signal completion on succees, ERR_PTR on
> + * Return: dma fence for rebind to signal completion on success, ERR_PTR on
>    * failure
>    */
>   struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
> @@ -907,7 +907,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
>    *
>    * Unbind SVM range removing the GPU page tables for the range.
>    *
> - * Return: dma fence for unbind to signal completion on succees, ERR_PTR on
> + * Return: dma fence for unbind to signal completion on success, ERR_PTR on
>    * failure
>    */
>   struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> @@ -1291,7 +1291,7 @@ static u16 pde_pat_index(struct xe_bo *bo)
>   	 * selection of options. The user PAT index is only for encoding leaf
>   	 * nodes, where we have use of more bits to do the encoding. The
>   	 * non-leaf nodes are instead under driver control so the chosen index
> -	 * here should be distict from the user PAT index. Also the
> +	 * here should be distinct from the user PAT index. Also the
>   	 * corresponding coherency of the PAT index should be tied to the
>   	 * allocation type of the page table (or at least we should pick
>   	 * something which is always safe).
> @@ -4172,7 +4172,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   
>   /**
>    * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
> - * @xe: Pointer to the XE device structure
> + * @xe: Pointer to the Xe device structure
>    * @vma: Pointer to the virtual memory area (VMA) structure
>    * @is_atomic: In pagefault path and atomic operation
>    *
> @@ -4319,7 +4319,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>   			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>   		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>   			vma = op->map.vma;
> -			/* In case of madvise call, MAP will always be follwed by REMAP.
> +			/* In case of madvise call, MAP will always be followed by REMAP.
>   			 * Therefore temp_attr will always have sane values, making it safe to
>   			 * copy them to new vma.
>   			 */
> diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
> index 1030ce214032..02e5288373c9 100644
> --- a/drivers/gpu/drm/xe/xe_vm_doc.h
> +++ b/drivers/gpu/drm/xe/xe_vm_doc.h
> @@ -7,7 +7,7 @@
>   #define _XE_VM_DOC_H_
>   
>   /**
> - * DOC: XE VM (user address space)
> + * DOC: Xe VM (user address space)
>    *
>    * VM creation
>    * ===========
> @@ -202,13 +202,13 @@
>    * User pointers are user allocated memory (malloc'd, mmap'd, etc..) for which the
>    * user wants to create a GPU mapping. Typically in other DRM drivers a dummy BO
>    * was created and then a binding was created. We bypass creating a dummy BO in
> - * XE and simply create a binding directly from the userptr.
> + * Xe and simply create a binding directly from the userptr.
>    *
>    * Invalidation
>    * ------------
>    *
>    * Since this a core kernel managed memory the kernel can move this memory
> - * whenever it wants. We register an invalidation MMU notifier to alert XE when
> + * whenever it wants. We register an invalidation MMU notifier to alert Xe when
>    * a user pointer is about to move. The invalidation notifier needs to block
>    * until all pending users (jobs or compute mode engines) of the userptr are
>    * idle to ensure no faults. This done by waiting on all of VM's dma-resv slots.
> @@ -419,7 +419,7 @@
>    * =======
>    *
>    * VM locking protects all of the core data paths (bind operations, execs,
> - * evictions, and compute mode rebind worker) in XE.
> + * evictions, and compute mode rebind worker) in Xe.
>    *
>    * Locks
>    * -----
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index d6e2a0fdd4b3..830ed7b05c27 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -52,7 +52,7 @@ struct xe_vm_pgtable_update_op;
>    * struct xe_vma_mem_attr - memory attributes associated with vma
>    */
>   struct xe_vma_mem_attr {
> -	/** @preferred_loc: perferred memory_location */
> +	/** @preferred_loc: preferred memory_location */
>   	struct {
>   		/** @preferred_loc.migration_policy: Pages migration policy */
>   		u32 migration_policy;
> @@ -338,7 +338,7 @@ struct xe_vm {
>   	u64 tlb_flush_seqno;
>   	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>   	bool batch_invalidate_tlb;
> -	/** @xef: XE file handle for tracking this VM's drm client */
> +	/** @xef: Xe file handle for tracking this VM's drm client */
>   	struct xe_file *xef;
>   };
>   

