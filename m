Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F0EC71153
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 19:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CED10E0FA;
	Mon, 11 Sep 2023 19:47:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A8210E0FA
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 19:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694461649; x=1725997649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D+GZ3ghwBa5Dc4LyQrmCBg8Q4Z8U8ErO9AcwZMAm39E=;
 b=UTfC7TeAAuOT7t1mYsTGTnETtMKcgighrSAMV9UCxCZiRmBrp62nHuLY
 gCzB2CBgAqpWYNUkUo9Ge0hJxFZyK+GmPkBOoSRweorSjm2Grch8+OgEX
 3NSpiR3nv17U2ptpUz22oPj2n1rJ4mUXTzZCMlSuVUKglqJHERjnAVAgv
 37OYtmu1E+nyScmPDdBf2bLRigo8ktl+dfdtZzPhjXLF+GqypzcAy+mEF
 nSy1bAGkdrOsljURTPz6Kk0I062weSx5XJuJtZAlBqpnnssoVWV8vioFe
 HgqEBVzZEv0DD3jsC/4sM4ik1dkuoNmWLNBskMKLX7Pll9370AAQItmP2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="380890300"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="380890300"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 12:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="990236492"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="990236492"
Received: from swedhana-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.33.188])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 12:47:27 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 11 Sep 2023 16:47:12 -0300
Message-ID: <20230911194712.34387-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911194712.34387-1-gustavo.sousa@intel.com>
References: <20230911194712.34387-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] fixup! drm/xe/display: Implement display
 support
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

Finalizer counterparts of display initializers are registered with
drmm_add_action_or_reset(). Since there are no other explicit users of
them outside of xe_display.c, let's turn them into static functions.

While at it, since this is a fixup patch, also do other cleanups
suggested by Lucas:

    * s/xe_display_modset_driver_remove/xe_display_driver_remove/

    * Remove the unused xe_display_enable()

    * s,xe_display_unlink,xe_display_fini,

      The original suggestion for the above was to replace with
      xe_display_shutdown, but I went with xe_display_fini to be
      consistent with the other "stepped" display finalizers.

    * Group functions in the header by namespaces.

v2:
  - Add more cleanups. (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  |  8 ++++----
 drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_display.h | 33 ++++++---------------------------
 3 files changed, 15 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 109aeb25d19c..a964dc205da9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -342,12 +342,12 @@ int xe_device_probe(struct xe_device *xe)
 	return 0;
 
 err_fini_display:
-	xe_display_modset_driver_remove(xe);
+	xe_display_driver_remove(xe);
 
 err_irq_shutdown:
 	xe_irq_shutdown(xe);
 err:
-	xe_display_unlink(xe);
+	xe_display_fini(xe);
 	return err;
 }
 
@@ -356,14 +356,14 @@ static void xe_device_remove_display(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
-	xe_display_modset_driver_remove(xe);
+	xe_display_driver_remove(xe);
 }
 
 void xe_device_remove(struct xe_device *xe)
 {
 	xe_device_remove_display(xe);
 
-	xe_display_unlink(xe);
+	xe_display_fini(xe);
 
 	xe_irq_shutdown(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index a453946ad108..37278f73cb39 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -132,7 +132,7 @@ int xe_display_create(struct xe_device *xe)
 	return 0;
 }
 
-void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
+static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
@@ -164,7 +164,7 @@ int xe_display_init_nommio(struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
 
-void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
@@ -204,7 +204,7 @@ int xe_display_init_noirq(struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
 }
 
-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
@@ -236,7 +236,7 @@ int xe_display_init(struct xe_device *xe)
 	return intel_display_driver_probe(xe);
 }
 
-void xe_display_unlink(struct xe_device *xe)
+void xe_display_fini(struct xe_device *xe)
 {
 	if (!xe->info.enable_display)
 		return;
@@ -269,7 +269,7 @@ void xe_display_unregister(struct xe_device *xe)
 	intel_display_driver_unregister(xe);
 }
 
-void xe_display_modset_driver_remove(struct xe_device *xe)
+void xe_display_driver_remove(struct xe_device *xe)
 {
 	if (!xe->info.enable_display)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 9e29de012df7..de835d459255 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -14,30 +14,23 @@ struct drm_driver;
 
 int xe_display_driver_probe_defer(struct pci_dev *pdev);
 void xe_display_driver_set_hooks(struct drm_driver *driver);
+void xe_display_driver_remove(struct xe_device *xe);
 
 int xe_display_create(struct xe_device *xe);
 
 void xe_display_info_init(struct xe_device *xe);
 
 int xe_display_init_nommio(struct xe_device *xe);
-void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
-
 int xe_display_init_noirq(struct xe_device *xe);
-void xe_display_fini_noirq(struct drm_device *dev, void *dummy);
-
 int xe_display_init_noaccel(struct xe_device *xe);
-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy);
-
 int xe_display_init(struct xe_device *xe);
-void xe_display_unlink(struct xe_device *xe);
+void xe_display_fini(struct xe_device *xe);
 
 void xe_display_register(struct xe_device *xe);
 void xe_display_unregister(struct xe_device *xe);
-void xe_display_modset_driver_remove(struct xe_device *xe);
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
-
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
@@ -49,35 +42,21 @@ void xe_display_pm_resume(struct xe_device *xe);
 #else
 
 static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
-
 static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
+static inline void xe_display_driver_remove(struct xe_device *xe) {}
 
-static inline int
-xe_display_create(struct xe_device *xe) { return 0; }
+static inline int xe_display_create(struct xe_device *xe) { return 0; }
 
 static inline void xe_display_info_init(struct xe_device *xe) { }
 
-static inline int
-xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
-
-static inline int
-xe_display_init_nommio(struct xe_device *xe) { return 0; }
-static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {}
-
+static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
 static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
-
-static inline void
-xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
-
 static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; }
-static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {}
-
 static inline int xe_display_init(struct xe_device *xe) { return 0; }
-static inline void xe_display_unlink(struct xe_device *xe) {}
+static inline void xe_display_fini(struct xe_device *xe) {}
 
 static inline void xe_display_register(struct xe_device *xe) {}
 static inline void xe_display_unregister(struct xe_device *xe) {}
-static inline void xe_display_modset_driver_remove(struct xe_device *xe) {}
 
 static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
 static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
-- 
2.42.0

