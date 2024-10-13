Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EBCCF2579
	for <intel-xe@archiver.kernel.org>; Sun, 13 Oct 2024 17:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8B510E170;
	Sun, 13 Oct 2024 17:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGjq/xcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010D510E170
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Oct 2024 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728839147; x=1760375147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5M/5tMoESHroIwWShnqlH8dBtl/aC4Nk0Oljq+W8OPQ=;
 b=eGjq/xcvjg/gGPJKOb0NMdnd6I/mTtxO1ZN7frtxqKzUSOn6gxE/S0Ob
 nzcamCyM1K0tn/8+33zyx/YKi6qSDQnOM06iZ3FaMsxLCrrvBMO04zaCu
 du+NRWhUBpf8pQdW+difrp6QgEdakzO8ageBtLQPavSfe4th+ZINkezho
 YyczOKgtmBJQWFNpU7ieNt7VfLPsxYmoKwXURyqIRVVvh+ZA3tLGX35pN
 jMwT8AM0H9Z1b8uu7Hf7GU6bCEj+Yt3gfGUIr2yRW6are0uxR6nPQDbb6
 vGy//Gg1zdoK+2/bZ0cAGPz9dC1khvmuJRgdYxzTKtBUr4y+V70Urykly Q==;
X-CSE-ConnectionGUID: Kvtz03a7QK2VzdPeejQ36Q==
X-CSE-MsgGUID: 0kxNk+ZiTTiNDrAT35xpFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28315296"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28315296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 10:05:47 -0700
X-CSE-ConnectionGUID: v7KotWUPQUu0LUIDHL3oig==
X-CSE-MsgGUID: XPjIfMipTvqrefyW7vGl0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; d="scan'208";a="77227136"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 13 Oct 2024 10:05:44 -0700
Received: from [10.245.97.255] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.97.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3873B27BC5;
 Sun, 13 Oct 2024 18:05:42 +0100 (IST)
Message-ID: <b2ee979e-9f4a-4d24-b562-ee7fb777aeae@intel.com>
Date: Sun, 13 Oct 2024 19:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/vf: React to MIGRATED interrupt
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241007201631.3369513-1-tomasz.lis@intel.com>
 <20241007201631.3369513-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241007201631.3369513-2-tomasz.lis@intel.com>
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



On 07.10.2024 22:16, Tomasz Lis wrote:
> To properly support VF Save/Restore procedure, fixups need to be
> applied after PF driver finishes its part of VF Restore. Those
> fixups are applied by the VF driver within a VM.
> 
> A VF driver gets informed that it was migrated by receiving an
> interrupt from each GuC. That should be the trigger for fixups.
> 
> The VF can safely do post-migration fixups on resources associated
> to each GuC only after that GuC issued the MIGRATED interrupt.

you should also say somewhere that this MIGRATED interrupt is a
GUC_INTR_SW_INT_0

> 
> This change introduces a worker to be used for post-migration fixups,
> and a mechanism to schedule said worker when all GuCs sent the irq.

and since in this commit message 'fixup' was mentioned 5x then it
wouldn't hurt if we also add some explanation what those 'fixups' could be

> 
> v2: renamed and moved functions, updated logged messages, removed
>   unused includes, used anon struct (Michal)
> v3: ordering, kerneldoc, asserts, debug messages,
>   on_all_tiles -> on_all_gts (Michal)
> v4: fixed missing header include
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  3 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 24 +++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  1 +
>  drivers/gpu/drm/xe/xe_guc.c          | 11 ++++
>  drivers/gpu/drm/xe/xe_memirq.c       |  3 ++
>  drivers/gpu/drm/xe/xe_sriov.c        |  4 ++
>  drivers/gpu/drm/xe/xe_sriov_types.h  | 17 ++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c     | 77 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.h     | 14 +++++
>  10 files changed, 155 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 26cd21bc7189..aec8e1b16219 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -123,7 +123,8 @@ xe-y += \
>  	xe_gt_sriov_vf.o \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
> -	xe_sriov.o
> +	xe_sriov.o \
> +	xe_sriov_vf.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 85bede4dd646..e86b5ca047c8 100644
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
> index d3baba50f085..38dd17f278de 100644
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
> @@ -692,6 +693,29 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
> + *   or just mark that a GuC is ready for it.
> + * @gt: the &xe_gt struct instance linked to target GuC
> + *
> + * This function shall be called only by VF.
> + */
> +void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +
> +	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> +	/*
> +	 * We need to be certain that if all flags were set, at least one
> +	 * thread will notice that and schedule the recovery.
> +	 */
> +	smp_mb__after_atomic();

nit: set_bit + mb could be placed in some small helper,
or at least add separation line

> +	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
> +	xe_sriov_vf_start_migration_recovery(xe);
> +}
> +
>  static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index e541ce57bec2..9959a296b221 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> +void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c2ddf883702b..fb5704526954 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1093,10 +1093,21 @@ int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val)
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
> index f833da88150a..51dc90906003 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -442,6 +442,9 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
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
> index ef10782af656..04e2f539ccd9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -14,6 +14,7 @@
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_vf.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -114,6 +115,9 @@ int xe_sriov_init(struct xe_device *xe)
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
> index c7b7ad4af5c8..5ade678b7c66 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/build_bug.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> +#include <linux/workqueue_types.h>
>  
>  /**
>   * VFID - Virtual Function Identifier
> @@ -56,4 +57,20 @@ struct xe_device_pf {
>  	struct mutex master_lock;
>  };
>  
> +/**
> + * struct xe_device_pv - Xe Virtual Function related data

typo s/pv/vf

> + *
> + * The data in this structure is valid only if driver is running in the
> + * @XE_SRIOV_MODE_VF mode.
> + */
> +struct xe_device_vf {
> +	/** @migration: VF Migration state data */
> +	struct {
> +		/** @migration.worker: VF migration recovery worker */
> +		struct work_struct worker;
> +		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> +		unsigned long gt_flags;
> +	} migration;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> new file mode 100644
> index 000000000000..b8c54926bdaa
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt_sriov_printk.h"
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
> +static bool vf_ready_to_recovery_on_all_gts(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id) {
> +		if (!test_bit(id, &xe->sriov.vf.migration.gt_flags)) {
> +			xe_gt_sriov_dbg_verbose(gt, "still not ready to recover\n");
> +			return false;
> +		}
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
> +	if (!vf_ready_to_recovery_on_all_gts(xe))
> +		return;
> +
> +	WRITE_ONCE(xe->sriov.vf.migration.gt_flags, 0);
> +	/* Ensure other threads see that no flags are set now. */
> +	smp_mb();
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

