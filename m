Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A678EC88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D610E8BE;
	Thu, 10 Sep 2026 21:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTVTtRbc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D5C10E8BE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789076035; x=1820612035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xdInKLyIRNy6Bc5wBr2Y+HtiRneTGuiGwS9coIMMGxw=;
 b=WTVTtRbcCW58wFbfu8oj3zPyVfxeEGPg4VJSVDGEyZWGtaESGS8lfRcM
 DSy0STgyhe8RYY6YGbpioD0Rua/PsjjpaniCOylJZs/6ZKJDfLljU1Yj3
 wwpZyOBeuTFz4s4lMPQoTXVMy40wte18UCZA4FXbBfL7/weEiRqGlQEMA
 DLJhdves0JBd+swhkKneYvTVDfBaJCa+gfpvVGvABNCc2n1CcZXhKKKNK
 gy9WPNN+kc0F4mdxspvFuGO/Hm+BsL59x9cYvTnMrFvx1gXRbLUkqJtaE
 uy9wwzPLCDWfT+3XxjkWuwkU90HitdyNFZSqWceM3+1tqWe/AamPo9DRb Q==;
X-CSE-ConnectionGUID: Vg//LyaQRNavQdwnanxbRw==
X-CSE-MsgGUID: NYvGZRddQX6H40AjxSYEHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100133458"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="100133458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:33:54 -0700
X-CSE-ConnectionGUID: WIfcRHHRST25yiaRj2QIlA==
X-CSE-MsgGUID: tydSMQKrRSGfN7Xi2XdzuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275525653"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa004.jf.intel.com with ESMTP; 10 Sep 2026 14:33:53 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime idleness
Date: Thu, 10 Sep 2026 14:28:22 -0700
Message-Id: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
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

Inspect all GT force wake bits in the idle check for runtime suspend.
This includes the ones not typically used by Xe KMD as well. Skip suspend
when any of these bits are set, since it could mean someone is trying to
keep the GT awake.

Also add a call to pm_runtime_autosuspend() inside the idle check. This
ensures a PM subsystem retry at a later time.

v2: Only check the GT domain FW register. Other domains require a GT force
wake applied before we can read their registers. Retry if idleness check
fails (Sashiko)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Assisted-by: Claude:Claude-Sonnet-5
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c        |  6 +++++-
 drivers/gpu/drm/xe/xe_pm.c         | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h         |  1 +
 5 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..0acb796c756c 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -148,6 +148,31 @@ static int domain_sleep_wait(struct xe_gt *gt,
 	return __domain_wait(gt, domain, false);
 }
 
+/**
+ * xe_force_wake_any_bit_set - Return true if any force wake bit is set
+ * @fw: struct xe_force_wake
+ * @id: Force wake domain id
+ *
+ * Check if any multithread force wake bit is set for a given domain ID.
+ *
+ * Return: true if any bit in the force wake reg is set
+ */
+bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain = &fw->domains[id];
+	u32 val;
+
+	val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
+	if (val & 0xFFFF) {
+		xe_gt_dbg(gt, "FW bit set in domain: %d, reg: 0x%x, val: 0x%x",
+			  domain->id, domain->reg_ctl.addr, val);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * xe_force_wake_get() : Increase the domain refcount
  * @fw: struct xe_force_wake
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e2721f205d6c..53941e5a0fbe 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -18,6 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
+bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id);
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..a79d928ad75a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1438,10 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int ret;
 
 	xe_pm_d3cold_allowed_toggle(xe);
 
-	return 0;
+	ret = xe_pm_check_runtime_idle(xe);
+	pm_runtime_autosuspend(dev);
+
+	return ret;
 }
 
 static const struct dev_pm_ops xe_pm_ops = {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..e8d4cdbaef88 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -17,6 +17,8 @@
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_force_wake_types.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
@@ -1030,6 +1032,23 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	mutex_unlock(&xe->d3cold.lock);
 }
 
+/**
+ * xe_pm_check_runtime_idle() - Perform checks before signaling runtime idle.
+ *
+ * Return: 0 on success, non-zero on finding device not idle
+ */
+int xe_pm_check_runtime_idle(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
+			return -EBUSY;
+
+	return 0;
+}
+
 /**
  * xe_pm_module_init() - Perform xe_pm specific module initialization.
  *
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6d5ab09cb769..d1f6a694b7c4 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -38,6 +38,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 int xe_pm_block_on_suspend(struct xe_device *xe);
 void xe_pm_might_block_on_suspend(void);
 int xe_pm_module_init(void);
+int xe_pm_check_runtime_idle(struct xe_device *xe);
 
 static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
 
-- 
2.38.1

