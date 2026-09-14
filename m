Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CE6C88E6F
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FB410F239;
	Mon, 14 Sep 2026 20:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQJB5tX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1DF10F233;
 Mon, 14 Sep 2026 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789418455; x=1820954455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNXgdvnY/joQa0CaO0DLcYxwCEYz2CkDb+rMkKTszrc=;
 b=aQJB5tX0jdzm7XCrMmiXv9JF8N1DsUorNp1NB9ZWpxw6FnTo3dL8SspZ
 HBjl8CvI+YCZteOw6Sz5SR53bATHu3R6NJo6YdNU0ca13lTDOqYpyBYOY
 syZ7tl4JHAaaF8jEFy9DNRM23AB6FgKG1YI4wE5jKkKjjrHWZX/I5kU9K
 Ijt6tZwYjgrIeBo/1cU1TRmQq7qGQ9aqSTnEUj+ftx0ggQB6IxScg7NyM
 qqb2NVDmdAzwoM3xgGNg2XW9WC/8hZqvp6IkkdAmdA1Dyf9qrLKTp5sIa
 6Bj9N81lE/jOIl4wa+daeucvT2weqPZ0BS9uz9Y7xjei8KjPbUwdQ/8QT w==;
X-CSE-ConnectionGUID: yIWfPwW/R+KR2bqcr4jX+A==
X-CSE-MsgGUID: XWjMHi2iT8u9o8WDxLPOnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107288127"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107288127"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:55 -0700
X-CSE-ConnectionGUID: Ix6UWS2pQTqbI+kFNCUb3Q==
X-CSE-MsgGUID: sG+bEPC+RvKlZttGS2zkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270113254"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:53 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v7 2/7] drm/xe/pm: introduce PM PME support
Date: Mon, 14 Sep 2026 23:40:29 +0300
Message-ID: <20260914204034.309566-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914204034.309566-1-vinod.govindapillai@intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
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

v3: use the local pme_enabled flag to clear the device wakeup
    incase of error

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++++++
 drivers/gpu/drm/xe/xe_pci.c          | 16 +++++++++++-
 drivers/gpu/drm/xe/xe_pm.c           | 39 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h           |  2 ++
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4661bfce2f4e..bb4234f00453 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -460,6 +460,19 @@ struct xe_device {
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
index 30c81042145f..3e7ee67c46f9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1384,8 +1384,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
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
@@ -1396,8 +1402,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	xe_assert(xe, !pci_num_vf(pdev));
 
 	err = xe_pm_runtime_suspend(xe);
-	if (err)
+	if (err) {
+		if (pme_enabled) {
+			pci_enable_wake(pdev, PCI_D3hot, false);
+			xe_pm_update_pme_enabled(xe, false);
+		}
+
 		return err;
+	}
 
 	pci_save_state(pdev);
 
@@ -1426,6 +1438,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
+	xe_pm_update_pme_enabled(xe, false);
+
 	if (xe->d3cold.allowed) {
 		err = pci_enable_device(pdev);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..ca5665d015e9 100644
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
@@ -993,6 +1007,31 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 	return 0;
 }
 
+/**
+ * xe_pm_pme_enabled - get the current state of PME enabled status
+ * @xe: xe device instance
+ *
+ * Return:
+ * * True if PME is enabled, false otherwise.
+ */
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
+ * Called during runtime suspend / resume with status set to True if PME is
+ * enabled during runtime_suspend. Cleared on runtime_resume.
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

