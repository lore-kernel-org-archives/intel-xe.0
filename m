Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0721BC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 05:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72E410E3DA;
	Tue, 23 May 2023 05:44:10 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE4910E3DA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 05:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684820637; x=1716356637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HuYx5cuJcDzsuOocqhn42P/oiiS4wkPFGnusP2/SStE=;
 b=Cq6tG87+Xz1Got8ue4CpQL3U9QrtMFBq16XmI4dNskqOO057jX6D1PLb
 koQP0hRe9Lsxf6kNqkRtr8jAA2mf957OQGGnPH4M1LgVBS4WsWaoVKV2O
 kFgFttV+lSmzwCzDO717QHAdgPGJvevQD9wrLDLAY7H11E0uxTwvp2OgR
 rwE4job8Cyy/TMluRDiAFblGA1k0VKnSwC7oGtNXZhcBNqZxAmZcOQHl6
 onho+tmw81aqaE6tyYWOU+uXw7H9Ev0L8ZZE9wi5CeuhqXKLq1PYD2HZ1
 ov0w3lEWmW7p4/ewpLpjLWp63hk6IMXZ6nUDb0H6zE23EnEY2Qfi4QKTU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="439489815"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="439489815"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 22:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="1033910193"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="1033910193"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 22:43:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 22 May 2023 22:44:04 -0700
Message-Id: <20230523054404.4011148-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523054404.4011148-1-matthew.brost@intel.com>
References: <20230523054404.4011148-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 8/8] drm/xe: VM LRU bulk move
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

Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
LRU position on every exec.

v2: Bulk move for compute VMs, remove bulk LRU in xe_gem_object_free

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 24 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
 drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
 drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
 drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 6 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..22cf65bd63fe 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -968,6 +968,16 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 static void xe_gem_object_free(struct drm_gem_object *obj)
 {
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	if (bo->vm && !xe_vm_in_fault_mode(bo->vm) && xe_bo_is_user(bo)) {
+		struct ww_acquire_ctx ww;
+
+		xe_bo_lock(bo, &ww, 0, false);
+		ttm_bo_set_bulk_move(&bo->ttm, NULL);
+		xe_bo_unlock(bo, &ww);
+	}
+
 	/* Our BO reference counting scheme works as follows:
 	 *
 	 * The gem object kref is typically used throughout the driver,
@@ -1081,8 +1091,8 @@ void xe_bo_free(struct xe_bo *bo)
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_gt *gt, struct dma_resv *resv,
-				    size_t size, enum ttm_bo_type type,
-				    u32 flags)
+				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    enum ttm_bo_type type, u32 flags)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1149,7 +1159,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		return ERR_PTR(err);
 
 	bo->created = true;
-	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, bulk);
+	else
+		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
 
 	return bo;
 }
@@ -1219,7 +1232,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		}
 	}
 
-	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
+	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
+				   vm && !xe_vm_in_fault_mode(vm) &&
+				   flags & XE_BO_CREATE_USER_BIT ?
+				   &vm->lru_bulk_move : NULL, size,
 				   type, flags);
 	if (IS_ERR(bo))
 		return bo;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e111332c35a..f7562012b836 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_gt *gt, struct dma_resv *resv,
-				    size_t size, enum ttm_bo_type type,
-				    u32 flags);
+				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    enum ttm_bo_type type, u32 flags);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_gt *gt, struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 9b252cc782b7..975dee1f770f 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	int ret;
 
 	dma_resv_lock(resv, NULL);
-	bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
+	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
 				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ff4df00f20a2..b2dcf34af16b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -395,6 +395,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
+	if (!err && !xe_vm_no_dma_fences(vm)) {
+		spin_lock(&xe->ttm.lru_lock);
+		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+		spin_unlock(&xe->ttm.lru_lock);
+	}
+
 err_repin:
 	if (!xe_vm_no_dma_fences(vm))
 		up_read(&vm->userptr.notifier_lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0398da1ef1e2..a5d65d0325d6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -629,6 +629,10 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 #undef retry_required
 
+	spin_lock(&vm->xe->ttm.lru_lock);
+	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+	spin_unlock(&vm->xe->ttm.lru_lock);
+
 	/* Point of no return. */
 	arm_preempt_fences(vm, &preempt_fences);
 	resume_and_reinstall_preempt_fences(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fada7896867f..d3e99f22510d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -164,6 +164,9 @@ struct xe_vm {
 	/** Protects @rebind_list and the page-table structures */
 	struct dma_resv resv;
 
+	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
+	struct ttm_lru_bulk_move lru_bulk_move;
+
 	u64 size;
 	struct rb_root vmas;
 
-- 
2.34.1

