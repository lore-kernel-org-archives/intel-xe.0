Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067E2FD45F3
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863D610E86F;
	Wed, 25 Feb 2026 20:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1WXsgVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BC910E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772051269; x=1803587269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O+LiHXLpB/SShvpfJqrLK64loN6MACuFvs8Qctg4Zeg=;
 b=T1WXsgVPWsH4IJ4a2v6RiguVfQO4s4PQ8t2i1onSvYgr6IEjWIRPKXaT
 XBV1nlCpaFT9WnlPfnTJw+ZjVuGJ2RvGPSK1SU1e84BrJY3WVZRcGuj5I
 pOz/w5hiX+X/9hBRr16hkl5SfLX4ax4w8KabHunlVB7dLpAu2GejtU59x
 q8PPIkh1pavda8G2iVS/l0teuf9HKa9iaE/bGUSQRjoy6245YIH7fYNcI
 DLqp9pziRho9IzAy2jVT6iFzd2ZyM+p+igEK7MQ33PnSC149crU91mbjq
 vhmyR45XBU+DEiKWgeFRsu7eyqD4Dl8T2Q8uxcY1nFymLgjIUtew3ykpB g==;
X-CSE-ConnectionGUID: h1FkxJgGSVCBuYY2ruHe1Q==
X-CSE-MsgGUID: 5EX2PU/fQ7eqCjPs7L6rVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90515164"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="90515164"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:47 -0800
X-CSE-ConnectionGUID: TA+6AkTxR7S+SZv5sDeYhA==
X-CSE-MsgGUID: JHK7Qq7tRUm0IlEZ1vz5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="220845132"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 05/12] drm/xe: Add num_pf_work modparam
Date: Wed, 25 Feb 2026 12:27:29 -0800
Message-Id: <20260225202736.2723250-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225202736.2723250-1-matthew.brost@intel.com>
References: <20260225202736.2723250-1-matthew.brost@intel.com>
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

Add a module parameter to control the number of page-fault work threads,
making it easy to experiment with how different numbers of work threads
impact performance.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_defaults.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++++++++---
 drivers/gpu/drm/xe/xe_device_types.h | 11 ++++-------
 drivers/gpu/drm/xe/xe_module.c       |  4 ++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c    |  6 +++---
 drivers/gpu/drm/xe/xe_vm.c           |  3 ++-
 7 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 5d5d41d067c5..2e615cf896b2 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -22,5 +22,6 @@
 #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
 #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
 #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
+#define XE_DEFAULT_NUM_PF_WORK			2
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..0571079a09e8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -436,6 +436,18 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+static void xe_device_parse_modparam(struct xe_device *xe)
+{
+	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->atomic_svm_timeslice_ms = 5;
+	xe->min_run_period_lr_ms = 5;
+	xe->info.num_pf_work = xe_modparam.num_pf_work;
+	if (xe->info.num_pf_work < 1)
+		xe->info.num_pf_work = 1;
+	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX)
+		xe->info.num_pf_work = XE_PAGEFAULT_WORK_MAX;
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -469,9 +481,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = xe_modparam.force_execlist;
-	xe->atomic_svm_timeslice_ms = 5;
-	xe->min_run_period_lr_ms = 5;
+
+	xe_device_parse_modparam(xe);
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0558dfd52541..a027ca5f6828 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -130,6 +130,8 @@ struct xe_device {
 		u8 revid;
 		/** @info.step: stepping information for each IP */
 		struct xe_step_info step;
+		/** @info.num_pf_work: Number of page fault work thread */
+		int num_pf_work;
 		/** @info.dma_mask_size: DMA address bits */
 		u8 dma_mask_size;
 		/** @info.vram_flags: Vram flags */
@@ -310,14 +312,9 @@ struct xe_device {
 		struct rw_semaphore lock;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
 		struct workqueue_struct *pf_wq;
-		/*
-		 * We pick 4 here because, in the current implementation, it
-		 * yields the best bandwidth utilization of the kernel paging
-		 * engine.
-		 */
-#define XE_PAGEFAULT_WORK_COUNT	4
+#define XE_PAGEFAULT_WORK_MAX	8
 		/** @usm.pf_workers: Page fault workers */
-		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_COUNT];
+		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_MAX];
 		/** @usm.pf_queue: Page fault queue */
 		struct xe_pagefault_queue pf_queue;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 903d3b433421..c750db4b579c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -28,6 +28,7 @@ struct xe_modparam xe_modparam = {
 	.max_vfs =		XE_DEFAULT_MAX_VFS,
 #endif
 	.wedged_mode =		XE_DEFAULT_WEDGED_MODE,
+	.num_pf_work =		XE_DEFAULT_NUM_PF_WORK,
 	.svm_notifier_size =	XE_DEFAULT_SVM_NOTIFIER_SIZE,
 	/* the rest are 0 by default */
 };
@@ -81,6 +82,9 @@ MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
 		 "[default=" XE_DEFAULT_WEDGED_MODE_STR "])");
 
+module_param_named(num_pf_work, xe_modparam.num_pf_work, int, 0600);
+MODULE_PARM_DESC(num_pf_work, "Number of page fault work threads, default=2, min=1, max=8");
+
 static int xe_check_nomodeset(void)
 {
 	if (drm_firmware_drivers_only())
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 79cb9639c0f3..c6642523184a 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -22,6 +22,7 @@ struct xe_modparam {
 	unsigned int max_vfs;
 #endif
 	unsigned int wedged_mode;
+	unsigned int num_pf_work;
 	u32 svm_notifier_size;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 7880fc7e7eb4..64b1dc574ab7 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -383,7 +383,7 @@ int xe_pagefault_init(struct xe_device *xe)
 
 	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
 					WQ_UNBOUND | WQ_HIGHPRI,
-					XE_PAGEFAULT_WORK_COUNT);
+					xe->info.num_pf_work);
 	if (!xe->usm.pf_wq)
 		return -ENOMEM;
 
@@ -391,7 +391,7 @@ int xe_pagefault_init(struct xe_device *xe)
 	if (err)
 		goto err_out;
 
-	for (i = 0; i < XE_PAGEFAULT_WORK_COUNT; ++i) {
+	for (i = 0; i < xe->info.num_pf_work; ++i) {
 		struct xe_pagefault_work *pf_work = xe->usm.pf_workers + i;
 
 		pf_work->xe = xe;
@@ -457,7 +457,7 @@ static int xe_pagefault_work_index(struct xe_device *xe)
 {
 	lockdep_assert_held(&xe->usm.pf_queue.lock);
 
-	return xe->usm.current_pf_work++ % XE_PAGEFAULT_WORK_COUNT;
+	return xe->usm.current_pf_work++ % xe->info.num_pf_work;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 06669e9c500d..54c7d0f791e1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3070,7 +3070,8 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
 	skip_threads =  op->prefetch_range.ranges_count == 1 ||
 		(!dpagemap && !(vops->flags &
 				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
-		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
+		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK) ||
+		vm->xe->info.num_pf_work == 1;
 	thread = skip_threads ? &stack_thread : NULL;
 
 	if (!skip_threads) {
-- 
2.34.1

