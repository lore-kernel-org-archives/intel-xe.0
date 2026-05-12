Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23490CD4F25
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E1B10EBDD;
	Tue, 12 May 2026 18:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzN+KqSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A0310EBDD
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610838; x=1810146838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Utyj05Ic8rtq9NwfBti0LubqSBB7+pZxppezli2JxY=;
 b=hzN+KqSVCqVipn4EPiH3HaW53FAikwS6/hzaYwk8R+BdMRoWwI6SMz4L
 Q4PucadbuR/AaFBP1q+UMn6GgJ5CUZqgZqj8Zh3TpKZe2Llml8Wgrf0Zh
 Vb3XB+dvgvCpIiTBQgpZTUcR4HQsFOq8q5yn52lHzBHBLMmElwvmgcjzi
 k47WyN87lLHH08ik+yYjMlO4RcbPJIS7KgNztjDfzBzepFuLz33woqh2W
 ZoYNaymF7aAgoBzfVpuMk09Z6XyOCHieYXEnvKvGmiANX3t9m1kbPraRX
 j7g6SwbjTVK8j7hs2NvaSPLr0PYFsYnTGb54MA8hI2pMWKYW3q0SFaXIR A==;
X-CSE-ConnectionGUID: ogU13qllT+K8msdV3GWYIw==
X-CSE-MsgGUID: twqGcxPuTkiYwpOH4CZsUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425724"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425724"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:58 -0700
X-CSE-ConnectionGUID: pNIxI7jwRGuB6vkp+dDU1A==
X-CSE-MsgGUID: kpYVQ4B6Sd2Orp4qm1XTQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791093"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 4/7] drm/xe/display: Add macro with display driver ops
Date: Tue, 12 May 2026 20:33:39 +0200
Message-ID: <20260512183342.3374-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512183342.3374-1-michal.wajdeczko@intel.com>
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
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

Instead of updating the drm_driver.fbdev_probe field in the runtime,
we can use macro which value depends on the actual Kconfig setup.

The hook .fbdev_probe shall not be used until confirmed by enabling
a DRIVER_MODESET driver feature flag, which still depends on the
xe_modparam.probe_display parameter.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++++----
 drivers/gpu/drm/xe/display/xe_display.h | 11 +++++++++++
 drivers/gpu/drm/xe/xe_device.c          |  2 ++
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 263e92203c9d..7e7d476da8ce 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -85,10 +85,6 @@ void xe_display_driver_set_hooks(struct drm_driver *driver)
 	if (!xe_modparam.probe_display)
 		return;
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	driver->fbdev_probe = intel_fbdev_driver_fbdev_probe;
-#endif
-
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
 }
 
@@ -603,3 +599,11 @@ int xe_display_probe(struct xe_device *xe)
 	unset_display_features(xe);
 	return 0;
 }
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+int xe_display_driver_fbdev_probe(struct drm_fb_helper *fbh,
+				  struct drm_fb_helper_surface_size *sizes)
+{
+	return intel_fbdev_driver_fbdev_probe(fbh, sizes);
+}
+#endif
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 95acf0fd8e7b..deec0232532e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 
 struct drm_driver;
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
 struct pci_dev;
 struct xe_device;
 
@@ -16,6 +18,8 @@ struct xe_device;
 
 bool xe_display_driver_probe_defer(struct pci_dev *pdev);
 void xe_display_driver_set_hooks(struct drm_driver *driver);
+int xe_display_driver_fbdev_probe(struct drm_fb_helper *fbh,
+				  struct drm_fb_helper_surface_size *sizes);
 
 int xe_display_probe(struct xe_device *xe);
 
@@ -40,8 +44,15 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
 
+#define XE_DISPLAY_DRIVER_OPS						\
+	.fbdev_probe = PTR_IF(IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION),	\
+			      xe_display_driver_fbdev_probe)
+
 #else
 
+#define XE_DISPLAY_DRIVER_OPS \
+	.fbdev_probe = NULL
+
 static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
 static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6512f1dfe691..3bca4c1d1d5f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -414,6 +414,7 @@ static struct drm_driver regular_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+	XE_DISPLAY_DRIVER_OPS,
 };
 
 #ifdef CONFIG_PCI_IOV
@@ -435,6 +436,7 @@ static struct drm_driver admin_only_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+	XE_DISPLAY_DRIVER_OPS,
 };
 
 /**
-- 
2.47.1

