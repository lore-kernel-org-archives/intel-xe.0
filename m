Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF06C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 16:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C500110EB25;
	Fri, 16 May 2025 16:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZFiiYN/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F190010EB25
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747413924; x=1778949924;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZgujcR/Kex+LfSXlcqGsXtglgSV4wRMUtnVMRW98Gwo=;
 b=mZFiiYN/R1HGfo5zk02EUJW6AwNzWASXbv5iKEcoV5scyRINfMOWU3kj
 8Ye+shGKEsjag73RpLhFN4yqVGNULQm6aRjSuNoXyRQ4jmHdVPD92bDzE
 lperORTcPeFvpOhOK8Fbxji8wKKVNRevY46espz9n/RDv+sdof+4LX/BF
 mr3ElxqieZfOfDq1Lcwai8/RZV2IsrrDgitn4M14wVqTDigYnOf1H4JHk
 uIYgaikjH/RSfO1ukhuMPVWvYmVaFbMHra4GIYgdpdKt3k+6Fb21UGj7+
 G4jPed9roiObdqtvrVJYeKziJX/nnAhxxqKrDwRacaicFxb5SfHtpwIjH w==;
X-CSE-ConnectionGUID: 1fplVJEnRW+pTF0S74Ygdg==
X-CSE-MsgGUID: iQBLmvfGT9Km7eRu8ngOzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60029175"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60029175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:45:17 -0700
X-CSE-ConnectionGUID: PfyNLI9gSX+1b33hA1SQbw==
X-CSE-MsgGUID: iAb4d53YR2q3ibyBJieS1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169781142"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:45:15 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2079134918;
 Fri, 16 May 2025 17:45:14 +0100 (IST)
Message-ID: <91cbdebe-4ee8-4fdd-8291-a522c2fac927@intel.com>
Date: Fri, 16 May 2025 18:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ONLY FOR INTERNAL REVIEW 1/3] drm/xe/vf: Create contexts for CCS
 read write
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20250516114832.19046-1-satyanarayana.k.v.p@intel.com>
 <20250516114832.19046-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250516114832.19046-2-satyanarayana.k.v.p@intel.com>
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



On 16.05.2025 13:48, Satyanarayana K V P wrote:
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
> ---
>  drivers/gpu/drm/xe/Makefile          |   3 +-
>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h |  15 +++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   |  17 ++-
>  drivers/gpu/drm/xe/xe_sriov.c        |  17 +++
>  drivers/gpu/drm/xe/xe_sriov.h        |   1 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 156 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  13 +++
>  8 files changed, 221 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4bf484d4121..ad2fb025463a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -139,7 +139,8 @@ xe-y += \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
>  	xe_sriov.o \
> -	xe_sriov_vf.o
> +	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d4b6e623aa48..c8cb25dbd0ac 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -929,6 +929,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);

missing error handling

> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 50b2bfa682ac..4f0b74bd0824 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -234,9 +234,24 @@ struct xe_tile {
>  			/** @sriov.pf.lmtt: Local Memory Translation Table. */
>  			struct xe_lmtt lmtt;
>  		} pf;
> +#define XE_CCS_READ_CTX	0
> +#define XE_CCS_WRITE_CTX	1
> +#define XE_CCS_RW_MAX_CTXS	(XE_CCS_WRITE_CTX + 1)
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			struct xe_ccs_rw_ctx {
> +				/** @migrate: Migration helper for save/restore of CCS data */
> +				struct xe_migrate *migrate;
> +
> +				struct {
> +					/** @ccs_rw_bb_pool: Pool from which batchbuffers
> +					 * are allocated.
> +					 */
> +					struct xe_sa_manager *ccs_rw_bb_pool;
> +				} mem;
> +			} ccs_rw_ctx[XE_CCS_RW_MAX_CTXS];

maybe it will look better if we move most of this to the
xe_sriov_vf_ccs_types.h and leave just here just .ccs member:

			struct xe_tile_vf_ccs ccs;

