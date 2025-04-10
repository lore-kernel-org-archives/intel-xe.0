Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF73C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 16:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1803F10EA0B;
	Thu, 10 Apr 2025 16:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/SIpWCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCC910EA0D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302081; x=1775838081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kVZ3elL0AFda4sNZ0gDuf90T7QL3R46twKiafR5CxxA=;
 b=c/SIpWCRLZd/HVMp3Zr2LKtn+XUHh06wAKtwJODiAom2CpLOmNXK3yKb
 5N4LoWmd3fVkKDYGnbS3dJj0mVWuK34vPtSTmwN98u/l5TIjzIdw8FY2C
 pV1vniNA0l3UbnHsH34YR9JUAtAOLFuO1i8LlKKzfPklMH7BB2sBO2JeW
 Nt8F5oe39m74Lw/z/JfFgV4UH7pHDspZJAb8575wHGrc8HUApeldWbqKx
 jhfGDPrXPFY8lnF9z1dwQ0If0z9+vk1T6SItLUN5RwuNcPY1i3Y7+7FLl
 Fz0RTlzesNMXYvgjnho9r1pbGTdDqjzTu4DBOU+W6QBZUgSEOP0qlp5l1 Q==;
X-CSE-ConnectionGUID: mu2qbp2xSmiq+keSUV5QHw==
X-CSE-MsgGUID: hv3ia+hwQe6rFs8UOAe+xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45733765"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45733765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:21 -0700
X-CSE-ConnectionGUID: WJot73E5SPOTa+/g97QJug==
X-CSE-MsgGUID: 81LSjr0ySBiuGtQSzLoRtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129490551"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.125])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:21:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/3] drm/xe: evict user memory in PM notifier
Date: Thu, 10 Apr 2025 17:20:18 +0100
Message-ID: <20250410162016.158474-6-matthew.auld@intel.com>
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

In the case of VRAM we might need to allocate large amounts of
GFP_KERNEL memory on suspend, however doing that directly in the driver
.suspend()/.prepare() callback is not advisable (no swap for example).

To improve on this we can instead hook up to the PM notifier framework
which is invoked at an earlier stage. We effectively call the evict
routine twice, where the notifier will have hopefully have cleared out
most if not everything by the time we call it a second time when
entering the .suspend() callback. For s4 we also get the added benefit
of allocating the system pages before the hibernation image size is
calculated, which looks more sensible.

Note that the .suspend() hook is still responsible for dealing with all
the pinned memory. Improving that is left to another patch.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1181
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4288
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4566
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c     | 45 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_bo_evict.h     |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_pci.c          |  2 +-
 drivers/gpu/drm/xe/xe_pm.c           | 55 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pm.h           |  2 +-
 6 files changed, 84 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 2bf74eb7f281..748360fd2439 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -47,25 +47,17 @@ static int xe_bo_apply_to_pinned(struct xe_device *xe,
 }
 
 /**
- * xe_bo_evict_all - evict all BOs from VRAM
- *
+ * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM
  * @xe: xe device
  *
- * Evict non-pinned user BOs first (via GPU), evict pinned external BOs next
- * (via GPU), wait for evictions, and finally evict pinned kernel BOs via CPU.
- * All eviction magic done via TTM calls.
+ * Evict non-pinned user BOs (via GPU).
  *
  * Evict == move VRAM BOs to temporary (typically system) memory.
- *
- * This function should be called before the device goes into a suspend state
- * where the VRAM loses power.
  */
-int xe_bo_evict_all(struct xe_device *xe)
+int xe_bo_evict_all_user(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
-	struct xe_tile *tile;
 	u32 mem_type;
-	u8 id;
 	int ret;
 
 	/* User memory */
@@ -91,9 +83,34 @@ int xe_bo_evict_all(struct xe_device *xe)
 		}
 	}
 
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
-				    &xe->pinned.late.external,
-				    xe_bo_evict_pinned);
+	return 0;
+}
+
+/**
+ * xe_bo_evict_all - evict all BOs from VRAM
+ * @xe: xe device
+ *
+ * Evict non-pinned user BOs first (via GPU), evict pinned external BOs next
+ * (via GPU), wait for evictions, and finally evict pinned kernel BOs via CPU.
+ * All eviction magic done via TTM calls.
+ *
+ * Evict == move VRAM BOs to temporary (typically system) memory.
+ *
+ * This function should be called before the device goes into a suspend state
+ * where the VRAM loses power.
+ */
+int xe_bo_evict_all(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+	int ret;
+
+	ret = xe_bo_evict_all_user(xe);
+	if (ret)
+		return ret;
+
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
+				    &xe->pinned.late.evicted, xe_bo_evict_pinned);
 
 	if (!ret)
 		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index d63eb3fc5cc9..e7f048634b32 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -9,6 +9,7 @@
 struct xe_device;
 
 int xe_bo_evict_all(struct xe_device *xe);
