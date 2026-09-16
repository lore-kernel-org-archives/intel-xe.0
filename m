Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F34CC88E7F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 19:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF50A10E0BD;
	Wed, 16 Sep 2026 19:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NG6BDXjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9403110E0BD
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789585908; x=1821121908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KUR/JJkQWuSvxiHz0/Yu6eS72hg8DlaBuX6O1onwdK0=;
 b=NG6BDXjNt8QHQYDav14t+TznhJr+jZQ+lZluQE8zip1dHRxayc8pxunV
 oeu+iwKrfcdCXPebqg0TheMUOMAdWVzBUcwrllGGklpo6qKJ001vsqRlk
 o8tIEgYBauBdYUpxPY/62uGIcWrflB5CXvvdahdoeBKT4RYUcyNfS+v/G
 4D9pq7I9OQzlXdpjyz2cQIsz/AL23rFLqUXDQcsERNcq+9dKB7tPMA72p
 BPSuHO1mh4yfZXc/R9s7J2MZ0juZJ1JbLY+49hxt7jo4VrKl3CyguhRFS
 vJQHaII01BtqY9ThnYt7jM6/Lx1wsQG3yl3A+QXPcTrAKWhYinU/3XvSl g==;
X-CSE-ConnectionGUID: Q75L5JZ/TMGmkw6ZECGgMg==
X-CSE-MsgGUID: B7PtgySDTLmvgtCWkndGlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89840255"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89840255"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 12:11:48 -0700
X-CSE-ConnectionGUID: +EjpmLBsTyyMKEdrHL0JpA==
X-CSE-MsgGUID: BbeewtGaSNO5+zFxYF+k2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270144935"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2026 12:11:48 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6] drm/xe: Poll GT for C6 before D3
Date: Wed, 16 Sep 2026 12:06:14 -0700
Message-Id: <20260916190614.3047807-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Ensure GT C6 state before D3 transition in runtime suspend flow.
This avoids the scenario where GT is being accessed after D3 state
is programmed. If the check for C6 fails, resume the device so it is
not stuck in an intermediate state.

v2: Force resume when we cancel suspend due to C6 check (Sashiko)
v3: Abort the suspend properly when idle check fails (Sashiko)
v4: Only check for C6 during suspend (Rodrigo). Have check in
xe_pci_runtime_suspend() instead of xe_pci_suspend().
v5: Don't checkfor PVC (Sashiko), rename function from_device_c6
to _device_idle
v6: Rename to _wait_all_c6 and move PVC check to gt_idle (Rodrigo)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 39 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c     | 13 ++++++++++-
 drivers/gpu/drm/xe/xe_pm.c      | 18 +++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h      |  1 +
 5 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index c208d7563e36..2eefd62f8d59 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -8,10 +8,12 @@
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
+#include <linux/iopoll.h>
 #include "xe_force_wake.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
@@ -451,3 +453,40 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
 
 	return 0;
 }
+
+static int wait_for_gt_c6_state(struct xe_gt *gt, u32 timeout_ms)
+{
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
+	enum xe_gt_idle_state state;
+
+	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
+			       state == GT_IDLE_C6,
+			       20,
+			       timeout_ms * USEC_PER_MSEC,
+			       false);
+}
+
+/**
+ * xe_gt_idle_wait_for_c6 - Poll for GT C6
+ * @gt: GT object
+ * @timeout_ms: wait time in ms
+ *
+ * This function waits for GT to enter C6.
+ *
+ * Return: 0 on success, -EAGAIN otherwise
+ */
+int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms)
+{
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return 0;
+
+	if (gt_to_xe(gt)->info.platform == XE_PVC)
+		return 0;
+
+	if (wait_for_gt_c6_state(gt, timeout_ms)) {
+		xe_gt_dbg(gt, "GT is not in C6\n");
+		return -EAGAIN;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 9c34a155e102..2c8e9adf4a68 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
 int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
 u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
+int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms);
 
 #endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..1a1bae5b936d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1381,7 +1381,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	int err;
+	int err, ret;
 
 	/*
 	 * We hold an additional reference to the runtime PM to keep PF in D0
@@ -1396,6 +1396,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
+	err = xe_pm_wait_all_c6(xe);
+	if (err) {
+		drm_dbg(&xe->drm, "Resuming - GT C6 check failed!");
+		ret = xe_pm_runtime_resume(xe);
+		if (ret) {
+			drm_err(&xe->drm, "Resume failed after suspend was canceled");
+			return ret;
+		}
+		return err;
+	}
+
 	pci_save_state(pdev);
 
 	if (xe->d3cold.allowed) {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..4a745c3a933b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -1030,6 +1030,24 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	mutex_unlock(&xe->d3cold.lock);
 }
 
+/**
+ * xe_pm_wait_all_c6() - Wait for all GTs to enter C6.
+ * @xe: xe device instance
+ *
+ * Return: 0 on success, -EAGAIN on failure
+ */
+int xe_pm_wait_all_c6(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		if (xe_gt_idle_wait_for_c6(gt, 200))
+			return -EAGAIN;
+
+	return 0;
+}
+
 /**
  * xe_pm_module_init() - Perform xe_pm specific module initialization.
  *
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6d5ab09cb769..fd8b2eab5de9 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -36,6 +36,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
 bool xe_rpm_reclaim_safe(const struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 int xe_pm_block_on_suspend(struct xe_device *xe);
+int xe_pm_wait_all_c6(struct xe_device *xe);
 void xe_pm_might_block_on_suspend(void);
 int xe_pm_module_init(void);
 
-- 
2.38.1

