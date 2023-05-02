Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6F6C7EE21
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876F710E3FD;
	Tue,  2 May 2023 00:17:30 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4171310E3FD
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986649; x=1714522649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HsnEKWLJVwq9bWb135vVFr9tcUTatvuSTfhCs52aJY=;
 b=LDLxB2U1R7+LoAIIMuROsa8opEaSWoR9Xa5tX2NiwZIwNA1kDyZWm+ZJ
 A/TC7Ud6FFUtCKb21Ey8bnxd2YtGozpgWqfvHi/oajpbvFDkrghp3t/eO
 SRRFranUoSBNpK4zHg5Xcvquah2k9VBDtSiXPWrllc7b3+j2ZRVak1nEu
 xa9Nf+n1NOt3nSVsg7rX9aNPUS26wZ2LtyKzLmPq1hfjub9Os2yVKfHQK
 bJloqRc5jYPr9aussHcvWV19fmCcKy7PV48cVlf7LDlZ/GYacEhHAxhs/
 Q6YYeSQ/jCDW892bPWc9X3wpCTdZGxYdONIYWbHhpI1kizBDPNUvziVlt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619568"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619568"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541684"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541684"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:04 -0700
Message-Id: <20230502001727.3211096-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
 drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
 drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 5 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..da99ee53e7d7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
 }
 
+static void xe_gem_object_close(struct drm_gem_object *obj,
+				struct drm_file *file_priv)
+{
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
+		struct ww_acquire_ctx ww;
+
+		XE_BUG_ON(!xe_bo_is_user(bo));
+
+		xe_bo_lock(bo, &ww, 0, false);
+		ttm_bo_set_bulk_move(&bo->ttm, NULL);
+		xe_bo_unlock(bo, &ww);
+	}
+}
+
+
 static bool should_migrate_to_system(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
@@ -1040,6 +1057,7 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
+	.close = xe_gem_object_close,
 	.mmap = drm_gem_ttm_mmap,
 	.export = xe_gem_prime_export,
 	.vm_ops = &xe_gem_vm_ops,
@@ -1081,8 +1099,8 @@ void xe_bo_free(struct xe_bo *bo)
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_gt *gt, struct dma_resv *resv,
-				    size_t size, enum ttm_bo_type type,
-				    u32 flags)
+				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    enum ttm_bo_type type, u32 flags)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1149,7 +1167,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		return ERR_PTR(err);
 
 	bo->created = true;
-	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, bulk);
+	else
+		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
 
 	return bo;
 }
@@ -1219,7 +1240,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		}
 	}
 
-	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
+	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
+				   vm && !xe_vm_no_dma_fences(vm) &&
+				   flags & XE_BO_CREATE_USER_BIT ?
+				   &vm->lru_bulk_move : NULL, size,
 				   type, flags);
 	if (IS_ERR(bo))
 		return bo;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8354d05ccdf3..25457b3c757b 100644
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
index 44ea9bcd0066..21a9c2fddf86 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -374,6 +374,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

