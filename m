Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE52C001E0
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 21:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424C910E3D4;
	Tue, 18 Jul 2023 21:24:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890AF10E3D0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 21:24:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------4rnAfZc6fulZ6jr2bfrUfA1E"
Message-ID: <5d49538f-0528-f0c9-d562-b19cf46066e3@linux.intel.com>
Date: Tue, 18 Jul 2023 23:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230710221544.1882405-1-matthew.brost@intel.com>
 <20230710221544.1882405-3-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230710221544.1882405-3-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Make bind engines safe
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

This is a multi-part message in MIME format.
--------------4rnAfZc6fulZ6jr2bfrUfA1E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-07-11 00:15, Matthew Brost wrote:
> We currently have a race between bind engines which can result in
> corrupted page tables leading to faults.
>
> A simple example:
> bind A 0x0000-0x1000, engine A, has unsatisfied in-fence
> bind B 0x1000-0x2000, engine B, no in-fences
> exec A uses 0x1000-0x2000
>
> Bind B will pass bind A and exec A will fault. This occurs as bind A
> programs the root of the page table in a bind job which is held up by an
> in-fence. Bind B in this case just programs a leaf entry of the
> structure.
>
> To fix use range-fence utility to track cross bind engine conflicts. In
> the above example bind A would insert an dependency into the range-fence
> tree with a key of 0x0-0x7fffffffff, bind B would find that dependency
> and its bind job would scheduled behind the unsatisfied in-fence and
> bind A's job.
>
> Co-developed-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c  |   2 +
>   drivers/gpu/drm/xe/xe_migrate.h  |   8 +++
>   drivers/gpu/drm/xe/xe_pt.c       | 115 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.c       |   9 +++
>   drivers/gpu/drm/xe/xe_vm_types.h |   7 ++
>   5 files changed, 141 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 47addcd3e78f..5e1ad3507175 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1073,6 +1073,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>   		return ERR_PTR(-ETIME);
>   
>   	if (ops->pre_commit) {
> +		pt_update->job = NULL;
>   		err = ops->pre_commit(pt_update);
>   		if (err)
>   			return ERR_PTR(err);
> @@ -1294,6 +1295,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>   		goto err_job;
>   
>   	if (ops->pre_commit) {
> +		pt_update->job = job;
>   		err = ops->pre_commit(pt_update);
>   		if (err)
>   			goto err_job;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 204337ea3b4e..da20b1a0e596 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -69,6 +69,14 @@ struct xe_migrate_pt_update {
>   	const struct xe_migrate_pt_update_ops *ops;
>   	/** @vma: The vma we're updating the pagetable for. */
>   	struct xe_vma *vma;
> +	/** @job: The job if a GPU page-table update. NULL otherwise */
> +	struct xe_sched_job *job;
> +	/** @start: Start of update for the range fence */
> +	u64 start;
> +	/** @last: Last of update for the range fence */
> +	u64 last;
> +	/** tild_id: Tile ID of the update */
> +	u8 tile_id;
>   };
>   
>   struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 00855681c0d5..3044930eae94 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1116,6 +1116,53 @@ struct xe_pt_migrate_pt_update {
>   	bool locked;
>   };
>   
> +/*
> + * This function adds the needed dependencies to a page-table update job
> + * to make sure racing jobs for separate bind engines don't race writing
> + * to the same page-table range, wreaking havoc. Initially use a single
> + * fence for the entire VM. An optimization would use smaller granularity.
> + */
> +static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> +				 struct xe_range_fence_tree *rftree,
> +				 u64 start, u64 last)
> +{
> +	struct xe_range_fence *rtfence;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	rtfence = xe_range_fence_tree_iter_first(&rftree->root, start, last);
> +	while (rtfence) {
> +		fence = rtfence->fence;
> +
> +		if (!dma_fence_is_signaled(fence)) {
> +			/*
> +			 * Is this a CPU update? GPU is busy updating, so return
> +			 * an error
> +			 */
> +			if (!job)
> +				return -ETIME;
> +
> +			dma_fence_get(fence);
> +			err = drm_sched_job_add_dependency(&job->drm, fence);
> +			if (err)
> +				return err;
> +		}
> +
> +		rtfence = xe_range_fence_tree_iter_next(rtfence, start, last);
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
> +{
> +	struct xe_range_fence_tree *rftree =
> +		&xe_vma_vm(pt_update->vma)->rftree[pt_update->tile_id];
> +
> +	return xe_pt_vm_dependencies(pt_update->job, rftree,
> +				     pt_update->start, pt_update->last);
> +}
> +
>   static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>   {
>   	struct xe_pt_migrate_pt_update *userptr_update =
> @@ -1123,6 +1170,13 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>   	struct xe_vma *vma = pt_update->vma;
>   	unsigned long notifier_seq = vma->userptr.notifier_seq;
>   	struct xe_vm *vm = xe_vma_vm(vma);
> +	int err = xe_pt_vm_dependencies(pt_update->job,
> +					&vm->rftree[pt_update->tile_id],
> +					pt_update->start,
> +					pt_update->last);
> +
> +	if (err)
> +		return err;
>   
>   	userptr_update->locked = false;
>   
> @@ -1161,6 +1215,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>   
>   static const struct xe_migrate_pt_update_ops bind_ops = {
>   	.populate = xe_vm_populate_pgtable,
> +	.pre_commit = xe_pt_pre_commit,
>   };
>   
>   static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
> @@ -1258,6 +1313,27 @@ static int invalidation_fence_init(struct xe_gt *gt,
>   	return ret && ret != -ENOENT ? ret : 0;
>   }
>   
> +static void xe_pt_calc_rfence_interval(struct xe_vma *vma,
> +				       struct xe_pt_migrate_pt_update *update,
> +				       struct xe_vm_pgtable_update *entries,
> +				       u32 num_entries)
> +{
> +	int i, level = 0;
> +
> +	for (i = 0; i < num_entries; i++) {
> +		const struct xe_vm_pgtable_update *entry = &entries[i];
> +
> +		if (entry->pt->level > level)
> +			level = entry->pt->level;
> +	}
> +
> +	/* Greedy (non-optimal) calculation but simple */
> +	update->base.start = ALIGN_DOWN(xe_vma_start(vma),
> +					0x1ull << xe_pt_shift(level));
> +	update->base.last = ALIGN(xe_vma_end(vma),
> +				  0x1ull << xe_pt_shift(level)) - 1;
> +}
> +
>   /**
>    * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
>    * address range.
> @@ -1290,6 +1366,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>   		.base = {
>   			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
>   			.vma = vma,
> +			.tile_id = tile->id,
>   		},
>   		.bind = true,
>   	};
> @@ -1297,6 +1374,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>   	u32 num_entries;
>   	struct dma_fence *fence;
>   	struct invalidation_fence *ifence = NULL;
> +	struct xe_range_fence *rfence;
>   	int err;
>   
>   	bind_pt_update.locked = false;
> @@ -1313,6 +1391,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>   	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
>   
>   	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> +	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
> +				   num_entries);
>   
>   	/*
>   	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> @@ -1333,6 +1413,12 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>   			return ERR_PTR(-ENOMEM);
>   	}
>   
> +	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> +	if (!rfence) {
> +		kfree(ifence);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
>   	fence = xe_migrate_update_pgtables(tile->migrate,
>   					   vm, xe_vma_bo(vma),
>   					   e ? e : vm->eng[tile->id],
> @@ -1342,6 +1428,14 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>   	if (!IS_ERR(fence)) {
>   		bool last_munmap_rebind = vma->gpuva.flags & XE_VMA_LAST_REBIND;
>   		LLIST_HEAD(deferred);
> +		int err;
> +
> +		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> +					    &xe_range_fence_kfree_ops,
> +					    bind_pt_update.base.start,
> +					    bind_pt_update.base.last, fence);
> +		if (err)
> +			dma_fence_wait(fence, false);
>   
>   		/* TLB invalidation must be done before signaling rebind */
>   		if (ifence) {
> @@ -1380,6 +1474,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>   			queue_work(vm->xe->ordered_wq,
>   				   &vm->preempt.rebind_work);
>   	} else {
> +		kfree(rfence);
>   		kfree(ifence);
>   		if (bind_pt_update.locked)
>   			up_read(&vm->userptr.notifier_lock);
> @@ -1589,6 +1684,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
>   
>   static const struct xe_migrate_pt_update_ops unbind_ops = {
>   	.populate = xe_migrate_clear_pgtable_callback,
> +	.pre_commit = xe_pt_pre_commit,
>   };
>   
>   static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
> @@ -1626,12 +1722,15 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>   			.ops = xe_vma_is_userptr(vma) ? &userptr_unbind_ops :
>   			&unbind_ops,
>   			.vma = vma,
> +			.tile_id = tile->id,
>   		},
>   	};
>   	struct xe_vm *vm = xe_vma_vm(vma);
>   	u32 num_entries;
>   	struct dma_fence *fence = NULL;
>   	struct invalidation_fence *ifence;
> +	struct xe_range_fence *rfence;
> +
>   	LLIST_HEAD(deferred);
>   
>   	xe_bo_assert_held(xe_vma_bo(vma));
> @@ -1645,11 +1744,19 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>   	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
>   
>   	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> +	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
> +				   num_entries);
>   
>   	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>   	if (!ifence)
>   		return ERR_PTR(-ENOMEM);
>   
> +	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> +	if (!rfence) {
> +		kfree(ifence);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
>   	/*
>   	 * Even if we were already evicted and unbind to destroy, we need to
>   	 * clear again here. The eviction may have updated pagetables at a
> @@ -1664,6 +1771,13 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>   	if (!IS_ERR(fence)) {
>   		int err;
>   
> +		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> +					    &xe_range_fence_kfree_ops,
> +					    unbind_pt_update.base.start,
> +					    unbind_pt_update.base.last, fence);
> +		if (err)
> +			dma_fence_wait(fence, false);
> +
>   		/* TLB invalidation must be done before signaling unbind */
>   		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
>   		if (err) {
> @@ -1685,6 +1799,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>   				    unbind_pt_update.locked ? &deferred : NULL);
>   		vma->tile_present &= ~BIT(tile->id);
>   	} else {
> +		kfree(rfence);
>   		kfree(ifence);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c216350084b..26d39de777aa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1229,6 +1229,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	INIT_LIST_HEAD(&vm->preempt.engines);
>   	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>   
> +	for_each_tile(tile, xe, id)
> +		xe_range_fence_tree_init(&vm->rftree[id]);
> +
>   	INIT_LIST_HEAD(&vm->extobj.list);
>   
>   	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> @@ -1351,6 +1354,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	drm_gpuva_manager_destroy(&vm->mgr);
>   err_put:
>   	dma_resv_fini(&vm->resv);
> +	for_each_tile(tile, xe, id)
> +		xe_range_fence_tree_fini(&vm->rftree[id]);
>   	kfree(vm);
>   	if (!(flags & XE_VM_FLAG_MIGRATION)) {
>   		xe_device_mem_access_put(xe);
> @@ -1468,6 +1473,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   					      NULL);
>   		}
>   	}
> +
>   	xe_vm_unlock(vm, &ww);
>   
>   	/*
Spurious newline?
> @@ -1495,6 +1501,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   		xe->usm.num_vm_in_non_fault_mode--;
>   	mutex_unlock(&xe->usm.lock);
>   
> +	for_each_tile(tile, xe, id)
> +		xe_range_fence_tree_fini(&vm->rftree[id]);
> +
>   	xe_vm_put(vm);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index edb3c99a9c81..37d57552d727 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -15,6 +15,7 @@
>   
>   #include "xe_device_types.h"
>   #include "xe_pt_types.h"
> +#include "xe_range_fence.h"
>   
>   struct async_op_fence;
>   struct xe_bo;
> @@ -182,6 +183,12 @@ struct xe_vm {
>   	 */
>   	struct work_struct destroy_work;
>   
> +	/**
> +	 * @rftree: range fence tree to track updates to page table structure.
> +	 * Used to implement conflict tracking between independent bind engines.
> +	 */
> +	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
> +
>   	/** @extobj: bookkeeping for external objects. Protected by the vm lock */
>   	struct {
>   		/** @enties: number of external BOs attached this VM */

With that fixed, and fixing the error output from

In file included from ../drivers/gpu/drm/xe/xe_range_fence.c:7:
../drivers/gpu/drm/xe/xe_range_fence.c:18:10: error: no previous prototype for ‘xe_range_fence_tree_insert’ [-Werror=missing-prototypes]
    18 |        , xe_range_fence_tree);
       |          ^~~~~~~~~~~~~~~~~~~
../include/linux/interval_tree_generic.h:38:15: note: in definition of macro ‘INTERVAL_TREE_DEFINE’
    38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,         \
       |               ^~~~~~~~
../drivers/gpu/drm/xe/xe_range_fence.c:18:10: error: no previous prototype for ‘xe_range_fence_tree_remove’ [-Werror=missing-prototypes]
    18 |        , xe_range_fence_tree);
       |          ^~~~~~~~~~~~~~~~~~~
