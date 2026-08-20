Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6D3C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 09:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25C910EF80;
	Thu, 20 Aug 2026 09:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByFHQfYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92B110EF80
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787217059; x=1818753059;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3M3y5fQhHr0Wha6VI1x89YuLe6B+HX0VY97tmgVluMM=;
 b=ByFHQfYsthkhbLK9YDgKaVsvKwiOE5vc3/1Qn1o1HsseLuDJX6vaAilH
 hOc9DxDQ/Efj15LerV1HAlClaaxiWTS8jdxF9GXFMZKAmS2sgtbMpiHvo
 9yYZzparziAPaRckEmgZfLhSR7iGKOnl+9XpR/KXtEdRaTqo3YhlJfTks
 qg1njr8MF4LCnrJIyOOG4tQbLcSUJAi4n7w/QQ4nzlml60+7lliu4yBWh
 w5spx5MoDx9/S+VRij3cn8em4ypozQ2qwwQYkrCZ4lZCShjaXLxSR354F
 XGGjkwyZ2I9EVcJNqw6svC7K0TR1ro4JxrZqkdA/OqQyrITF36iq0KUgy A==;
X-CSE-ConnectionGUID: prFPah1DQqimoItiM2ygAQ==
X-CSE-MsgGUID: UJT3gAfiTu+opoyE9lCaHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98080697"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="98080697"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 02:10:58 -0700
X-CSE-ConnectionGUID: 5ANo1euNRLOZ05aIEucX7A==
X-CSE-MsgGUID: f4yCG8HrTxmvtZoR2kJjXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="265954498"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.82])
 ([10.245.245.82])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 02:10:58 -0700
Message-ID: <de4e2add35cf2be46b99d2f15f8741fc9ef8270f.camel@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Flush L2 asynchronously in
 xe_bo_trigger_rebind()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date: Thu, 20 Aug 2026 11:10:55 +0200
