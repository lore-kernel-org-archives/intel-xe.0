Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24DEC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 12:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECAC10E0EE;
	Mon,  9 Jun 2025 12:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANipyaYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287B810E0EE
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749472774; x=1781008774;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=siJN9hXoJsLmdWOUUyimsZrVHoidugsoSKi13gkpjWU=;
 b=ANipyaYG7nmhY4IcWq/OlVNXQsJyUqtixXjSPeNilQbJ3SQAJWS8JbUW
 gDSSPrOQNIxQ/1OJCbt/vsTLLAM//1sLAshvAJxkrORYtlKpgxA4DjNPl
 cWZmLoXtMmyYXMMAbmBN4q0xn1cKh8duXDaj5viiuB+HAEIKKlu/aYkaq
 KBEZgaDzJChGRrIxIAwiv5ZuJXTFGiee2N0nDy6aft3nEQgw8gMbeYiU8
 G6hJBYYOg8EyptXYlmb0OiQ4Inrx6kyKwb59h5m0v8tXsdSljnbIdXaph
 7WF6gEdorvNZCmlArLKyu9Fv7CBu8bs5hnJwMN/IW+9KwuKi6q/WH7gTg A==;
X-CSE-ConnectionGUID: jmYrtYyUSseWR3R8qcHeoA==
X-CSE-MsgGUID: USmdRzqsSImmtjR9u6TqUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51252012"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51252012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 05:39:33 -0700
X-CSE-ConnectionGUID: tKFkFvJYTP68wAt8Csu27A==
X-CSE-MsgGUID: UN80Q5dDTpmIQEvbdm3Zvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146429884"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 09 Jun 2025 05:39:31 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CCD7333E8B;
 Mon,  9 Jun 2025 13:39:28 +0100 (IST)
Message-ID: <44e1ab5b-2e1a-4ab4-9de5-f57b0ea1fbb3@intel.com>
Date: Mon, 9 Jun 2025 14:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/xe/vf: Create contexts for CCS read write
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
 <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 06.06.2025 14:45, Satyanarayana K V P wrote:
> Create two LRCs to handle CCS meta data read / write from CCS pool in the
> VM. Read context is used to hold GPU instructions to be executed at save
> time and write context is used to hold GPU instructions to be executed at
> the restore time.
> 
> Allocate batch buffer pool using suballocator for both read and write
> contexts.
> 
> Migration framework is reused to create LRCAs for read and write.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V5 -> V6:
> - Added id field in the xe_tile_vf_ccs structure for self identification.
> 
> V4 -> V5:
> - Modified read/write contexts to enums from #defines (Matthew Brost).
> - The CCS BB pool size is calculated based on the system memory size (Michal
>   Wajdeczko & Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Added new variable which denotes the initialization of contexts.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/Makefile                |   1 +
>  drivers/gpu/drm/xe/xe_device.c             |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
>  drivers/gpu/drm/xe/xe_sriov.c              |  19 +++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 186 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  46 +++++
>  10 files changed, 315 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..3b5241937742 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -140,6 +140,7 @@ xe-y += \
>  	xe_memirq.o \
>  	xe_sriov.o \
>  	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o \
>  	xe_tile_sriov_vf.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..bf96045770c7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -925,6 +925,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..caf3bb1ef048 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,7 @@
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> @@ -234,6 +235,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..2c6d757db810 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int ctx_id;
> +
> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> +		return 0;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/*
> + * only for GT debugfs files which are valid on VF. Not valid on PF.
> + */
> +static const struct drm_info_list vf_only_debugfs_list[] = {
> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> +};
> +
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
> +	else
> +		drm_debugfs_create_files(vf_only_debugfs_list,
> +					 ARRAY_SIZE(vf_only_debugfs_list),
> +					 root, minor);
> +
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..87911fb4eea7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * On VF this function will initialize code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_VF_CCS_INIT_NEEDED(xe))
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..0e0c1abf2d14 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> +int xe_sriov_late_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..8abfdb2c5ead 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -71,6 +71,11 @@ struct xe_device_vf {
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
>  	} migration;
> +
> +	struct {
> +		/** @initialized: Initilalization of vf ccs is completed or not */
> +		bool initialized;
> +	} ccs;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..41fe1f59e0e9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "instructions/xe_gpu_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data
> + *
> + * VF KMD registers two special contexts/LRCAs.
> + *
> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) save in regular System memory in VM.
> + *
> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) Restore from regular System memory in
> + * VM to corresponding CCS pool.
> + *
> + * Below diagram explain steps needed for VF save/Restore of compression Meta
> + * Data::

nit: this last word likely can be part of prev line

