Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7FBC76195
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 01:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6EC10E424;
	Tue, 28 Mar 2023 01:54:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6E710E428
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 01:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679968487; x=1711504487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ofg+KBmssiLRcTgbJPjxj3gQj1amM1JjptLjjOKbHoc=;
 b=KtsKzKRuF+Y+j957+Erfifrq59lStD8CxAnhcWPg5/lCB0SSj2gttcS9
 laTbUIvTFfezUCGkbuBiJWM85Ya+Gn0ggqbCrUIRagG8v+GH7BAfB6w03
 UDvf89n663pAipCbMIN6HiFGU4um6AEWaq4nwsQQ75wH5pQKB1k9P7XEP
 17Z1N/GTIhFxEsZnfuvhOFDnxudj0B3a78reExpSDpNd9YqgdU/+s8HjX
 xsJoUsSmVwGFmN/eA4ibagvuPnEdnf+Itu0eJO2Fdet1A9gyfJY4D2g4h
 PceKtkM0Y3mdP/Uk+zNRrTee6MFSMgeTPgiW6019U+Un9IjlfRu1HI6cF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328889389"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="328889389"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 18:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="677173390"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="677173390"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 18:54:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 27 Mar 2023 18:54:50 -0700
Message-Id: <20230328015450.1731183-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328015450.1731183-1-matthew.brost@intel.com>
References: <20230328015450.1731183-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: VM LRU bulk move
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
index e4d079b61d52..0b9c3d320b67 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -856,6 +856,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
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
@@ -911,6 +928,7 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
+	.close = xe_gem_object_close,
 	.mmap = drm_gem_ttm_mmap,
 	.export = xe_gem_prime_export,
 	.vm_ops = &xe_gem_vm_ops,
@@ -952,8 +970,8 @@ void xe_bo_free(struct xe_bo *bo)
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_gt *gt, struct dma_resv *resv,
-				    size_t size, enum ttm_bo_type type,
-				    u32 flags)
+				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    enum ttm_bo_type type, u32 flags)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1021,7 +1039,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		return ERR_PTR(err);
 
 	bo->created = true;
-	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, bulk);
+	else
+		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
 
 	return bo;
 }
@@ -1091,7 +1112,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
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
index 9b26049521de..b580920cbfe9 100644
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
index ea869f2452ef..9ccc597f0ac9 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -366,6 +366,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

