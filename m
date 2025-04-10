Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED12FC369A9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 16:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDAD10EA03;
	Thu, 10 Apr 2025 16:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMbYBwDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA110EA03
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 16:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302083; x=1775838083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nA8kIGNWiPtYvShxXMY33s6BzpkP3DNlQnuCTMdO/0I=;
 b=hMbYBwDobmvWroTt/T4WYAQbfKisr0zJLkXUy3pmbdj8/uAc0AgEEhEM
 Ulsu8rcpSFxUyoqqw/KahHi17R+02fj5stB/cNHGOup1oSXAv2C8OEFo9
 Mhh1rqJsGMnglDrWc/KVQ1suqr5eZU6iOW8g+r380QqdUuiti9BVHRoPu
 9qaJbGbVVOldFn2OGdODz2HrFQ51M9c5dFPiH/eHcwO+RdsXfN01MieTd
 JOhy+Da8i1XL5yL+XMmO8JUT8iOV10ecsmKLwTeKV6TumfS6Yw0NVbwf1
 9XG8gglPgWL2aOJ8NQ8FPS/ukWUEgDKBlYN3khAZCxuoYTtLeV8G5W3yp w==;
X-CSE-ConnectionGUID: TzgzFVISRMamCToX2h5z4Q==
X-CSE-MsgGUID: 2Y17HyITSE+heMIEcmSs1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45733767"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45733767"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:23 -0700
X-CSE-ConnectionGUID: G2sj2RCrRMGS9ZZDMt7Bfg==
X-CSE-MsgGUID: tJSDd22ESXSUyGKheZ656Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129490559"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.125])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/3] drm/xe: handle pinned memory in PM notifier
Date: Thu, 10 Apr 2025 17:20:20 +0100
Message-ID: <20250410162016.158474-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410162016.158474-5-matthew.auld@intel.com>
References: <20250410162016.158474-5-matthew.auld@intel.com>
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

Userspace is still alive and kicking at this point so actually moving
pinned stuff here is tricky. However, we can instead pre-allocate the
backup storage upfront from the notifier, such that we scoop up as much
as we can, and then leave the final .suspend() to do the actual copy (or
allocate anything that we missed). That way the bulk of our allocations
will hopefully be done outside the more restrictive .suspend().

We do need to be extra careful though, since the pinned handling can now
race with PM notifier, like something becoming unpinned after we prepare
it from the notifier.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 115 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h       |   2 +
 drivers/gpu/drm/xe/xe_bo_evict.c |  49 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
 drivers/gpu/drm/xe/xe_pm.c       |  17 ++++-
 5 files changed, 167 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3eab6352d9dc..2509f3d8954d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1084,6 +1084,77 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 	return lret;
 }
 