> + *
> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *     LRCA        LRCA
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |     Create Save LRCA            |                              |         |
> + *     [ ]<----------------------------- [ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |   Register LRCA with Guc     |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Create restore LRCA |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |

don't we need to register in GuC this 'restore' LRCA ?

> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]-----------------------      |         |
> + *      |           |                    [ ]  Allocate main memory |     |         |
> + *      |           |                    [ ]  Allocate CCS memory  |     |         |
> + *      |           |                    [ ]<----------------------      |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      | Update Main memory & CCS pages  |                              |         |
> + *      |   PPGTT + BB cmds to save       |                              |         |
> + *     [ ]<------------------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Update Main memory  |                              |         |
> + *      |           | & CCS pages PPGTT + |                              |         |
> + *      |           | BB cms to restore   |                              |         |

typo: cms

> + *      |          [ ]<------------------[ ]                             |         |

those above updates are happening as part of BO allocations sequence,
likely depicted as above 'allocate' box - so shouldn't it be drawn as such?

> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Pause                         |         |

this is out of VF control, so maybe

           :           :                                            :
       ------------------------  VF Paused -----------------------------


> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS Save |
> + *      |           |                     |                              | LRCA    |
> + *      |           |                     |                             [ ]------>[ ]

shouldn't we also have arrow from HW to save-LRCA?

> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Restore                       |         |

and

       ------------------------  VF Resumed ---------------------------
           :           :                                            :


> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]--------------               |         |
> + *      |           |                    [ ] Fix up GGTT  |              |         |
> + *      |           |                    [ ]<-------------               |         |

what about showing RESFIX_DONE notification to GuC here ?

> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |Restore  |
> + *      |           |                     |                              |LRCA     |
> + *      |           |                     |                             [ ]------>[ ]

shouldn't we also have arrow from HW to restore-LRCA?

> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |

btw, I assume this 'restore' job is happening as part of the RESFIX_DONE
message processing so return arrow will fit here as well

> + *
> + */
> +
> +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> +{
> +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
> +	struct sysinfo si;
> +
> +	si_meminfo(&si);
> +	sys_mem_size = si.totalram * si.mem_unit;
> +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
> +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
> +
> +	/**
> +	 * We need below BB size to hold PTE mappings and some DWs for copy
> +	 * command. In reality, we need space for many copy commands. So, let
> +	 * us allocate double the calculated size which is enough to holds GPU
> +	 * instructions for the whole region.
> +	 */
> +	bb_pool_size = ptes * sizeof(u32);
> +
> +	return round_up(bb_pool_size * 2, SZ_1M);
> +}
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	u64 bb_pool_size;
> +	int offset, err;
> +
> +	bb_pool_size = get_ccs_bb_pool_size(xe);
> +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> +		      ctx->id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> +			     sa_manager);
> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
> +
> +	offset = bb_pool_size - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +
> +	ctx->mem.ccs_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF. It initializes
> + * LRCA and suballocator needed for CCS save & restore.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> +{
> +	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	int err = 0;
> +
> +	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe) ||
> +		       xe_device_has_flat_ccs(xe)));

make it as 3x separate asserts to clearly see which one will eventually
fire (and to make then logical AND condition)

> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			ctx->id = ctx_id;
> +
> +			migrate = xe_migrate_init(tile);
> +			if (IS_ERR(migrate)) {
> +				err = PTR_ERR(migrate);
> +				goto err_ret;
> +			}
> +			ctx->migrate = migrate;
> +
> +			err = alloc_bb_pool(tile, ctx);
> +			if (err)
> +				goto err_ret;
> +		}
> +	}
> +
> +	xe->sriov.vf.ccs.initialized = 1;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..5df9ba028d14
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_H_
> +#define _XE_SRIOV_VF_CCS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> new file mode 100644
> index 000000000000..f67f002c7a96
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2023 Intel Corporation

2025

> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
> +#define _XE_SRIOV_VF_CCS__TYPES_H_

_XE_SRIOV_VF_CCS_TYPES_H_

> +
> +#define for_each_ccs_rw_ctx(id__) \
> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> +		___xe->sriov.vf.ccs.initialized; \
> +		})
> +
> +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> +		struct xe_device *___xe = (xe); \
> +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> +		})
> +
> +enum xe_sriov_vf_ccs_rw_ctxs {
> +	XE_SRIOV_VF_CCS_RW_MIN_CTXS = 0,
> +	XE_SRIOV_VF_CCS_READ_CTX = XE_SRIOV_VF_CCS_RW_MIN_CTXS,
> +	XE_SRIOV_VF_CCS_WRITE_CTX,
> +	XE_SRIOV_VF_CCS_RW_MAX_CTXS

if we need just READ and WRITE then maybe we can use existing
definitions from <linux/kernel.h>

> +};
> +
> +struct xe_migrate;
> +struct xe_sa_manager;
> +
> +struct xe_tile_vf_ccs {
> +	/** @id: Id to which context it belongs to */

did you mean GuC context id here?
if yes then maybe name it as guc_id as done elsewhere?

> +	int id;
> +	/** @migrate: Migration helper for save/restore of CCS data */
> +	struct xe_migrate *migrate;
> +
> +	struct {
> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		struct xe_sa_manager *ccs_bb_pool;
> +	} mem;
> +};
> +
> +#endif