../include/linux/interval_tree_generic.h:65:15: note: in definition of macro ‘INTERVAL_TREE_DEFINE’
    65 | ITSTATIC void ITPREFIX ## _remove(ITSTRUCT *node,         \
       |               ^~~~~~~~
../drivers/gpu/drm/xe/xe_range_fence.c:47:6: error: no previous prototype for ‘xe_range_fence_cleanup’ [-Werror=missing-prototypes]
    47 | void xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
       |      ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>

--------------4rnAfZc6fulZ6jr2bfrUfA1E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-07-11 00:15, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230710221544.1882405-3-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">We currently have a race between bind engines which can result in
corrupted page tables leading to faults.

A simple example:
bind A 0x0000-0x1000, engine A, has unsatisfied in-fence
bind B 0x1000-0x2000, engine B, no in-fences
exec A uses 0x1000-0x2000

Bind B will pass bind A and exec A will fault. This occurs as bind A
programs the root of the page table in a bind job which is held up by an
in-fence. Bind B in this case just programs a leaf entry of the
structure.

To fix use range-fence utility to track cross bind engine conflicts. In
the above example bind A would insert an dependency into the range-fence
tree with a key of 0x0-0x7fffffffff, bind B would find that dependency
and its bind job would scheduled behind the unsatisfied in-fence and
bind A's job.