+/**
+ * xe_bo_notifier_prepare_pinned() - Prepare a pinned VRAM object to be backed
+ * up in system memory.
+ * @bo: The buffer object to prepare.
+ *
+ * On successful completion, the object backup pages are allocated. Expectation
+ * is that this is called from the PM notifier, prior to suspend/hibernation.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
+{
+	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
+	struct xe_bo *backup;
+	int ret = 0;
+
+	xe_bo_lock(bo, false);
+
+	xe_assert(xe, !bo->backup_obj);
+
+	/*
+	 * Since this is called from the PM notifier we might have raced with
+	 * someone unpinning this after we dropped the pinned list lock and
+	 * grabbing the above bo lock.
+	 */
+	if (!xe_bo_is_pinned(bo))
+		goto out_unlock_bo;
+
+	if (!xe_bo_is_vram(bo))
+		goto out_unlock_bo;
+
+	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+		goto out_unlock_bo;
+
+	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
+					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+					XE_BO_FLAG_PINNED);
+	if (IS_ERR(backup)) {
+		ret = PTR_ERR(backup);
+		goto out_unlock_bo;
+	}
+
+	ttm_bo_pin(&backup->ttm);
+	bo->backup_obj = backup;
+
+out_unlock_bo:
+	xe_bo_unlock(bo);
+	return ret;
+}
+
+/**
+ * xe_bo_notifier_unprepare_pinned() - Undo the previous prepare operation.
+ * @bo: The buffer object to undo the prepare for.
+ *
+ * Always returns 0. The backup object is removed, if still present. Expectation
+ * it that this called from the PM notifier when undoing the prepare step.
+ */
+int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
+{
+	xe_bo_lock(bo, false);
+	if (bo->backup_obj) {
+		ttm_bo_unpin(&bo->backup_obj->ttm);
+		xe_bo_put(bo->backup_obj);
+		bo->backup_obj = NULL;
+	}
+	xe_bo_unlock(bo);
+
+	return 0;
+}
+
 /**
  * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
  * @bo: The buffer object to move.
@@ -1098,7 +1169,8 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 int xe_bo_evict_pinned(struct xe_bo *bo)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
-	struct xe_bo *backup;
+	struct xe_bo *backup = bo->backup_obj;
+	bool backup_created = false;
 	bool unmap = false;
 	int ret = 0;
 
@@ -1120,13 +1192,16 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 		goto out_unlock_bo;
 
-	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
-					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
-					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-					XE_BO_FLAG_PINNED);
-	if (IS_ERR(backup)) {
-		ret = PTR_ERR(backup);
-		goto out_unlock_bo;
+	if (!backup) {
+		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, bo->size,
+						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
+						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
+						XE_BO_FLAG_PINNED);
+		if (IS_ERR(backup)) {
+			ret = PTR_ERR(backup);
+			goto out_unlock_bo;
+		}
+		backup_created = true;
 	}
 
 	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
@@ -1174,11 +1249,12 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 				   bo->size);
 	}
 
-	bo->backup_obj = backup;
+	if (!bo->backup_obj)
+		bo->backup_obj = backup;
 
 out_backup:
 	xe_bo_vunmap(backup);
-	if (ret)
+	if (ret && backup_created)
 		xe_bo_put(backup);
 out_unlock_bo:
 	if (unmap)
@@ -1214,9 +1290,11 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
 	xe_bo_lock(bo, false);
 
-	ret = ttm_bo_validate(&backup->ttm, &backup->placement, &ctx);
-	if (ret)
-		goto out_backup;
+	if (!xe_bo_is_pinned(backup)) {
+		ret = ttm_bo_validate(&backup->ttm, &backup->placement, &ctx);
+		if (ret)
+			goto out_unlock_bo;
+	}
 
 	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
 		struct xe_migrate *migrate;
@@ -1256,7 +1334,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		if (iosys_map_is_null(&bo->vmap)) {
 			ret = xe_bo_vmap(bo);
 			if (ret)
-				goto out_unlock_bo;
+				goto out_backup;
 			unmap = true;
 		}
 
@@ -1264,7 +1342,8 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 				 bo->size);
 	}
 
-	bo->backup_obj = NULL;
+	if (!xe_bo_is_pinned(backup))
+		bo->backup_obj = NULL;
 
 out_backup:
 	xe_bo_vunmap(backup);
@@ -2300,6 +2379,12 @@ void xe_bo_unpin(struct xe_bo *bo)
 		xe_assert(xe, !list_empty(&bo->pinned_link));
 		list_del_init(&bo->pinned_link);
 		spin_unlock(&xe->pinned.lock);
+
+		if (bo->backup_obj) {
+			ttm_bo_unpin(&bo->backup_obj->ttm);
+			xe_bo_put(bo->backup_obj);
+			bo->backup_obj = NULL;
+		}
 	}
 	ttm_bo_unpin(&bo->ttm);
 	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0a19b50045b2..8bc449c78cc7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -277,6 +277,8 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
 int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
 
 int xe_bo_evict_pinned(struct xe_bo *bo);
+int xe_bo_notifier_prepare_pinned(struct xe_bo *bo);
+int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
 
 int xe_bo_dma_unmap_pinned(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 748360fd2439..fa318fdb4d9d 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -34,7 +34,13 @@ static int xe_bo_apply_to_pinned(struct xe_device *xe,
 		ret = pinned_fn(bo);
 		if (ret && pinned_list != new_list) {
 			spin_lock(&xe->pinned.lock);
-			list_move(&bo->pinned_link, pinned_list);
+			/*
+			 * We might no longer be pinned, since PM notifier can
+			 * call this. If the pinned link is now empty, keep it
+			 * that way.
+			 */
+			if (!list_empty(&bo->pinned_link))
+				list_move(&bo->pinned_link, pinned_list);
 			spin_unlock(&xe->pinned.lock);
 		}
 		xe_bo_put(bo);
@@ -46,6 +52,47 @@ static int xe_bo_apply_to_pinned(struct xe_device *xe,
 	return ret;
 }
 
+/**
+ * xe_bo_notifier_prepare_all_pinned() - Pre-allocate the backing pages for all
+ * pinned VRAM objects which need to be saved.
+ * @xe: xe device
+ *
+ * Should be called from PM notifier when preparing for s3/s4.
+ */
+int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe)
+{
+	int ret;
+
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
+				    &xe->pinned.early.kernel_bo_present,
+				    xe_bo_notifier_prepare_pinned);
+	if (!ret)
+		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
+					    &xe->pinned.late.kernel_bo_present,
+					    xe_bo_notifier_prepare_pinned);
+
+	return ret;
+}
+
+/**
+ * xe_bo_notifier_unprepare_all_pinned() - Remove the backing pages for all
+ * pinned VRAM objects which have been restored.
+ * @xe: xe device
+ *
+ * Should be called from PM notifier after exiting s3/s4 (either on success or
+ * failure).
+ */
+void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe)
+{
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
+				    &xe->pinned.early.kernel_bo_present,
+				    xe_bo_notifier_unprepare_pinned);
+
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
+				    &xe->pinned.late.kernel_bo_present,
+				    xe_bo_notifier_unprepare_pinned);
+}
+
 /**
  * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM
  * @xe: xe device
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index e7f048634b32..e8385cb7f5e9 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -10,6 +10,8 @@ struct xe_device;
 
 int xe_bo_evict_all(struct xe_device *xe);
 int xe_bo_evict_all_user(struct xe_device *xe);
+int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
+void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
 int xe_bo_restore_early(struct xe_device *xe);
 int xe_bo_restore_late(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index e7ea4003dbf8..cf9f1fdd83e4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -293,9 +293,22 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_SUSPEND_PREPARE:
 		xe_pm_runtime_get(xe);
 		err = xe_bo_evict_all_user(xe);
-		xe_pm_runtime_put(xe);
-		if (err)
+		if (err) {
 			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
+			xe_pm_runtime_put(xe);
+			break;
+		}
+
+		err = xe_bo_notifier_prepare_all_pinned(xe);
+		if (err) {
+			drm_dbg(&xe->drm, "Notifier prepare pin failed (%d)\n", err);
+			xe_pm_runtime_put(xe);
+		}
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_SUSPEND:
+		xe_bo_notifier_unprepare_all_pinned(xe);
+		xe_pm_runtime_put(xe);
 		break;
 	}
 
-- 
2.49.0

