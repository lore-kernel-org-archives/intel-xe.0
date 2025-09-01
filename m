Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45108CA0FFF
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 16:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0158910E149;
	Mon,  1 Sep 2025 16:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MExzxc6G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB1B10E4EF
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756743218; x=1788279218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KMzDbdPMYHzzgowO+2Tb+LkL851e9JghOuMW/CFfv/4=;
 b=MExzxc6G1ctCD1+Aicr/da/BRLIBDwn8idc+Rj8kybMqqesY7jmnWNW/
 jKd6fjYfz6/c9MwUf1VFa50t+8Dz0xMdGNy2JdtE5v7gzIVL4u8qDL/VT
 GD4dR+pfOFjroKwuMoUiWA8H+hVXNnRlmhBgEZCVp5CUp0JMttwjB697h
 0XNpYZU6XuVtAI8y10CXyDFuFlcT+n8s76AnKcdYmwqemWkhV65ekTXMM
 D8Xuc/xFn5WKcD4mXgwWYStHU11hDaolWV/BQN8vNXMBBFz6n6r2hTEkz
 jUNcwxa6PI7FONqWiH9j+uTYlU6tEa3XBR1GLao1K4+5Oes2af5xHFRnn A==;
X-CSE-ConnectionGUID: weJHPX0bQSGU5cNWEdjLAQ==
X-CSE-MsgGUID: e4E1OyzVRoCCS6mrr0UbVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58204369"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58204369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:37 -0700
X-CSE-ConnectionGUID: xoBr7SQLSLeJoIt6yMKG+w==
X-CSE-MsgGUID: qDx1DFUkTjKQo4d+zyokLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171215199"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 09/14] drm/xe: Rename ___xe_bo_create_locked()
Date: Mon,  1 Sep 2025 18:12:44 +0200
Message-ID: <20250901161250.5279-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
References: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Don't start external function names with underscores.
Rename to xe_bo_init_locked().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 39 ++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_bo.h      | 10 ++++-----
 drivers/gpu/drm/xe/xe_dma_buf.c |  6 ++---
 3 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c3151f3874da..9f5f6b48ab0f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1161,10 +1161,10 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 		goto out_unlock_bo;
 
-	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
-					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-					XE_BO_FLAG_PINNED, exec);
+	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+				   XE_BO_FLAG_PINNED, exec);
 	if (IS_ERR(backup)) {
 		ret = PTR_ERR(backup);
 		goto out_unlock_bo;
@@ -1240,11 +1240,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		goto out_unlock_bo;
 
 	if (!backup) {
-		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv,
-						NULL, xe_bo_size(bo),
-						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-						XE_BO_FLAG_PINNED, exec);
+		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					   XE_BO_FLAG_PINNED, exec);
 		if (IS_ERR(backup)) {
 			ret = PTR_ERR(backup);
 			goto out_unlock_bo;
@@ -2024,7 +2023,7 @@ void xe_bo_free(struct xe_bo *bo)
 }
 
 /**
- * ___xe_bo_create_locked() - Initialize or create an xe_bo.
+ * xe_bo_init_locked() - Initialize or create an xe_bo.
  * @xe: The xe device.
  * @bo: An already allocated buffer object or NULL
  * if the function should allocate a new one.
@@ -2044,11 +2043,11 @@ void xe_bo_free(struct xe_bo *bo)
  *
  * Return: The buffer object on success. Negative error pointer on failure.
  */
-struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				     struct xe_tile *tile, struct dma_resv *resv,
-				     struct ttm_lru_bulk_move *bulk, size_t size,
-				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags, struct drm_exec *exec)
+struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
+				struct xe_tile *tile, struct dma_resv *resv,
+				struct ttm_lru_bulk_move *bulk, size_t size,
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -2240,11 +2239,11 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
-				    vm && !xe_vm_in_fault_mode(vm) &&
-				    flags & XE_BO_FLAG_USER ?
-				    &vm->lru_bulk_move : NULL, size,
-				    cpu_caching, type, flags, exec);
+	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
+			       vm && !xe_vm_in_fault_mode(vm) &&
+			       flags & XE_BO_FLAG_USER ?
+			       &vm->lru_bulk_move : NULL, size,
+			       cpu_caching, type, flags, exec);
 	if (IS_ERR(bo))
 		return bo;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8a057d39f0a8..13f3ef9fab6e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -89,11 +89,11 @@ struct sg_table;
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
-struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				     struct xe_tile *tile, struct dma_resv *resv,
-				     struct ttm_lru_bulk_move *bulk, size_t size,
-				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags, struct drm_exec *exec);
+struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
+				struct xe_tile *tile, struct dma_resv *resv,
+				struct ttm_lru_bulk_move *bulk, size_t size,
+				u16 cpu_caching, enum ttm_bo_type type,
+				u32 flags, struct drm_exec *exec);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_tile *tile, struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 8d8e5f7345b6..90fbdec31b58 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -238,9 +238,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 		if (ret)
 			break;
 
-		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
-					    0, /* Will require 1way or 2way for vm_bind */
-					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
+		bo = xe_bo_init_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+				       0, /* Will require 1way or 2way for vm_bind */
+				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
 		drm_exec_retry_on_contention(&exec);
 		if (IS_ERR(bo)) {
 			ret = PTR_ERR(bo);
-- 
2.50.1

