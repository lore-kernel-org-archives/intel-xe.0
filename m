Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29965C54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 11:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEBA10F567;
	Thu, 28 Mar 2024 11:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htH+s55w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984741123D5
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711625314; x=1743161314;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=+fVqIEh/Fq4n5ESSRNGUfvbqXLZ/cFCsDcOIgXTPq2M=;
 b=htH+s55w5oor34+CStwar02WUz4oQstXXDHFgA1QJOm5tetxcTc1KeHv
 USugsbF6t+AiEkpvjyqxPq31Sak8aY16/UYoZJX72emxTJ8bPzhBP+lsl
 8pz7F0rL51EeVwby2L0XWZk+5BzxakyCUpzonkK0wylHgdG1EopnsFPEr
 04CXktX4Uyt/LrcEf1UYA0C88h+oeDPEcTGYT1RUyMp12gERgXESw5pvs
 FZ+ufu3mlLJlxz6PjGUUolaoiiFkyQA2BKaIOcxHRlHwhyexSIP7SiXy1
 kvHXoV6mm3C9tzUcC1VA3NWCkQECPGFnIIS9sbwRDqNkgjtMvb5gNF7sZ Q==;
X-CSE-ConnectionGUID: KfEMZBL4S5OETluwwkJdAg==
X-CSE-MsgGUID: lTcLtvB9Q1GxPRHdeKgZqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6634169"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6634169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21306563"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.185])
 ([10.249.254.185])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:28:33 -0700
Message-ID: <20edfe9fd505005ac24751068ec18ca7d4daacc9.camel@linux.intel.com>
Subject: Re: [PATCH v3 20/22] drm/xe: CPU binds for jobs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 12:28:30 +0100
In-Reply-To: <20240206233729.3173206-21-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
 <20240206233729.3173206-21-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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

Hi, Matthew,

On Tue, 2024-02-06 at 15:37 -0800, Matthew Brost wrote:
> No reason to use the GPU for binds. In run_job use the CPU to do
> binds
> once the bind job dependencies are resolved.

I think there are two good reasons to keep the GPU job functionality.

One which we've discussed previously is for small aperture situations.
I'm not sure we actually will see much of this moving forward, but I
don't think in that case we'd want to fill whatever small aperture we
have with page-table bos.

The other is if we rely on cpu page-table binding only we're forced to
accept the latency bubbles between finishing a migration job, signaling
the fence and scheduling the bind job for run. I'm thinking of a
situation where you allocate and clear a number of small bos. The ideal
situation here would be clearing and binding on the same exec queue.
You can then pipeline them all in the exec queue with little or no
latency between the jobs.

In any case, I understand that this simplifies the refactoring, but I
don't think at least we should *rely* on us doing cpu binding for all
future, and we need a better commit message discussing why we, given
the above, choose to sacrifice gpu binding.

/Thomas


