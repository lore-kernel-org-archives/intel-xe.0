Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F34CDE00E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 21:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3410E2CE;
	Thu, 25 Jun 2026 21:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5r3IZmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9E10E2CE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 21:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782424594; x=1813960594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4V3pblfBXWfRzueasKfEc75mrJFYdZLIq3rDOwNfrB0=;
 b=Z5r3IZmZJG2jeMqysCWGjuE/9lrAxWSH+1l8wMXOQOysknMvh8Cl42kB
 gnxxeuSmLR+8+2CobDSjiwAUcXxjyYC+bYRVJ2S372m7ziZk3WFYpEChe
 +bcK4Uewqjv9R9pfvQHJW5hiTaLsDWp+Afl08z8gR4HE2KiXbsoOGOw00
 2jlqa5OsMhGkWjSHrvqm8y92X6qMbds1wNIBJMFQ/PbCYA/wV+kJQNI/n
 vfSnW//9f3UF8FK74D45anslqM/2JeO7EB166qqMyZdETuJLEhTFXB2Po
 fnSJFduO0P+l5OOVlaznolKiGpMwcwnUJkU/TmhM4hvxTGBEUPFupmAKR w==;
X-CSE-ConnectionGUID: w/2rIwQJTxG5Mz/io9yxcg==
X-CSE-MsgGUID: exOMEpAFTUKMW26MThPmmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83101463"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83101463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 14:56:33 -0700
X-CSE-ConnectionGUID: wHGTNf2PTiazikOiUs1kNw==
X-CSE-MsgGUID: GOjbw3xLSd+4Fcb9BDBGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="289171420"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa001.jf.intel.com with ESMTP; 25 Jun 2026 14:56:31 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] drm/xe/userptr: Hold notifier_lock for write on inject test
 path
Date: Thu, 25 Jun 2026 21:56:15 +0000
Message-Id: <20260625215615.3016892-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

When CONFIG_DRM_XE_USERPTR_INVAL_INJECT=y, xe_pt_svm_userptr_pre_commit()
runs vma_check_userptr() with the svm notifier_lock taken for read. The
test injection causes vma_check_userptr() to call
xe_vma_userptr_force_invalidate(), which feeds into
xe_vma_userptr_do_inval() with drm_gpusvm_ctx.in_notifier=true. That
flag tells drm_gpusvm_unmap_pages() the caller already holds
notifier_lock for write and only asserts the mode. Because the caller
actually holds it for read, the assertion fires:

  WARNING: drivers/gpu/drm/drm_gpusvm.c:1669 at \
           drm_gpusvm_unmap_pages+0xd4/0x130 [drm_gpusvm_helper]
  Call Trace:
   xe_vma_userptr_do_inval+0x40d/0xfd0 [xe]
   xe_vma_userptr_invalidate_pass1+0x3e6/0x8d0 [xe]
   xe_vma_userptr_force_invalidate+0xde/0x290 [xe]
   vma_check_userptr.constprop.0+0x1c6/0x220 [xe]
   xe_pt_svm_userptr_pre_commit+0x6a3/0xc60 [xe]
   ...
   xe_vm_bind_ioctl+0x3a0a/0x4480 [xe]

Acquire notifier_lock for write in pre-commit when the inject Kconfig
is enabled, via new helpers xe_pt_svm_userptr_notifier_lock()/_unlock().
Rename xe_svm_assert_held_read() to
xe_svm_assert_held_read_or_inject_write() so it asserts the correct
mode under each build configuration. Production builds
(CONFIG_DRM_XE_USERPTR_INVAL_INJECT=n) keep the existing read-mode
behavior bit-for-bit.

Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
Assisted-by: Claude:claude-opus-4.7
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Zongyao Bai <zongyao.bai@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  | 43 ++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h | 15 +++++++++++--
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0959e0e88a14..4f0f438d6b9b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1086,7 +1086,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	xe_pt_commit_prepare_locks_assert(vma);
 
 	if (xe_vma_is_userptr(vma))
