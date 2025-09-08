Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF689CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B085D10E4C5;
	Mon,  8 Sep 2025 10:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQHKh78R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7AC10E4C3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326400; x=1788862400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nrD+2zgct7eQuFCpeywqkr+BhZz6qhSU08ux4MK8Un8=;
 b=LQHKh78RDexnhJWw1rKJl10p1J0qp7N5MlvTZR1naA2UfH3aISIz49mL
 zKfntpAQ5gR/H25ct5QuA7OQYKWTsXgidBjou0l4duvQ00SchI37z79yw
 AbPtcGSEy0LR8Sme2IRI+m1G3JcXAdfqzWDjlxM0NSyYU1xEneUCNQLPy
 wPDzb/CbdEim6AmPCnE7fBFlfo2UZMiLwr0mJFIJxYDZ54zIsfqToaiwU
 GGqNu6T2Uhf4jCLxQIqkTu654TJG+urNFzIzXPGrO7srpxjc6Ec8EG4uq
 XxgULYNYJvPQ3Q2yQBFKjK+0SY+17zksmsli3VZZy4UvJjJGxw/oiVqdY w==;
X-CSE-ConnectionGUID: GSo/ZE3LSeOtLsN0ac1ipg==
X-CSE-MsgGUID: R2E6rBZSRgmj2s4Tt2TM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="85022827"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85022827"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:19 -0700
X-CSE-ConnectionGUID: KsD3UdHLR7+nJBjn6bDV6w==
X-CSE-MsgGUID: 5PidHuNRTzm712d8Nj2lTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172673734"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.9])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:18 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 09/13] drm/xe: Rename ___xe_bo_create_locked()
Date: Mon,  8 Sep 2025 12:12:42 +0200
Message-ID: <20250908101246.65025-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
References: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
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
index 4b2eba7d4ce1..82955c177c05 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1163,10 +1163,10 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
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
@@ -1242,11 +1242,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
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
@@ -2036,7 +2035,7 @@ void xe_bo_free(struct xe_bo *bo)
 }
 
 /**
- * ___xe_bo_create_locked() - Initialize or create an xe_bo.
+ * xe_bo_init_locked() - Initialize or create an xe_bo.
  * @xe: The xe device.
  * @bo: An already allocated buffer object or NULL
  * if the function should allocate a new one.
@@ -2056,11 +2055,11 @@ void xe_bo_free(struct xe_bo *bo)
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
@@ -2252,11 +2251,11 @@ __xe_bo_create_locked(struct xe_device *xe,
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
index f0923717660e..69782a06f9c5 100644
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
index 2e5b4b37118f..607c3f4ef3b9 100644
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
2.51.0

