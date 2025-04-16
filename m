Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D6EC369C2
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 15:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A46910E968;
	Wed, 16 Apr 2025 15:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkqKFwzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4237E10E0A3
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744816169; x=1776352169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukhTZ2wzaKjjxnGiAP/BMGTenQHNnFpoWCF4KBUxi3E=;
 b=VkqKFwzVi+HW5DVl2bPhDWycJGakmUw0ZToZSg7H5vHyHwlCiprEjSV/
 aw2PDrS8nFM3l4lO7Ky/xaUHKV2cPOo6qHSObVi6/HDYKxILY2WG4k90A
 3UvmyFanAxbxbrd/xnsPG2WcRUHprVK+sR/Dhv0wn+647YLMfFpsZ+iHb
 xAPrSH+kXke+egdUF4Alc1hIwPfTfM+jFA5PqfBG7tLpMDxrusS4L9vkI
 Jeik8WdRufAkNh/dGvEGP47Nn3Y4klBQdmGzgT6a4mM28yMoVuapj//kj
 E21lFZCzgK0jpp72NJL4g2dKmP4CNTIrr/DGbVocFlDR9knkaT1JT/+4Z w==;
X-CSE-ConnectionGUID: CZKHGwu2TfyX25NG+qijxw==
X-CSE-MsgGUID: v5a8OcEUTN2I5HKKVpyCYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46383162"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46383162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:09:28 -0700
X-CSE-ConnectionGUID: ooEw6eGDTuyoxMuIgUZNdw==
X-CSE-MsgGUID: O2CakGB8TFCd4ntxlVgqwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135495906"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.11])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:09:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 1/3] drm/xe: evict user memory in PM notifier
Date: Wed, 16 Apr 2025 16:09:15 +0100
Message-ID: <20250416150913.434369-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416150913.434369-5-matthew.auld@intel.com>
References: <20250416150913.434369-5-matthew.auld@intel.com>
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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
index b9a892c44c67..06c65dace026 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -521,6 +521,9 @@ struct xe_device {
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

