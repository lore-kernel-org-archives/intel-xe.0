Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4196AEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 13:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F7310E253;
	Mon, 17 Jul 2023 13:32:35 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD91110E253
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689600752; x=1721136752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b+whQbDdxWIXQabyJeHMAMfxrXTTrTNjCejh9lgB7Lk=;
 b=LNKEFyAu8Qsjx8ocdBcY2h16KB5BoZM9xaqgUFujaZURgjL4eOTz+0tk
 VjHT4rqKLzdOWW1d1wJdshz+aS/a7CVSr88uvAfF1a0FxyTy+V2gR+aru
 ReJLcNAcgMjbzrxbZJ0r1HizfN1XcbF6JJnkqLYDBNQHRkzv7kQ9aFcGo
 5MtRQj7O94NLRoW9/zEkDI9yw80K2Y/516Zg5UPNhI5WuguxKPbOh63Zp
 Xn0ue4i+sEEz0qUWxKYQ9Bc1vR1f+ya89lVDN2ulbVqwffcKQzZZtu6JH
 QqQPoEGAeFME7n/yq7zi2V21iRORn0nbUTwMcTWUkFpYsW8PubWHTEA3Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355867852"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355867852"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836881093"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="836881093"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 14:32:04 +0100
Message-ID: <20230717133159.47980-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717133159.47980-6-matthew.auld@intel.com>
References: <20230717133159.47980-6-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] drm/xe: add missing bulk_move reset
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It looks like bulk_move is set during object construction, but is only
removed on object close, however in various places we might not yet have
an actual fd to close, like on the error paths for the gem_create ioctl,
and also one internal user for the evict_test_run_gt() selftest. Try to
handle those cases by manually resetting the bulk_move. This should
prevent triggering:

WARNING: CPU: 7 PID: 8252 at drivers/gpu/drm/ttm/ttm_bo.c:327
ttm_bo_release+0x25e/0x2a0 [ttm]

v2 (Nirmoy):
  - It should be safe to just unconditionally call __xe_bo_unset_bulk_move().

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c |  7 +++++++
 drivers/gpu/drm/xe/xe_bo.c       | 25 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_bo.h       |  6 ++++++
 3 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 21c6dfef8dc7..1a5b48d60c80 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -285,6 +285,10 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 		xe_bo_unlock(external, &ww);
 
 		xe_bo_put(external);
+
+		xe_bo_lock(bo, &ww, 0, false);
+		__xe_bo_unset_bulk_move(bo);
+		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		continue;
 
@@ -295,6 +299,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 cleanup_external:
 		xe_bo_put(external);
 cleanup_bo:
+		xe_bo_lock(bo, &ww, 0, false);
+		__xe_bo_unset_bulk_move(bo);
+		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5d6f73c1d37e..e8aa8ca3d187 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1317,6 +1317,7 @@ xe_bo_create_locked_range(struct xe_device *xe,
 	return bo;
 
 err_unlock_put_bo:
+	__xe_bo_unset_bulk_move(bo);
 	xe_bo_unlock_vm_held(bo);
 	xe_bo_put(bo);
 	return ERR_PTR(err);
@@ -1760,22 +1761,28 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
 	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
 			  bo_flags);
-	if (vm) {
-		xe_vm_unlock(vm, &ww);
-		xe_vm_put(vm);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		goto out_vm;
 	}
 
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
 	err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
-	xe_bo_put(bo);
 	if (err)
-		return err;
+		goto out_bulk;
 
 	args->handle = handle;
+	goto out_put;
 
-	return 0;
+out_bulk:
+	__xe_bo_unset_bulk_move(bo);
+out_put:
+	xe_bo_put(bo);
+out_vm:
+	if (vm) {
+		xe_vm_unlock(vm, &ww);
+		xe_vm_put(vm);
+	}
+	return err;
 }
 
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 08ca1d06bf77..72c68facd481 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -135,6 +135,12 @@ static inline void xe_bo_put(struct xe_bo *bo)
 		drm_gem_object_put(&bo->ttm.base);
 }
 
+static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
+{
+	if (bo)
+		ttm_bo_set_bulk_move(&bo->ttm, NULL);
+}
+
 static inline void xe_bo_assert_held(struct xe_bo *bo)
 {
 	if (bo)
-- 
2.41.0

