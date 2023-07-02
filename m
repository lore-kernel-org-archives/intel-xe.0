Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B132EB64DA
	for <intel-xe@archiver.kernel.org>; Sun,  2 Jul 2023 22:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F40C10E031;
	Sun,  2 Jul 2023 22:17:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBBD10E011
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Jul 2023 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688336222; x=1719872222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZOrovH2IjUVa8pePyeCuuMGMmdYVpaiAy90y2WSPKXo=;
 b=GWLNhGmkvzR+4IQ+mO99m1voVgxRCW+At59Rb6LrJC8vPBpRdnFwjIbN
 48RddELwm+Jw3y2o4gASGmBcLLJXDS8Z98XPfkvSor7JBEtLH873Fcv0z
 VfcToGbGsaN4/3Ua95yLouGfF6Elw+RxgtZXqxG5dIMIB8mQjbF1l4YIC
 FIZvydi6Q4GOGhM1JpAmdtlnD8i0RLPq8h+F9sq0PbjyycFI+YSjzIZuT
 80NK1+RCJDXCC1FJEsR9rVIm6lGysUdw/PjP4uBZo7nQ/2U08bvV8lzb0
 xFO/OE8O2q16ivuqxs66WVO85tScj0q0qYazOxtypbjVy/mkUEa9j6MK5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426428700"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="426428700"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2023 15:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="783678537"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="783678537"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2023 15:17:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun,  2 Jul 2023 15:17:10 -0700
Message-Id: <20230702221710.1332629-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702221710.1332629-1-matthew.brost@intel.com>
References: <20230702221710.1332629-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Make bind engines safe
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

We currently have a race between bind engines which can result in
corrupted page tables leading to faults.

A simple example:
bind A 0x0000-0x1000, engine A, has unsatisfied in-fence
bind B 0x1000-0x2000, engine B, no in-fences
exec A uses 0x1000-0x2000

Bind B will pass bind A and exec A will fault. This occurs as bind A
programs the root of the page table in a bind job which is held up by an
in-fence. Bind B in this case just programs a leaf entry of the
structure.

To fix this introduce a per VM maple tree to track cross engine
conflicts. In the above example bind A would insert an dependency in the
maple tree with a key of 0x0-0x7fffffffff, bind B would find that
dependency and its bind job would scheduled behind the unsatisfied
in-fence and bind A's job.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c         | 76 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_sched_job_types.h |  7 +++
 drivers/gpu/drm/xe/xe_vm.c              | 18 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h        |  6 ++
 4 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b2fa2cb5f537..efcbb3909b2e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1109,6 +1109,14 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
 	return true;
 }
 
