Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0D7C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 09:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8B310E65C;
	Fri, 12 May 2023 09:39:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74DA10E65C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683884355; x=1715420355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=70C0wWgs8/t790H+e8qKLa0DxlczVQ5OUswXUUXxAQY=;
 b=TuEmRPWiuqbqhjCuq8oQgL283kgUzQcaB22xV2BCOWwGf0rZ2lHeLis5
 Z5kHE61XNyG2cRx2HXwH30QCLGbYhKfVWeW6112f5PYPralM5FkvMAL8j
 n/sqjV/4US45dPgc0WN4oYExQcm0VLXm44WtmMxk2ViNiff1kQQFFmoS3
 LX1ZQo7bdZ741Ehxo8LwCcuWg6STTUv9rnf9zTEAHvf3Id1iPYxhebEo6
 Dr8iGyq+cb+2K2bK5sD9vOOguNvch9wAPYIDTDT4YWIb+dSHhiAV8kXIY
 twoUq0dt+cpsukogNfG3kM1sYuyQWIXQTuQc0ChtskM5bbdZoenFhqQ7N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331115158"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="331115158"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 02:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1030013541"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="1030013541"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 02:39:12 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 15:06:32 +0530
Message-Id: <20230512093632.2988909-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe/pm: d3cold policy
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding pci d3cold capable check support.
Adding a vram_save_restore_threshold modparam, that is the
permissisble threshold for vram save/restore. If vram used
is more then the threshold value then disabllow the d3cold
to avoid the vram save/restore latency.

TODO: At resume vram save/restore only in case card really lost power.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_module.c       |  4 +++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 46 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.c           | 20 ++++++++++++
 drivers/gpu/drm/xe/xe_pm.h           |  1 +
 6 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1cb404e48aaa..1137f544575d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -263,6 +263,9 @@ struct xe_device {
 		bool hold_rpm;
 	} mem_access;
 
+	/** d3cold_capable: Indicates if root port is d3cold capable */
+	bool d3cold_capable;
+
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..1dd515ed8a65 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -26,6 +26,10 @@ u32 xe_force_vram_bar_size;
 module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
 
+u32 xe_vram_save_restore_threshold = 300;
+module_param_named(vram_save_restore_threshold, xe_vram_save_restore_threshold, uint, 0600);
+MODULE_PARM_DESC(vram_save_restore_threshold, "Set the vram used threshold below which vram save/restore premissible (in MB)");
+
 int xe_guc_log_level = 5;
 module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 7169907c3365..620d1b80cab6 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -9,5 +9,6 @@
 extern bool enable_guc;
 extern bool enable_display;
 extern u32 xe_force_vram_bar_size;
+extern u32 xe_vram_save_restore_threshold;
 extern int xe_guc_log_level;
 extern char *xe_param_force_probe;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ee61a03d1afd..2c86a8ab727a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -592,6 +592,40 @@ static void xe_pci_unbounded_bridge_disable_pm(struct pci_dev *pdev)
 	}
 }
 
+static bool xe_pci_d3cold_capable(struct pci_dev *pdev)
+{
+	struct pci_dev *root_pdev;
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev)
+		return false;
+
+	/* D3Cold requires PME capability and _PR3 power resource */
+	if (!pci_pme_capable(root_pdev, PCI_D3cold) || !pci_pr3_present(root_pdev))
+		return false;
+
+	return true;
+}
+
+static void xe_pci_d3cold_enable_disable(struct pci_dev *pdev, bool enable)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct pci_dev *root_pdev;
+
+	if (!xe->d3cold_capable)
+		return;
+
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev)
+		return;
+
+	if (enable)
+		pci_d3cold_enable(pdev);
+	else
+		pci_d3cold_disable(pdev);
+
+}
+
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
@@ -669,6 +703,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 	}
 
+	xe->d3cold_capable = xe_pci_d3cold_capable(pdev);
+
 	xe_pm_runtime_init(xe);
 
 	return 0;
@@ -741,6 +777,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 		pci_set_power_state(pdev, PCI_D3cold);
 	} else {
 		pci_set_power_state(pdev, PCI_D3hot);
+		xe_pci_d3cold_enable_disable(pdev, false);
 	}
 
 	return 0;
@@ -764,6 +801,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 			return err;
 
 		pci_set_master(pdev);
+	} else {
+		xe_pci_d3cold_enable_disable(pdev, true);
 	}
 
 	return xe_pm_runtime_resume(xe);
@@ -774,6 +813,13 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
+	if (!xe->d3cold_capable) {
+		xe->d3cold_allowed = false;
+		return 0;
+	}
+
+	xe->d3cold_allowed = xe_pm_vram_d3cold_allowed(xe);
+
 	/*
 	 * TODO: d3cold should be allowed (true) if
 	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7b57f10ba25..523d5f89ec89 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -16,6 +16,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_irq.h"
+#include "xe_module.h"
 #include "xe_pcode.h"
 
 /**
@@ -117,6 +118,25 @@ int xe_pm_resume(struct xe_device *xe)
 	return 0;
 }
 
+bool xe_pm_vram_d3cold_allowed(struct xe_device *xe)
+{
+	struct ttm_resource_manager *man;
+	u64 vram_used;
+	size_t total_vram_used_mb = 0;
+	int i;
+
+	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+		man = ttm_manager_type(&xe->ttm, i);
+		if (man) {
+			vram_used = ttm_resource_manager_usage(man);
+			total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
+		}
+	}
+
+	return total_vram_used_mb < xe_vram_save_restore_threshold;
+}
+
 void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6a885585f653..33515d5c2cc2 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -17,6 +17,7 @@ void xe_pm_runtime_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
+bool xe_pm_vram_d3cold_allowed(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
-- 
2.38.0

