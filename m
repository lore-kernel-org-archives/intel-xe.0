Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67B6C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06EC10E134;
	Thu,  5 Jun 2025 15:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccZuGCPU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A2B10E134
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749138252; x=1780674252;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E8qq8gwlArt+y7T6ARxJdV2ckUjFZYqyydZ7n6wy+L0=;
 b=ccZuGCPU3T5/v/7R0ld3EwDgOLACYHsHlFLRKQZe6mtYA/NkuiJOYgCK
 2q2wfkD/7N3QdwdUUn6b8SGENMs4iJ5cfzf5J8NVlPur3yZhMi2dB2h5S
 w3HISvuCZSbyxgkhcGycfJ8jPV/J1yFu2dq4APqYu/XYOSTob4cYwsewJ
 eomzQt0fIOQf8ayF2EwH1iNzhUuUuFSAh+VC6PIqiu49bZzVib4yx8EBt
 AkWyz5oSsHfWgVTyK9lp72utql6Xat+3KuVa5Lgd5JKjg0i1iayOSWC23
 o5GNvBSc2yyU+mKiO1scbDto+SW0Uuf6AG94O6RzJivKAhHUH+KZK2uuE w==;
X-CSE-ConnectionGUID: jb5/aABtTC6Zo36l5ASYoA==
X-CSE-MsgGUID: EM5hGqaoThKatOVOJjX9lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51121801"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51121801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:44:11 -0700
X-CSE-ConnectionGUID: VP4zXMM/TiS9qe7it0bh3w==
X-CSE-MsgGUID: ZH9fFCZyRSav7awTFAp9LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150374664"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.59])
 ([10.245.244.59])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:44:10 -0700
Message-ID: <76e0599da375cb378ff74ef4f34d45c64c4066be.camel@linux.intel.com>
Subject: Re: [PATCH 03/15] drm/xe: CPU binds for jobs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, himal.prasad.ghimiray@intel.com
Date: Thu, 05 Jun 2025 17:44:07 +0200
In-Reply-To: <20250605153223.2789122-4-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
 <20250605153223.2789122-4-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi, Matt,

An early comment:

Previous concerns have also included:

1) If clearing and binding happens on the same exec_queue, GPU binding
is actually likely to be faster, right since it can be queued without
waiting for additional dependencies? Do we have any timings from start-
of-clear to support or debunk this argument.

2) Is page-tables in unmappable VRAM something we'd want to support at
some point.

Thanks,
Thomas