-		xe_svm_assert_held_read(vm);
+		xe_svm_assert_held_read_or_inject_write(vm);
 }
 
 static void xe_pt_commit(struct xe_vma *vma,
@@ -1406,6 +1406,33 @@ static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
 				     pt_update_ops, rftree);
 }
 
+/*
+ * Acquire/release the svm notifier_lock around xe_pt_svm_userptr_pre_commit()
+ * and the matching late release in xe_pt_update_ops_run(). Read mode by
+ * default; write mode when CONFIG_DRM_XE_USERPTR_INVAL_INJECT is on,
+ * because a userptr op in this critical section may invoke the injected
+ * xe_vma_userptr_force_invalidate() path that calls
+ * drm_gpusvm_unmap_pages() with ctx->in_notifier=true, which requires the
+ * lock held for write.
+ */
+static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+	down_write(&vm->svm.gpusvm.notifier_lock);
+#else
+	xe_svm_notifier_lock(vm);
+#endif
+}
+
+static void xe_pt_svm_userptr_notifier_unlock(struct xe_vm *vm)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+	up_write(&vm->svm.gpusvm.notifier_lock);
+#else
+	xe_svm_notifier_unlock(vm);
+#endif
+}
+
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
 #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
 
@@ -1437,7 +1464,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_userptr_vma *uvma;
 	unsigned long notifier_seq;
 
-	xe_svm_assert_held_read(vm);
+	xe_svm_assert_held_read_or_inject_write(vm);
 
 	if (!xe_vma_is_userptr(vma))
 		return 0;
@@ -1467,7 +1494,7 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 {
 	int err = 0;
 
-	xe_svm_assert_held_read(vm);
+	xe_svm_assert_held_read_or_inject_write(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -1539,12 +1566,12 @@ static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	if (err)
 		return err;
 
-	xe_svm_notifier_lock(vm);
+	xe_pt_svm_userptr_notifier_lock(vm);
 
 	list_for_each_entry(op, &vops->list, link) {
 		err = op_check_svm_userptr(vm, op, pt_update_ops);
 		if (err) {
-			xe_svm_notifier_unlock(vm);
+			xe_pt_svm_userptr_notifier_unlock(vm);
 			break;
 		}
 	}
@@ -2409,7 +2436,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   vma->tile_invalidated & ~BIT(tile->id));
 	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
-		xe_svm_assert_held_read(vm);
+		xe_svm_assert_held_read_or_inject_write(vm);
 		to_userptr_vma(vma)->userptr.initial_bind = true;
 	}
 
@@ -2445,7 +2472,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
 		if (xe_vma_is_userptr(vma)) {
-			xe_svm_assert_held_read(vm);
+			xe_svm_assert_held_read_or_inject_write(vm);
 
 			spin_lock(&vm->userptr.invalidated_lock);
 			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
@@ -2721,7 +2748,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	}
 
 	if (pt_update_ops->needs_svm_lock)
-		xe_svm_notifier_unlock(vm);
+		xe_pt_svm_userptr_notifier_unlock(vm);
 
 	/*
 	 * The last fence is only used for zero bind queue idling; migrate
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b7b8eeacf196..3ca46a6f98c7 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -394,8 +394,19 @@ static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_inst
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
-#define xe_svm_assert_held_read(vm__) \
+/*
+ * Assert the svm notifier_lock is held. Read mode by default; write mode
+ * when CONFIG_DRM_XE_USERPTR_INVAL_INJECT is on, because that path forces
+ * a userptr invalidation that ends in drm_gpusvm_unmap_pages() with
+ * ctx->in_notifier=true, which requires the lock held for write.
+ */
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+#define xe_svm_assert_held_read_or_inject_write(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+#else
+#define xe_svm_assert_held_read_or_inject_write(vm__) \
 	lockdep_assert_held_read(&(vm__)->svm.gpusvm.notifier_lock)
+#endif
 
 #define xe_svm_notifier_lock(vm__)	\
 	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
@@ -409,7 +420,7 @@ static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_inst
 #else
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 
-static inline void xe_svm_assert_held_read(struct xe_vm *vm)
+static inline void xe_svm_assert_held_read_or_inject_write(struct xe_vm *vm)
 {
 }
 
-- 
2.43.0

