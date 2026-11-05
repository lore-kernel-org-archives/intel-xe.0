Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4A606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EcoF+x6V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5604A10E070;
	Thu,  5 Nov 2026 16:13:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7226510E99C
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:13:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4385542E3A;
 Thu,  5 Nov 2026 16:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC1F1F000C1;
 Thu,  5 Nov 2026 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793895218;
 bh=jXVlPbuW/zUXM+i8Y1b2s2A3mzy5ts0Kre0dI2VDgCM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=EcoF+x6VM4wZIGfp5IpIhnwywXfMCQtrHbvA3D5bofc3cBl1vJfgcA4diaos3nJjZ
 5UiP63KgQ/RUOqd+hJALkOksj6BmVUwUw5JZhuVsn0rjuLVEDo2gTkxNV4vVC0aWp6
 +r4IkYP75va/SwEvczOUzA/Q/8l/AHw5aTluorjDGD7N+kPCx8Z7nyBTcZtDFnCx7+
 qkmU0PY8bgcmNVI8pp7mT9VDb5+F1aakyzRCPYvGuOltbAwXml6MCzynjOhu2de9ZI
 2kAunq9CqHhi8BHnur8pVjfHEA21o2m0zlUBfh8rrY9JWfe3X3PcKUjHShaUHu/9B8
 +v7r6I5LQg1xQ==
Message-ID: <sashiko-outbox-199454@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261104221459.1534188-1-matthew.brost@intel.com>
References: <20261104221459.1534188-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:13:37 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] drm/xe: wrong exec queue in xe_vma_tlb_flush_client() causes N=
ULL deref and race
- [High] drm/xe: missing tile offset when indexing q->tlb_inval in xe_vm_fl=
ush_vm_bo_tlb_async()
- [High] drm/xe: xe_bo_trigger_rebind() ignores ctx->no_wait_gpu when queue=
ing async TLB flush
- [High] drm/xe: GFP_KERNEL allocations in xe_vm_flush_vm_bo_tlb_async() un=
der fs_reclaim
- [Medium] drm/xe: xe_bo_move() synchronously and uninterruptibly waits on =
async TLB flush
--

commit 1eb2e98a6dad350728e769ae239024f455ba2958
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()

This commit replaces the synchronous BO idle wait and VMA TLB invalidation =
in
xe_bo_trigger_rebind() on L2-flush-optimized platforms with asynchronous TLB
invalidation jobs queued via xe_vm_flush_vm_bo_tlb_async(). Each job waits =
on
the BO's in-flight GPU work and installs its completion fence into the BO's
dma-resv object with DMA_RESV_USAGE_KERNEL.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a0..0ffe4cc46b3b3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -809,6 +809,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe,=
 struct xe_bo *bo,
>  			 */
>  			if (!xe_device_is_l2_flush_optimized(xe))
>  				continue;
> +
> +			if (!xe_vm_flush_vm_bo_tlb_async(vm, bo, vm_bo))
> +				continue;

[Severity: High]
How does calling xe_vm_flush_vm_bo_tlb_async() before the ctx->no_wait_gpu
check interact with non-blocking callers such as the shrinker?

In the shrinker path, xe_shrinker_walk() runs its first pass with
ctx->no_wait_gpu =3D true (and in direct reclaim where
ttm_bo_shrink_avoid_wait() is true, ctx.no_wait_gpu remains true for the
entire shrinker invocation). For an already-idle purgeable BO in XE_PL_TT,
ttm_bo_shrink_suitable() succeeds because bo->base.resv is signaled, and
xe_bo_shrink() runs:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
	if (xe_tt->purgeable) {
		if (bo->resource->mem_type !=3D XE_PL_SYSTEM)
			lret =3D xe_bo_move_notify(xe_bo, ctx);
		if (!lret)
			lret =3D xe_bo_shrink_purge(ctx, bo, scanned);
}