+static void remove_dep_job(struct maple_tree *mtree,
+			   struct xe_sched_job *dep_job)
+{
+	mtree_erase(mtree, dep_job->bind_args.index);
+	dma_fence_put(dep_job->fence);
+	xe_sched_job_put(dep_job);
+}
+
 /**
  * xe_migrate_update_pgtables() - Pipelined page-table update
  * @m: The migrate context.
@@ -1150,8 +1158,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	struct xe_tile *tile = m->tile;
 	struct xe_gt *gt = tile->primary_gt;
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_sched_job *job;
-	struct dma_fence *fence;
+	struct xe_sched_job *job, *dep_job;
+	struct dma_fence *fence, *dep_fence;
 	struct drm_suballoc *sa_bo = NULL;
 	struct xe_vma *vma = pt_update->vma;
 	struct xe_bb *bb;
@@ -1161,9 +1169,31 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	bool usm = !eng && xe->info.supports_usm;
 	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
 	struct xe_engine *eng_override = !eng ? m->eng : eng;
+	int level = 0;
+	bool found_dep = false;
+	unsigned long index, last;
+
+	/* Find inter-engine deps */
+	for (i = 0; i < num_updates; i++) {
+		const struct xe_vm_pgtable_update *update = &updates[i];
+
+		if (update->pt->level > level)
+			level = update->pt->level;
+	}
+	index = ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
+	last = ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
+	mt_for_each(&vm->mtree[tile->id], dep_job, index, last) {
+		dep_fence = dep_job->fence;
+
+		if (dma_fence_is_signaled(dep_fence))
+			remove_dep_job(&vm->mtree[tile->id], dep_job);
+		else if (eng_override != dep_job->engine)
+			found_dep = true;
+	}
 
 	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(syncs, num_syncs) && xe_engine_is_idle(eng_override)) {
+	if (no_in_syncs(syncs, num_syncs) && xe_engine_is_idle(eng_override) &&
+	    !found_dep) {
 		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
 							num_updates,
 							first_munmap_rebind,
@@ -1293,11 +1323,47 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (err)
 		goto err_job;
 
+	/* Add inter-engine dep */
+	index = ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
+	last = ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
+	job->bind_args.index = index;
+	job->bind_args.last = last;
+	mt_for_each(&vm->mtree[tile->id], dep_job, index, last) {
+		dep_fence = dep_job->fence;
+
+		if (dma_fence_is_signaled(dep_fence)) {
+			remove_dep_job(&vm->mtree[tile->id], dep_job);
+		} else {
+			if (eng_override != dep_job->engine) {
+				dma_fence_get(dep_fence);
+				err = drm_sched_job_add_dependency(&job->drm,
+								   dep_fence);
+				if (err)
+					goto err_job;
+			}
+
+			if (dep_job->bind_args.index < job->bind_args.index)
+				job->bind_args.index = dep_job->bind_args.index;
+			if (dep_job->bind_args.last > job->bind_args.last)
+				job->bind_args.last = dep_job->bind_args.last;
+
+			remove_dep_job(&vm->mtree[tile->id], dep_job);
+		}
+	}
+	err = mtree_insert_range(&vm->mtree[tile->id], job->bind_args.index,
+				 job->bind_args.last, job, GFP_KERNEL);
+	if (err)
+		goto err_job;
+
+	dma_fence_get(job->fence);
+	xe_sched_job_get(job);
+
 	if (ops->pre_commit) {
 		err = ops->pre_commit(pt_update);
 		if (err)
-			goto err_job;
+			goto err_mtree;
 	}
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -1310,6 +1376,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	return fence;
 
+err_mtree:
+	remove_dep_job(&vm->mtree[tile->id], job);
 err_job:
 	xe_sched_job_put(job);
 err_bb:
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 5534bfacaa16..246313926e05 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -37,6 +37,13 @@ struct xe_sched_job {
 		/** @value: write back value */
 		u64 value;
 	} user_fence;
+	/** @bind_args: if a bind job, the bind arguments */
+	struct {
+		/** @index: index of job a bind job stored in a mtree */
+		unsigned long index;
+		/** @last: last of job a bind job stored in a mtree */
+		unsigned long last;
+	} bind_args;
 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
 	u32 migrate_flush_flags;
 	/** @batch_addr: batch buffer address of job */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dbff75a9087b..711d79e5fd3e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1233,6 +1233,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		    tile->id != XE_VM_FLAG_GT_ID(flags))
 			continue;
 
+		mt_init(&vm->mtree[id]);
+
 		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
 		if (IS_ERR(vm->pt_root[id])) {
 			err = PTR_ERR(vm->pt_root[id]);
@@ -1402,6 +1404,21 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 
 	down_write(&vm->lock);
+
+	for_each_tile(tile, xe, id) {
+		struct xe_sched_job *job;
+		unsigned long index = 0, max = ULONG_MAX;
+
+		if (!vm->pt_root[id])
+			continue;
+
+		mt_for_each(&vm->mtree[id], job, index, max) {
+			mtree_erase(&vm->mtree[tile->id], job->bind_args.index);
+			dma_fence_put(job->fence);
+			xe_sched_job_put(job);
+		}
+	}
+
 	xe_vm_lock(vm, &ww, 0, false);
 	while (vm->vmas.rb_node) {
 		struct xe_vma *vma = to_xe_vma(vm->vmas.rb_node);
@@ -1507,6 +1524,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	xe_vm_lock(vm, &ww, 0, false);
 	for_each_tile(tile, xe, id) {
 		if (vm->pt_root[id]) {
+			mtree_destroy(&vm->mtree[id]);
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 			vm->pt_root[id] = NULL;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c148dd49a6ca..e313ecfa1aa0 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/dma-resv.h>
 #include <linux/kref.h>
+#include <linux/maple_tree.h>
 #include <linux/mmu_notifier.h>
 #include <linux/scatterlist.h>
 
@@ -160,6 +161,11 @@ struct xe_vm {
 
 	struct kref refcount;
 
+	/**
+	 * @mtree: the &maple_tree to track of conflicts between bind engines
+	 */
+	struct maple_tree mtree[XE_MAX_TILES_PER_DEVICE];
+
 	/* engine used for (un)binding vma's */
 	struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
 
-- 
2.34.1

