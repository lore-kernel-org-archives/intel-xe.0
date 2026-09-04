Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91D1C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6465F10E1C3;
	Fri,  4 Sep 2026 00:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a2Nr4hPF";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777FA10E1C3
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:31:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 587424040E;
 Fri,  4 Sep 2026 00:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABBA1F000E9;
 Fri,  4 Sep 2026 00:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481910;
 bh=TsuiER4LoPi0wGBEiK3tnyk5Bdd4mEPSB9fKMcNr4nk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=a2Nr4hPFZpucQldGoyvdFDRQIY8nIqZ16rwtrc+xxp5pLib1PmWM36Gg6k6utS6at
 0CLmLhfO9AuIY+32UXcufltsD1X5I5iRpuukA7J2JDkaBuNQJK/odkJPiBoyrcQujY
 1ebGNTb1i7DAF0UgtRIEiOytrMKu1B3x789lfEvKV+XRIyzzB16K0KpG12sxkiotk0
 hAyo0E8gpNciHLYjjwnmXcgAProEKmLc5LzMURCW9ES1PyN9ipVoKNgZwFi4QMqG3Q
 2pZU5NcG7jTRWnmfhgUzzDB5qQYYlkJJIpqiSDLgQQ+D5r0zcfYTHOJUsVKATrjwO3
 ziWuZcOiLsmIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/25] drm/xe: Add CPU bind layer
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-17-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:31:49 +0000
Message-Id: <20260904003150.1ABBA1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] TLB invalidation on mirrored (shared) tiles uses uninitialized=
 `start` and `last` addresses, failing to invalidate the correctly updated =
address range.
- [Critical] Shallow copying of the page reclaim list (PRL) for mirrored ti=
les leads to a Use-After-Free and double-free of the PRL entries during TLB=
 invalidation.
- [Critical] The arguments `tile_mask` and `usage` are swapped when calling=
 `unbind_op_commit()` in the `DRM_GPUVA_OP_UNMAP` case, leading to un-clear=
ed VMAs and corrupted dma-resv state.
- [High] Missing NULL check for the result of `drmm_kzalloc()` in `xe_cpu_b=
ind_init()`.
- [High] `op_prepare` mistakenly uses `XE_VMA_OPS_FLAG_WAIT_VM_KERNEL` inst=
ead of `XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP` for REMAP operations, breaking dm=
a-resv wait semantics.
--

commit 87e03e5ddd64ecb931de7c6186e72459d6401535
Author: Matthew Brost <matthew.brost@intel.com>
Subject: drm/xe: Add CPU bind layer

This commit introduces a dedicated CPU bind layer for the xe driver, moving
CPU bind handling out of the migrate layer since it's decoupled from
hardware. It also updates the page table layer to generate a single bind job
when pages are mirrored across tiles.

