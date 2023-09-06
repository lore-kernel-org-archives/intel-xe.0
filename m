Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C51FEE14A0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 15:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A4310E6AB;
	Wed,  6 Sep 2023 15:39:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1428B10E6AC
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694014786; x=1725550786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mj99kmjzf7AFIjH4mRp//pgooHlepb3iPLd1lNoNvjU=;
 b=W2RpxNum4WUKQtpucwugkU6XLebEmUI5GPwe09CkwbtMJ54LDZuWuKTE
 j1X+hoFjS8AnLWEfTQdswSxxo1b57VUludPaHZVMwXl1iWkQNLizqybMy
 jTLimgwEHWp41xMtKk724CZErA0rftus3M2xIFr9X5lqImvs2EyTz+7YL
 69qw6mLL1fjo/d8zzSICfEVpspBhSqIoOxuN0AQnfcgLtxV7Hmgz4nkQs
 8zTtyim/POK5pccRRHB8fhwOqU+Je8Yh70l8KobHyRbsTcIFdymvvBPfg
 UY5s2rS3tadwGcjW9sWvQLCPefoWcfKKwjEGh1n43vfX5oaUKatmaviQo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362131432"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="362131432"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 08:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988287106"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="988287106"
Received: from yinbingc-mobl.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.11])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 08:39:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 17:39:13 +0200
Message-ID: <20230906153916.5665-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
References: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 3/6] drm/xe/bo: Remove the
 lock_no_vm()/unlock_no_vm() interface
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

Apart from asserts, it's essentially the same as
xe_bo_lock()/xe_bo_unlock(), and the usage intentions of this interface
was unclear. Remove it.

v2:
- Update the xe_display subsystem as well.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c |  4 ++--
 drivers/gpu/drm/xe/tests/xe_bo.c        |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c   |  4 ++--
 drivers/gpu/drm/xe/tests/xe_migrate.c   |  2 +-
 drivers/gpu/drm/xe/xe_bo.h              | 23 ++---------------------
 drivers/gpu/drm/xe/xe_dma_buf.c         |  5 +++--
 drivers/gpu/drm/xe/xe_lrc.c             | 10 ++--------
 7 files changed, 13 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index e0bac4cf3f4b..f5a96b94cfba 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1892,9 +1892,9 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 		struct xe_bo *bo = intel_fb_obj(fb);
 
 		/* Unpin our kernel fb first */
-		xe_bo_lock_no_vm(bo, NULL);
+		xe_bo_lock(bo, false);
 		xe_bo_unpin(bo);
-		xe_bo_unlock_no_vm(bo);
+		xe_bo_unlock(bo);
 	}
 	xe_bo_put(intel_fb_obj(fb));
 #endif
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index ad6dd6fae853..2c04357377ab 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -143,7 +143,7 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
 	ret = ccs_test_migrate(gt, bo, true, 0ULL, 0ULL, test);
 
 out_unlock:
-	xe_bo_unlock_no_vm(bo);
+	xe_bo_unlock(bo);
 	xe_bo_put(bo);
 }
 
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 513a3b3362e9..1c3f4bc72b99 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -148,14 +148,14 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			int err;
 
 			/* Is everything where we expect it to be? */
-			xe_bo_lock_no_vm(import_bo, NULL);
+			xe_bo_lock(import_bo, false);
 			err = xe_bo_validate(import_bo, NULL, false);
 			if (err && err != -EINTR && err != -ERESTARTSYS)
 				KUNIT_FAIL(test,
 					   "xe_bo_validate() failed with err=%d\n", err);
 
 			check_residency(test, bo, import_bo, dmabuf);
-			xe_bo_unlock_no_vm(import_bo);
+			xe_bo_unlock(import_bo);
 		}
 		drm_gem_object_put(import);
 	} else if (PTR_ERR(import) != -EOPNOTSUPP) {
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 8bb081086ca2..f58cd1da1a34 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -183,7 +183,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 
 	xe_bo_vunmap(sysmem);
 out_unlock:
-	xe_bo_unlock_no_vm(sysmem);
+	xe_bo_unlock(sysmem);
 	xe_bo_put(sysmem);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a7b9e7084225..9097bcc13209 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -164,25 +164,6 @@ static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 	}
 }
 
-static inline void xe_bo_lock_no_vm(struct xe_bo *bo,
-				    struct ww_acquire_ctx *ctx)
-{
-	if (bo) {
-		XE_WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
-				      bo->ttm.base.resv != &bo->ttm.base._resv));
-		dma_resv_lock(bo->ttm.base.resv, ctx);
-	}
-}
-
-static inline void xe_bo_unlock_no_vm(struct xe_bo *bo)
-{
-	if (bo) {
-		XE_WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
-				      bo->ttm.base.resv != &bo->ttm.base._resv));
-		dma_resv_unlock(bo->ttm.base.resv);
-	}
-}
-
 int xe_bo_pin_external(struct xe_bo *bo);
 int xe_bo_pin(struct xe_bo *bo);
 void xe_bo_unpin_external(struct xe_bo *bo);
@@ -197,9 +178,9 @@ static inline bool xe_bo_is_pinned(struct xe_bo *bo)
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
-		xe_bo_lock_no_vm(bo, NULL);
+		xe_bo_lock(bo, false);
 		xe_bo_unpin(bo);
-		xe_bo_unlock_no_vm(bo);
+		xe_bo_unlock(bo);
 
 		xe_bo_put(bo);
 	}
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 975dee1f770f..09343b8b3e96 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -153,9 +153,10 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	if (!reads)
 		return 0;
 
-	xe_bo_lock_no_vm(bo, NULL);
+	/* Can we do interruptible lock here? */
+	xe_bo_lock(bo, false);
 	(void)xe_bo_migrate(bo, XE_PL_TT);
-	xe_bo_unlock_no_vm(bo);
+	xe_bo_unlock(bo);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 434fbb364b4b..6f899b6a4877 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -790,15 +790,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
-	if (lrc->bo->vm)
-		xe_vm_lock(lrc->bo->vm, false);
-	else
-		xe_bo_lock_no_vm(lrc->bo, NULL);
+	xe_bo_lock(lrc->bo, false);
 	xe_bo_unpin(lrc->bo);
-	if (lrc->bo->vm)
-		xe_vm_unlock(lrc->bo->vm);
-	else
-		xe_bo_unlock_no_vm(lrc->bo);
+	xe_bo_unlock(lrc->bo);
 	xe_bo_put(lrc->bo);
 }
 
-- 
2.41.0

