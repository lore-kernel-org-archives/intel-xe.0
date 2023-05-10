Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B567C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 19:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F419410E513;
	Wed, 10 May 2023 19:54:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7C10E515
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683748489; x=1715284489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbTd9AupD3X6tBXsjg3kWLu3pJQZExRFQGxFPzJTS7Y=;
 b=Co0HKcZAY4QAYZrA809HNzzjwfhnEhe0h6WdBbkPImMlgyabc7nt9QQM
 yrj5/GEchiaRDME44p5XrgpHpKRqLcnMcqDF8XD0SYAilhaNwIFcdxMiB
 E6erxJ5bxZ0Wj0dq2v3xUmK7LXXRm8QFxzsfvBEYSFzZU6Lgl01KWz/2U
 0DThXTMdVoWUhOS5WblLLEHBgzm9SREn0Sy+vzaYo6T/AA2qROg0mEjxE
 32FVCl2A5InvhywXftrsjC+0vf6x4utT7r2j4puw8tKeutXX9UjghEnrn
 deB25izW5S49YQn0n6cM9F0BRdWEhzKLh+0PTDsVc0Lvp7wJeE5mSal+T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350336278"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="350336278"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730056894"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="730056894"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 12:54:24 -0700
Message-Id: <20230510195424.3045127-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510195424.3045127-1-lucas.demarchi@intel.com>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe/display: Use xe_display_driver prefix
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use a separate xe_display_driver prefix for functions dealing with the
DRM driver struct or the early probe. This splits
xe_display_set_driver_hooks() in 2: one to allow the driver to defer the
probe if the display needs that and the other to set the additional
hooks in the driver struct.  Although the hooks are set by every device
binding to the module, they only depend on the module param
enable_display, so that is safe.

Since unset_driver_hooks() is not really tweaking the driver, but rather
the driver_features saved in the device, rename it to
unset_display_features() to clarify that.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  |  4 +--
 drivers/gpu/drm/xe/xe_display.c | 44 ++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_display.h |  8 +++---
 drivers/gpu/drm/xe/xe_pci.c     |  4 +++
 4 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1daacc533083..cb37e8556b37 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -171,9 +171,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	struct xe_device *xe;
 	int err;
 
-	err = xe_display_set_driver_hooks(pdev, &driver);
-	if (err)
-		return ERR_PTR(err);
+	xe_display_driver_set_hooks(&driver);
 
 	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 43c5af1ff80e..d1782e0737ed 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -34,37 +34,47 @@
 
 /* Xe device functions */
 
+/**
+ * xe_display_driver_probe_defer - Detect if we need to wait for other drivers
+ *				   early on
+ * @pdev: PCI device
+ *
+ * Returns: 0 if probe can continue, -EPROBE_DEFER otherwise
+ */
+int xe_display_driver_probe_defer(struct pci_dev *pdev)
+{
+	if (!enable_display)
+		return 0;
+
+	return intel_display_driver_probe_defer(pdev);
+}
+
 static void xe_display_last_close(struct drm_device *dev)
 {
-	intel_fbdev_restore_mode(to_xe_device(dev));
+	struct xe_device *xe = to_xe_device(dev);
+
+	if (xe->info.enable_display)
+		intel_fbdev_restore_mode(to_xe_device(dev));
 }
 
 /**
- * xe_display_set_driver_hooks - set driver flags and hooks for display
- * @pdev: PCI device
+ * xe_display_driver_set_hooks - Add driver flags and hooks for display
  * @driver: DRM device driver
  *
  * Set features and function hooks in @driver that are needed for driving the
- * display IP, when that is enabled.
- *
- * Returns: 0 on success
+ * display IP. This sets the driver's capability of driving display, regardless
+ * if the device has it enabled
  */
-int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
+void xe_display_driver_set_hooks(struct drm_driver *driver)
 {
 	if (!enable_display)
-		return 0;
-
-	/* Detect if we need to wait for other drivers early on */
-	if (intel_display_driver_probe_defer(pdev))
-		return -EPROBE_DEFER;
+		return;
 
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
 	driver->lastclose = xe_display_last_close;
-
-	return 0;
 }
 
-static void unset_driver_hooks(struct xe_device *xe)
+static void unset_display_features(struct xe_device *xe)
 {
 	xe->drm.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
 }
@@ -488,7 +498,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 void xe_display_info_init(struct xe_device *xe)
 {
 	if (!xe->info.enable_display) {
-		unset_driver_hooks(xe);
+		unset_display_features(xe);
 		return;
 	}
 
@@ -539,7 +549,7 @@ void xe_display_info_init(struct xe_device *xe)
 	default:
 		drm_warn(&xe->drm, "Unknown display IP\n");
 		xe->info.enable_display = false;
-		unset_driver_hooks(xe);
+		unset_display_features(xe);
 		return;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 84c556111c91..9e29de012df7 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -12,7 +12,8 @@ struct drm_driver;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
-int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver);
+int xe_display_driver_probe_defer(struct pci_dev *pdev);
+void xe_display_driver_set_hooks(struct drm_driver *driver);
 
 int xe_display_create(struct xe_device *xe);
 
@@ -47,8 +48,9 @@ void xe_display_pm_resume(struct xe_device *xe);
 
 #else
 
-static inline int
-xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
+static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
+
+static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
 
 static inline int
 xe_display_create(struct xe_device *xe) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3fa3e8706d98..8b3d4d5006e8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -618,6 +618,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
+	err = xe_display_driver_probe_defer(pdev);
+	if (err)
+		return err;
+
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
-- 
2.40.1

