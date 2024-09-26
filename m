Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9C6CDE009
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 14:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA010E17C;
	Thu, 26 Sep 2024 14:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mj+Fn5e/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8313410E17C
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727359532; x=1758895532;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GNkL70lULBUF17EFkP+h8rlj70BQ+m4cogF8UhgGfE4=;
 b=Mj+Fn5e/Cc09uksp797jcU1qb5I0+fmdtbh+UiRpUqfe0xXXiGtg7QYd
 TqRET/E1CH9uP+B/qewD+LJmYoD0QNIQutWcIisEC+J/7Pl187V7l3CDh
 cylz6sZyz8HuHVmz1jZSVO3IkBW8SoPw4kw0Gw+F3oF86RHha4hjFqHCF
 La/XLgoS57pk4ibfLDfZcINZ6qA7j49xawSXApOS/8kuF7KRNjjmXAgqD
 Ys2d35NJOCUSZsYatJZbdRrJEpkxjySnJqOwqAb/KjYlmMRqCdlKHAjUU
 2P04HT5AeXH2618d3J6FsPTOERH3/3HEcA4uiaAR3eDdTtVIjQVGFvTIB A==;
X-CSE-ConnectionGUID: 3xO+mnHVQE6+NUl8lZA3LQ==
X-CSE-MsgGUID: QHx4ZLk6TkObeUP8kRPTjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26322373"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26322373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:05:32 -0700
X-CSE-ConnectionGUID: MM5+VnfPRwCMAw0Jq5dvqg==
X-CSE-MsgGUID: koxPuwnwQw2iGD83zIV7Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72243152"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 26 Sep 2024 07:05:29 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8310F284ED;
 Thu, 26 Sep 2024 15:05:28 +0100 (IST)
Message-ID: <959687eb-92f9-4bfe-9065-577b467c2b2d@intel.com>
Date: Thu, 26 Sep 2024 16:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/vf: React to MIGRATED interrupt
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240924202553.1541574-1-tomasz.lis@intel.com>
 <20240924202553.1541574-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240924202553.1541574-2-tomasz.lis@intel.com>
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



On 24.09.2024 22:25, Tomasz Lis wrote:
> To properly support VF Save/Restore procedure, fixups need to be
> applied after PF driver finishes its part of VF Restore. Those
> fixups are applied by the VF driver within a VM.
> 
> A VF driver gets informed that it was migrated by receiving an
> interrupt from each GuC. That should be the trigger for fixups.
> 
> The VF can safely do post-migration fixups on resources associated
> to each GuC only after that GuC issued the MIGRATED interrupt.
> 
> This change introduces a worker to be used for post-migration fixups,
> and a mechanism to schedule said worker when all GuCs sent the irq.
> 
> v2: renamed and moved functions, updated logged messages, removed
>   unused includes, used anon struct (mwajdeczko)
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 11 +++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  2 +
>  drivers/gpu/drm/xe/xe_guc.c          | 11 +++++
>  drivers/gpu/drm/xe/xe_memirq.c       |  3 ++
>  drivers/gpu/drm/xe/xe_sriov.c        |  4 ++
>  drivers/gpu/drm/xe/xe_sriov_types.h  | 10 ++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c     | 73 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.h     | 14 ++++++
>  10 files changed, 131 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8f1c5c329f79..1f07983bb865 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -123,6 +123,7 @@ xe-y += \
>  	xe_gt_sriov_vf.o \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
> +	xe_sriov_vf.o \

wrong order

>  	xe_sriov.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 484fb34dde98..07ff7554fc3e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -374,6 +374,8 @@ struct xe_device {
>  
>  		/** @sriov.pf: PF specific data */
>  		struct xe_device_pf pf;
> +		/** @sriov.vf: VF specific data */
> +		struct xe_device_vf vf;
>  
>  		/** @sriov.wq: workqueue used by the virtualization workers */
>  		struct workqueue_struct *wq;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d3baba50f085..489ace57c2a1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -27,6 +27,7 @@
>  #include "xe_guc_relay.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_vf.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> @@ -692,6 +693,16 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>  	return err;
>  }
>  
> +void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)

this is public function, so you should add kernel-doc for it

> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +

since below you are accessing VF specific fields, you may want to add:

	xe_gt_assert(gt, IS_SRIOV_VF(xe));

> +	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> +	smp_mb__after_atomic();
> +	xe_gt_sriov_info(gt, "VF migration recovery ready\n");

