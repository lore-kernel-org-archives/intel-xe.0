Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C23C9832B
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F9D10F85C;
	Fri, 25 Sep 2026 04:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UESymPg9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D1610E44C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312012; x=1821848012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udDKsaKwviJwThMgYP/k1suXGKHfQdFRJI2nmTnpFcw=;
 b=UESymPg9W/W3DvdGzp3DnbYGqo78ZZPqMSmlp1oQ6W5ECtXTnl6A6hdk
 Kz8yZK1ASMntuAM53OjudGL8fdolHh7amh68e1uJL3k27zs5HFKn1OZpr
 Ng9S6We5JPP5R5hgR6DWybJDuj9WAGhAFv/EQJqOQVVxGoM7mcfQyRj7H
 YTG/3JV7ENa1TcTdLFpuRt1qhXtgDBbJhoFRpYIUkj97kalkzre/paRz4
 BcZ6dbkjWiLfJdZ/pPY1H+svwBNcnvcOxC9GbR8EXyS66kT5exJiGDpgf
 JzAnuovFT5Rz1t82SOpSVw2lXetLDATu+YSLRUutJ33corXfqyRQG11Yr w==;
X-CSE-ConnectionGUID: /xDJ50cbRGCMKcan6PMcaQ==
X-CSE-MsgGUID: 0uGD+d+3T6+Aqjq7YDIEbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156225"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
X-CSE-ConnectionGUID: /VhZUndmS8yaGZLt4kG0xg==
X-CSE-MsgGUID: xQVbes40SFe1BPdZpAnmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155526"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 12/24] drm/xe: Don't use migrate exec queue for page fault
 binds
Date: Thu, 24 Sep 2026 21:53:08 -0700
Message-Id: <20260925045320.1325860-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 47 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c      | 17 +++++++-----
 3 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3007fe0b8535..d8d35671a190 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -51,6 +51,8 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
+	/** @bind_q: Default exec queue used for binds */
+	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -115,6 +117,7 @@ static void xe_migrate_fini(void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	xe_exec_queue_put(m->bind_q);
 }
 
 static inline u16 xe_migrate_pat_index(struct xe_device *xe,
@@ -504,6 +507,15 @@ int xe_migrate_init(struct xe_migrate *m)
 			goto err_out;
 		}
 
+		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
+						 EXEC_QUEUE_FLAG_KERNEL |
+						 EXEC_QUEUE_FLAG_HIGH_PRIORITY |
+						 EXEC_QUEUE_FLAG_MIGRATE, 0);
+		if (IS_ERR(m->bind_q)) {
+			err = PTR_ERR(m->bind_q);
+			goto err_out;
+		}
+
 		/*
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
 		 * PVC, may want to revisit if performance is needed.
@@ -514,6 +526,15 @@ int xe_migrate_init(struct xe_migrate *m)
 					    EXEC_QUEUE_FLAG_MIGRATE |
 					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
 	} else {
+		m->bind_q = xe_exec_queue_create_class(xe, primary_gt, vm,
+						       XE_ENGINE_CLASS_COPY,
+						       EXEC_QUEUE_FLAG_KERNEL |
+						       EXEC_QUEUE_FLAG_MIGRATE, 0);
+		if (IS_ERR(m->bind_q)) {
+			err = PTR_ERR(m->bind_q);
+			goto err_out;
+		}
+
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
 						  EXEC_QUEUE_FLAG_KERNEL |
@@ -549,6 +570,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	return err;
 
 err_out:
+	if (!IS_ERR_OR_NULL(m->bind_q))
+		xe_exec_queue_put(m->bind_q);
 	xe_vm_close_and_put(vm);
 	return err;
 
@@ -1505,6 +1528,17 @@ static u32 blt_mem_set_cmd_len(struct xe_device *xe)
 	return 7;
 }
 
+/**
+ * xe_get_migrate_bind_queue() - Get the bind queue from migrate context.
+ * @migrate: Migrate context.
+ *
+ * Return: Pointer to bind queue on success, error on failure
+ */
+struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate)
+{
+	return migrate->bind_q;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1891,6 +1925,11 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	return dma_fence_get_stub();
 }
 
+static bool is_migrate_queue(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	return m->bind_q == q;
+}
+
 static struct dma_fence *
 __xe_migrate_update_pgtables(struct xe_migrate *m,
 			     struct xe_migrate_pt_update *pt_update,
@@ -1908,7 +1947,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	u32 num_updates = 0, current_update = 0;
 	u64 addr;
 	int err = 0;
-	bool is_migrate = pt_update_ops->q == m->q;
+	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
 	bool usm = is_migrate && xe->info.has_usm;
 
 	for (i = 0; i < pt_update_ops->num_ops; ++i) {
@@ -2630,7 +2669,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
  */
 void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
 {
-	bool is_migrate = q == m->q;
+	bool is_migrate = is_migrate_queue(m, q);
 
 	if (is_migrate)
 		mutex_lock(&m->job_mutex);
@@ -2648,7 +2687,7 @@ void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
  */
 void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
 {
-	bool is_migrate = q == m->q;
+	bool is_migrate = is_migrate_queue(m, q);
 
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
@@ -2665,7 +2704,7 @@ void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
 {
 	struct xe_migrate *m = gt_to_tile(q->gt)->migrate;
 
-	xe_gt_assert(q->gt, q == m->q);
+	xe_gt_assert(q->gt, q == m->bind_q);
 	lockdep_assert_held(&m->job_mutex);
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index c41f6e3ca2c6..e6b7070134e1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -146,6 +146,7 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
+struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate);
 struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
 					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
 					     u64 size, enum xe_migrate_copy_dir dir);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a441c5a2a8c9..c0d8c0e266a3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -796,7 +796,9 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	struct xe_vma *vma, *next;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
-	int err, i;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
 
 	lockdep_assert_held(&vm->lock);
 	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
@@ -804,8 +806,11 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		return 0;
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
-		vops.pt_update_ops[i].wait_vm_bookkeep = true;
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[id].q =
+			xe_migrate_bind_queue(tile->migrate);
+	}
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
@@ -863,7 +868,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_migrate_bind_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
@@ -955,7 +960,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_migrate_bind_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
@@ -1039,7 +1044,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_migrate_bind_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_range_unbind(&vops, range);
-- 
2.34.1

