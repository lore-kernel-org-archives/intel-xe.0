Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48784C001B0
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 05:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2467910E1BA;
	Wed,  5 Jul 2023 05:34:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE3010E1BA
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 05:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688535267; x=1720071267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blbLG5RdbSEOr2obms0K4TWyLBg/aaARoAah/g364ic=;
 b=U4re1wmzjRS7/oZwEgoYFX68hr7NwlqmawSKLvTCCWkbllIxAK6ay1jb
 3VrzcNVTBMKrMniQn32tDwYw8+UpcTMwu4HxrwExxIlnJxbSXuDMiheuy
 XIlSWuCgv4ymulMI6Rthb5m2H1VVZuAbVDe2El+IOQ0jSOqIplVmJrNTp
 KFAlW16siV918JsS6SiHNXsRZ5rACi6Tird/iAbSh0WR1ICjs7rfWcWjh
 DkgMGA8EUZDI6NjIcdSw+ircE7q7AASXIJuOq/MF1GXXF6uWL/qnIAYG0
 MoJxXUTu14WRWuFKoIt8GteHzKNSjXSlkgNdQGqKl+dqult3GqcY8VKOv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="360732103"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="360732103"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 22:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="863602205"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="863602205"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 22:34:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Jul 2023 22:34:39 -0700
Message-Id: <20230705053439.1442470-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705053439.1442470-1-matthew.brost@intel.com>
References: <20230705053439.1442470-1-matthew.brost@intel.com>
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

To fix this introduce a per VM interval tree to track cross engine
conflicts. In the above example bind A would insert an dependency in the
interval tree with a key of 0x0-0x7fffffffff, bind B would find that
dependency and its bind job would scheduled behind the unsatisfied
in-fence and bind A's job.

v2: Use interval tree, proper cleanup, fix build

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c      |  3 +
 drivers/gpu/drm/xe/xe_migrate.c         | 93 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_sched_job.h       | 14 ++++
 drivers/gpu/drm/xe/xe_sched_job_types.h | 15 ++++
 drivers/gpu/drm/xe/xe_vm.c              |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h        |  5 ++
 6 files changed, 128 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 86c445903560..1a57d22df99b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -682,6 +682,9 @@ static void guc_engine_free_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
 	trace_xe_sched_job_free(job);
+
+	if (xe_sched_job_is_bind(job))
+		xe_sched_job_trigger_bind_cleanup(job);
 	xe_sched_job_put(job);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b2fa2cb5f537..367149c3a0ee 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -6,6 +6,7 @@
 #include "xe_migrate.h"
 
 #include <linux/bitfield.h>
+#include <linux/interval_tree_generic.h>
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
@@ -1109,6 +1110,33 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
 	return true;
 }
 