Co-developed-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_migrate.c  |   2 +
 drivers/gpu/drm/xe/xe_migrate.h  |   8 +++
 drivers/gpu/drm/xe/xe_pt.c       | 115 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       |   9 +++
 drivers/gpu/drm/xe/xe_vm_types.h |   7 ++
 5 files changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 47addcd3e78f..5e1ad3507175 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1073,6 +1073,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 		return ERR_PTR(-ETIME);
 
 	if (ops-&gt;pre_commit) {
+		pt_update-&gt;job = NULL;
 		err = ops-&gt;pre_commit(pt_update);
 		if (err)
 			return ERR_PTR(err);
@@ -1294,6 +1295,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		goto err_job;
 
 	if (ops-&gt;pre_commit) {
+		pt_update-&gt;job = job;
 		err = ops-&gt;pre_commit(pt_update);
 		if (err)
 			goto err_job;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 204337ea3b4e..da20b1a0e596 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -69,6 +69,14 @@ struct xe_migrate_pt_update {
 	const struct xe_migrate_pt_update_ops *ops;
 	/** @vma: The vma we're updating the pagetable for. */
 	struct xe_vma *vma;
+	/** @job: The job if a GPU page-table update. NULL otherwise */
+	struct xe_sched_job *job;
+	/** @start: Start of update for the range fence */
+	u64 start;
+	/** @last: Last of update for the range fence */
+	u64 last;
+	/** tild_id: Tile ID of the update */
+	u8 tile_id;
 };
 
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 00855681c0d5..3044930eae94 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1116,6 +1116,53 @@ struct xe_pt_migrate_pt_update {
 	bool locked;
 };
 
+/*
+ * This function adds the needed dependencies to a page-table update job
+ * to make sure racing jobs for separate bind engines don't race writing
+ * to the same page-table range, wreaking havoc. Initially use a single
+ * fence for the entire VM. An optimization would use smaller granularity.
+ */
+static int xe_pt_vm_dependencies(struct xe_sched_job *job,
+				 struct xe_range_fence_tree *rftree,
+				 u64 start, u64 last)
+{
+	struct xe_range_fence *rtfence;
+	struct dma_fence *fence;
+	int err;
+
+	rtfence = xe_range_fence_tree_iter_first(&amp;rftree-&gt;root, start, last);
+	while (rtfence) {
+		fence = rtfence-&gt;fence;
+
+		if (!dma_fence_is_signaled(fence)) {
+			/*
+			 * Is this a CPU update? GPU is busy updating, so return
+			 * an error
+			 */
+			if (!job)
+				return -ETIME;
+
+			dma_fence_get(fence);
+			err = drm_sched_job_add_dependency(&amp;job-&gt;drm, fence);
+			if (err)
+				return err;
+		}
+
+		rtfence = xe_range_fence_tree_iter_next(rtfence, start, last);
+	}
+
+	return 0;
+}
+
+static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_range_fence_tree *rftree =
+		&amp;xe_vma_vm(pt_update-&gt;vma)-&gt;rftree[pt_update-&gt;tile_id];
+
+	return xe_pt_vm_dependencies(pt_update-&gt;job, rftree,
+				     pt_update-&gt;start, pt_update-&gt;last);
+}
+
 static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_pt_migrate_pt_update *userptr_update =
@@ -1123,6 +1170,13 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_vma *vma = pt_update-&gt;vma;
 	unsigned long notifier_seq = vma-&gt;userptr.notifier_seq;
 	struct xe_vm *vm = xe_vma_vm(vma);
+	int err = xe_pt_vm_dependencies(pt_update-&gt;job,
+					&amp;vm-&gt;rftree[pt_update-&gt;tile_id],
+					pt_update-&gt;start,
+					pt_update-&gt;last);
+
+	if (err)
+		return err;
 
 	userptr_update-&gt;locked = false;
 
@@ -1161,6 +1215,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 
 static const struct xe_migrate_pt_update_ops bind_ops = {
 	.populate = xe_vm_populate_pgtable,
+	.pre_commit = xe_pt_pre_commit,
 };
 
 static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
@@ -1258,6 +1313,27 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	return ret &amp;&amp; ret != -ENOENT ? ret : 0;
 }
 
