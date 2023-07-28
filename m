Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E19C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 14:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7C810E6F2;
	Fri, 28 Jul 2023 14:13:34 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7982110E6F2
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 14:13:32 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Jul 2023 16:13:22 +0200
Message-Id: <20230728141322.93703-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Improve s2idle handling.
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

We accidentally always pass true as s2idle argument, instead of
calculating it in the same way as i915.

Suspend modes were removed to achieve compatibility with i915, but
accidentally left in the source code.

While at it, fix all other cases too, s2idle will go into a D1 state and
setting a lower power state should be handled by PCI core.

Maybe my laptop stops draining so much power during suspend now? I can
only hope..

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h | 6 ------
 drivers/gpu/drm/xe/xe_display.c                           | 6 ++++--
 drivers/gpu/drm/xe/xe_pci.c                               | 6 ------
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
index 9251c05dfd11..ce2b9bf3918d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
@@ -5,12 +5,6 @@
 
 #include "intel_wakeref.h"
 
-enum i915_drm_suspend_mode {
-	I915_DRM_SUSPEND_IDLE,
-	I915_DRM_SUSPEND_MEM,
-	I915_DRM_SUSPEND_HIBERNATE,
-};
-
 static inline void disable_rpm_wakeref_asserts(void *rpm)
 {
 }
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 8e39fb7f1fc8..ec7a654bf587 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -333,6 +333,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
 
 void xe_display_pm_suspend(struct xe_device *xe)
 {
+	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
 	if (!xe->info.enable_display)
 		return;
 
@@ -352,7 +353,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 
 	intel_suspend_encoders(xe);
 
-	intel_opregion_suspend(xe, PCI_D3cold);
+	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
 
 	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
 
@@ -361,10 +362,11 @@ void xe_display_pm_suspend(struct xe_device *xe)
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
+	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
 	if (!xe->info.enable_display)
 		return;
 
-	intel_power_domains_suspend(xe, I915_DRM_SUSPEND_MEM);
+	intel_power_domains_suspend(xe, s2idle);
 
 	intel_display_power_suspend_late(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78df43c20cd2..63387d99b3ed 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -728,10 +728,6 @@ static int xe_pci_suspend(struct device *dev)
 	pci_save_state(pdev);
 	pci_disable_device(pdev);
 
-	err = pci_set_power_state(pdev, PCI_D3hot);
-	if (err)
-		return err;
-
 	return 0;
 }
 
@@ -744,8 +740,6 @@ static int xe_pci_resume(struct device *dev)
 	if (err)
 		return err;
 
-	pci_restore_state(pdev);
-
 	err = pci_enable_device(pdev);
 	if (err)
 		return err;
-- 
2.39.2