>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 119a55bb7580..1ff54bdcfc3d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -143,10 +143,23 @@ static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
>  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_sa_manager *bb_pool;
>  
>  	xe_pm_runtime_get(gt_to_xe(gt));
> -	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
> -				     tile->mem.kernel_bb_pool->gpu_addr);
> +
> +	drm_printf(p, "kernel_bb_pool info\n");
> +	drm_printf(p, "-------------------------\n");
> +	bb_pool = tile->mem.kernel_bb_pool;
> +	drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +
> +	if (IS_SRIOV_VF(xe)) {

maybe just add separate debugfs file instead of altering existing entry?

> +		drm_printf(p, "\nccs_rw_bb_pool info\n");

please don't start log with \n
if separation line is required then use drm_puts(p, "\n");

> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs_rw_ctx[0].mem.ccs_rw_bb_pool;
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +	}
> +
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..fa6286e123f0 100644
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
> @@ -157,3 +158,19 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *

    * On VF this function will initialize code for CCS migration ...

or something similar

> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		err = xe_sriov_vf_ccs_rw_init(xe);
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
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..a8a21336dc12
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data.

remove trailing dot

https://docs.kernel.org/doc-guide/kernel-doc.html#overview-documentation-comments

> + *
> + * VF KMD register two special context/LRCA.
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
> + *

please double check the output, :: requires extra indent to follow

https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks

> + * CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *  LRCA        LRCA
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |     Create Save LRCA            |                              |         |
> + *  [ ]<----------------------------- [ ]                             |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |   Register LRCA with Guc     |         |
> + *   |           |                    [ ]--------------------------->[ ]        |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           | Create restore LRCA |                              |         |
> + *   |          [ ]<------------------[ ]                             |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           |                    [ ]-----------------------      |         |
> + *   |           |                    [ ]  Allocate main memory |     |         |
> + *   |           |                    [ ]  Allocate CCS memory  |     |         |
> + *   |           |                    [ ]<----------------------      |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   | Update Main memory&CCS pages    |                              |         |
> + *   |   PPGTT + BB cmds to save       |                              |         |
> + *  [ ]<------------------------------[ ]                             |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           | Update Main memory  |                              |         |
> + *   |           | & CCS pages PPGTT + |                              |         |
> + *   |           | BB cms to restore   |                              |         |
> + *   |          [ ]<------------------[ ]                             |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           |                   VF Pause                         |         |
> + *   |           |                     |                              |Schedule |
> + *   |           |                     |                              |CCS Save |
> + *   |           |                     |                              | LRCA    |
> + *   |           |                     |                             [ ]------>[ ]
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           |                   VF Restore                       |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           |                    [ ]--------------               |         |
> + *   |           |                    [ ] Fix up GGTT  |              |         |
> + *   |           |                    [ ]<-------------               |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |Schedule |
> + *   |           |                     |                              |CCS      |
> + *   |           |                     |                              |Restore  |
> + *   |           |                     |                              |LRCA     |
> + *   |           |                     |                             [ ]------>[ ]
> + *   |           |                     |                              |         |
> + *   |           |                     |                              |         |
> + *
> + */
> +
> +#define for_each_ccs_rw_ctx(id__) \
> +       for ((id__) = 0; (id__) < XE_CCS_RW_MAX_CTXS; (id__)++)
> +
> +#define MAX_CCS_RW_BB_POOL_SIZE	(SZ_4K * XE_PAGE_SIZE)
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_ccs_rw_ctx *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	int offset, err;
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, MAX_CCS_RW_BB_POOL_SIZE, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed\n");

if xe_sa_bo_manager_init didn't already print an error, use %pe here

> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      MAX_CCS_RW_BB_POOL_SIZE);
> +
> +	offset = MAX_CCS_RW_BB_POOL_SIZE - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +
> +	ctx->mem.ccs_rw_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_save_restore_init - Setup LRCA for save & restore.

function name mismatch

> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_rw_init(struct xe_device *xe)
> +{
> +	struct xe_migrate *migrate;
> +	struct xe_ccs_rw_ctx *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	int err = 0;
> +
> +	if (!IS_SRIOV_VF(xe) || IS_DGFX(xe))

we shouldn't call this on VFs so assert shall be sufficient
and you check for IS_VF in xe_sriov_late_init()

> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs_rw_ctx[ctx_id];
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
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..c371aabb4d21
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
> +int xe_sriov_vf_ccs_rw_init(struct xe_device *xe);

do you plan more init() functions?

can't it just be xe_sriov_vf_ccs_init() ?

> +
> +#endif