+int xe_bo_evict_all_user(struct xe_device *xe);
 int xe_bo_restore_early(struct xe_device *xe);
 int xe_bo_restore_late(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0369fc09c9da..495bc00ebed4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -522,6 +522,9 @@ struct xe_device {
 		struct mutex lock;
 	} d3cold;
 
+	/** @pm_notifier: Our PM notifier to perform actions in response to various PM events. */
+	struct notifier_block pm_notifier;
+
 	/** @pmt: Support the PMT driver callback interface */
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4fe7e0d941a9..a4caa6222b6f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -747,7 +747,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 		return;
 
 	xe_device_remove(xe);
-	xe_pm_runtime_fini(xe);
+	xe_pm_fini(xe);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index aaba2a97bb3a..e7ea4003dbf8 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -282,6 +282,29 @@ static u32 vram_threshold_value(struct xe_device *xe)
 	return DEFAULT_VRAM_THRESHOLD;
 }
 
+static int xe_pm_notifier_callback(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct xe_device *xe = container_of(nb, struct xe_device, pm_notifier);
+	int err = 0;
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		xe_pm_runtime_get(xe);
+		err = xe_bo_evict_all_user(xe);
+		xe_pm_runtime_put(xe);
+		if (err)
+			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
+		break;
+	}
+
+	if (err)
+		return NOTIFY_BAD;
+
+	return NOTIFY_DONE;
+}
+
 /**
  * xe_pm_init - Initialize Xe Power Management
  * @xe: xe device instance
@@ -295,6 +318,11 @@ int xe_pm_init(struct xe_device *xe)
 	u32 vram_threshold;
 	int err;
 
+	xe->pm_notifier.notifier_call = xe_pm_notifier_callback;
+	err = register_pm_notifier(&xe->pm_notifier);
+	if (err)
+		return err;
+
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
 		return 0;
@@ -304,24 +332,23 @@ int xe_pm_init(struct xe_device *xe)
 	if (xe->d3cold.capable) {
 		err = xe_device_sysfs_init(xe);
 		if (err)
-			return err;
+			goto err_unregister;
 
 		vram_threshold = vram_threshold_value(xe);
 		err = xe_pm_set_vram_threshold(xe, vram_threshold);
 		if (err)
-			return err;
+			goto err_unregister;
 	}
 
 	xe_pm_runtime_init(xe);
-
 	return 0;
+
+err_unregister:
+	unregister_pm_notifier(&xe->pm_notifier);
+	return err;
 }
 
-/**
- * xe_pm_runtime_fini - Finalize Runtime PM
- * @xe: xe device instance
- */
-void xe_pm_runtime_fini(struct xe_device *xe)
+static void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
@@ -329,6 +356,18 @@ void xe_pm_runtime_fini(struct xe_device *xe)
 	pm_runtime_forbid(dev);
 }
 
+/**
+ * xe_pm_fini - Finalize PM
+ * @xe: xe device instance
+ */
+void xe_pm_fini(struct xe_device *xe)
+{
+	if (xe_device_uc_enabled(xe))
+		xe_pm_runtime_fini(xe);
+
+	unregister_pm_notifier(&xe->pm_notifier);
+}
+
 static void xe_pm_write_callback_task(struct xe_device *xe,
 				      struct task_struct *task)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 998d1ed64556..59678b310e55 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -17,7 +17,7 @@ int xe_pm_resume(struct xe_device *xe);
 
 int xe_pm_init_early(struct xe_device *xe);
 int xe_pm_init(struct xe_device *xe);
-void xe_pm_runtime_fini(struct xe_device *xe);
+void xe_pm_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
-- 
2.49.0