When xe_bo_move_notify() -> xe_bo_trigger_rebind() calls
xe_vm_flush_vm_bo_tlb_async(), it queues an async TLB invalidation job on
gt->tlb_inval.job_wq and installs an unsignaled DMA_RESV_USAGE_KERNEL fence
into bo->ttm.base.resv. Immediately afterward, xe_bo_shrink_purge() calls
ttm_bo_wait_ctx(bo, ctx):

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink_purge() {
	if (bo->resource->mem_type !=3D XE_PL_SYSTEM) {
		struct ttm_resource *new_resource;

		lret =3D ttm_bo_wait_ctx(bo, ctx);
		if (lret)
			return lret;
}

Because ctx->no_wait_gpu is true and bo->ttm.base.resv now contains the
unsignaled flush fence, ttm_bo_wait_ctx() fails with -EBUSY after
drm_gpuvm_bo_evict() and xe_bo_vunmap() have already run. The same -EBUSY
failure can happen in xe_ttm_bo_purge(), or if a subsequent vm_bo on the sa=
me
BO falls through to the if (!idle) block in xe_bo_trigger_rebind().

Conversely, if a BO in XE_PL_TT has in-flight GPU work and xe_bo_move() is
called with ctx->no_wait_gpu =3D true, xe_bo_trigger_rebind() previously
returned -EBUSY at the ctx->no_wait_gpu check, whereas now it succeeds and
xe_bo_move() proceeds to wait unconditionally on DMA_RESV_USAGE_BOOKKEEP.
Should xe_bo_trigger_rebind() skip the async path or honor ctx->no_wait_gpu
before queueing unsignaled fences into the BO's dma-resv?

[Severity: Medium]
Also, on L2-flush-optimized platforms (where !IS_DGFX(xe) is true), does
xe_bo_move() still end up stalling synchronously on the newly queued flush
fences?

When evicting a BO from XE_PL_TT to XE_PL_SYSTEM, xe_bo_move() calls
xe_bo_move_notify(bo, ctx) and then immediately waits on
DMA_RESV_USAGE_BOOKKEEP before checking handle_system_ccs or scheduling a
migration copy:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_move() {
	if (!move_lacks_source && !xe_bo_is_pinned(bo)) {
		ret =3D xe_bo_move_notify(bo, ctx);
		if (ret)
			goto out;
	}

	if (old_mem_type =3D=3D XE_PL_TT &&
	    new_mem->mem_type =3D=3D XE_PL_SYSTEM) {
		long timeout =3D dma_resv_wait_timeout(ttm_bo->base.resv,
						     DMA_RESV_USAGE_BOOKKEEP,
						     false,
						     MAX_SCHEDULE_TIMEOUT);
}

Because DMA_RESV_USAGE_BOOKKEEP is a superset of DMA_RESV_USAGE_KERNEL, won=
't
this wait in xe_bo_move() still block the calling thread synchronously (and
uninterruptibly, with intr =3D false instead of ctx->interruptible) on both=
 all
in-flight GPU work and the async TLB invalidation jobs just queued by
xe_vm_flush_vm_bo_tlb_async()?

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dfbabfb19cbba..6c8164fc7c200 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
[ ... ]
> @@ -4582,6 +4583,130 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	return ret;
>  }
> =20
> +/*
> + * xe_vma_tlb_flush_client - Queue an async TLB flush for one VMA on one=
 client
> + *
> + * Create and push a TLB invalidation job on the tile migrate (kernel) e=
xec
> + * queue covering @vma's range, depending on @dep (the BO's in-flight GP=
U work)
> + * so the flush only fires once the GPU is done with the current mapping=
. The
> + * job's completion fence is installed into @resv as a KERNEL fence so t=
he
> + * subsequent migration waits on the flush. No PTEs are zapped; this only
> + * flushes L2 via the TLB invalidation.
> + */
> +static int xe_vma_tlb_flush_client(struct xe_vm *vm, struct xe_vma *vma,
> +				   struct xe_tile *tile, struct xe_gt *gt,
> +				   struct dma_resv *resv, struct dma_fence *dep,
> +				   int type)
> +{
> +	struct xe_exec_queue *q =3D xe_migrate_exec_queue(tile->migrate);
> +	struct xe_tlb_inval_job *job;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	job =3D xe_tlb_inval_job_create(q, &gt->tlb_inval,
> +				      q->tlb_inval[type].dep_scheduler, vm,
> +				      xe_vma_start(vma), xe_vma_end(vma), type);
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
> +	/* Cannot fail; takes its own ref on @dep and returns a referenced fenc=
e. */
> +	fence =3D xe_tlb_inval_job_push(job, dep);

[Severity: Critical]
Is xe_migrate_exec_queue(tile->migrate) the right exec queue to pass to
xe_tlb_inval_job_create() and xe_tlb_inval_job_push() here, or should this =
be
using xe_cpu_bind_queue(vm->xe->cpu_bind)?

Inside xe_tlb_inval_job_push(), job arming, pushing, and updating last_fence
are serialized by xe_cpu_bind_job_lock():

drivers/gpu/drm/xe/xe_tlb_inval_job.c:xe_tlb_inval_job_push() {
	...
	xe_cpu_bind_job_lock(cpu_bind, job->q);
	...
	drm_sched_job_arm(&job->dep.drm);
	dma_fence_get(&job->dep.drm.s_fence->finished);
	drm_sched_entity_push_job(&job->dep.drm);

	/* Let the upper layers fish this out */
	xe_exec_queue_tlb_inval_last_fence_set(job->q, job->vm,
					       &job->dep.drm.s_fence->finished,
					       job->idx);

	xe_cpu_bind_job_unlock(cpu_bind, job->q);
}

And xe_cpu_bind_job_lock() checks whether q is cpu_bind->q:

drivers/gpu/drm/xe/xe_cpu_bind.c:xe_cpu_bind_job_lock() {
	bool is_cpu_bind =3D is_cpu_bind_queue(cpu_bind, q);

	if (is_cpu_bind)
		mutex_lock(&cpu_bind->job_mutex);
	else
		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
}

Because tile->migrate->q is a separate queue from xe->cpu_bind->q and has
q->user_vm =3D=3D NULL:

1. With CONFIG_PROVE_LOCKING enabled, is_cpu_bind is false, so
   xe_vm_assert_held(q->user_vm) dereferences a NULL q->user_vm pointer.
   In addition, xe_exec_queue_tlb_inval_last_fence_set() calls
   xe_exec_queue_last_fence_lockdep_assert() -> xe_cpu_bind_job_lock_assert=
(),
   which triggers xe_assert(xe, q =3D=3D cpu_bind->q) and
   lockdep_assert_held(&cpu_bind->job_mutex).

2. With CONFIG_PROVE_LOCKING disabled, xe_cpu_bind_job_lock() is a no-op for
   tile->migrate->q. Since xe_vm_flush_vm_bo_tlb_async() only holds the per=
-BO
   dma-resv lock, concurrent evictions of BOs with distinct dma-resv locks =
can
   call drm_sched_job_arm(), drm_sched_entity_push_job(), and
   xe_exec_queue_tlb_inval_last_fence_set() concurrently on the shared
   tile->migrate->q without any lock, corrupting the drm_sched_entity SPSC
   queue and racing on q->tlb_inval[idx].last_fence.

[Severity: High]
Also, is it safe to call xe_vma_tlb_flush_client() and
xe_tlb_inval_job_alloc_dep() from the shrinker under fs_reclaim?

On L2-flush-optimized platforms, __xe_shrinker_walk() walks XE_PL_TT BOs
during slab shrinking (xe_shrinker_scan() and xe_shrinker_scan_purgeable())
and calls xe_bo_shrink() -> xe_bo_move_notify() -> xe_bo_trigger_rebind() ->
xe_vm_flush_vm_bo_tlb_async().

Within this path, dma_resv_get_singleton(), xe_tlb_inval_job_create(),
dma_resv_reserve_fences(), and xe_tlb_inval_job_alloc_dep() perform GFP_KER=
NEL
allocations, and xe_tlb_inval_job_alloc_dep() explicitly asserts
might_alloc(GFP_KERNEL):

drivers/gpu/drm/xe/xe_tlb_inval_job.c:xe_tlb_inval_job_alloc_dep() {
	xe_assert(gt_to_xe(job->q->gt), !xa_load(&job->dep.drm.dependencies, 0));
	might_alloc(GFP_KERNEL);

	return drm_sched_job_add_dependency(&job->dep.drm,
					    dma_fence_get_stub());
}

Won't reaching this from the shrinker while fs_reclaim is held trigger a
lockdep recursive-reclaim warning and risk recursive memory reclaim deadloc=
ks?

[ ... ]
> +		for_each_tile(tile, xe, id) {
> +			if (!(vma->tile_present & BIT(id)))
> +				continue;
> +
> +			err =3D xe_vma_tlb_flush_client(vm, vma, tile,
> +						      tile->primary_gt, resv, dep,
> +						      XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +			if (err)
> +				goto out;
> +
> +			if (tile->media_gt) {
> +				err =3D xe_vma_tlb_flush_client(vm, vma, tile,
> +							      tile->media_gt, resv, dep,
> +							      XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
> +				if (err)
> +					goto out;
> +			}
> +		}

[Severity: High]
On multi-tile devices, shouldn't the index passed to xe_vma_tlb_flush_clien=
t()
be offset by the tile ID?

In alloc_dep_schedulers(), q->tlb_inval[] is populated across all tiles and
GTs as a flat array indexed by i =3D id * (XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT=
 + 1)
+ j:

drivers/gpu/drm/xe/xe_exec_queue.c:alloc_dep_schedulers() {
	for_each_tile(tile, xe, id) {
		for (j =3D 0; j < (XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1); ++j, ++i) {
			...
			if (j =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
				gt =3D tile->primary_gt;
			else
				gt =3D tile->media_gt;

			if (!gt)
				continue;
			...
			q->tlb_inval[i].dep_scheduler =3D dep_scheduler;
		}
	}
}

Passing the unshifted XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT (0) and
XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT (1) for every tile causes tiles with id > 0
to use tile 0's dep_scheduler and overwrite tile 0's last_fence slots (and =
if
tile 0 has no media GT while a higher tile does, q->tlb_inval[1].dep_schedu=
ler
will be NULL). Should this compute the index using the tile ID in the same =
way
as xe_pt_update_ops_run()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104221459.1534=
188-1-matthew.brost@intel.com?part=3D1