Link: https://patch.msgid.link/20260228013501.106680-17-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_cpu_bind.c b/drivers/gpu/drm/xe/xe_cpu=
_bind.c
> new file mode 100644
> index 0000000000000..ed79e229151b4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cpu_bind.c
> @@ -0,0 +1,295 @@
[ ... ]
> +int xe_cpu_bind_init(struct xe_device *xe)
> +{
> +	struct xe_cpu_bind *cpu_bind =3D
> +		drmm_kzalloc(&xe->drm, sizeof(*cpu_bind), GFP_KERNEL);
> +	struct xe_exec_queue *q;
> +
> +	q =3D xe_exec_queue_create_bind(xe, xe_device_get_root_tile(xe), NULL,
> +				      EXEC_QUEUE_FLAG_KERNEL |
> +				      EXEC_QUEUE_FLAG_MIGRATE, 0);
> +	if (IS_ERR(q))
> +		return PTR_ERR(q);
> +
> +	cpu_bind->xe =3D xe;

[Severity: High]
Does this code dereference cpu_bind without checking if drmm_kzalloc()
succeeded? If the allocation fails under memory pressure and returns NULL,
this assignment will cause a NULL pointer dereference kernel panic during
device probe.

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7c7cd7a0365b7..821edeaecaed9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
[ ... ]
> @@ -2395,7 +2388,7 @@ static int op_prepare(struct xe_vm *vm,
> =20
>  		err =3D bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
>  				      op->map.invalidate_on_bind);
> -		pt_update_ops->wait_vm_kernel =3D true;
> +		vops->flags |=3D XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  	{
> @@ -2409,12 +2402,12 @@ static int op_prepare(struct xe_vm *vm,
>  		if (!err && op->remap.prev && !op->remap.skip_prev) {
>  			err =3D bind_op_prepare(vm, tile, pt_update_ops,
>  					      op->remap.prev, false);
> -			pt_update_ops->wait_vm_bookkeep =3D true;
> +			vops->flags |=3D XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
>  		}
>  		if (!err && op->remap.next && !op->remap.skip_next) {
>  			err =3D bind_op_prepare(vm, tile, pt_update_ops,
>  					      op->remap.next, false);
> -			pt_update_ops->wait_vm_bookkeep =3D true;
> +			vops->flags |=3D XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
>  		}
>  		break;
>  	}

[Severity: High]
Are the flag updates in the DRM_GPUVA_OP_REMAP branch intentionally setting
XE_VMA_OPS_FLAG_WAIT_VM_KERNEL instead of XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP?

The original code correctly set wait_vm_bookkeep to true for remap
operations, but the updated version uses the KERNEL flag. This flips the
expected synchronization dependency semantics, which could cause REMAP
operations to incorrectly wait on KERNEL fences instead of BOOKKEEP fences,
violating the synchronization contract.

[ ... ]
> @@ -2604,21 +2624,19 @@ static void unbind_op_commit(struct xe_vm *vm, st=
ruct xe_tile *tile,
> =20
>  static void range_present_and_invalidated_tile(struct xe_vm *vm,
>  					       struct xe_svm_range *range,
> -					       u8 tile_id)
> +					       u8 tile_mask)
>  {
>  	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() =
*/
> =20
>  	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
> =20
> -	WRITE_ONCE(range->tile_present, range->tile_present | BIT(tile_id));
> -	WRITE_ONCE(range->tile_invalidated, range->tile_invalidated & ~BIT(tile=
_id));
> +	WRITE_ONCE(range->tile_present, range->tile_present | tile_mask);
> +	WRITE_ONCE(range->tile_invalidated, range->tile_invalidated & ~tile_mas=
k);
>  }
> =20
> -static void op_commit(struct xe_vm *vm,
> -		      struct xe_tile *tile,
> -		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> -		      struct xe_vma_op *op, struct dma_fence *fence,
> -		      struct dma_fence *fence2)
> +static void op_commit(struct xe_vm *vm, struct xe_vma_op *op,
> +		      struct dma_fence **fences, int fence_count,
> +		      enum dma_resv_usage usage, u8 tile_mask)
>  {
>  	xe_vm_assert_held(vm);
> =20
[ ... ]
> @@ -2657,8 +2672,8 @@ static void op_commit(struct xe_vm *vm,
>  		struct xe_vma *vma =3D gpuva_to_vma(op->base.unmap.va);
> =20
>  		if (!xe_vma_is_cpu_addr_mirror(vma))
> -			unbind_op_commit(vm, tile, pt_update_ops, vma, fence,
> -					 fence2);
> +			unbind_op_commit(vm, vma, fences, fence_count,
> +					 tile_mask, usage);
>  		break;
>  	}

[Severity: Critical]
Is it possible the tile_mask and usage arguments are swapped here?

Looking at the signature for unbind_op_commit(), it expects usage before
tile_mask:

unbind_op_commit(struct xe_vm *vm, struct xe_vma *vma,
                 struct dma_fence **fences, int fence_count,
                 enum dma_resv_usage usage, u8 tile_mask)

Because the arguments are passed in reverse order, the dma_resv usage enum
is treated as the tile mask. This would mean vma->tile_present &=3D ~tile_m=
ask
evaluates with the enum value (e.g. DMA_RESV_USAGE_KERNEL =3D 0), leaving
the VMA marked fully present, and un-cleared memory could be incorrectly
freed. Simultaneously, the tile mask is passed into the dma_resv tracking
slots as a bogus usage value.

[ ... ]
> @@ -2737,82 +2739,83 @@ static struct xe_dep_scheduler *to_dep_scheduler(=
struct xe_exec_queue *q,
>  struct dma_fence *
> -xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> +xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
>  {
[ ... ]
> -	if (pt_update_ops->needs_invalidation) {
> -		struct xe_dep_scheduler *dep_scheduler =3D
> -			to_dep_scheduler(q, tile, tile->primary_gt, &type);
> -
> -		ijob =3D xe_tlb_inval_job_create(q, &tile->primary_gt->tlb_inval,
> -					       dep_scheduler, vm,
> -					       pt_update_ops->start,
> -					       pt_update_ops->last,
> -					       type);
> -		if (IS_ERR(ijob)) {
> -			err =3D PTR_ERR(ijob);
> -			goto kill_vm_tile1;
> -		}
> -		update.ijob =3D ijob;
> -		/*
> -		 * Only add page reclaim for the primary GT. Media GT does not have
> -		 * any PPC to flush, so enabling the PPC flush bit for media is
> -		 * effectively a NOP and provides no performance benefit nor
> -		 * interfere with primary GT.
> -		 */
> -		if (xe_page_reclaim_list_valid(&pt_update_ops->prl)) {
> -			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> -			/* Release ref from alloc, job will now handle it */
> -			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> -		}
> -
> -		if (tile->media_gt) {
> -			dep_scheduler =3D to_dep_scheduler(q, tile,
> -							 tile->media_gt, &type);
> -
> -			mjob =3D xe_tlb_inval_job_create(q,
> -						       &tile->media_gt->tlb_inval,
> -						       dep_scheduler, vm,
> -						       pt_update_ops->start,
> -						       pt_update_ops->last,
> -						       type);
> -			if (IS_ERR(mjob)) {
> -				err =3D PTR_ERR(mjob);
> +	if (needs_invalidation) {
> +		for_each_tlb_inval(q, i) {
> +			struct xe_dep_scheduler *dep_scheduler =3D
> +				q->tlb_inval[i].dep_scheduler;
> +			struct xe_tile *tile =3D
> +				&xe->tiles[i / XE_MAX_GT_PER_TILE];
> +			struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +				&vops->pt_update_ops[tile->id];
> +			struct xe_page_reclaim_list *prl =3D &pt_update_ops->prl;
> +			struct xe_tlb_inval_job *ijob;
> +			struct xe_gt *gt =3D i % XE_MAX_GT_PER_TILE ?
> +				tile->media_gt : tile->primary_gt;
> +
> +			ijob =3D xe_tlb_inval_job_create(q, &gt->tlb_inval,
> +						       dep_scheduler,
> +						       vm, pt_update_ops->start,
> +						       pt_update_ops->last, i);
> +			if (IS_ERR(ijob)) {
> +				err =3D PTR_ERR(ijob);
>  				goto free_ijob;
>  			}
> -			update.mjob =3D mjob;
> +
> +			update.ijobs[i] =3D ijob;
> +
> +			/*
> +			 * Only add page reclaim for the primary GT. Media GT
> +			 * does not have any PPC to flush, so enabling the PPC
> +			 * flush bit for media is effectively a NOP and provides
> +			 * no performance benefit nor interfere with primary GT.
> +			 */
> +			if (xe_page_reclaim_list_valid(prl)) {
> +				xe_tlb_inval_job_add_page_reclaim(ijob, prl);
> +				/* Release ref from alloc, job will now handle it */
> +				xe_page_reclaim_list_invalidate(prl);
> +			}
>  		}
>  	}

[Severity: Critical]
Does this code inadvertently create TLB invalidation jobs with uninitialized
bounds for secondary mirrored tiles?

When a tile shares a page table (mirroring disabled), the initialization of
pt_update_ops->start and pt_update_ops->last is skipped during the prepare
phase. Consequently, they remain 0. Here, xe_tlb_inval_job_create() relies
on these bounds, meaning the secondary tile's GTs could execute an invalid
TLB flush for the [0, 0] range, leaving stale TLB entries for the actual
modified range.

[Severity: Critical]
Can this loop trigger a use-after-free and double-free on the page reclaim
list (PRL)?

For secondary mirrored tiles, the PRL is set up as a shallow copy of the
primary tile's PRL without taking an additional page reference.
When the loop iterates over the primary tile, it adds the PRL and calls
xe_page_reclaim_list_invalidate(), which drops the page reference.

When the loop then reaches the secondary tile, its shallow-copied
prl.entries pointer is still non-NULL but points to freed memory. The code
will pass this dangling pointer to the secondary job and call
xe_page_reclaim_list_invalidate() a second time, triggering a double-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D16
