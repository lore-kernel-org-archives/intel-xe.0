Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94631C7EE32
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D2B10E371;
	Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933F410E366
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677720899; x=1709256899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbR7+SVqQil8ZDHS63CsdmnNCM99ZeWqyvEmUw6zbcI=;
 b=Oi8bCx/U5GQ8QDS3mrq24DTmsgXNpodRMEZcLf79Re6sPWND6HjP1wBw
 BLMFTvaP9mmclZ1WQmgLZ+G6nuqdRlm50bL/3Md8uBH146WvXNwuHt+sg
 xVFHlR+JMckLIfZihLdlBCQrxrFPPAQR3hnUTsythhFJLsHeFbBb+JPDC
 4c90fg1UPl/pH7SCIzeae58uH/HrsshRHwq3qm4hGAAMMS1W5KmQ30EX9
 hwQQDSwmU6DTd1j/RUQQWULR/c0S9JTL4fzGh2qhsEPsz3fHH+xzMTxYj
 qVYNQrgRL+JuI1AoaqH9ll0UrIO5xd1tfpO4CYJNHOfMXFQHphTXxVTQS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397148700"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="397148700"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798635056"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="798635056"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 17:34:08 -0800
Message-Id: <20230302013411.3262608-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302013411.3262608-1-lucas.demarchi@intel.com>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe/display: Move display sw init to
 xe_display.c
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of having all the fields initialized in xe_device_create(), move
the display part to xe_display_create(). Right now the name "_create()"
is not so good as it's basically initializing the fields from xe_device.
There is still work needed to move fields to the display substruct so it
can be an opaque struct.  However, there are already several _init_*()
functions, so use the create() suffix in the hope the struct will be
made opaque soon.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  | 27 ++---------------
 drivers/gpu/drm/xe/xe_display.c | 53 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_display.h |  5 ++++
 3 files changed, 61 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8b0a6cd6fd65..1553949d12b6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -158,7 +158,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
-	destroy_workqueue(xe->display.hotplug.dp_wq);
 	destroy_workqueue(xe->ordered_wq);
 	ttm_device_fini(&xe->ttm);
 }
@@ -211,29 +210,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 
-	/* Initialize display parts here.. */
-	spin_lock_init(&xe->display.fb_tracking.lock);
-
-	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
-
-	drmm_mutex_init(&xe->drm, &xe->sb_lock);
-	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
-	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
-	drmm_mutex_init(&xe->drm, &xe->display.wm.wm_mutex);
-	drmm_mutex_init(&xe->drm, &xe->display.pps.mutex);
-	drmm_mutex_init(&xe->drm, &xe->display.hdcp.comp_mutex);
-	xe->enabled_irq_mask = ~0;
-
-	xe->params.invert_brightness = -1;
-	xe->params.vbt_sdvo_panel_type = -1;
-	xe->params.disable_power_well = -1;
-	xe->params.enable_dc = -1;
-	xe->params.enable_dpcd_backlight = -1;
-	xe->params.enable_dp_mst = -1;
-	xe->params.enable_fbc = -1;
-	xe->params.enable_psr = -1;
-	xe->params.enable_psr2_sel_fetch = -1;
-	xe->params.panel_use_ssc = -1;
+	err = xe_display_create(xe);
+	if (WARN_ON(err))
+		goto err_put;
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 19c1f9945911..34bdb2d60938 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -55,6 +55,59 @@ int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
 	return 0;
 }
 
+static void display_destroy(struct drm_device *dev, void *dummy)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	destroy_workqueue(xe->display.hotplug.dp_wq);
+}
+
+/**
+ * xe_display_create - create display struct
+ * @xe: XE device instance
+ *
+ * Initialize all fields used by the display part.
+ *
+ * TODO: once everything can be inside a single struct, make the struct opaque
+ * to the rest of xe and return it to be xe->display.
+ *
+ * Returns: 0 on success
+ */
+int xe_display_create(struct xe_device *xe)
+{
+	int err;
+
+	/* Initialize display parts here.. */
+	spin_lock_init(&xe->display.fb_tracking.lock);
+
+	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
+
+	drmm_mutex_init(&xe->drm, &xe->sb_lock);
+	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
+	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
+	drmm_mutex_init(&xe->drm, &xe->display.wm.wm_mutex);
+	drmm_mutex_init(&xe->drm, &xe->display.pps.mutex);
+	drmm_mutex_init(&xe->drm, &xe->display.hdcp.comp_mutex);
+	xe->enabled_irq_mask = ~0;
+
+	xe->params.invert_brightness = -1;
+	xe->params.vbt_sdvo_panel_type = -1;
+	xe->params.disable_power_well = -1;
+	xe->params.enable_dc = -1;
+	xe->params.enable_dpcd_backlight = -1;
+	xe->params.enable_dp_mst = -1;
+	xe->params.enable_fbc = -1;
+	xe->params.enable_psr = -1;
+	xe->params.enable_psr2_sel_fetch = -1;
+	xe->params.panel_use_ssc = -1;
+
+	err = drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index cc908d8a7cd9..cb5298ceed3b 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -14,6 +14,8 @@
 
 int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver);
 
+int xe_display_create(struct xe_device *xe);
+
 int xe_display_init_nommio(struct xe_device *xe);
 void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
 
@@ -46,6 +48,9 @@ void xe_display_pm_resume(struct xe_device *xe);
 static inline int
 xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
 
+static inline int
+xe_display_create(struct xe_device *xe) { return 0; }
+
 static inline int
 xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
 
-- 
2.39.0