On Thu, 2025-06-05 at 08:32 -0700, Matthew Brost wrote:
> No reason to use the GPU for binds. In run_job, use the CPU to
> perform
> binds once the bind job's dependencies are resolved.
>=20
> Benefits of CPU-based binds:
> - Lower latency once dependencies are resolved, as there is no
> =C2=A0 interaction with the GuC or a hardware context switch both of whic=
h
> =C2=A0 are relatively slow.
> - Large arrays of binds do not risk running out of migration PTEs,
> =C2=A0 avoiding -ENOBUFS being returned to userspace.
> - Kernel binds are decoupled from the migration exec queue (which
> issues
> =C2=A0 copies and clears), so they cannot get stuck behind unrelated
> =C2=A0 jobs=E2=80=94this can be a problem with parallel GPU faults.
> - Enables ULLS on the migration exec queue, as this queue has
> exclusive
> =C2=A0 access to the paging copy engine.
>=20
> The basic idea of the implementation is to store the VM page table
> update operations (struct xe_vm_pgtable_update_op *pt_op) and
> additional
> arguments for the migrate layer=E2=80=99s CPU PTE update function in a jo=
b.
> The
> submission backend can then call into the migrate layer using the CPU
> to
> write the PTEs and free the stored resources for the PTE update.
>=20
> PT job submission is implemented in the GuC backend for simplicity. A
> follow-up could introduce a specific backend for PT jobs.
>=20
> All code related to GPU-based binding has been removed.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 -
> =C2=A0drivers/gpu/drm/xe/xe_drm_client.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 36 +++-
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 251 +++-------------------
> --
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 188 ++++++++++++++----
> =C2=A0drivers/gpu/drm/xe/xe_pt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/xe/xe_pt_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 29 ++-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 78 +++++---
> =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h |=C2=A0 31 ++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46 ++---
> =C2=A013 files changed, 341 insertions(+), 350 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61d208c85281..7aa598b584d2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3033,8 +3033,13 @@ void xe_bo_put_commit(struct llist_head
> *deferred)
> =C2=A0	if (!freed)
> =C2=A0		return;
> =C2=A0
> -	llist_for_each_entry_safe(bo, next, freed, freed)
> +	llist_for_each_entry_safe(bo, next, freed, freed) {
> +		struct xe_vm *vm =3D bo->vm;
> +
> =C2=A0		drm_gem_object_free(&bo->ttm.base.refcount);
> +		if (bo->flags & XE_BO_FLAG_PUT_VM_ASYNC)
> +			xe_vm_put(vm);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_bo_dev_work_func(struct work_struct *work)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 02ada1fb8a23..967b1fe92560 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -46,6 +46,7 @@
> =C2=A0#define XE_BO_FLAG_GGTT2		BIT(22)
> =C2=A0#define XE_BO_FLAG_GGTT3		BIT(23)
> =C2=A0#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
> +#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(25)
> =C2=A0
> =C2=A0/* this one is trigger internally only */
> =C2=A0#define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> @@ -319,6 +320,7 @@ void __xe_bo_release_dummy(struct kref *kref);
> =C2=A0 * @bo: The bo to put.
> =C2=A0 * @deferred: List to which to add the buffer object if we cannot
> put, or
> =C2=A0 * NULL if the function is to put unconditionally.
> + * @added: BO was added to deferred list
> =C2=A0 *
> =C2=A0 * Since the final freeing of an object includes both sleeping and
> (!)
> =C2=A0 * memory allocation in the dma_resv individualization, it's not ok
> @@ -338,7 +340,8 @@ void __xe_bo_release_dummy(struct kref *kref);
> =C2=A0 * false otherwise.
> =C2=A0 */
> =C2=A0static inline bool
> -xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
> +xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
> +		=C2=A0=C2=A0 bool *added)
> =C2=A0{
> =C2=A0	if (!deferred) {
> =C2=A0		xe_bo_put(bo);
> @@ -348,6 +351,7 @@ xe_bo_put_deferred(struct xe_bo *bo, struct
> llist_head *deferred)
> =C2=A0	if (!kref_put(&bo->ttm.base.refcount,
> __xe_bo_release_dummy))
> =C2=A0		return false;
> =C2=A0
> +	*added =3D true;
> =C2=A0	return llist_add(&bo->freed, deferred);
> =C2=A0}
> =C2=A0
> @@ -363,8 +367,9 @@ static inline void
> =C2=A0xe_bo_put_async(struct xe_bo *bo)
> =C2=A0{
> =C2=A0	struct xe_bo_dev *bo_device =3D &xe_bo_device(bo)->bo_device;
> +	bool added =3D false;
> =C2=A0
> -	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> +	if (xe_bo_put_deferred(bo, &bo_device->async_list, &added))
> =C2=A0		schedule_work(&bo_device->async_free);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..ecf42a04640a 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -70,8 +70,6 @@ struct xe_bo {
> =C2=A0
> =C2=A0	/** @freed: List node for delayed put. */
> =C2=A0	struct llist_node freed;
> -	/** @update_index: Update index if PT BO */
> -	int update_index;
> =C2=A0	/** @created: Whether the bo has passed initial creation */
> =C2=A0	bool created;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
> b/drivers/gpu/drm/xe/xe_drm_client.c
> index 31f688e953d7..6f5a91ef7491 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -200,6 +200,7 @@ static void show_meminfo(struct drm_printer *p,
> struct drm_file *file)
> =C2=A0	LLIST_HEAD(deferred);
> =C2=A0	unsigned int id;
> =C2=A0	u32 mem_type;
> +	bool added =3D false;
> =C2=A0
> =C2=A0	client =3D xef->client;
> =C2=A0
> @@ -246,7 +247,7 @@ static void show_meminfo(struct drm_printer *p,
> struct drm_file *file)
> =C2=A0			xe_assert(xef->xe, !list_empty(&bo-
> >client_link));
> =C2=A0		}
> =C2=A0
> -		xe_bo_put_deferred(bo, &deferred);
> +		xe_bo_put_deferred(bo, &deferred, &added);
> =C2=A0	}
> =C2=A0	spin_unlock(&client->bos_lock);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 2b61d017eeca..551cd21a6465 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -19,6 +19,7 @@
> =C2=A0#include "abi/guc_klvs_abi.h"
> =C2=A0#include "regs/xe_lrc_layout.h"
> =C2=A0#include "xe_assert.h"
> +#include "xe_bo.h"
> =C2=A0#include "xe_devcoredump.h"
> =C2=A0#include "xe_device.h"
> =C2=A0#include "xe_exec_queue.h"
> @@ -38,8 +39,10 @@
> =C2=A0#include "xe_lrc.h"
> =C2=A0#include "xe_macros.h"
> =C2=A0#include "xe_map.h"
> +#include "xe_migrate.h"
> =C2=A0#include "xe_mocs.h"
> =C2=A0#include "xe_pm.h"
> +#include "xe_pt.h"
> =C2=A0#include "xe_ring_ops_types.h"
> =C2=A0#include "xe_sched_job.h"
> =C2=A0#include "xe_trace.h"
> @@ -745,6 +748,20 @@ static void submit_exec_queue(struct
> xe_exec_queue *q)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static bool is_pt_job(struct xe_sched_job *job)
> +{
> +	return job->is_pt_job;
> +}
> +
> +static void run_pt_job(struct xe_sched_job *job)
> +{
> +	__xe_migrate_update_pgtables_cpu(job->pt_update[0].vm,
> +					 job->pt_update[0].tile,
> +					 job->pt_update[0].ops,
> +					 job-
> >pt_update[0].pt_job_ops->ops,
> +					 job-
> >pt_update[0].pt_job_ops->current_op);
> +}
> +
> =C2=A0static struct dma_fence *
> =C2=A0guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> =C2=A0{
> @@ -760,14 +777,21 @@ guc_exec_queue_run_job(struct drm_sched_job
> *drm_job)
> =C2=A0	trace_xe_sched_job_run(job);
> =C2=A0
> =C2=A0	if (!exec_queue_killed_or_banned_or_wedged(q) &&
> !xe_sched_job_is_error(job)) {
> -		if (!exec_queue_registered(q))
> -			register_exec_queue(q);
> -		if (!lr)	/* LR jobs are emitted in the exec
> IOCTL */
> -			q->ring_ops->emit_job(job);
> -		submit_exec_queue(q);
> +		if (is_pt_job(job)) {
> +			run_pt_job(job);
> +		} else {
> +			if (!exec_queue_registered(q))
> +				register_exec_queue(q);
> +			if (!lr)	/* LR jobs are emitted in
> the exec IOCTL */
> +				q->ring_ops->emit_job(job);
> +			submit_exec_queue(q);
> +		}
> =C2=A0	}
> =C2=A0
> -	if (lr) {
> +	if (is_pt_job(job)) {
> +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> +		dma_fence_put(job->fence);	/* Drop ref from
> xe_sched_job_arm */
> +	} else if (lr) {
> =C2=A0		xe_sched_job_set_error(job, -EOPNOTSUPP);
> =C2=A0		dma_fence_put(job->fence);	/* Drop ref from
> xe_sched_job_arm */
> =C2=A0	} else {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 9084f5cbc02d..e444f3fae97c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -58,18 +58,12 @@ struct xe_migrate {
> =C2=A0	 * Protected by @job_mutex.
> =C2=A0	 */
> =C2=A0	struct dma_fence *fence;
> -	/**
> -	 * @vm_update_sa: For integrated, used to suballocate page-
> tables
> -	 * out of the pt_bo.
> -	 */
> -	struct drm_suballoc_manager vm_update_sa;
> =C2=A0	/** @min_chunk_size: For dgfx, Minimum chunk size */
> =C2=A0	u64 min_chunk_size;
> =C2=A0};
> =C2=A0
> =C2=A0#define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> =C2=A0#define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
> (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
> -#define NUM_KERNEL_PDE 15
> =C2=A0#define NUM_PT_SLOTS 32
> =C2=A0#define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> =C2=A0#define MAX_NUM_PTE 512
> @@ -107,7 +101,6 @@ static void xe_migrate_fini(void *arg)
> =C2=A0
> =C2=A0	dma_fence_put(m->fence);
> =C2=A0	xe_bo_put(m->pt_bo);
> -	drm_suballoc_manager_fini(&m->vm_update_sa);
> =C2=A0	mutex_destroy(&m->job_mutex);
> =C2=A0	xe_vm_close_and_put(m->q->vm);
> =C2=A0	xe_exec_queue_put(m->q);
> @@ -199,8 +192,6 @@ static int xe_migrate_prepare_vm(struct xe_tile
> *tile, struct xe_migrate *m,
> =C2=A0	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> =C2=A0	/* Must be a multiple of 64K to support all platforms */
> =C2=A0	BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
> -	/* And one slot reserved for the 4KiB page table updates */
> -	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
> =C2=A0
> =C2=A0	/* Need to be sure everything fits in the first PT, or
> create more */
> =C2=A0	xe_tile_assert(tile, m->batch_base_ofs + batch->size <
> SZ_2M);
> @@ -333,8 +324,6 @@ static int xe_migrate_prepare_vm(struct xe_tile
> *tile, struct xe_migrate *m,
> =C2=A0	/*
> =C2=A0	 * Example layout created above, with root level =3D 3:
> =C2=A0	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> -	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> -	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
> =C2=A0	 * [PT27 =3D PDE 0] [PT28 =3D PDE 1] [PT29 =3D PDE 2] [PT30 & PT31
> =3D 2M vram identity map]
> =C2=A0	 *
> =C2=A0	 * This makes the lowest part of the VM point to the
> pagetables.
> @@ -342,19 +331,10 @@ static int xe_migrate_prepare_vm(struct xe_tile
> *tile, struct xe_migrate *m,
> =C2=A0	 * and flushes, other parts of the VM can be used either for
> copying and
> =C2=A0	 * clearing.
> =C2=A0	 *
> -	 * For performance, the kernel reserves PDE's, so about 20
> are left
> -	 * for async VM updates.
> -	 *
> =C2=A0	 * To make it easier to work, each scratch PT is put in slot
> (1 + PT #)
> =C2=A0	 * everywhere, this allows lockless updates to scratch pages
> by using
> =C2=A0	 * the different addresses in VM.
> =C2=A0	 */
> -#define NUM_VMUSA_UNIT_PER_PAGE	32
> -#define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE /
> NUM_VMUSA_UNIT_PER_PAGE)
> -#define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE /
> sizeof(u64))
> -	drm_suballoc_manager_init(&m->vm_update_sa,
> -				=C2=A0 (size_t)(map_ofs / XE_PAGE_SIZE -
> NUM_KERNEL_PDE) *
> -				=C2=A0 NUM_VMUSA_UNIT_PER_PAGE, 0);
> =C2=A0
> =C2=A0	m->pt_bo =3D bo;
> =C2=A0	return 0;
> @@ -1193,56 +1173,6 @@ struct dma_fence *xe_migrate_clear(struct
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
> XE_PAGE_SIZE), false);
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
> @@ -1258,7 +1188,18 @@ struct migrate_test_params {
> =C2=A0	container_of(_priv, struct migrate_test_params, base)
> =C2=A0#endif
> =C2=A0
> -static void
> +/**
> + * __xe_migrate_update_pgtables_cpu() - Update a VM's PTEs via the
> CPU
> + * @vm: The VM being updated
> + * @tile: The tile being updated
> + * @ops: The migrate PT update ops
> + * @pt_ops: The VM PT update ops
> + * @num_ops: The number of The VM PT update ops
> + *
> + * Execute the VM PT update ops array which results in a VM's PTEs
> being updated
> + * via the CPU.
> + */
> +void
> =C2=A0__xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile
> *tile,
> =C2=A0				 const struct
> xe_migrate_pt_update_ops *ops,
> =C2=A0				 struct xe_vm_pgtable_update_op
> *pt_op,
> @@ -1314,7 +1255,7 @@ xe_migrate_update_pgtables_cpu(struct
> xe_migrate *m,
> =C2=A0	}
> =C2=A0
> =C2=A0	__xe_migrate_update_pgtables_cpu(vm, m->tile, ops,
> -					 pt_update_ops->ops,
> +					 pt_update_ops->pt_job_ops-
> >ops,
> =C2=A0					 pt_update_ops->num_ops);
> =C2=A0
> =C2=A0	return dma_fence_get_stub();
> @@ -1327,161 +1268,19 @@ __xe_migrate_update_pgtables(struct
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
> DIV_ROUND_UP(updates[j].qwords,
> -						=C2=A0=C2=A0=C2=A0
> MAX_PTE_PER_SDI);
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
> -		batch_size +=3D 6 * (num_updates / MAX_PTE_PER_SDI +
> 1) +
> -			num_updates * 2;
> -
> -	bb =3D xe_bb_new(gt, batch_size, usm);
> -	if (IS_ERR(bb))
> -		return ERR_CAST(bb);
> -
> -	/* For sysmem PTE's, need to map them in our hole.. */
> -	if (!IS_DGFX(xe)) {
> -		u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
> -		u32 ptes, ofs;
> -
> -		ppgtt_ofs =3D NUM_KERNEL_PDE - 1;
> -		if (!is_migrate) {
> -			u32 num_units =3D DIV_ROUND_UP(num_updates,
> -						=C2=A0=C2=A0=C2=A0=C2=A0
> NUM_VMUSA_WRITES_PER_UNIT);
> -
> -			if (num_units > m->vm_update_sa.size) {
> -				err =3D -ENOBUFS;
> -				goto err_bb;
> -			}
> -			sa_bo =3D drm_suballoc_new(&m->vm_update_sa,
> num_units,
> -						 GFP_KERNEL, true,
> 0);
> -			if (IS_ERR(sa_bo)) {
> -				err =3D PTR_ERR(sa_bo);
> -				goto err_bb;
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
> -		i =3D 0;
> -		j =3D 0;
> -		ptes =3D num_updates;
> -		ofs =3D ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> -		while (ptes) {
> -			u32 chunk =3D min(MAX_PTE_PER_SDI, ptes);
> -			u32 idx =3D 0;
> -
> -			bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> -				MI_SDI_NUM_QW(chunk);
> -			bb->cs[bb->len++] =3D ofs;
> -			bb->cs[bb->len++] =3D 0; /* upper_32_bits */
> -
> -			for (; i < pt_update_ops->num_ops; ++i) {
> -				struct xe_vm_pgtable_update_op
> *pt_op =3D
> -					&pt_update_ops->ops[i];
> -				struct xe_vm_pgtable_update *updates
> =3D pt_op->entries;
> -
> -				for (; j < pt_op->num_entries; ++j,
> ++current_update, ++idx) {
> -					struct xe_vm *vm =3D
> pt_update->vops->vm;
> -					struct xe_bo *pt_bo =3D
> updates[j].pt_bo;
> -
> -					if (idx =3D=3D chunk)
> -						goto next_cmd;
> -
> -					xe_tile_assert(tile, pt_bo-
> >size =3D=3D SZ_4K);
> -
> -					/* Map a PT at most once */
> -					if (pt_bo->update_index < 0)
> -						pt_bo->update_index
> =3D current_update;
> -
> -					addr =3D vm->pt_ops-
> >pte_encode_bo(pt_bo, 0,
> -
> 									 pat_index, 0);
> -					bb->cs[bb->len++] =3D
> lower_32_bits(addr);
> -					bb->cs[bb->len++] =3D
> upper_32_bits(addr);
> -				}
> -
> -				j =3D 0;
> -			}
> -
> -next_cmd:
> -			ptes -=3D chunk;
> -			ofs +=3D chunk * sizeof(u64);
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
> -	job =3D xe_bb_create_migration_job(pt_update_ops->q, bb,
> -					 xe_migrate_batch_base(m,
> usm),
> -					 update_idx);
> +	job =3D xe_sched_job_create(pt_update_ops->q, NULL);
> =C2=A0	if (IS_ERR(job)) {
> =C2=A0		err =3D PTR_ERR(job);
> -		goto err_sa;
> +		goto err_out;
> =C2=A0	}
> =C2=A0
> +	xe_tile_assert(tile, job->is_pt_job);
> +
> =C2=A0	if (ops->pre_commit) {
> =C2=A0		pt_update->job =3D job;
> =C2=A0		err =3D ops->pre_commit(pt_update);
> @@ -1491,6 +1290,12 @@ __xe_migrate_update_pgtables(struct xe_migrate
> *m,
> =C2=A0	if (is_migrate)
> =C2=A0		mutex_lock(&m->job_mutex);
> =C2=A0
> +	job->pt_update[0].vm =3D pt_update->vops->vm;
> +	job->pt_update[0].tile =3D tile;
> +	job->pt_update[0].ops =3D ops;
> +	job->pt_update[0].pt_job_ops =3D
> +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> +
> =C2=A0	xe_sched_job_arm(job);
> =C2=A0	fence =3D dma_fence_get(&job->drm.s_fence->finished);
> =C2=A0	xe_sched_job_push(job);
> @@ -1498,17 +1303,11 @@ __xe_migrate_update_pgtables(struct
> xe_migrate *m,
> =C2=A0	if (is_migrate)
> =C2=A0		mutex_unlock(&m->job_mutex);
> =C2=A0
> -	xe_bb_free(bb, fence);
> -	drm_suballoc_free(sa_bo, fence);
> -
> =C2=A0	return fence;
> =C2=A0
> =C2=A0err_job:
> =C2=A0	xe_sched_job_put(job);
> -err_sa:
> -	drm_suballoc_free(sa_bo, NULL);
> -err_bb:
> -	xe_bb_free(bb, NULL);
> +err_out:
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index b064455b604e..0986ffdd8d9a 100644
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
> @@ -125,6 +126,11 @@ struct dma_fence *xe_migrate_clear(struct
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
> index db1c363a65d5..1ad31f444b79 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -200,7 +200,9 @@ unsigned int xe_pt_shift(unsigned int level)
> =C2=A0 * and finally frees @pt. TODO: Can we remove the @flags argument?
> =C2=A0 */
> =C2=A0void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head
> *deferred)
> +
> =C2=A0{
> +	bool added =3D false;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	if (!pt)
> @@ -208,7 +210,18 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> struct llist_head *deferred)
> =C2=A0
> =C2=A0	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
> =C2=A0	xe_bo_unpin(pt->bo);
> -	xe_bo_put_deferred(pt->bo, deferred);
> +	xe_bo_put_deferred(pt->bo, deferred, &added);
> +	if (added) {
> +		/*
> +		 * We need the VM present until the BO is destroyed
> as it shares
> +		 * a dma-resv and BO destroy is async. Reinit BO
> refcount so
> +		 * xe_bo_put_async can be used when the PT job ops
> refcount goes
> +		 * to zero.
> +		 */
> +		xe_vm_get(pt->bo->vm);
> +		pt->bo->flags |=3D XE_BO_FLAG_PUT_VM_ASYNC;
> +		kref_init(&pt->bo->ttm.base.refcount);
> +	}
> =C2=A0
> =C2=A0	if (pt->level > 0 && pt->num_live) {
> =C2=A0		struct xe_pt_dir *pt_dir =3D as_xe_pt_dir(pt);
> @@ -361,7 +374,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd,
> struct xe_pt *parent,
> =C2=A0	entry->pt =3D parent;
> =C2=A0	entry->flags =3D 0;
> =C2=A0	entry->qwords =3D 0;
> -	entry->pt_bo->update_index =3D -1;
> +	entry->level =3D parent->level;
> =C2=A0
> =C2=A0	if (alloc_entries) {
> =C2=A0		entry->pt_entries =3D kmalloc_array(XE_PDES,
> @@ -1739,7 +1752,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm
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
> @@ -1805,13 +1818,20 @@ xe_pt_commit_prepare_unbind(struct xe_vma
> *vma,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static struct xe_vm_pgtable_update_op *
> +to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32
> current_op)
> +{
> +	return &pt_update_ops->pt_job_ops->ops[current_op];
> +}
> +
> =C2=A0static void
> =C2=A0xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> =C2=A0				 u64 start, u64 end)
> =C2=A0{
> =C2=A0	u64 last;
> -	u32 current_op =3D pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	u32 current_op =3D pt_update_ops->pt_job_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D
> +		to_pt_op(pt_update_ops, current_op);
> =C2=A0	int i, level =3D 0;
> =C2=A0
> =C2=A0	for (i =3D 0; i < pt_op->num_entries; i++) {
> @@ -1846,8 +1866,9 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> =C2=A0			=C2=A0=C2=A0 struct xe_vma *vma, bool
> invalidate_on_bind)
> =C2=A0{
> -	u32 current_op =3D pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	u32 current_op =3D pt_update_ops->pt_job_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D
> +		to_pt_op(pt_update_ops, current_op);
> =C2=A0	int err;
> =C2=A0
> =C2=A0	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> @@ -1876,7 +1897,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0		xe_pt_update_ops_rfence_interval(pt_update_ops,
> =C2=A0						 xe_vma_start(vma),
> =C2=A0						 xe_vma_end(vma));
> -		++pt_update_ops->current_op;
> +		++pt_update_ops->pt_job_ops->current_op;
> =C2=A0		pt_update_ops->needs_userptr_lock |=3D
> xe_vma_is_userptr(vma);
> =C2=A0
> =C2=A0		/*
> @@ -1913,8 +1934,9 @@ static int bind_range_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma, struct
> xe_svm_range *range)
> =C2=A0{
> -	u32 current_op =3D pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	u32 current_op =3D pt_update_ops->pt_job_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D
> +		to_pt_op(pt_update_ops, current_op);
> =C2=A0	int err;
> =C2=A0
> =C2=A0	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
> @@ -1938,7 +1960,7 @@ static int bind_range_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0		xe_pt_update_ops_rfence_interval(pt_update_ops,
> =C2=A0						 range-
> >base.itree.start,
> =C2=A0						 range-
> >base.itree.last + 1);
> -		++pt_update_ops->current_op;
> +		++pt_update_ops->pt_job_ops->current_op;
> =C2=A0		pt_update_ops->needs_svm_lock =3D true;
> =C2=A0
> =C2=A0		pt_op->vma =3D vma;
> @@ -1955,8 +1977,9 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma)
> =C2=A0{
> -	u32 current_op =3D pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	u32 current_op =3D pt_update_ops->pt_job_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D
> +		to_pt_op(pt_update_ops, current_op);
> =C2=A0	int err;
> =C2=A0
> =C2=A0	if (!((vma->tile_present | vma->tile_staged) & BIT(tile-
> >id)))
> @@ -1984,7 +2007,7 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0				pt_op->num_entries, false);
> =C2=A0	xe_pt_update_ops_rfence_interval(pt_update_ops,
> xe_vma_start(vma),
> =C2=A0					 xe_vma_end(vma));
> -	++pt_update_ops->current_op;
> +	++pt_update_ops->pt_job_ops->current_op;
> =C2=A0	pt_update_ops->needs_userptr_lock |=3D xe_vma_is_userptr(vma);
> =C2=A0	pt_update_ops->needs_invalidation =3D true;
> =C2=A0
> @@ -1998,8 +2021,9 @@ static int unbind_range_prepare(struct xe_vm
> *vm,
> =C2=A0				struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> =C2=A0				struct xe_svm_range *range)
> =C2=A0{
> -	u32 current_op =3D pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	u32 current_op =3D pt_update_ops->pt_job_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D
> +		to_pt_op(pt_update_ops, current_op);
> =C2=A0
> =C2=A0	if (!(range->tile_present & BIT(tile->id)))
> =C2=A0		return 0;
> @@ -2019,7 +2043,7 @@ static int unbind_range_prepare(struct xe_vm
> *vm,
> =C2=A0				pt_op->num_entries, false);
> =C2=A0	xe_pt_update_ops_rfence_interval(pt_update_ops, range-
> >base.itree.start,
> =C2=A0					 range->base.itree.last +
> 1);
> -	++pt_update_ops->current_op;
> +	++pt_update_ops->pt_job_ops->current_op;
> =C2=A0	pt_update_ops->needs_svm_lock =3D true;
> =C2=A0	pt_update_ops->needs_invalidation =3D true;
> =C2=A0
> @@ -2122,7 +2146,6 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0static void
> =C2=A0xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops
> *pt_update_ops)
> =C2=A0{
> -	init_llist_head(&pt_update_ops->deferred);
> =C2=A0	pt_update_ops->start =3D ~0x0ull;
> =C2=A0	pt_update_ops->last =3D 0x0ull;
> =C2=A0}
> @@ -2163,7 +2186,7 @@ int xe_pt_update_ops_prepare(struct xe_tile
> *tile, struct xe_vma_ops *vops)
> =C2=A0			return err;
> =C2=A0	}
> =C2=A0
> -	xe_tile_assert(tile, pt_update_ops->current_op <=3D
> +	xe_tile_assert(tile, pt_update_ops->pt_job_ops->current_op
> <=3D
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_update_ops->num_ops);
> =C2=A0
> =C2=A0#ifdef TEST_VM_OPS_ERROR
> @@ -2396,7 +2419,7 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0	lockdep_assert_held(&vm->lock);
> =C2=A0	xe_vm_assert_held(vm);
> =C2=A0
> -	if (!pt_update_ops->current_op) {
> +	if (!pt_update_ops->pt_job_ops->current_op) {
> =C2=A0		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
> =C2=A0
> =C2=A0		return dma_fence_get_stub();
> @@ -2445,12 +2468,16 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0		goto free_rfence;
> =C2=A0	}
> =C2=A0
> -	/* Point of no return - VM killed if failure after this */
> -	for (i =3D 0; i < pt_update_ops->current_op; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op =3D
> &pt_update_ops->ops[i];
> +	/*
> +	 * Point of no return - VM killed if failure after this
> +	 */
> +	for (i =3D 0; i < pt_update_ops->pt_job_ops->current_op; ++i)
> {
> +		struct xe_vm_pgtable_update_op *pt_op =3D
> +			to_pt_op(pt_update_ops, i);
> =C2=A0
> =C2=A0		xe_pt_commit(pt_op->vma, pt_op->entries,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 pt_op->num_entries, &pt_update_ops-
> >deferred);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 pt_op->num_entries,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 &pt_update_ops->pt_job_ops->deferred);
> =C2=A0		pt_op->vma =3D NULL;	/* skip in
> xe_pt_update_ops_abort */
> =C2=A0	}
> =C2=A0
> @@ -2530,27 +2557,19 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
> =C2=A0
> =C2=A0/**
> - * xe_pt_update_ops_fini() - Finish PT update operations
> - * @tile: Tile of PT update operations
> - * @vops: VMA operations
> + * xe_pt_update_ops_free() - Free PT update operations
> + * @pt_op: Array of PT update operations
> + * @num_ops: Number of PT update operations
> =C2=A0 *
> - * Finish PT update operations by committing to destroy page table
> memory
> + * Free PT update operations
> =C2=A0 */
> -void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops
> *vops)
> +static void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op
> *pt_op,
> +				=C2=A0 u32 num_ops)
> =C2=A0{
> -	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> -		&vops->pt_update_ops[tile->id];
> -	int i;
> -
> -	lockdep_assert_held(&vops->vm->lock);
> -	xe_vm_assert_held(vops->vm);
> -
> -	for (i =3D 0; i < pt_update_ops->current_op; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op =3D
> &pt_update_ops->ops[i];
> +	u32 i;
> =C2=A0
> +	for (i =3D 0; i < num_ops; ++i, ++pt_op)
> =C2=A0		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> -	}
> -	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -2571,9 +2590,9 @@ void xe_pt_update_ops_abort(struct xe_tile
> *tile, struct xe_vma_ops *vops)
> =C2=A0
> =C2=A0	for (i =3D pt_update_ops->num_ops - 1; i >=3D 0; --i) {
> =C2=A0		struct xe_vm_pgtable_update_op *pt_op =3D
> -			&pt_update_ops->ops[i];
> +			to_pt_op(pt_update_ops, i);
> =C2=A0
> -		if (!pt_op->vma || i >=3D pt_update_ops->current_op)
> +		if (!pt_op->vma || i >=3D pt_update_ops->pt_job_ops-
> >current_op)
> =C2=A0			continue;
> =C2=A0
> =C2=A0		if (pt_op->bind)
> @@ -2584,6 +2603,89 @@ void xe_pt_update_ops_abort(struct xe_tile
> *tile, struct xe_vma_ops *vops)
> =C2=A0			xe_pt_abort_unbind(pt_op->vma, pt_op-
> >entries,
> =C2=A0					=C2=A0=C2=A0 pt_op->num_entries);
> =C2=A0	}
> +}
> +
> +/**
> + * xe_pt_job_ops_alloc() - Allocate PT job ops
> + * @num_ops: Number of VM PT update ops
> + *
> + * Allocate PT job ops and internal array of VM PT update ops.
> + *
> + * Return: Pointer to PT job ops or NULL
> + */
> +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops)
> +{
> +	struct xe_pt_job_ops *pt_job_ops;
> +
> +	pt_job_ops =3D kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);
> +	if (!pt_job_ops)
> +		return NULL;
> +
> +	pt_job_ops->ops =3D kvmalloc_array(num_ops,
> sizeof(*pt_job_ops->ops),
> +					 GFP_KERNEL);
> +	if (!pt_job_ops->ops) {
> +		kvfree(pt_job_ops);
> +		return NULL;
> +	}
> +
> +	pt_job_ops->current_op =3D 0;
> +	kref_init(&pt_job_ops->refcount);
> +	init_llist_head(&pt_job_ops->deferred);
> +
> +	return pt_job_ops;
> +}
> +
> +/**
> + * xe_pt_job_ops_get() - Get PT job ops
> + * @pt_job_ops: PT job ops to get
> + *
> + * Take a reference to PT job ops
> + *
> + * Return: Pointer to PT job ops or NULL
> + */
> +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops
> *pt_job_ops)
> +{
> +	if (pt_job_ops)
> +		kref_get(&pt_job_ops->refcount);
> +
> +	return pt_job_ops;
> +}
> +
> +static void xe_pt_job_ops_destroy(struct kref *ref)
> +{
> +	struct xe_pt_job_ops *pt_job_ops =3D
> +		container_of(ref, struct xe_pt_job_ops, refcount);
> +	struct llist_node *freed;
> +	struct xe_bo *bo, *next;
> +
> +	xe_pt_update_ops_free(pt_job_ops->ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_job_ops->current_op);
> +
> +	freed =3D llist_del_all(&pt_job_ops->deferred);
> +	if (freed) {
> +		llist_for_each_entry_safe(bo, next, freed, freed)
> +			/*
> +			 * If called from run_job, we are in the
> dma-fencing
> +			 * path and cannot take dma-resv locks so
> use an async
> +			 * put.
> +			 */
> +			xe_bo_put_async(bo);
> +	}
> +
> +	kvfree(pt_job_ops->ops);
> +	kfree(pt_job_ops);
> +}
> +
> +/**
> + * xe_pt_job_ops_put() - Put PT job ops
> + * @pt_job_ops: PT job ops to put
> + *
> + * Drop a reference to PT job ops
> + */
> +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops)
> +{
> +	if (!pt_job_ops)
> +		return;
> =C2=A0
> -	xe_pt_update_ops_fini(tile, vops);
> +	kref_put(&pt_job_ops->refcount, xe_pt_job_ops_destroy);
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 5ecf003d513c..c9904573db82 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -41,11 +41,14 @@ void xe_pt_clear(struct xe_device *xe, struct
> xe_pt *pt);
> =C2=A0int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_op=
s
> *vops);
> =C2=A0struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma_ops *vops);
> -void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops
> *vops);
> =C2=A0void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops
> *vops);
> =C2=A0
> =C2=A0bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> =C2=A0bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> =C2=A0			=C2=A0 struct xe_svm_range *range);
> =C2=A0
> +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops);
> +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops
> *pt_job_ops);
> +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops);
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> index 69eab6f37cfe..33d0d20e0ac6 100644
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
> @@ -88,12 +91,28 @@ struct xe_vm_pgtable_update_op {
> =C2=A0	bool rebind;
> =C2=A0};
> =C2=A0
> -/** struct xe_vm_pgtable_update_ops: page table update operations */
> -struct xe_vm_pgtable_update_ops {
> -	/** @ops: operations */
> -	struct xe_vm_pgtable_update_op *ops;
> +/**
> + * struct xe_pt_job_ops: page table update operations dynamic
> allocation
> + *
> + * This is the part of struct xe_vma_ops and struct
> xe_vm_pgtable_update_ops
> + * which is dynamic allocated as it must be available until the bind
> job is
> + * complete.
> + */
> +struct xe_pt_job_ops {
> +	/** @current_op: current operations */
> +	u32 current_op;
> +	/** @refcount: ref count ops allocation */
> +	struct kref refcount;
> =C2=A0	/** @deferred: deferred list to destroy PT entries */
> =C2=A0	struct llist_head deferred;
> +	/** @ops: operations */
> +	struct xe_vm_pgtable_update_op *ops;
> +};
> +
> +/** struct xe_vm_pgtable_update_ops: page table update operations */
> +struct xe_vm_pgtable_update_ops {
> +	/** @pt_job_ops: PT update operations dynamic allocation*/
> +	struct xe_pt_job_ops *pt_job_ops;
> =C2=A0	/** @q: exec queue for PT operations */
> =C2=A0	struct xe_exec_queue *q;
> =C2=A0	/** @start: start address of ops */
> @@ -102,8 +121,6 @@ struct xe_vm_pgtable_update_ops {
> =C2=A0	u64 last;
> =C2=A0	/** @num_ops: number of operations */
> =C2=A0	u32 num_ops;
> -	/** @current_op: current operations */
> -	u32 current_op;
> =C2=A0	/** @needs_svm_lock: Needs SVM lock */
> =C2=A0	bool needs_svm_lock;
> =C2=A0	/** @needs_userptr_lock: Needs userptr lock */
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..09cdd14d9ef7 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -26,19 +26,22 @@ static struct kmem_cache
> *xe_sched_job_parallel_slab;
> =C2=A0
> =C2=A0int __init xe_sched_job_module_init(void)
> =C2=A0{
> +	struct xe_sched_job *job;
> +	size_t size;
> +
> +	size =3D struct_size(job, ptrs, 1);
> =C2=A0	xe_sched_job_slab =3D
> -		kmem_cache_create("xe_sched_job",
> -				=C2=A0 sizeof(struct xe_sched_job) +
> -				=C2=A0 sizeof(struct xe_job_ptrs), 0,
> +		kmem_cache_create("xe_sched_job", size, 0,
> =C2=A0				=C2=A0 SLAB_HWCACHE_ALIGN, NULL);
> =C2=A0	if (!xe_sched_job_slab)
> =C2=A0		return -ENOMEM;
> =C2=A0
> +	size =3D max_t(size_t,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct_size(job, ptrs,
> +				 XE_HW_ENGINE_MAX_INSTANCE),
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct_size(job, pt_update, 1));
> =C2=A0	xe_sched_job_parallel_slab =3D
> -		kmem_cache_create("xe_sched_job_parallel",
> -				=C2=A0 sizeof(struct xe_sched_job) +
> -				=C2=A0 sizeof(struct xe_job_ptrs) *
> -				=C2=A0 XE_HW_ENGINE_MAX_INSTANCE, 0,
> +		kmem_cache_create("xe_sched_job_parallel", size, 0,
> =C2=A0				=C2=A0 SLAB_HWCACHE_ALIGN, NULL);
> =C2=A0	if (!xe_sched_job_parallel_slab) {
> =C2=A0		kmem_cache_destroy(xe_sched_job_slab);
> @@ -84,7 +87,7 @@ static void xe_sched_job_free_fences(struct
> xe_sched_job *job)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> -	for (i =3D 0; i < job->q->width; ++i) {
> +	for (i =3D 0; !job->is_pt_job && i < job->q->width; ++i) {
> =C2=A0		struct xe_job_ptrs *ptrs =3D &job->ptrs[i];
> =C2=A0
> =C2=A0		if (ptrs->lrc_fence)
> @@ -118,33 +121,44 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0	if (err)
> =C2=A0		goto err_free;
> =C2=A0
> -	for (i =3D 0; i < q->width; ++i) {
> -		struct dma_fence *fence =3D
> xe_lrc_alloc_seqno_fence();
> -		struct dma_fence_chain *chain;
> -
> -		if (IS_ERR(fence)) {
> -			err =3D PTR_ERR(fence);
> -			goto err_sched_job;
> -		}
> -		job->ptrs[i].lrc_fence =3D fence;
> -
> -		if (i + 1 =3D=3D q->width)
> -			continue;
> -
> -		chain =3D dma_fence_chain_alloc();
> -		if (!chain) {
> +	if (!batch_addr) {
> +		job->fence =3D
> dma_fence_allocate_private_stub(ktime_get());
> +		if (!job->fence) {
> =C2=A0			err =3D -ENOMEM;
> =C2=A0			goto err_sched_job;
> =C2=A0		}
> -		job->ptrs[i].chain_fence =3D chain;
> +		job->is_pt_job =3D true;
> +	} else {
> +		for (i =3D 0; i < q->width; ++i) {
> +			struct dma_fence *fence =3D
> xe_lrc_alloc_seqno_fence();
> +			struct dma_fence_chain *chain;
> +
> +			if (IS_ERR(fence)) {
> +				err =3D PTR_ERR(fence);
> +				goto err_sched_job;
> +			}
> +			job->ptrs[i].lrc_fence =3D fence;
> +
> +			if (i + 1 =3D=3D q->width)
> +				continue;
> +
> +			chain =3D dma_fence_chain_alloc();
> +			if (!chain) {
> +				err =3D -ENOMEM;
> +				goto err_sched_job;
> +			}
> +			job->ptrs[i].chain_fence =3D chain;
> +		}
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
> -		job->ptrs[i].batch_addr =3D batch_addr[i];
> +		for (i =3D 0; i < width; ++i)
> +			job->ptrs[i].batch_addr =3D batch_addr[i];
> +	}
> =C2=A0
> =C2=A0	xe_pm_runtime_get_noresume(job_to_xe(job));
> =C2=A0	trace_xe_sched_job_create(job);
> @@ -243,7 +257,7 @@ bool xe_sched_job_completed(struct xe_sched_job
> *job)
> =C2=A0void xe_sched_job_arm(struct xe_sched_job *job)
> =C2=A0{
> =C2=A0	struct xe_exec_queue *q =3D job->q;
> -	struct dma_fence *fence, *prev;
> +	struct dma_fence *fence =3D job->fence, *prev;
> =C2=A0	struct xe_vm *vm =3D q->vm;
> =C2=A0	u64 seqno =3D 0;
> =C2=A0	int i;
> @@ -263,6 +277,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> =C2=A0		job->ring_ops_flush_tlb =3D true;
> =C2=A0	}
> =C2=A0
> +	if (job->is_pt_job)
> +		goto arm;
> +
> =C2=A0	/* Arm the pre-allocated fences */
> =C2=A0	for (i =3D 0; i < q->width; prev =3D fence, ++i) {
> =C2=A0		struct dma_fence_chain *chain;
> @@ -283,6 +300,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> =C2=A0		fence =3D &chain->base;
> =C2=A0	}
> =C2=A0
> +arm:
> =C2=A0	job->fence =3D dma_fence_get(fence);	/* Pairs with put in
> scheduler */
> =C2=A0	drm_sched_job_arm(&job->drm);
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index dbf260dded8d..79a459f2a0a8 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -10,10 +10,29 @@
> =C2=A0
> =C2=A0#include <drm/gpu_scheduler.h>
> =C2=A0
> -struct xe_exec_queue;
> =C2=A0struct dma_fence;
> =C2=A0struct dma_fence_chain;
> =C2=A0
> +struct xe_exec_queue;
> +struct xe_migrate_pt_update_ops;
> +struct xe_pt_job_ops;
> +struct xe_tile;
> +struct xe_vm;
> +
> +/**
> + * struct xe_pt_update_args - PT update arguments
> + */
> +struct xe_pt_update_args {
> +	/** @vm: VM */
> +	struct xe_vm *vm;
> +	/** @tile: Tile */
> +	struct xe_tile *tile;
> +	/** @ops: Migrate PT update ops */
> +	const struct xe_migrate_pt_update_ops *ops;
> +	/** @pt_job_ops: PT update ops */
> +	struct xe_pt_job_ops *pt_job_ops;
> +};
> +
> =C2=A0/**
> =C2=A0 * struct xe_job_ptrs - Per hw engine instance data
> =C2=A0 */
> @@ -58,8 +77,14 @@ struct xe_sched_job {
> =C2=A0	bool ring_ops_flush_tlb;
> =C2=A0	/** @ggtt: mapped in ggtt. */
> =C2=A0	bool ggtt;
> -	/** @ptrs: per instance pointers. */
> -	struct xe_job_ptrs ptrs[];
> +	/** @is_pt_job: is a PT job */
> +	bool is_pt_job;
> +	union {
> +		/** @ptrs: per instance pointers. */
> +		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> +		/** @pt_update: PT update arguments */
> +		DECLARE_FLEX_ARRAY(struct xe_pt_update_args,
> pt_update);
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0struct xe_sched_job_snapshot {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 18f967ce1f1a..6fc01fdd7286 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -780,6 +780,19 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
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
> +	vops->flags =3D 0;
> +}
> +
> =C2=A0static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool
> array_of_binds)
> =C2=A0{
> =C2=A0	int i;
> @@ -788,11 +801,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops
> *vops, bool array_of_binds)
> =C2=A0		if (!vops->pt_update_ops[i].num_ops)
> =C2=A0			continue;
> =C2=A0
> -		vops->pt_update_ops[i].ops =3D
> -			kmalloc_array(vops-
> >pt_update_ops[i].num_ops,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*vops-
> >pt_update_ops[i].ops),
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL |
> __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> -		if (!vops->pt_update_ops[i].ops)
> +		vops->pt_update_ops[i].pt_job_ops =3D
> +			xe_pt_job_ops_alloc(vops-
> >pt_update_ops[i].num_ops);
> +		if (!vops->pt_update_ops[i].pt_job_ops)
> =C2=A0			return array_of_binds ? -ENOBUFS : -ENOMEM;
> =C2=A0	}
> =C2=A0
> @@ -828,7 +839,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops
> *vops)
> =C2=A0	xe_vma_svm_prefetch_ops_fini(vops);
> =C2=A0
> =C2=A0	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> -		kfree(vops->pt_update_ops[i].ops);
> +		xe_pt_job_ops_put(vops-
> >pt_update_ops[i].pt_job_ops);
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops,
> u8 tile_mask, int inc_val)
> @@ -877,9 +888,6 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops
> *vops, struct xe_vma *vma,
> =C2=A0
> =C2=A0static struct dma_fence *ops_execute(struct xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma_ops *vops);
> -static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm
> *vm,
> -			=C2=A0=C2=A0=C2=A0 struct xe_exec_queue *q,
> -			=C2=A0=C2=A0=C2=A0 struct xe_sync_entry *syncs, u32
> num_syncs);
> =C2=A0
> =C2=A0int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> =C2=A0{
> @@ -3163,13 +3171,6 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
> =C2=A0		fence =3D &cf->base;
> =C2=A0	}
> =C2=A0
> -	for_each_tile(tile, vm->xe, id) {
> -		if (!vops->pt_update_ops[id].num_ops)
> -			continue;
> -
> -		xe_pt_update_ops_fini(tile, vops);
> -	}
> -
> =C2=A0	return fence;
> =C2=A0
> =C2=A0err_out:
> @@ -3447,19 +3448,6 @@ static int vm_bind_ioctl_signal_fences(struct
> xe_vm *vm,
> =C2=A0	return err;
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
> -	vops->flags =3D 0;
> -}
> -
> =C2=A0static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struc=
t
> xe_bo *bo,
> =C2=A0					u64 addr, u64 range, u64
> obj_offset,
> =C2=A0					u16 pat_index, u32 op, u32
> bind_flags)