+static void xe_pt_calc_rfence_interval(struct xe_vma *vma,
+				       struct xe_pt_migrate_pt_update *update,
+				       struct xe_vm_pgtable_update *entries,
+				       u32 num_entries)
+{
+	int i, level = 0;
+
+	for (i = 0; i &lt; num_entries; i++) {
+		const struct xe_vm_pgtable_update *entry = &amp;entries[i];
+
+		if (entry-&gt;pt-&gt;level &gt; level)
+			level = entry-&gt;pt-&gt;level;
+	}
+
+	/* Greedy (non-optimal) calculation but simple */
+	update-&gt;base.start = ALIGN_DOWN(xe_vma_start(vma),
+					0x1ull &lt;&lt; xe_pt_shift(level));
+	update-&gt;base.last = ALIGN(xe_vma_end(vma),
+				  0x1ull &lt;&lt; xe_pt_shift(level)) - 1;
+}
+
 /**
  * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
  * address range.
@@ -1290,6 +1366,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		.base = {
 			.ops = xe_vma_is_userptr(vma) ? &amp;userptr_bind_ops : &amp;bind_ops,
 			.vma = vma,
+			.tile_id = tile-&gt;id,
 		},
 		.bind = true,
 	};
@@ -1297,6 +1374,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	u32 num_entries;
 	struct dma_fence *fence;
 	struct invalidation_fence *ifence = NULL;
+	struct xe_range_fence *rfence;
 	int err;
 
 	bind_pt_update.locked = false;
@@ -1313,6 +1391,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	XE_BUG_ON(num_entries &gt; ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
+	xe_pt_calc_rfence_interval(vma, &amp;bind_pt_update, entries,
+				   num_entries);
 
 	/*
 	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
@@ -1333,6 +1413,12 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 			return ERR_PTR(-ENOMEM);
 	}
 
+	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
+	if (!rfence) {
+		kfree(ifence);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	fence = xe_migrate_update_pgtables(tile-&gt;migrate,
 					   vm, xe_vma_bo(vma),
 					   e ? e : vm-&gt;eng[tile-&gt;id],
@@ -1342,6 +1428,14 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	if (!IS_ERR(fence)) {
 		bool last_munmap_rebind = vma-&gt;gpuva.flags &amp; XE_VMA_LAST_REBIND;
 		LLIST_HEAD(deferred);
+		int err;
+
+		err = xe_range_fence_insert(&amp;vm-&gt;rftree[tile-&gt;id], rfence,
+					    &amp;xe_range_fence_kfree_ops,
+					    bind_pt_update.base.start,
+					    bind_pt_update.base.last, fence);
+		if (err)
+			dma_fence_wait(fence, false);
 
 		/* TLB invalidation must be done before signaling rebind */
 		if (ifence) {
@@ -1380,6 +1474,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 			queue_work(vm-&gt;xe-&gt;ordered_wq,
 				   &amp;vm-&gt;preempt.rebind_work);
 	} else {
+		kfree(rfence);
 		kfree(ifence);
 		if (bind_pt_update.locked)
 			up_read(&amp;vm-&gt;userptr.notifier_lock);
@@ -1589,6 +1684,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 
 static const struct xe_migrate_pt_update_ops unbind_ops = {
 	.populate = xe_migrate_clear_pgtable_callback,
+	.pre_commit = xe_pt_pre_commit,
 };
 
 static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
@@ -1626,12 +1722,15 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 			.ops = xe_vma_is_userptr(vma) ? &amp;userptr_unbind_ops :
 			&amp;unbind_ops,
 			.vma = vma,
+			.tile_id = tile-&gt;id,
 		},
 	};
 	struct xe_vm *vm = xe_vma_vm(vma);
 	u32 num_entries;
 	struct dma_fence *fence = NULL;
 	struct invalidation_fence *ifence;
