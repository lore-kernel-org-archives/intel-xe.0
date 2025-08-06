Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66C0C87FCA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A261210E3B1;
	Wed,  6 Aug 2025 06:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jb2grfml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E45910E3AB
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461369; x=1785997369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQTOZAv7/Qlb6bgerMtzVbL0YV4R/O91LkLJAPGq1UI=;
 b=Jb2grfmlVdue/G5l5f//F9OrqwHE6z9JEZRTWmCKzoQwBUPJ/trrKx5J
 SfRqjL9UUPkk9T0wiZZ5wfumg81+SDCQv1oIMXhXFlLyV4PpyAclXXo2g
 Fg5XUj9ZvgnyAySMgtJ60zysoQ42BKItQQom68x8NB5QUxPhxmuRHnMmc
 8tLCuJNl0plqhd6vvpoywPcr9GmxsubU2at4R3YiwulabocIcx8SH5Hio
 Me1z9vA7YlcGTCAeJr6PUbhpYmBbXlIi3/dNQ09mVBrnnLz6Za99cXKva
 U+LZnRe4Hq0sTZdxi9KSbPH8h1lAa4rqq3DYxXscSIGrS63CL+NFl3cgS g==;
X-CSE-ConnectionGUID: ngEkrO45Qym3bzg5OeHH4w==
X-CSE-MsgGUID: zuJ9nTC4RvqPmWdb3M8TQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316940"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: ENidJ7nKSTe6Ol3Ca8U6Rg==
X-CSE-MsgGUID: k5TZtYa6RZWAZ1rokmS7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868966"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 11/11] drm/xe: Add num_pf_queue modparam
Date: Tue,  5 Aug 2025 23:22:42 -0700
Message-Id: <20250806062242.1090416-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
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

Enable quick experiment to see how number of page fault queues affects
performance.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
 drivers/gpu/drm/xe/xe_module.c       |  5 +++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c    |  8 ++++----
 drivers/gpu/drm/xe/xe_vm.c           |  3 ++-
 6 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7c8aee03841..47eb07e9c799 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,6 +413,17 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+static void xe_device_parse_modparame(struct xe_device *xe)
+{
+	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->info.num_pf_queue = xe_modparam.num_pf_queue;
+	if (xe->info.num_pf_queue < 1)
+		xe->info.num_pf_queue = 1;
+	else if (xe->info.num_pf_queue > XE_PAGEFAULT_QUEUE_MAX)
+		xe->info.num_pf_queue = XE_PAGEFAULT_QUEUE_MAX;
+	xe->atomic_svm_timeslice_ms = 5;
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -446,8 +457,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = xe_modparam.force_execlist;
-	xe->atomic_svm_timeslice_ms = 5;
+
+	xe_device_parse_modparame(xe);
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 02b91a698500..d5c5fd7972a1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -243,6 +243,8 @@ struct xe_device {
 		u8 revid;
 		/** @info.step: stepping information for each IP */
 		struct xe_step_info step;
+		/** @info.num_pf_queue: Number of page fault queues */
+		int num_pf_queue;
 		/** @info.dma_mask_size: DMA address bits */
 		u8 dma_mask_size;
 		/** @info.vram_flags: Vram flags */
@@ -399,9 +401,9 @@ struct xe_device {
 		struct rw_semaphore lock;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
 		struct workqueue_struct *pf_wq;
-#define XE_PAGEFAULT_QUEUE_COUNT	4
+#define XE_PAGEFAULT_QUEUE_MAX	8
 		/** @pf_queue: Page fault queues */
-		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
+		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_MAX];
 	} usm;
 
 	/** @pinned: pinned BO state */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..0671ae9d9e5a 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -27,6 +27,7 @@
 #define DEFAULT_PROBE_DISPLAY		true
 #define DEFAULT_VRAM_BAR_SIZE		0
 #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
+#define DEFAULT_NUM_PF_QUEUE		4
 #define DEFAULT_MAX_VFS			~0
 #define DEFAULT_MAX_VFS_STR		"unlimited"
 #define DEFAULT_WEDGED_MODE		1
@@ -40,6 +41,7 @@ struct xe_modparam xe_modparam = {
 	.max_vfs =		DEFAULT_MAX_VFS,
 #endif
 	.wedged_mode =		DEFAULT_WEDGED_MODE,
+	.num_pf_queue =		DEFAULT_NUM_PF_QUEUE,
 	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
 	/* the rest are 0 by default */
 };
@@ -93,6 +95,9 @@ MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
 		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
 
+module_param_named(num_pf_queue, xe_modparam.num_pf_queue, int, 0600);
+MODULE_PARM_DESC(num_pf_queue, "Number of page fault queue, default=4, min=1, max=8");
+
 static int xe_check_nomodeset(void)
 {
 	if (drm_firmware_drivers_only())
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..36ac2151fe16 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -22,6 +22,7 @@ struct xe_modparam {
 	unsigned int max_vfs;
 #endif
 	int wedged_mode;
+	int num_pf_queue;
 	u32 svm_notifier_size;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index f11c70ca6dd9..3c69557c6aa9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -373,11 +373,11 @@ int xe_pagefault_init(struct xe_device *xe)
 
 	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
 					WQ_UNBOUND | WQ_HIGHPRI,
-					XE_PAGEFAULT_QUEUE_COUNT);
+					xe->info.num_pf_queue);
 	if (!xe->usm.pf_wq)
 		return -ENOMEM;
 
-	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
+	for (i = 0; i < xe->info.num_pf_queue; ++i) {
 		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
 		if (err)
 			goto err_out;
@@ -420,7 +420,7 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
 {
 	int i;
 
-	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
+	for (i = 0; i < xe->info.num_pf_queue; ++i)
 		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
 }
 
@@ -442,7 +442,7 @@ static int xe_pagefault_queue_index(struct xe_device *xe)
 
 	WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
 
-	return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
+	return old_pf_queue % xe->info.num_pf_queue;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 147b900b1f0b..67000c4466ab 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3039,7 +3039,8 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
 	bool devmem_possible = IS_DGFX(vm->xe) &&
 		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	bool skip_threads = op->prefetch_range.ranges_count == 1 || sram ||
-		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
+		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK) ||
+		vm->xe->info.num_pf_queue == 1;
 	struct prefetch_thread *thread = skip_threads ? &stack_thread : NULL;
 	int err = 0, idx = 0;
 
-- 
2.34.1

