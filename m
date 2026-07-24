Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBA8C5321B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69EF10F4B2;
	Fri, 24 Jul 2026 21:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cj4ab2eS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FB010F4A5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784929174; x=1816465174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z8qU8PP0a+BtTd01VP+4S+eExyWP0cotLNvjOBbtrlM=;
 b=cj4ab2eSevoq6q1RL1Zk48vrgnXX5MoNphZkIcsJ61z0rlx0neRTv0lR
 v0V3DfSguNalSdtFcEvYtA9V0o/kziu6wIV2UqjLJp3S8HxlDDRtyzPHR
 CXZ+YVAq+dnsCMGq6gZxNqNgzlf/dMsvPT1GBKi67PCTXnCiZ4+HXbOUZ
 enB9/wrGtLEkrJ7iSrweJI7GoHqYdeXj9+xlFRpvrLtNnGLYXFqeYNikR
 o9lD461+EqNGpvVrc1PVj57mo4WGt5GkOKUkaLVg8TMaaX9wp6n5Xxjv7
 TtVywBQsHxzpXijVSzClPtjL3qTLQEf3UV6P3MxG7tnbZRiLMTE7RXdIy A==;
X-CSE-ConnectionGUID: 5MSAVhTYQWSGQ6DX89ltHw==
X-CSE-MsgGUID: a0kHO6u8SYCny725XYBV0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="111144559"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="111144559"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:39:34 -0700
X-CSE-ConnectionGUID: VvXkPl14SJ24ocv1PyVEJA==
X-CSE-MsgGUID: Dxl1KDAkTO6nPad1PdTWgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="263812728"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:39:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v7 05/12] drm/xe: Add num_pf_work modparam
Date: Fri, 24 Jul 2026 14:39:21 -0700
Message-Id: <20260724213928.1670731-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724213928.1670731-1-matthew.brost@intel.com>
References: <20260724213928.1670731-1-matthew.brost@intel.com>
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
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_defaults.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_device_types.h | 11 ++++-------
 drivers/gpu/drm/xe/xe_module.c       |  4 ++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c    |  8 ++++----
 drivers/gpu/drm/xe/xe_vm.c           |  3 ++-
 7 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index c8ae1d5f3d60..0884224ef7c7 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -22,5 +22,6 @@
 #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
 #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
 #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
+#define XE_DEFAULT_NUM_PF_WORK			2
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65..ff24d4a00c24 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -513,6 +513,17 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 }
 ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
+static void xe_device_parse_modparam(struct xe_device *xe)
+{
+	xe->atomic_svm_timeslice_ms = 5;
+	xe->min_run_period_lr_ms = 5;
+	xe->info.num_pf_work = xe_modparam.num_pf_work;
+	if (xe->info.num_pf_work < 1)
+		xe->info.num_pf_work = 1;
+	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX)
+		xe->info.num_pf_work = XE_PAGEFAULT_WORK_MAX;
+}
+
 /**
  * xe_device_init_early() - Initialize a new &xe_device instance
  * @xe: the &xe_device to initialize
@@ -539,8 +550,7 @@ int xe_device_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->atomic_svm_timeslice_ms = 5;
-	xe->min_run_period_lr_ms = 5;
+	xe_device_parse_modparam(xe);
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bacbe70ea541..7f084a0ee8ec 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -123,6 +123,8 @@ struct xe_device {
 		u8 revid;
 		/** @info.step: stepping information for each IP */
 		struct xe_step_info step;
+		/** @info.num_pf_work: Number of page fault work thread */
+		int num_pf_work;
 		/** @info.dma_mask_size: DMA address bits */
 		u8 dma_mask_size;
 		/** @info.vram_flags: Vram flags */
@@ -311,14 +313,9 @@ struct xe_device {
 		struct workqueue_struct *pagefault_wq;
 		/** @usm.prefetch_wq: threaded prefetch work queue, unbound */
 		struct workqueue_struct *prefetch_wq;
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
index 848d65265443..4bc28dfc1992 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -29,6 +29,7 @@ struct xe_modparam xe_modparam = {
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
 
+module_param_named(num_pf_work, xe_modparam.num_pf_work, uint, 0600);
+MODULE_PARM_DESC(num_pf_work, "Number of page fault work threads, default=2, min=1, max=8");
+
 static int xe_check_nomodeset(void)
 {
 	if (drm_firmware_drivers_only())
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index a0eb7db07770..6272d9e41207 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -23,6 +23,7 @@ struct xe_modparam {
 	unsigned int max_vfs;
 #endif
 	unsigned int wedged_mode;
+	unsigned int num_pf_work;
 	u32 svm_notifier_size;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd34ec2cb166..8198c60e960a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -398,13 +398,13 @@ int xe_pagefault_init(struct xe_device *xe)
 
 	xe->usm.pagefault_wq = alloc_workqueue("xe_page_fault_work_queue",
 					       WQ_UNBOUND | WQ_HIGHPRI,
-					       XE_PAGEFAULT_WORK_COUNT);
+					       xe->info.num_pf_work);
 	if (!xe->usm.pagefault_wq)
 		return -ENOMEM;
 
 	xe->usm.prefetch_wq = alloc_workqueue("xe_prefetch_work_queue",
 					      WQ_UNBOUND,
-					      XE_PAGEFAULT_WORK_COUNT);
+					      xe->info.num_pf_work);
 	if (!xe->usm.prefetch_wq) {
 		err = -ENOMEM;
 		goto err_pagefault_wq;
@@ -414,7 +414,7 @@ int xe_pagefault_init(struct xe_device *xe)
 	if (err)
 		goto err_out;
 
-	for (i = 0; i < XE_PAGEFAULT_WORK_COUNT; ++i) {
+	for (i = 0; i < xe->info.num_pf_work; ++i) {
 		struct xe_pagefault_work *pf_work = xe->usm.pf_workers + i;
 
 		pf_work->xe = xe;
@@ -482,7 +482,7 @@ static int xe_pagefault_work_index(struct xe_device *xe)
 {
 	lockdep_assert_held(&xe->usm.pf_queue.lock);
 
-	return xe->usm.current_pf_work++ % XE_PAGEFAULT_WORK_COUNT;
+	return xe->usm.current_pf_work++ % xe->info.num_pf_work;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f7d68ab30adc..c38e66614730 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3228,7 +3228,8 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
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