+	struct xe_range_fence *rfence;
+
 	LLIST_HEAD(deferred);
 
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1645,11 +1744,19 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	XE_BUG_ON(num_entries &gt; ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
+	xe_pt_calc_rfence_interval(vma, &amp;unbind_pt_update, entries,
+				   num_entries);
 
 	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 	if (!ifence)
 		return ERR_PTR(-ENOMEM);
 
+	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
+	if (!rfence) {
+		kfree(ifence);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	/*
 	 * Even if we were already evicted and unbind to destroy, we need to
 	 * clear again here. The eviction may have updated pagetables at a
@@ -1664,6 +1771,13 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	if (!IS_ERR(fence)) {
 		int err;
 
+		err = xe_range_fence_insert(&amp;vm-&gt;rftree[tile-&gt;id], rfence,
+					    &amp;xe_range_fence_kfree_ops,
+					    unbind_pt_update.base.start,
+					    unbind_pt_update.base.last, fence);
+		if (err)
+			dma_fence_wait(fence, false);
+
 		/* TLB invalidation must be done before signaling unbind */
 		err = invalidation_fence_init(tile-&gt;primary_gt, ifence, fence, vma);
 		if (err) {
@@ -1685,6 +1799,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 				    unbind_pt_update.locked ? &amp;deferred : NULL);
 		vma-&gt;tile_present &amp;= ~BIT(tile-&gt;id);
 	} else {
+		kfree(rfence);
 		kfree(ifence);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6c216350084b..26d39de777aa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1229,6 +1229,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	INIT_LIST_HEAD(&amp;vm-&gt;preempt.engines);
 	vm-&gt;preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
+	for_each_tile(tile, xe, id)
+		xe_range_fence_tree_init(&amp;vm-&gt;rftree[id]);
+
 	INIT_LIST_HEAD(&amp;vm-&gt;extobj.list);
 
 	if (!(flags &amp; XE_VM_FLAG_MIGRATION)) {
@@ -1351,6 +1354,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	drm_gpuva_manager_destroy(&amp;vm-&gt;mgr);
 err_put:
 	dma_resv_fini(&amp;vm-&gt;resv);
+	for_each_tile(tile, xe, id)
+		xe_range_fence_tree_fini(&amp;vm-&gt;rftree[id]);
 	kfree(vm);
 	if (!(flags &amp; XE_VM_FLAG_MIGRATION)) {
 		xe_device_mem_access_put(xe);
@@ -1468,6 +1473,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 					      NULL);
 		}
 	}
+
 	xe_vm_unlock(vm, &amp;ww);
 
 	/*</pre>
    </blockquote>
    Spurious newline?<br>
    <blockquote type="cite"
      cite="mid:20230710221544.1882405-3-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
@@ -1495,6 +1501,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe-&gt;usm.num_vm_in_non_fault_mode--;
 	mutex_unlock(&amp;xe-&gt;usm.lock);
 
+	for_each_tile(tile, xe, id)
+		xe_range_fence_tree_fini(&amp;vm-&gt;rftree[id]);
+
 	xe_vm_put(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index edb3c99a9c81..37d57552d727 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -15,6 +15,7 @@
 
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
+#include "xe_range_fence.h"
 
 struct async_op_fence;
 struct xe_bo;
@@ -182,6 +183,12 @@ struct xe_vm {
 	 */
 	struct work_struct destroy_work;
 
+	/**
+	 * @rftree: range fence tree to track updates to page table structure.
+	 * Used to implement conflict tracking between independent bind engines.
+	 */
+	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
+
 	/** @extobj: bookkeeping for external objects. Protected by the vm lock */
 	struct {
 		/** @enties: number of external BOs attached this VM */</pre>
    </blockquote>
    <p>With that fixed, and fixing the error output from <br>
    </p>
    <pre class="panel-body test-result">In file included from ../drivers/gpu/drm/xe/xe_range_fence.c:7:
../drivers/gpu/drm/xe/xe_range_fence.c:18:10: error: no previous prototype for ‘xe_range_fence_tree_insert’ [-Werror=missing-prototypes]
   18 |        , xe_range_fence_tree);
      |          ^~~~~~~~~~~~~~~~~~~
../include/linux/interval_tree_generic.h:38:15: note: in definition of macro ‘INTERVAL_TREE_DEFINE’
   38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,         \
      |               ^~~~~~~~
../drivers/gpu/drm/xe/xe_range_fence.c:18:10: error: no previous prototype for ‘xe_range_fence_tree_remove’ [-Werror=missing-prototypes]
   18 |        , xe_range_fence_tree);
      |          ^~~~~~~~~~~~~~~~~~~
../include/linux/interval_tree_generic.h:65:15: note: in definition of macro ‘INTERVAL_TREE_DEFINE’
   65 | ITSTATIC void ITPREFIX ## _remove(ITSTRUCT *node,         \
      |               ^~~~~~~~
../drivers/gpu/drm/xe/xe_range_fence.c:47:6: error: no previous prototype for ‘xe_range_fence_cleanup’ [-Werror=missing-prototypes]
   47 | void xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
      |      ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Reviewed-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>

</pre>
    <p></p>
  </body>
</html>

--------------4rnAfZc6fulZ6jr2bfrUfA1E--
