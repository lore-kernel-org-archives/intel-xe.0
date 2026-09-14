Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1E9C88E7B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 19:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE5E10F1C3;
	Mon, 14 Sep 2026 19:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea1xaCBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF5B10EFB1;
 Mon, 14 Sep 2026 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789415277; x=1820951277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vkZ4H7KWogiHXdvXNWGydUpvJKgK/PtXqYWB5SWqZ0k=;
 b=ea1xaCBQRmVvPnYhtWcsWxb9/noji5xXFgBXBKFCIoC3LsRg6kfF136a
 9LomOOPSClnYTEeY2onugMyIAstWcUBXyZXarZsquar2eewZbdJ/bZDSD
 vYEOWTRAiX7OCQdDzaKyjVOyD1qXbooz5FXiOUxogCF/UgfhIB69lWGH8
 37hkWZx7qP6E7v0kOBLEiCBpySC3t9T9hkUnL3h6s/oG3VGn2QhJmGY4I
 nRIDBl6FuUVNFN7IQs1/gpAEEJRUSXq5/48k/ZmsA5sHMw3RCcF3nnnHw
 DPELqWX3qTnGbe+2L2EgCM58sbS2K5YDGcxmntZ6Teg7eblOhWLzR630n g==;
X-CSE-ConnectionGUID: EwhCWpakT9G6ttaYmqHvew==
X-CSE-MsgGUID: V2nFNzGLQVa7CBvxa1zwzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92284845"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92284845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:47:57 -0700
X-CSE-ConnectionGUID: h3nRNHp5QZ+QugAVcprDvQ==
X-CSE-MsgGUID: EYiQAgmeROqhxNDIFJpajA==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:47:55 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v6 2/7] drm/xe/pm: introduce PM PME support
Date: Mon, 14 Sep 2026 22:47:32 +0300
Message-ID: <20260914194737.272679-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914194737.272679-1-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Introduce PME support for PME capable devices. Whether device is
PME capable is assessed during PCI probe routine. And the whether
PME is enabled for a specific context is assessed during the PM
runtime suspend call if the device is PME capable.

If the PME is enabled, HPDs can generate PME which in turn call
the runtime resume call and do the wakeup routines. Till now
the driver was relying on HPD polling to wakeup in case of any
HPDs. HPD polling can be avoided in platforms with PME support
and instead rely on this PCI PME for HPD induced wakeup.

v2: access functions for xe.pme.enabled status and clear the pme.
    enabled in case of error in xe_pm_runtime_suspend()

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 13 +++++++++++
 drivers/gpu/drm/xe/xe_pci.c          | 16 +++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c           | 33 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h           |  2 ++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f88bacf63c83..37190473f6db 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -454,6 +454,19 @@ struct xe_device {
 		struct mutex lock;
 	} d3cold;
 
+	/** @pme: Encapsulate pme related stuff */
+	struct {
+		/** @pme.capable: Indicates if device is PME capable */
+		bool capable;
+
+		/** @pme.enabled:
+		 *
+		 * Indicates if PME is enabled - depends on user controllable
+		 * sysfs interface as well
+		 */
+		bool enabled;
+	} pme;
+
 	/** @pm_notifier: Our PM notifier to perform actions in response to various PM events. */
 	struct notifier_block pm_notifier;
 	/** @pm_block: Completion to block validating tasks on suspend / hibernate prepare */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f8e16aefd2f8..e7e6b5a7d738 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1385,8 +1385,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	bool pme_enabled;
 	int err;
 
+	pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
+		      pci_enable_wake(pdev, PCI_D3hot, true) == 0;
+
+	xe_pm_update_pme_enabled(xe, pme_enabled);
+
 	/*
 	 * We hold an additional reference to the runtime PM to keep PF in D0
 	 * during VFs lifetime, as our VFs do not implement the PM capability.
@@ -1397,8 +1403,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	xe_assert(xe, !pci_num_vf(pdev));
 
 	err = xe_pm_runtime_suspend(xe);
-	if (err)
+	if (err) {
+		if (xe_pm_pme_enabled(xe)) {
+			pci_enable_wake(pdev, PCI_D3hot, false);
+			xe_pm_update_pme_enabled(xe, false);
+		}
+
 		return err;
+	}
 
 	pci_save_state(pdev);
 
@@ -1427,6 +1439,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
+	xe_pm_update_pme_enabled(xe, false);
+
 	if (xe->d3cold.allowed) {
 		err = pci_enable_device(pdev);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..f282f7676826 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -78,6 +78,8 @@
  * management (RPS).
  */
 
+#define HAS_PM_PME_SUPPORT(xe) (GRAPHICS_VERx100(xe) >= 3500)
+
 #ifdef CONFIG_LOCKDEP
 static struct lockdep_map xe_pm_runtime_d3cold_map = {
 	.name = "xe_rpm_d3cold_map"
@@ -384,6 +386,14 @@ int xe_pm_init_early(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
 
+static bool xe_pm_pci_pme_capable(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	return HAS_PM_PME_SUPPORT(xe) ?
+		pci_pme_capable(pdev, PCI_D3hot) : false;
+}
+
 /**
  * xe_pm_probe() - Initialize Xe Power Management
  * @xe: the &xe_device instance
@@ -397,6 +407,9 @@ int xe_pm_probe(struct xe_device *xe)
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe->d3cold.capable));
 
+	xe->pme.capable = xe_pm_pci_pme_capable(xe);
+	xe_dbg(xe, "pme: capable=%s\n", str_yes_no(xe->pme.capable));
+
 	return 0;
 }
 
@@ -650,6 +663,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	return 0;
 
 out_resume:
+	xe_pm_update_pme_enabled(xe, false);
 	xe_display_pm_runtime_resume(xe);
 	xe_pxp_pm_resume(xe->pxp);
 out:
@@ -993,6 +1007,25 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 	return 0;
 }
 
+bool xe_pm_pme_enabled(struct xe_device *xe)
+{
+	return xe->pme.enabled;
+}
+
+/**
+ * xe_pm_update_pme_enabled - Update the PME enabled state
+ * @xe: xe device instance
+ * @status: New PME enabled status
+ *
+ * To be called during runtime_pm suspend / resume.
+ * True if conditions are met during runtime_suspend.
+ * False during runtime_resume and other error scenarios in suspend.
+ */
+void xe_pm_update_pme_enabled(struct xe_device *xe, bool status)
+{
+	xe->pme.enabled = status;
+}
+
 /**
  * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6d5ab09cb769..037c73ea4342 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -33,6 +33,8 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
+bool xe_pm_pme_enabled(struct xe_device *xe);
+void xe_pm_update_pme_enabled(struct xe_device *xe, bool status);
 bool xe_rpm_reclaim_safe(const struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 int xe_pm_block_on_suspend(struct xe_device *xe);
-- 
2.43.0