>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 -
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 35 +++++
> =C2=A0drivers/gpu/drm/xe/xe_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 4 +
> =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +-
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 47 +++++-
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 198 +++-------------------
> --
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 +++--
> =C2=A0drivers/gpu/drm/xe/xe_pt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_pt_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 24 ++-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h |=C2=A0 31 +++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 104 ++++++-------
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A017 files changed, 247 insertions(+), 269 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 686d716c5581..3f327c123bbc 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2237,16 +2237,16 @@ void __xe_bo_release_dummy(struct kref *kref)
> =C2=A0
> =C2=A0/**
> =C2=A0 * xe_bo_put_commit() - Put bos whose put was deferred by
> xe_bo_put_deferred().
> + * @xe: Xe device
> =C2=A0 * @deferred: The lockless list used for the call to
> xe_bo_put_deferred().
> =C2=A0 *
> =C2=A0 * Puts all bos whose put was deferred by xe_bo_put_deferred().
> =C2=A0 * The @deferred list can be either an onstack local list or a
> global
> =C2=A0 * shared list used by a workqueue.
> =C2=A0 */
> -void xe_bo_put_commit(struct llist_head *deferred)
> +void xe_bo_put_commit(struct xe_device *xe, struct llist_head
> *deferred)
> =C2=A0{
> =C2=A0	struct llist_node *freed;
> -	struct xe_bo *bo, *next;
> =C2=A0
> =C2=A0	if (!deferred)
> =C2=A0		return;
> @@ -2255,8 +2255,7 @@ void xe_bo_put_commit(struct llist_head
> *deferred)
> =C2=A0	if (!freed)
> =C2=A0		return;
> =C2=A0
> -	llist_for_each_entry_safe(bo, next, freed, freed)
> -		drm_gem_object_free(&bo->ttm.base.refcount);
> +	xe_device_put_deferred(xe, freed);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index db4b2db6b073..2a4bfa4fe6c4 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -10,7 +10,6 @@
> =C2=A0
> =C2=A0#include "xe_bo_types.h"
> =C2=A0#include "xe_macros.h"
> -#include "xe_vm_types.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0
> =C2=A0/**
> @@ -307,10 +306,11 @@ xe_bo_put_deferred(struct xe_bo *bo, struct
> llist_head *deferred)
> =C2=A0	if (!kref_put(&bo->ttm.base.refcount,
> __xe_bo_release_dummy))
> =C2=A0		return false;
> =C2=A0
> +	xe_vm_get(bo->vm);
> =C2=A0	return llist_add(&bo->freed, deferred);
> =C2=A0}
> =C2=A0
> -void xe_bo_put_commit(struct llist_head *deferred);
> +void xe_bo_put_commit(struct xe_device *xe, struct llist_head
> *deferred);
> =C2=A0
> =C2=A0struct sg_table *xe_bo_sg(struct xe_bo *bo);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index 1ff5b5a68adc..14ef13b7b421 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -77,8 +77,6 @@ struct xe_bo {
> =C2=A0	} props;
> =C2=A0	/** @freed: List node for delayed put. */
> =C2=A0	struct llist_node freed;
> -	/** @update_index: Update index if PT BO */
> -	int update_index;
> =C2=A0	/** @created: Whether the bo has passed initial creation */
> =C2=A0	bool created;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 5b84d7305520..2998c679f3bd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -198,6 +198,9 @@ static void xe_device_destroy(struct drm_device
> *dev, void *dummy)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> =C2=A0
> +	flush_work(&xe->mem.deferred_work);
> +	xe_assert(xe, !llist_del_all(&xe->mem.deferred));
> +
> =C2=A0	if (xe->ordered_wq)
> =C2=A0		destroy_workqueue(xe->ordered_wq);
> =C2=A0
> @@ -207,6 +210,35 @@ static void xe_device_destroy(struct drm_device
> *dev, void *dummy)
> =C2=A0	ttm_device_fini(&xe->ttm);
> =C2=A0}
> =C2=A0
> +void xe_device_put_deferred(struct xe_device *xe, struct llist_node
> *deferred)
> +{
> +	struct xe_bo *bo, *next;
> +
> +	llist_for_each_entry_safe(bo, next, deferred, freed) {
> +		init_llist_node(&bo->freed);
> +		llist_add(&bo->freed, &xe->mem.deferred);
> +	}
> +	queue_work(system_wq, &xe->mem.deferred_work);
> +}
> +
> +static void deferred_work(struct work_struct *w)
> +{
> +	struct xe_device *xe =3D container_of(w, struct xe_device,
> +					=C2=A0=C2=A0=C2=A0 mem.deferred_work);
> +	struct llist_node *freed =3D llist_del_all(&xe->mem.deferred);
> +	struct xe_bo *bo, *next;
> +
> +	if (!freed)
> +		return;
> +
> +	llist_for_each_entry_safe(bo, next, freed, freed) {
> +		struct xe_vm *vm =3D bo->vm;
> +
> +		drm_gem_object_free(&bo->ttm.base.refcount);
> +		xe_vm_put(vm);
> +	}
> +}
> +
> =C2=A0struct xe_device *xe_device_create(struct pci_dev *pdev,
> =C2=A0				=C2=A0=C2=A0 const struct pci_device_id *ent)
> =C2=A0{
> @@ -274,6 +306,9 @@ struct xe_device *xe_device_create(struct pci_dev
> *pdev,
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> +	init_llist_head(&xe->mem.deferred);
> +	INIT_WORK(&xe->mem.deferred_work, deferred_work);
> +
> =C2=A0	err =3D xe_display_create(xe);
> =C2=A0	if (WARN_ON(err))
> =C2=A0		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h
> index 462f59e902b1..8991d6a18368 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -180,4 +180,6 @@ void xe_device_snapshot_print(struct xe_device
> *xe, struct drm_printer *p);
> =C2=A0u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> =C2=A0u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64
> address);
> =C2=A0
> +void xe_device_put_deferred(struct xe_device *xe, struct llist_node
> *deferred);
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index eb2b806a1d23..3018f1d79177 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -315,6 +315,10 @@ struct xe_device {
> =C2=A0		struct xe_mem_region vram;
> =C2=A0		/** @mem.sys_mgr: system TTM manager */
> =C2=A0		struct ttm_resource_manager sys_mgr;
> +		/** @deferred: deferred list to destroy PT entries
> */
> +		struct llist_head deferred;
> +		/** @deferred_work: worker to destroy PT entries */
> +		struct work_struct deferred_work;
> =C2=A0	} mem;
> =C2=A0
> =C2=A0	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 27dbbdc9127e..2beba426517e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -206,10 +206,13 @@ static int handle_pagefault(struct xe_gt *gt,
> struct pagefault *pf)
> =C2=A0
> =C2=A0	/* Bind VMA only to the GT that has faulted */
> =C2=A0	trace_xe_vma_pf_bind(vma);
> -	xe_vm_populate_dummy_rebind(vm, vma, BIT(tile->id));
> +	ret =3D xe_vm_populate_dummy_rebind(vm, vma, BIT(tile->id));
> +	if (ret)
> +		goto unlock_dma_resv;
> =C2=A0	vm->dummy_ops.vops.pt_update_ops[tile->id].q =3D
> =C2=A0		xe_tile_migrate_exec_queue(tile);
> =C2=A0	fence =3D xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
> +	xe_vma_ops_free(&vm->dummy_ops.vops);
> =C2=A0	if (IS_ERR(fence)) {
> =C2=A0		ret =3D PTR_ERR(fence);
> =C2=A0		goto unlock_dma_resv;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4744668ef60a..bcf0563b76ea 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -17,6 +17,7 @@
> =C2=A0#include "abi/guc_klvs_abi.h"
> =C2=A0#include "regs/xe_lrc_layout.h"
> =C2=A0#include "xe_assert.h"
> +#include "xe_bo.h"
> =C2=A0#include "xe_devcoredump.h"
> =C2=A0#include "xe_device.h"
> =C2=A0#include "xe_exec_queue.h"
> @@ -33,7 +34,9 @@
> =C2=A0#include "xe_lrc.h"
> =C2=A0#include "xe_macros.h"
> =C2=A0#include "xe_map.h"
> +#include "xe_migrate.h"
> =C2=A0#include "xe_mocs.h"
> +#include "xe_pt.h"
> =C2=A0#include "xe_ring_ops_types.h"
> =C2=A0#include "xe_sched_job.h"
> =C2=A0#include "xe_trace.h"
> @@ -719,6 +722,29 @@ static void submit_exec_queue(struct
> xe_exec_queue *q)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static bool is_pt_job(struct xe_sched_job *job)
> +{
> +	return test_bit(JOB_FLAG_PT, &job->fence->flags);
> +}
> +
> +static void cleanup_pt_job(struct xe_device *xe, struct xe_sched_job
> *job)
> +{
> +	xe_pt_update_ops_free(job->pt_update[0].pt_op,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->pt_update[0].num_ops);
> +	xe_bo_put_commit(xe, &job->pt_update[0].deferred);
> +	kfree(job->pt_update[0].pt_op);
> +}
> +
> +static void run_pt_job(struct xe_device *xe, struct xe_sched_job
> *job)
> +{
> +	__xe_migrate_update_pgtables_cpu(job->pt_update[0].vm,
> +					 job->pt_update[0].tile,
> +					 job->pt_update[0].ops,
> +					 job->pt_update[0].pt_op,
> +					 job->pt_update[0].num_ops);
> +	cleanup_pt_job(xe, job);
> +}
> +
> =C2=A0static struct dma_fence *
> =C2=A0guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> =C2=A0{
> @@ -734,15 +760,22 @@ guc_exec_queue_run_job(struct drm_sched_job
> *drm_job)
> =C2=A0	trace_xe_sched_job_run(job);
> =C2=A0
> =C2=A0	if (!exec_queue_killed_or_banned(q) &&
> !xe_sched_job_is_error(job)) {
> -		if (!exec_queue_registered(q))
> -			register_engine(q);
> -		if (!lr)	/* LR jobs are emitted in the exec
> IOCTL */
> -			q->ring_ops->emit_job(job);
> -		submit_exec_queue(q);
> +		if (is_pt_job(job)) {
> +			run_pt_job(xe, job);
> +		} else {
> +			if (!exec_queue_registered(q))
> +				register_engine(q);
> +			if (!lr)	/* LR jobs are emitted in
> the exec IOCTL */
> +				q->ring_ops->emit_job(job);
> +			submit_exec_queue(q);
> +		}
> +	} else if (is_pt_job(job)) {
> +		cleanup_pt_job(xe, job);
> =C2=A0	}
> =C2=A0
> -	if (lr) {
> -		xe_sched_job_set_error(job, -EOPNOTSUPP);
> +	if (lr || is_pt_job(job)) {
> +		if (lr)
> +			xe_sched_job_set_error(job, -EOPNOTSUPP);
> =C2=A0		return NULL;
> =C2=A0	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence-
> >flags)) {
> =C2=A0		return job->fence;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 780e6eca2c40..7d752e424b3b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1104,56 +1104,6 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0	return fence;
> =C2=A0}
> =C2=A0
> -static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb,
> u64 ppgtt_ofs,
> -			=C2=A0 const struct xe_vm_pgtable_update_op
> *pt_op,
> -			=C2=A0 const struct xe_vm_pgtable_update *update,
> -			=C2=A0 struct xe_migrate_pt_update *pt_update)
> -{
> -	const struct xe_migrate_pt_update_ops *ops =3D pt_update->ops;
> -	struct xe_vm *vm =3D pt_update->vops->vm;
> -	u32 chunk;
> -	u32 ofs =3D update->ofs, size =3D update->qwords;
> -
> -	/*
> -	 * If we have 512 entries (max), we would populate it
> ourselves,
> -	 * and update the PDE above it to the new pointer.
> -	 * The only time this can only happen if we have to update
> the top
> -	 * PDE. This requires a BO that is almost vm->size big.
> -	 *
> -	 * This shouldn't be possible in practice.. might change
> when 16K
> -	 * pages are used. Hence the assert.
> -	 */
> -	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
> -	if (!ppgtt_ofs)
> -		ppgtt_ofs =3D xe_migrate_vram_ofs(tile_to_xe(tile),
> -						xe_bo_addr(update-
> >pt_bo, 0,
> -							=C2=A0=C2=A0
> XE_PAGE_SIZE));
> -
> -	do {
> -		u64 addr =3D ppgtt_ofs + ofs * 8;
> -
> -		chunk =3D min(size, MAX_PTE_PER_SDI);
> -
> -		/* Ensure populatefn can do memset64 by aligning bb-
> >cs */
> -		if (!(bb->len & 1))
> -			bb->cs[bb->len++] =3D MI_NOOP;
> -
> -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> MI_SDI_NUM_QW(chunk);
> -		bb->cs[bb->len++] =3D lower_32_bits(addr);
> -		bb->cs[bb->len++] =3D upper_32_bits(addr);
> -		if (pt_op->bind)
> -			ops->populate(tile, NULL, bb->cs + bb->len,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ofs, chunk, update);
> -		else
> -			ops->clear(vm, tile, NULL, bb->cs + bb->len,
> -				=C2=A0=C2=A0 ofs, chunk, update);
> -
> -		bb->len +=3D chunk * 2;
> -		ofs +=3D chunk;
> -		size -=3D chunk;
> -	} while (size);
> -}
> -
> =C2=A0struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m)
> =C2=A0{
> =C2=A0	return xe_vm_get(m->q->vm);
> @@ -1169,11 +1119,10 @@ struct migrate_test_params {
> =C2=A0	container_of(_priv, struct migrate_test_params, base)
> =C2=A0#endif
> =C2=A0
> -static void
> -__xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile
> *tile,
> -				 const struct
> xe_migrate_pt_update_ops *ops,
> -				 struct xe_vm_pgtable_update_op
> *pt_op,
> -				 int num_ops)
> +void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct
> xe_tile *tile,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> xe_migrate_pt_update_ops *ops,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_op
> *pt_op,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int num_ops)
> =C2=A0{
> =C2=A0	u32 j, i;
> =C2=A0
> @@ -1234,131 +1183,15 @@ __xe_migrate_update_pgtables(struct
> xe_migrate *m,
> =C2=A0{
> =C2=A0	const struct xe_migrate_pt_update_ops *ops =3D pt_update->ops;
> =C2=A0	struct xe_tile *tile =3D m->tile;
> -	struct xe_gt *gt =3D tile->primary_gt;
> -	struct xe_device *xe =3D tile_to_xe(tile);
> =C2=A0	struct xe_sched_job *job;
> =C2=A0	struct dma_fence *fence;
> -	struct drm_suballoc *sa_bo =3D NULL;
> -	struct xe_bb *bb;
> -	u32 i, j, batch_size =3D 0, ppgtt_ofs, update_idx, page_ofs =3D
> 0;
> -	u32 num_updates =3D 0, current_update =3D 0;
> -	u64 addr;
> -	int err =3D 0;
> =C2=A0	bool is_migrate =3D pt_update_ops->q =3D=3D m->q;
> -	bool usm =3D is_migrate && xe->info.has_usm;
> -
> -	for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op =3D
> &pt_update_ops->ops[i];
> -		struct xe_vm_pgtable_update *updates =3D pt_op-
> >entries;
> -
> -		num_updates +=3D pt_op->num_entries;
> -		for (j =3D 0; j < pt_op->num_entries; ++j) {
> -			u32 num_cmds =3D
> DIV_ROUND_UP(updates[j].qwords, 0x1ff);
> -
> -			/* align noop + MI_STORE_DATA_IMM cmd prefix
> */
> -			batch_size +=3D 4 * num_cmds +
> updates[j].qwords * 2;
> -		}
> -	}
> -
> -	/* fixed + PTE entries */
> -	if (IS_DGFX(xe))
> -		batch_size +=3D 2;
> -	else
> -		batch_size +=3D 6 + num_updates * 2;
> -
> -	bb =3D xe_bb_new(gt, batch_size, usm);
> -	if (IS_ERR(bb))
> -		return ERR_CAST(bb);
> -
> -	/* For sysmem PTE's, need to map them in our hole.. */
> -	if (!IS_DGFX(xe)) {
> -		ppgtt_ofs =3D NUM_KERNEL_PDE - 1;
> -		if (!is_migrate) {
> -			u32 num_units =3D DIV_ROUND_UP(num_updates,
> -						=C2=A0=C2=A0=C2=A0=C2=A0
> NUM_VMUSA_WRITES_PER_UNIT);
> -
> -			sa_bo =3D drm_suballoc_new(&m->vm_update_sa,
> num_units,
> -						 GFP_KERNEL, true,
> 0);
> -			if (IS_ERR(sa_bo)) {
> -				err =3D PTR_ERR(sa_bo);
> -				goto err;
> -			}
> -
> -			ppgtt_ofs =3D NUM_KERNEL_PDE +
> -				(drm_suballoc_soffset(sa_bo) /
> -				 NUM_VMUSA_UNIT_PER_PAGE);
> -			page_ofs =3D (drm_suballoc_soffset(sa_bo) %
> -				=C2=A0=C2=A0=C2=A0 NUM_VMUSA_UNIT_PER_PAGE) *
> -				VM_SA_UPDATE_UNIT_SIZE;
> -		}
> -
> -		/* Map our PT's to gtt */
> -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> MI_SDI_NUM_QW(num_updates);
> -		bb->cs[bb->len++] =3D ppgtt_ofs * XE_PAGE_SIZE +
> page_ofs;
> -		bb->cs[bb->len++] =3D 0; /* upper_32_bits */
> -
> -		for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> -			struct xe_vm_pgtable_update_op *pt_op =3D
> -				&pt_update_ops->ops[i];
> -			struct xe_vm_pgtable_update *updates =3D
> pt_op->entries;
> -
> -			for (j =3D 0; j < pt_op->num_entries; ++j,
> ++current_update) {
> -				struct xe_vm *vm =3D pt_update->vops-
> >vm;
> -				struct xe_bo *pt_bo =3D
> updates[j].pt_bo;
> -
> -				xe_tile_assert(tile, pt_bo->size =3D=3D
> SZ_4K);
> -
> -				/* Map a PT at most once */
> -				if (pt_bo->update_index < 0)
> -					pt_bo->update_index =3D
> current_update;
> -
> -				addr =3D vm->pt_ops-
> >pte_encode_bo(pt_bo, 0,
> -							=09
> XE_CACHE_WB, 0);
> -				bb->cs[bb->len++] =3D
> lower_32_bits(addr);
> -				bb->cs[bb->len++] =3D
> upper_32_bits(addr);
> -			}
> -		}
> -
> -		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> -		update_idx =3D bb->len;
> -
> -		addr =3D xe_migrate_vm_addr(ppgtt_ofs, 0) +
> -			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> -		for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> -			struct xe_vm_pgtable_update_op *pt_op =3D
> -				&pt_update_ops->ops[i];
> -			struct xe_vm_pgtable_update *updates =3D
> pt_op->entries;
> -
> -			for (j =3D 0; j < pt_op->num_entries; ++j) {
> -				struct xe_bo *pt_bo =3D
> updates[j].pt_bo;
> -
> -				write_pgtable(tile, bb, addr +
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_bo->update_index *
> XE_PAGE_SIZE,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_op, &updates[j],
> pt_update);
> -			}
> -		}
> -	} else {
> -		/* phys pages, no preamble required */
> -		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> -		update_idx =3D bb->len;
> -
> -		for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> -			struct xe_vm_pgtable_update_op *pt_op =3D
> -				&pt_update_ops->ops[i];
> -			struct xe_vm_pgtable_update *updates =3D
> pt_op->entries;
> -
> -			for (j =3D 0; j < pt_op->num_entries; ++j)
> -				write_pgtable(tile, bb, 0, pt_op,
> &updates[j],
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_update);
> -		}
> -	}
> +	int err;
> =C2=A0
> =C2=A0	if (is_migrate)
> =C2=A0		mutex_lock(&m->job_mutex);
> =C2=A0
> -	job =3D xe_bb_create_migration_job(pt_update_ops->q, bb,
> -					 xe_migrate_batch_base(m,
> usm),
> -					 update_idx);
> +	job =3D xe_sched_job_create(pt_update_ops->q, NULL);
> =C2=A0	if (IS_ERR(job)) {
> =C2=A0		err =3D PTR_ERR(job);
> =C2=A0		goto err_bb;
> @@ -1370,6 +1203,19 @@ __xe_migrate_update_pgtables(struct xe_migrate
> *m,
> =C2=A0		if (err)
> =C2=A0			goto err_job;
> =C2=A0	}
> +
> +	set_bit(JOB_FLAG_PT, &job->fence->flags);
> +	job->pt_update[0].vm =3D pt_update->vops->vm;
> +	job->pt_update[0].tile =3D tile;
> +	job->pt_update[0].ops =3D ops;
> +	job->pt_update[0].pt_op =3D pt_update_ops->ops;
> +	job->pt_update[0].num_ops =3D pt_update_ops->num_ops;
> +	job->pt_update[0].deferred =3D pt_update_ops->deferred;
> +
> +	/* Submission backend now owns freeing of pt_update_ops->ops
> */
> +	init_llist_head(&pt_update_ops->deferred);
> +	pt_update_ops->skip_free =3D true;
> +
> =C2=A0	xe_sched_job_arm(job);
> =C2=A0	fence =3D dma_fence_get(&job->drm.s_fence->finished);
> =C2=A0	xe_sched_job_push(job);
> @@ -1377,9 +1223,6 @@ __xe_migrate_update_pgtables(struct xe_migrate
> *m,
> =C2=A0	if (is_migrate)
> =C2=A0		mutex_unlock(&m->job_mutex);
> =C2=A0
> -	xe_bb_free(bb, fence);
> -	drm_suballoc_free(sa_bo, fence);
> -
> =C2=A0	return fence;
> =C2=A0
> =C2=A0err_job:
> @@ -1387,9 +1230,6 @@ __xe_migrate_update_pgtables(struct xe_migrate
> *m,
> =C2=A0err_bb:
> =C2=A0	if (is_migrate)
> =C2=A0		mutex_unlock(&m->job_mutex);
> -	xe_bb_free(bb, NULL);
> -err:
> -	drm_suballoc_free(sa_bo, NULL);
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index 18f5a8e40b5c..f80c94bb8f4c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -22,6 +22,7 @@ struct xe_pt;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> =C2=A0struct xe_vm_pgtable_update;
> +struct xe_vm_pgtable_update_op;
> =C2=A0struct xe_vma;
> =C2=A0
> =C2=A0/**
> @@ -106,6 +107,11 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0
> =C2=A0struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> =C2=A0
> +void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct
> xe_tile *tile,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> xe_migrate_pt_update_ops *ops,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_op
> *pt_op,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int num_ops);
> +
> =C2=A0struct dma_fence *
> =C2=A0xe_migrate_update_pgtables(struct xe_migrate *m,
> =C2=A0			=C2=A0=C2=A0 struct xe_migrate_pt_update *pt_update);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 4758ae8a5459..26a00af6c4a6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -315,7 +315,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd,
> struct xe_pt *parent,
> =C2=A0	entry->pt =3D parent;
> =C2=A0	entry->flags =3D 0;
> =C2=A0	entry->qwords =3D 0;
> -	entry->pt_bo->update_index =3D -1;
> +	entry->level =3D parent->level;
> =C2=A0
> =C2=A0	if (alloc_entries) {
> =C2=A0		entry->pt_entries =3D kmalloc_array(XE_PDES,
> @@ -1476,7 +1476,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm
> *vm, struct xe_tile *tile,
> =C2=A0				=C2=A0 u32 qword_ofs, u32 num_qwords,
> =C2=A0				=C2=A0 const struct xe_vm_pgtable_update
> *update)
> =C2=A0{
> -	u64 empty =3D __xe_pt_empty_pte(tile, vm, update->pt->level);
> +	u64 empty =3D __xe_pt_empty_pte(tile, vm, update->level);
> =C2=A0	int i;
> =C2=A0
> =C2=A0	if (map && map->is_iomem)
> @@ -1890,7 +1890,7 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0		goto free_ifence;
> =C2=A0	}
> =C2=A0
> -	/* FIXME: Point of no return - VM killed if failure after
> this */
> +	/* Point of no return - VM killed if failure after this */
> =C2=A0	for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> =C2=A0		struct xe_vm_pgtable_update_op *pt_op =3D
> &pt_update_ops->ops[i];
> =C2=A0
> @@ -1953,6 +1953,21 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_pt_update_ops_free() - Free PT update operations
> + * @pt_op: Array of PT update operations
> + * @num_ops: Number of PT update operations
> + *
> + * Free PT update operations
> + */
> +void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op,
> u32 num_ops)
> +{
> +	u32 i;
> +
> +	for (i =3D 0; i < num_ops; ++i, ++pt_op)
> +		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_pt_update_ops_fini() - Finish PT update operations
> =C2=A0 * @tile: Tile of PT update operations
> @@ -1964,17 +1979,16 @@ void xe_pt_update_ops_fini(struct xe_tile
> *tile, struct xe_vma_ops *vops)
> =C2=A0{
> =C2=A0	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> =C2=A0		&vops->pt_update_ops[tile->id];
> -	int i;
> =C2=A0
> =C2=A0	lockdep_assert_held(&vops->vm->lock);
> =C2=A0	xe_vm_assert_held(vops->vm);
> =C2=A0
> -	for (i =3D 0; i < pt_update_ops->num_ops; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op =3D
> &pt_update_ops->ops[i];
> -
> -		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> -	}
> -	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> +	xe_bo_put_commit(tile_to_xe(tile), &pt_update_ops-
> >deferred);
> +	if (!pt_update_ops->skip_free)
> +		xe_pt_update_ops_free(pt_update_ops->ops,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_update_ops->num_ops);
> +	else
> +		pt_update_ops->ops =3D NULL;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -2009,5 +2023,5 @@ void xe_pt_update_ops_abort(struct xe_tile
> *tile, struct xe_vma_ops *vops)
> =C2=A0					=C2=A0=C2=A0 pt_op->num_entries);
> =C2=A0	}
> =C2=A0
> -	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> +	xe_pt_update_ops_fini(tile, vops);
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 9ab386431cad..989c9b190fa0 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -40,6 +40,7 @@ struct dma_fence *xe_pt_update_ops_run(struct
> xe_tile *tile,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma_ops *vops);
> =C2=A0void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops
> *vops);
> =C2=A0void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops
> *vops);
> +void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op,
> u32 num_ops);
> =C2=A0
> =C2=A0bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> index 384cc04de719..cfd0d35408a5 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -70,6 +70,9 @@ struct xe_vm_pgtable_update {
> =C2=A0	/** @pt_entries: Newly added pagetable entries */
> =C2=A0	struct xe_pt_entry *pt_entries;
> =C2=A0
> +	/** @level: level of update */
> +	unsigned int level;
> +
> =C2=A0	/** @flags: Target flags */
> =C2=A0	u32 flags;
> =C2=A0};
> @@ -120,6 +123,8 @@ struct xe_vm_pgtable_update_ops {
> =C2=A0	 * slots are idle.
> =C2=A0	 */
> =C2=A0	bool wait_vm_kernel;
> +	/** @skip_free: Free @ops in submission backend rather than
> in IOCTL */
> +	bool skip_free;
> =C2=A0};
> =C2=A0
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> b/drivers/gpu/drm/xe/xe_sched_job.c
> index 8151ddafb940..5930f03a81ad 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -34,8 +34,10 @@ int __init xe_sched_job_module_init(void)
> =C2=A0	xe_sched_job_parallel_slab =3D
> =C2=A0		kmem_cache_create("xe_sched_job_parallel",
> =C2=A0				=C2=A0 sizeof(struct xe_sched_job) +
> +				=C2=A0 max_t(size_t,
> =C2=A0				=C2=A0 sizeof(u64) *
> -				=C2=A0 XE_HW_ENGINE_MAX_INSTANCE, 0,
> +				=C2=A0 XE_HW_ENGINE_MAX_INSTANCE,
> +				=C2=A0 sizeof(struct pt_update_args)), 0,
> =C2=A0				=C2=A0 SLAB_HWCACHE_ALIGN, NULL);
> =C2=A0	if (!xe_sched_job_parallel_slab) {
> =C2=A0		kmem_cache_destroy(xe_sched_job_slab);
> @@ -108,7 +110,13 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0	if (err)
> =C2=A0		goto err_free;
> =C2=A0
> -	if (!xe_exec_queue_is_parallel(q)) {
> +	if (!batch_addr) {
> +		job->fence =3D
> dma_fence_allocate_private_stub(ktime_get());
> +		if (!job->fence) {
> +			err =3D -ENOMEM;
> +			goto err_sched_job;
> +		}
> +	} else if (!xe_exec_queue_is_parallel(q)) {
> =C2=A0		job->fence =3D xe_lrc_create_seqno_fence(q->lrc);
> =C2=A0		if (IS_ERR(job->fence)) {
> =C2=A0			err =3D PTR_ERR(job->fence);
> @@ -148,12 +156,14 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0		job->fence =3D &cf->base;
> =C2=A0	}
> =C2=A0
> -	width =3D q->width;
> -	if (is_migration)
> -		width =3D 2;
> +	if (batch_addr) {
> +		width =3D q->width;
> +		if (is_migration)
> +			width =3D 2;
> =C2=A0
> -	for (i =3D 0; i < width; ++i)
> -		job->batch_addr[i] =3D batch_addr[i];
> +		for (i =3D 0; i < width; ++i)
> +			job->batch_addr[i] =3D batch_addr[i];
> +	}
> =C2=A0
> =C2=A0	/* All other jobs require a VM to be open which has a ref */
> =C2=A0	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index b1d83da50a53..623d6dcc8ae5 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -11,6 +11,28 @@
> =C2=A0#include <drm/gpu_scheduler.h>
> =C2=A0
> =C2=A0struct xe_exec_queue;
> +struct xe_migrate_pt_update_ops;
> +struct xe_tile;
> +struct xe_vm;
> +struct xe_vm_pgtable_update_op;
> +
> +/**
> + * struct pt_update_args - PT update arguments
> + */
> +struct pt_update_args {
> +	/** @vm: VM */
> +	struct xe_vm *vm;
> +	/** @tile: Tile */
> +	struct xe_tile *tile;
> +	/** @ops: Migrate PT update ops */
> +	const struct xe_migrate_pt_update_ops *ops;
> +	/** @pt_op: PT update ops */
> +	struct xe_vm_pgtable_update_op *pt_op;
> +	/** @deferred: deferred list to destroy PT entries */
> +	struct llist_head deferred;
> +	/** @num_ops: number of PT update ops */
> +	int num_ops;
> +};
> =C2=A0
> =C2=A0/**
> =C2=A0 * struct xe_sched_job - XE schedule job (batch buffer tracking)
> @@ -27,6 +49,7 @@ struct xe_sched_job {
> =C2=A0	 * can safely reference fence, fence cannot safely reference
> job.
> =C2=A0	 */
> =C2=A0#define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
> +#define JOB_FLAG_PT		(DMA_FENCE_FLAG_USER_BITS << 1)
> =C2=A0	struct dma_fence *fence;
> =C2=A0	/** @user_fence: write back value when BB is complete */
> =C2=A0	struct {
> @@ -39,8 +62,12 @@ struct xe_sched_job {
> =C2=A0	} user_fence;
> =C2=A0	/** @migrate_flush_flags: Additional flush flags for
> migration jobs */
> =C2=A0	u32 migrate_flush_flags;
> -	/** @batch_addr: batch buffer address of job */
> -	u64 batch_addr[];
> +	union {
> +		/** @batch_addr: batch buffer address of job */
> +		u64 batch_addr[0];
> +		/** @pt_update: PT update arguments */
> +		struct pt_update_args pt_update[0];
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0struct xe_sched_job_snapshot {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9d2d1c262445..3b3136045327 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -749,6 +749,45 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> =C2=A0		list_empty_careful(&vm->userptr.invalidated)) ? 0 :
> -EAGAIN;
> =C2=A0}
> =C2=A0
> +static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm
> *vm,
> +			=C2=A0=C2=A0=C2=A0 struct xe_exec_queue *q,
> +			=C2=A0=C2=A0=C2=A0 struct xe_sync_entry *syncs, u32
> num_syncs)
> +{
> +	memset(vops, 0, sizeof(*vops));
> +	INIT_LIST_HEAD(&vops->list);
> +	vops->vm =3D vm;
> +	vops->q =3D q;
> +	vops->syncs =3D syncs;
> +	vops->num_syncs =3D num_syncs;
> +}
> +
> +static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
> +		if (!vops->pt_update_ops[i].num_ops)
> +			continue;
> +
> +		vops->pt_update_ops[i].ops =3D
> +			kmalloc_array(vops-
> >pt_update_ops[i].num_ops,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*vops-
> >pt_update_ops[i].ops),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> +		if (!vops->pt_update_ops[i].ops)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +void xe_vma_ops_free(struct xe_vma_ops *vops)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> +		kfree(vops->pt_update_ops[i].ops);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_vm_populate_dummy_rebind() - Populate dummy rebind VMA ops
> =C2=A0 * @vm: The VM.
> @@ -756,9 +795,11 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> =C2=A0 * @tile_mask: tile mask for VMA ops
> =C2=A0 *
> =C2=A0 * Populate dummy VMA ops which can be used to issue a rebind for
> the VMA
> + *
> + * Return: 0 on success, -ENOMEM on failure
> =C2=A0 */
> -void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma
> *vma,
> -				 u8 tile_mask)
> +int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma
> *vma,
> +				u8 tile_mask)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> @@ -792,12 +833,15 @@ void xe_vm_populate_dummy_rebind(struct xe_vm
> *vm, struct xe_vma *vma,
> =C2=A0	vm->dummy_ops.op.map.immediate =3D true;
> =C2=A0	vm->dummy_ops.op.map.read_only =3D xe_vma_read_only(vma);
> =C2=A0	vm->dummy_ops.op.map.is_null =3D xe_vma_is_null(vma);
> +
> +	return xe_vma_ops_alloc(&vm->dummy_ops.vops);
> =C2=A0}
> =C2=A0
> =C2=A0struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker=
)
> =C2=A0{
> =C2=A0	struct dma_fence *fence =3D NULL;
> =C2=A0	struct xe_vma *vma, *next;
> +	int err;
> =C2=A0
> =C2=A0	lockdep_assert_held(&vm->lock);
> =C2=A0	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
> @@ -815,8 +859,12 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm,
> bool rebind_worker)
> =C2=A0		else
> =C2=A0			trace_xe_vma_rebind_exec(vma);
> =C2=A0
> -		xe_vm_populate_dummy_rebind(vm, vma, vma-
> >tile_present);
> +		err =3D xe_vm_populate_dummy_rebind(vm, vma, vma-
> >tile_present);
> +		if (err)
> +			return ERR_PTR(err);
> +
> =C2=A0		fence =3D xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
> +		xe_vma_ops_free(&vm->dummy_ops.vops);
> =C2=A0		if (IS_ERR(fence))
> =C2=A0			return fence;
> =C2=A0	}
> @@ -1305,48 +1353,6 @@ static void xe_vm_free_scratch(struct xe_vm
> *vm)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm
> *vm,
> -			=C2=A0=C2=A0=C2=A0 struct xe_exec_queue *q,
> -			=C2=A0=C2=A0=C2=A0 struct xe_sync_entry *syncs, u32
> num_syncs)
> -{
> -	memset(vops, 0, sizeof(*vops));
> -	INIT_LIST_HEAD(&vops->list);
> -	vops->vm =3D vm;
> -	vops->q =3D q;
> -	vops->syncs =3D syncs;
> -	vops->num_syncs =3D num_syncs;
> -}
> -
> -static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> -{
> -	int i, j;
> -
> -	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
> -		if (!vops->pt_update_ops[i].num_ops)
> -			continue;
> -
> -		vops->pt_update_ops[i].ops =3D
> -			kmalloc_array(vops-
> >pt_update_ops[i].num_ops,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*vops-
> >pt_update_ops[i].ops),
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> -		if (!vops->pt_update_ops[i].ops)
> -			return -ENOMEM;
> -
> -		for (j =3D 0; j < vops->pt_update_ops[i].num_ops; ++j)
> -			vops->pt_update_ops[i].ops[j].num_entries =3D
> 0;
> -	}
> -
> -	return 0;
> -}
> -
> -static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> -		kfree(vops->pt_update_ops[i].ops);
> -}
> -
> =C2=A0static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops,
> u8 tile_mask)
> =C2=A0{
> =C2=A0	int i;
> @@ -1381,9 +1387,6 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
> =C2=A0	for (id =3D 0; id < XE_MAX_TILES_PER_DEVICE; ++id)
> =C2=A0		vm->dummy_ops.vops.pt_update_ops[id].num_ops =3D 1;
> -	err =3D xe_vma_ops_alloc(&vm->dummy_ops.vops);
> -	if (err)
> -		goto err_free;
> =C2=A0
> =C2=A0	INIT_LIST_HEAD(&vm->rebind_list);
> =C2=A0
> @@ -1513,8 +1516,6 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0		xe_device_mem_access_put(xe);
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		xe_range_fence_tree_fini(&vm->rftree[id]);
> -err_free:
> -	xe_vma_ops_fini(&vm->dummy_ops.vops);
> =C2=A0	kfree(vm);
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> @@ -1650,7 +1651,6 @@ static void vm_destroy_work_func(struct
> work_struct *w)
> =C2=A0		XE_WARN_ON(vm->pt_root[id]);
> =C2=A0
> =C2=A0	trace_xe_vm_free(vm);
> -	xe_vma_ops_fini(&vm->dummy_ops.vops);
> =C2=A0	kfree(vm);
> =C2=A0}
> =C2=A0
> @@ -2948,7 +2948,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0unwind_ops:
> =C2=A0	if (err && err !=3D -ENODATA)
> =C2=A0		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> -	xe_vma_ops_fini(&vops);
> +	xe_vma_ops_free(&vops);
> =C2=A0	for (i =3D args->num_binds - 1; i >=3D 0; --i)
> =C2=A0		if (ops[i])
> =C2=A0			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b8134804fce9..58e7490f7401 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -262,8 +262,9 @@ static inline struct dma_resv *xe_vm_resv(struct
> xe_vm *vm)
> =C2=A0 */
> =C2=A0#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
> =C2=A0
> -void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma
> *vma,
> -				 u8 tile_mask);
> +int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma
> *vma,
> +				u8 tile_mask);
> +void xe_vma_ops_free(struct xe_vma_ops *vops);
> =C2=A0struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct
> xe_vma_ops *vops);
> =C2=A0
> =C2=A0void xe_vm_kill(struct xe_vm *vm, bool unlocked);