+#define JOB_RES_START(_job)	((_job)->bind_args.start)
+#define JOB_RES_LAST(_job)	((_job)->bind_args.last)
+INTERVAL_TREE_DEFINE(struct xe_sched_job, bind_args.rb, u64,
+		     bind_args.subtree_last, JOB_RES_START, JOB_RES_LAST,
+		     static, xe_dep_job_itree);
+
+static void remove_dep_job(struct rb_root_cached *itree,
+                           struct xe_sched_job *dep_job)
+{
+	xe_dep_job_itree_remove(dep_job, itree);
+	dma_fence_put(dep_job->fence);
+	xe_sched_job_put(dep_job);
+}
+
+static void cleanup_dep_job_work_func(struct work_struct *w)
+{
+	struct xe_sched_job *job = container_of(w, struct xe_sched_job,
+						bind_args.cleanup_work);
+	struct xe_vm *vm = job->engine->vm;
+
+	xe_vm_get(vm);
+	down_write(&vm->lock);
+	remove_dep_job(&vm->itree[job->bind_args.tile_id], job);
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+}
+
 /**
  * xe_migrate_update_pgtables() - Pipelined page-table update
  * @m: The migrate context.
@@ -1150,8 +1178,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
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
@@ -1161,9 +1189,36 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	bool usm = !eng && xe->info.supports_usm;
 	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
 	struct xe_engine *eng_override = !eng ? m->eng : eng;
+	int level = 0;
+	bool found_dep = false;
+	unsigned long index, last;
+
+	/* Setup inter-engine dep args */
+	for (i = 0; i < num_updates; i++) {
+		const struct xe_vm_pgtable_update *update = &updates[i];
+
+		if (update->pt->level > level)
+			level = update->pt->level;
+	}
+	index = ALIGN_DOWN(vma->start, 0x1ull << xe_pt_shift(level));
+	last = ALIGN(vma->end, 0x1ull << xe_pt_shift(level)) - 1;
+
+	/* Find inter-engine deps */
+	dep_job = xe_dep_job_itree_iter_first(&vm->itree[tile->id], index,
+					      last);
+	while (dep_job) {
+		dep_fence = dep_job->fence;
+
+		if (!dma_fence_is_signaled(dep_fence) &&
+		    eng_override != dep_job->engine)
+			found_dep = true;
+
+		dep_job = xe_dep_job_itree_iter_next(dep_job, index, last);
+	}
 
 	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(syncs, num_syncs) && xe_engine_is_idle(eng_override)) {
+	if (no_in_syncs(syncs, num_syncs) && xe_engine_is_idle(eng_override) &&
+	    !found_dep) {
 		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
 							num_updates,
 							first_munmap_rebind,
@@ -1293,11 +1348,39 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (err)
 		goto err_job;
 
+	/* Add inter-engine dep */
+	dep_job = xe_dep_job_itree_iter_first(&vm->itree[tile->id], index,
+					      last);
+	while (dep_job) {
+		dep_fence = dep_job->fence;
+
+		if (!dma_fence_is_signaled(dep_fence) &&
+		    eng_override != dep_job->engine) {
+			dma_fence_get(dep_fence);
+			err = drm_sched_job_add_dependency(&job->drm,
+							   dep_fence);
+			if (err)
+				goto err_job;
+		}
+
+		dep_job = xe_dep_job_itree_iter_next(dep_job, index, last);
+	}
+
+	/* Insert this job's inter-engine dep */
+	job->bind_args.start = index;
+	job->bind_args.last = last;
+	job->bind_args.tile_id = tile->id;
+	INIT_WORK(&job->bind_args.cleanup_work, cleanup_dep_job_work_func);
+	dma_fence_get(job->fence);
+	xe_sched_job_get(job);
+	xe_dep_job_itree_insert(job, &vm->itree[tile->id]);
+
 	if (ops->pre_commit) {
 		err = ops->pre_commit(pt_update);
 		if (err)
-			goto err_job;
+			goto err_itree;
 	}
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -1310,6 +1393,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	return fence;
 
+err_itree:
+	remove_dep_job(&vm->itree[tile->id], job);
 err_job:
 	xe_sched_job_put(job);
 err_bb:
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 5315ad8656c2..dec2e07e524b 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -6,6 +6,7 @@
 #ifndef _XE_SCHED_JOB_H_
 #define _XE_SCHED_JOB_H_
 
+#include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
 #define XE_SCHED_HANG_LIMIT 1
@@ -73,4 +74,17 @@ xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32 flags)
 
 bool xe_sched_job_is_migration(struct xe_engine *e);
 
+static inline bool
+xe_sched_job_is_bind(struct xe_sched_job *job)
+{
+	return !!job->bind_args.last;
+}
+
+static inline void
+xe_sched_job_trigger_bind_cleanup(struct xe_sched_job *job)
+{
+	XE_WARN_ON(!xe_sched_job_is_bind(job));
+	queue_work(system_wq, &job->bind_args.cleanup_work);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 5534bfacaa16..1e2581efd9f4 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -37,6 +37,21 @@ struct xe_sched_job {
 		/** @value: write back value */
 		u64 value;
 	} user_fence;
+	/** @bind_args: if a bind job, the bind arguments */
+	struct {
+		/** @start: start of a bind job stored in a itree */
+		u64 start;
+		/** @last: last of a bind job stored in a itree */
+		u64 last;
+		/** @rb: RB node for itree to track deps for bind jobs */
+		struct rb_node rb;
+		/** @subtree_last: needed for itree lookup */
+		u64 subtree_last;
+		/** @cleanup_work: worker to cleanup bind job */
+		struct work_struct cleanup_work;
+		/** @tile_id: tile id of bind job */
+		u8 tile_id;
+	} bind_args;
 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
 	u32 migrate_flush_flags;
 	/** @batch_addr: batch buffer address of job */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dbff75a9087b..382c896ac250 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1233,6 +1233,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		    tile->id != XE_VM_FLAG_GT_ID(flags))
 			continue;
 
+		vm->itree[id] = RB_ROOT_CACHED;
+
 		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
 		if (IS_ERR(vm->pt_root[id])) {
 			err = PTR_ERR(vm->pt_root[id]);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c148dd49a6ca..97151e4fd314 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -160,6 +160,11 @@ struct xe_vm {
 
 	struct kref refcount;
 
+	/**
+	 * @itree: the interval tree to track of conflicts between bind engines
+	 */
+	struct rb_root_cached itree[XE_MAX_TILES_PER_DEVICE];
+
 	/* engine used for (un)binding vma's */
 	struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
 
-- 
2.34.1

