Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F605C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FFA10E985;
	Thu,  5 Jun 2025 15:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aosZoZzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62F210E8A8
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4xzk8I8R6qtMVvnjf3IxNGbs6LwU4OBxwMmYirIeUYU=;
 b=aosZoZzTD8+0M/5+0Es/7meHVZhlC65o9vo19vHlcwt5O4HXBUSZbPeZ
 9b93QyWaXc7+dGf2hEsHbrVEPSedhRc1HUBJ/kC5finrj/3GqBlQnnbs6
 QnP5+CIekGxep6/7JVDAm+NXp2m9q369zsp8IDJgjx+70AxYclAEBJraB
 SlHG9cdB4HUms2Ma4AXUdGoF7zrRdRYj+KSlt2wNIn4BIb2OV3HzZhqyR
 Ga4sL6KkCY/zMB5/fKCYYuwP5MI+riOhRej08PNMnbiiLewwvs+3SAXR7
 671U/FTB2eMU/upO6GLp2sp1o9lPyb6QMaDTx9+25DwGbF6bsh0pRulHF w==;
X-CSE-ConnectionGUID: bz0kZvmqSc6oG4FkMJUFQQ==
X-CSE-MsgGUID: e/Z/8lu6Q8qklcHP2pr9DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529488"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:51 -0700
X-CSE-ConnectionGUID: y6JoaqEfQMeKMeRun8rnSg==
X-CSE-MsgGUID: KJIfP/yqSR+pUY+HJy/0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502804"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 05/15] drm/xe: Don't use migrate exec queue for page fault
 binds
Date: Thu,  5 Jun 2025 08:32:13 -0700
Message-Id: <20250605153223.2789122-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Now that the CPU is always used for binds even in jobs, CPU bind jobs
can pass GPU jobs in the same exec queue resulting dma-fences signaling
out-of-order. Use a dedicated exec queue for binds issued from page
faults to avoid ordering issues and avoid blocking kernel binds on
unrelated copies / clears.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 27 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_migrate.h |  2 +-
 drivers/gpu/drm/xe/xe_vm.c      | 17 +++++++++++------
 3 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9b17feb8bae6..6b6dff9d4aaa 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -41,6 +41,8 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
+	/** @bind_q: Default exec queue used for binds */
+	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -79,16 +81,16 @@ struct xe_migrate {
 #define MAX_PTE_PER_SDI 0x1FE
 
 /**
- * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
+ * xe_tile_migrate_bind_exec_queue() - Get this tile's migrate bind exec queue.
  * @tile: The tile.
  *
- * Returns the default migrate exec queue of this tile.
+ * Returns the default migrate bind exec queue of this tile.
  *
- * Return: The default migrate exec queue
+ * Return: The default migrate bind exec queue
  */
-struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile)
 {
-	return tile->migrate->q;
+	return tile->migrate->bind_q;
 }
 
 static void xe_migrate_fini(void *arg)
@@ -104,6 +106,8 @@ static void xe_migrate_fini(void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	if (m->bind_q)
+		xe_exec_queue_put(m->bind_q);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
@@ -410,6 +414,15 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
+		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
+						 EXEC_QUEUE_FLAG_KERNEL |
+						 EXEC_QUEUE_FLAG_PERMANENT |
+						 EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
+		if (IS_ERR(m->bind_q)) {
+			xe_vm_close_and_put(vm);
+			return ERR_CAST(m->bind_q);
+		}
+
 		/*
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
 		 * PVC, may want to revisit if performance is needed.
@@ -425,6 +438,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 						  EXEC_QUEUE_FLAG_PERMANENT, 0);
 	}
 	if (IS_ERR(m->q)) {
+		if (m->bind_q)
+			xe_exec_queue_put(m->bind_q);
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->q);
 	}
@@ -1270,7 +1285,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	struct xe_tile *tile = m->tile;
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	bool is_migrate = pt_update_ops->q == m->q;
+	bool is_migrate = pt_update_ops->q == m->bind_q;
 	int err;
 
 	job = xe_sched_job_create(pt_update_ops->q, NULL);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index b78bdd11d496..3131875341c9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -134,5 +134,5 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6fc01fdd7286..0285938a4bb2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -895,7 +895,9 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	struct xe_vma *vma, *next;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
-	int err, i;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
 
 	lockdep_assert_held(&vm->lock);
 	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
@@ -903,8 +905,11 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		return 0;
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
-		vops.pt_update_ops[i].wait_vm_bookkeep = true;
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[id].q =
+			xe_tile_migrate_bind_exec_queue(tile);
+	}
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
@@ -961,7 +966,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_tile_migrate_exec_queue(tile);
+			xe_tile_migrate_bind_exec_queue(tile);
 	}
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
@@ -1051,7 +1056,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_tile_migrate_exec_queue(tile);
+			xe_tile_migrate_bind_exec_queue(tile);
 	}
 
 	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
@@ -1134,7 +1139,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_tile_migrate_exec_queue(tile);
+			xe_tile_migrate_bind_exec_queue(tile);
 	}
 
 	err = xe_vm_ops_add_range_unbind(&vops, range);
-- 
2.34.1

