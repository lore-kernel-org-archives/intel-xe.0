Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CECCA1013
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820010E4B9;
	Mon,  8 Sep 2025 10:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJkjiVr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FE110E4C8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326405; x=1788862405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAfzvP4KZlxZ/ZkdJphkjJnq0wl5FpFkp+ybuy36RCo=;
 b=AJkjiVr10L6gfB5hH89znZf7Mrfc2u/afsX++KZRaWSSSLWE2Mbj2nah
 LNYcL+zLBv+kEfZDs/ULUNRbFDtO5pP5Hp4TreUYbMxXqONsmTMhtupvf
 VjwU6etJwjDKOxlQ2neOf2m5u25Yg7CUtT4IFY5HUJMQq/Dk3BwJlUbBA
 U+JmF/lHO9kXRFo0CYHbdx4uHsv8TmBWKM4qcq8cHvIkZXY6J43vMxm+I
 KIC2b21gc3QiexH8za/CZsm8d036Mqyw1DIcoeWdYxRSvNSInFVAiRtTl
 uH6U1jvxuLC8XzLGPOhelKctSChdtXtqAl9C9lq/wLlOSuyhQL5ubrmiw A==;
X-CSE-ConnectionGUID: 6DOftEtRQ3ygSyiM13f6Lw==
X-CSE-MsgGUID: z7dC0FAZSqyubGVm0N/HZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="85022832"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85022832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:25 -0700
X-CSE-ConnectionGUID: vZAZSSsNTHyeKlQtC/dr/w==
X-CSE-MsgGUID: rCzaYflCSRKQztZGxw4AVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172673771"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.9])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 13/13] drm/xe: Convert pinned suspend eviction for
 exhaustive eviction
Date: Mon,  8 Sep 2025 12:12:46 +0200
Message-ID: <20250908101246.65025-14-thomas.hellstrom@linux.intel.com>
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

Pinned suspend eviction and preparation for eviction validates
system memory for eviction buffers. Do that under a
validation exclusive lock to avoid interfering with other
processes validating system graphics memory.

v2:
- Avoid gotos from within xe_validation_guard().
- Adapt to signature change of xe_validation_guard().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 184 +++++++++++++++++++++----------------
 1 file changed, 103 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c8f97ba98744..803b303cfed3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1141,43 +1141,47 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_bo *backup;
 	int ret = 0;
 
-	xe_bo_lock(bo, false);
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		xe_assert(xe, !ret);
+		xe_assert(xe, !bo->backup_obj);
 
-	xe_assert(xe, !bo->backup_obj);
+		/*
+		 * Since this is called from the PM notifier we might have raced with
+		 * someone unpinning this after we dropped the pinned list lock and
+		 * grabbing the above bo lock.
+		 */
+		if (!xe_bo_is_pinned(bo))
+			break;
 
-	/*
-	 * Since this is called from the PM notifier we might have raced with
-	 * someone unpinning this after we dropped the pinned list lock and
-	 * grabbing the above bo lock.
-	 */
-	if (!xe_bo_is_pinned(bo))
-		goto out_unlock_bo;
+		if (!xe_bo_is_vram(bo))
+			break;
 
-	if (!xe_bo_is_vram(bo))
-		goto out_unlock_bo;
+		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+			break;
 
-	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
-		goto out_unlock_bo;
+		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					   XE_BO_FLAG_PINNED, &exec);
+		if (IS_ERR(backup)) {
+			drm_exec_retry_on_contention(&exec);
+			ret = PTR_ERR(backup);
+			xe_validation_retry_on_oom(&ctx, &ret);
+			break;
+		}
 
-	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
-				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED, exec);
-	if (IS_ERR(backup)) {
-		ret = PTR_ERR(backup);
-		goto out_unlock_bo;
+		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
+		ttm_bo_pin(&backup->ttm);
+		bo->backup_obj = backup;
 	}
 
-	backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
-	ttm_bo_pin(&backup->ttm);
-	bo->backup_obj = backup;
-
-out_unlock_bo:
-	xe_bo_unlock(bo);
 	return ret;
 }
 
@@ -1203,57 +1207,12 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
 	return 0;
 }
 
-/**
- * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
- * @bo: The buffer object to move.
- *
- * On successful completion, the object memory will be moved to system memory.
- *
- * This is needed to for special handling of pinned VRAM object during
- * suspend-resume.
- *
- * Return: 0 on success. Negative error code on failure.
- */
-int xe_bo_evict_pinned(struct xe_bo *bo)
+static int xe_bo_evict_pinned_copy(struct xe_bo *bo, struct xe_bo *backup)
 {
-	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
-	struct xe_bo *backup = bo->backup_obj;
-	bool backup_created = false;
+	struct xe_device *xe = xe_bo_device(bo);
 	bool unmap = false;
 	int ret = 0;
 
-	xe_bo_lock(bo, false);
-
-	if (WARN_ON(!bo->ttm.resource)) {
-		ret = -EINVAL;
-		goto out_unlock_bo;
-	}
-
-	if (WARN_ON(!xe_bo_is_pinned(bo))) {
-		ret = -EINVAL;
-		goto out_unlock_bo;
-	}
-
-	if (!xe_bo_is_vram(bo))
-		goto out_unlock_bo;
-
-	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
-		goto out_unlock_bo;
-
-	if (!backup) {
-		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
-					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-					   XE_BO_FLAG_PINNED, exec);
-		if (IS_ERR(backup)) {
-			ret = PTR_ERR(backup);
-			goto out_unlock_bo;
-		}
-		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
-		backup_created = true;
-	}
-
 	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
 		struct xe_migrate *migrate;
 		struct dma_fence *fence;
@@ -1286,7 +1245,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		if (iosys_map_is_null(&bo->vmap)) {
 			ret = xe_bo_vmap(bo);
 			if (ret)
-				goto out_backup;
+				goto out_vunmap;
 			unmap = true;
 		}
 
@@ -1296,15 +1255,78 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 
 	if (!bo->backup_obj)
 		bo->backup_obj = backup;
-
-out_backup:
+out_vunmap:
 	xe_bo_vunmap(backup);
-	if (ret && backup_created)
-		xe_bo_put(backup);
-out_unlock_bo:
+out_backup:
 	if (unmap)
 		xe_bo_vunmap(bo);
-	xe_bo_unlock(bo);
+
+	return ret;
+}
+
+/**
+ * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
+ * @bo: The buffer object to move.
+ *
+ * On successful completion, the object memory will be moved to system memory.
+ *
+ * This is needed to for special handling of pinned VRAM object during
+ * suspend-resume.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_evict_pinned(struct xe_bo *bo)
+{
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *backup = bo->backup_obj;
+	bool backup_created = false;
+	int ret = 0;
+
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		xe_assert(xe, !ret);
+
+		if (WARN_ON(!bo->ttm.resource)) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (WARN_ON(!xe_bo_is_pinned(bo))) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (!xe_bo_is_vram(bo))
+			break;
+
+		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+			break;
+
+		if (!backup) {
+			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
+						   xe_bo_size(bo),
+						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+						   XE_BO_FLAG_PINNED, &exec);
+			if (IS_ERR(backup)) {
+				drm_exec_retry_on_contention(&exec);
+				ret = PTR_ERR(backup);
+				xe_validation_retry_on_oom(&ctx, &ret);
+				break;
+			}
+			backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
+			backup_created = true;
+		}
+
+		ret = xe_bo_evict_pinned_copy(bo, backup);
+	}
+
+	if (ret && backup_created)
+		xe_bo_put(backup);
+
 	return ret;
 }
 
-- 
2.51.0