In-Reply-To: <20260717193809.131394-1-matthew.brost@intel.com>
References: <20260717193809.131394-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-07-17 at 12:38 -0700, Matthew Brost wrote:
> On L2-flush-optimized HW with a dma-resv (non-fault) VM, evicting a
> BO
> only needs to flush the L2 cache before the migration copy runs; the
> mappings themselves are torn down and rebuilt lazily via
> drm_gpuvm_bo_evict() and a subsequent rebind. Today this flush is
> done
> by waiting for the BO to go idle and then issuing a synchronous TLB
> invalidation per mapping VMA from inside xe_bo_trigger_rebind(). Both
> the idle wait and the synchronous invalidation stall the calling
> thread
> while holding the BO dma-resv lock, serializing the move behind all
> in-flight GPU work on the BO.
>=20
> Replace this with an asynchronous flush. Add
> xe_vm_flush_vm_bo_tlb_async()
> which, for each VMA mapping the BO on each present tile, queues a TLB
> invalidation job on the tile migrate (kernel) exec queue. The jobs
> depend
> on the BO's in-flight GPU work, captured once as a singleton over
> DMA_RESV_USAGE_BOOKKEEP, so the flush only fires once the GPU is done
> with
> the current mapping. Each job's completion fence is installed into
> the
> BO's dma-resv as a DMA_RESV_USAGE_KERNEL fence, so the migration copy
> -
> which waits on the resv - waits on the flush without stalling this
> thread.
>=20
> No PTEs are zapped and vma->tile_invalidated is left untouched: the
> mapping stays valid until the lazy rebind, and the only work
> performed
> here is the L2 flush. On any failure the caller falls back to the
> existing blocking wait-idle plus xe_vm_invalidate_vma() path.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>=20
> ---
> v2: Less verbose comment (Thomas)
> v3: Honor no_gpu_wait (Sashiko)
> ---
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c |=C2=A0=C2=A0 8 +++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 125
> +++++++++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.h |=C2=A0=C2=A0 5 ++
> =C2=A03 files changed, 138 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1..bb9dbc592941 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -686,6 +686,14 @@ static int xe_bo_trigger_rebind(struct xe_device
> *xe, struct xe_bo *bo,
> =C2=A0			 */
> =C2=A0			if (!xe_device_is_l2_flush_optimized(xe))
> =C2=A0				continue;
> +
> +			/*
> +			 * Attempt to flush L2 async, fallback to
> sync flush on
> +			 * no_wait_gpu or faliure
> +			 */
> +			if (!ctx->no_wait_gpu &&
> +			=C2=A0=C2=A0=C2=A0 !xe_vm_flush_vm_bo_tlb_async(vm, bo,
> vm_bo))
> +				continue;

To follow the no_wait_gpu semantics, Shouldn't this be

if (!xe_vm_flush_vm_bo_tlb_async(vm, bo, vm_bo))
	continue;
else if (ctx->no_wait_gpu)
	return -EBUSY;


> =C2=A0		}
> =C2=A0
> =C2=A0		if (!idle) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 57bcf0660eb8..28223e32fd26 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -39,6 +39,7 @@
> =C2=A0#include "xe_sync.h"
> =C2=A0#include "xe_tile.h"
> =C2=A0#include "xe_tlb_inval.h"
> +#include "xe_tlb_inval_job.h"
> =C2=A0#include "xe_trace_bo.h"
> =C2=A0#include "xe_vm_madvise.h"
> =C2=A0#include "xe_wa.h"
> @@ -4432,6 +4433,130 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/*
> + * xe_vma_tlb_flush_client - Queue an async TLB flush for one VMA on
> one client
> + *
> + * Create and push a TLB invalidation job on the tile migrate
> (kernel) exec
> + * queue covering @vma's range, depending on @dep (the BO's in-
> flight GPU work)
> + * so the flush only fires once the GPU is done with the current
> mapping. The
> + * job's completion fence is installed into @resv as a KERNEL fence
> so the
> + * subsequent migration waits on the flush. No PTEs are zapped; this
> only
> + * flushes L2 via the TLB invalidation.
> + */
> +static int xe_vma_tlb_flush_client(struct xe_vm *vm, struct xe_vma
> *vma,
> +				=C2=A0=C2=A0 struct xe_tile *tile, struct
> xe_gt *gt,
> +				=C2=A0=C2=A0 struct dma_resv *resv, struct
> dma_fence *dep,
> +				=C2=A0=C2=A0 int type)
> +{
> +	struct xe_exec_queue *q =3D xe_migrate_exec_queue(tile-
> >migrate);
> +	struct xe_tlb_inval_job *job;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	job =3D xe_tlb_inval_job_create(q, &gt->tlb_inval,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q-
> >tlb_inval[type].dep_scheduler, vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_start(vma),
> xe_vma_end(vma), type);
> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	err =3D xe_tlb_inval_job_alloc_dep(job);
> +	if (err)
> +		goto out_put;
> +
> +	err =3D dma_resv_reserve_fences(resv, 1);
> +	if (err)
> +		goto out_put;
> +
> +	/* Cannot fail; consumes a ref on @dep and returns a
> referenced fence. */
> +	fence =3D xe_tlb_inval_job_push(job, tile->migrate, dep);
> +	dma_resv_add_fence(resv, fence, DMA_RESV_USAGE_KERNEL);
> +	dma_fence_put(fence);
> +
> +out_put:
> +	/* Drop the creation reference (destroys the job if it was
> not pushed). */
> +	xe_tlb_inval_job_put(job);
> +	return err;
> +}
> +
> +/**
> + * xe_vm_flush_vm_bo_tlb_async - Asynchronously flush TLBs for a
> vm_bo's mappings
> + * @vm: The VM @vm_bo belongs to
> + * @bo: The buffer object being moved
> + * @vm_bo: The gpuvm_bo linking @bo into @vm
> + *
> + * On L2-flush-optimized HW a BO move only needs to flush L2 (via a
> TLB
> + * invalidation) for the BO's live mappings; the mappings themselves
> are torn
> + * down and rebuilt lazily via the eviction/rebind path, so no PTEs
> need to be
> + * zapped here. Rather than blocking the caller on a synchronous
> invalidation,
> + * issue a TLB invalidation job per VMA per TLB-invalidation client
> (per present
> + * tile, primary and media GT). Each job waits on the BO's in-flight
> GPU work
> + * (all dma-resv usages) and its completion fence is installed into
> the BO's
> + * dma-resv KERNEL slots, so the following migration waits on the
> flush without
> + * stalling this thread.
> + *
> + * The caller must hold the BO's dma-resv lock and @vm must not be
> in fault
> + * mode.
> + *
> + * Return: 0 on success, negative error code on failure. On failure
> the caller
> + * should fall back to the blocking xe_vm_invalidate_vma() path; any
> jobs
> + * already queued install harmless extra flush fences.
> + */
> +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> +				struct drm_gpuvm_bo *vm_bo)
> +{
> +	struct xe_device *xe =3D vm->xe;
> +	struct dma_resv *resv =3D bo->ttm.base.resv;
> +	struct dma_fence *dep =3D NULL;
> +	struct drm_gpuva *gpuva;
> +	int err;
> +
> +	dma_resv_assert_held(resv);
> +	xe_assert(xe, !xe_vm_in_fault_mode(vm));
> +
> +	/*
> +	 * Single fence capturing all in-flight GPU work on the BO;
> the TLB
> +	 * invalidation jobs depend on it so the flush fires only
> once the GPU
> +	 * is done with the current mapping.
> +	 */
> +	err =3D dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP,
> &dep);
> +	if (err)
> +		return err;
> +	if (!dep)
> +		dep =3D dma_fence_get_stub();
> +
> +	drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> +		struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> +		struct xe_tile *tile;
> +		u8 id;
> +
> +		if (xe_vma_is_null(vma) ||
> xe_vma_is_cpu_addr_mirror(vma))
> +			continue;
> +
> +		for_each_tile(tile, xe, id) {
> +			if (!(vma->tile_present & BIT(id)))
> +				continue;
> +
> +			err =3D xe_vma_tlb_flush_client(vm, vma, tile,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tile-
> >primary_gt, resv, dep,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +			if (err)
> +				goto out;
> +
> +			if (tile->media_gt) {
> +				err =3D xe_vma_tlb_flush_client(vm,
> vma, tile,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tile-
> >media_gt, resv, dep,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
> +				if (err)
> +					goto out;
> +			}
> +		}
> +	}
> +
> +out:
> +	dma_fence_put(dep);
> +	return err;
> +}
> +
> =C2=A0int xe_vm_validate_protected(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	struct drm_gpuva *gpuva;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c5b900f38ded..dd5b070eaede 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -26,6 +26,8 @@ struct ttm_buffer_object;
> =C2=A0
> =C2=A0struct dma_fence;
> =C2=A0
> +struct xe_bo;
> +struct drm_gpuvm_bo;
> =C2=A0struct xe_exec_queue;
> =C2=A0struct xe_file;
> =C2=A0struct xe_pagefault;
> @@ -254,6 +256,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
> =C2=A0
> =C2=A0int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct
> xe_tlb_inval_batch *batch);
> =C2=A0
> +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> +				struct drm_gpuvm_bo *vm_bo);
> +
> =C2=A0int xe_vm_validate_protected(struct xe_vm *vm);
> =C2=A0
> =C2=A0static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