the xe_gt_sriov_info() will already add "VF:" prefix for you:

	xe_gt_sriov_info(gt, "ready for recovery after migration\n");

[ ] xe 0000:00:02.0: [drm] GT0: VF: ready for recovery after migration

> +	xe_sriov_vf_start_migration_recovery(xe);
> +}
> +
>  static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index e541ce57bec2..544e913b8465 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  
> +void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> +
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b6cd5e941f19..05aa93070e5a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1092,10 +1092,21 @@ int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val)
>  	return guc_self_cfg(guc, key, 2, val);
>  }
>  
> +static void xe_guc_sw_0_irq_handler(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		xe_gt_sriov_vf_migrated_event_handler(gt);
> +}
> +
>  void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
>  {
>  	if (iir & GUC_INTR_GUC2HOST)
>  		xe_guc_ct_irq_handler(&guc->ct);
> +
> +	if (iir & GUC_INTR_SW_INT_0)
> +		xe_guc_sw_0_irq_handler(guc);
>  }
>  
>  void xe_guc_sanitize(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 3f8d4ca64302..2d2f40378942 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -435,6 +435,9 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  
>  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
> +
> +	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> +		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 69a066ef20c0..2f4c3ae24f6e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -12,6 +12,7 @@
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_vf.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -112,6 +113,9 @@ int xe_sriov_init(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_init_early(xe);
> +
>  	xe_assert(xe, !xe->sriov.wq);
>  	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
>  	if (!xe->sriov.wq)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index c7b7ad4af5c8..8c518e68d33a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -56,4 +56,14 @@ struct xe_device_pf {
>  	struct mutex master_lock;
>  };
>  
> +struct xe_device_vf {

you need to add kernel-doc for the struct, otherwise below doc will be
ignored (now) or wrongly interpreted (in near future)

> +	/** @migration: VF Migration state data */
> +	struct {
> +		/** @migration.worker: VF migration recovery worker */
> +		struct work_struct worker;
> +		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */

hmm, if something is per-GT then maybe it should be defined under struct
xe_gt in the xe_gt_sriov_vf_types.h as

	struct xe_gt_sriov_vf {

	/** @migration.ready: ready for VF migration recovery */
	bool ready;

> +		unsigned long gt_flags;
> +	} migration;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> new file mode 100644
> index 000000000000..0e332bb215fd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_vf.h"
> +#include "xe_sriov_printk.h"
> +
> +static void migration_worker_func(struct work_struct *w);
> +
> +/**
> + * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
> + * @xe: the &xe_device to initialize
> + */
> +void xe_sriov_vf_init_early(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> +}
> +
> +static void vf_post_migration_recovery(struct xe_device *xe)
> +{
> +	drm_dbg(&xe->drm, "migration recovery in progress\n");
> +	/* FIXME: add the recovery steps */
> +	drm_notice(&xe->drm, "migration recovery ended\n");
> +}
> +
> +static void migration_worker_func(struct work_struct *w)
> +{
> +	struct xe_device *xe = container_of(w, struct xe_device,
> +					    sriov.vf.migration.worker);
> +
> +	vf_post_migration_recovery(xe);
> +}
> +
> +static bool vf_ready_to_recovery_on_all_tiles(struct xe_device *xe)

you likely want to mean "on all GTs", right?

> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id) {
> +		if (!test_bit(id, &xe->sriov.vf.migration.gt_flags))

		if (!gt->sriov.vf.migration.ready) ?

> +			return false;

as you're testing each GT separately, then maybe it's worth to add

	xe_gt_sriov_dbg_verbose(gt, "still not ready to recover\n");

> +	}
> +	return true;
> +}
> +
> +/**
> + * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF.
> + */
> +void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
> +{
> +	bool started;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	if (!vf_ready_to_recovery_on_all_tiles(xe))
> +		return;
> +
> +	WRITE_ONCE(xe->sriov.vf.migration.gt_flags, 0);
> +	smp_mb();

IIRC each use of mb requires documentation of "why"

> +
> +	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
> +	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
> +		 "scheduled" : "already in progress");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> new file mode 100644
> index 000000000000..7b8622cff2b7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_H_
> +#define _XE_SRIOV_VF_H_
> +
> +struct xe_device;
> +
> +void xe_sriov_vf_init_early(struct xe_device *xe);
> +void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> +
> +#endif

