Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D8DCD4F25
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB69A10EBE5;
	Tue, 12 May 2026 18:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6vR9jYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3814E10EBDF
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610841; x=1810146841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kG5BNRhrUTZpgFNPSNiFq+p85KyR+oU8ULHOkI9/f5w=;
 b=e6vR9jYBrTyx+8qLRh8cJSD3OghHpuIK2Z+3TE+DyoiJ8pbSLm69BH/b
 pvDgCk2XLzFpkaqNdo5NmzedcPec5RFgIQQFZ3E9fsMPwpDnRAE6tMGhp
 JEQ0b8vBjp+U/acBJmGAhT59Gu+quFO78PAPrwHKq84/Y/OcsH801H266
 j47lE3rXZkyMHVsT1tWoY/ipM1xXA3adWHTourt0ch+VJDRyw/G6+Ln+h
 908l+N/LbMx2cHQWDt1T/ctp/zt760yH9j0H500DuFIfhbuKzBG6uR8l9
 SxtWOTcgtnyCEkZlT2470LGSocfT3Gn2do0hVdmzJtUo61GLNXWWtEu4i Q==;
X-CSE-ConnectionGUID: 3OaKxB9KSZy8VmR0NqiB+Q==
X-CSE-MsgGUID: ggymYELFTS6g7DTfv3rcow==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425736"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425736"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:34:00 -0700
X-CSE-ConnectionGUID: kWHBe9YWTye5UPu9FWFE6w==
X-CSE-MsgGUID: lykHt8VTThykmfnfZSl7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791104"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 6/7] drm/xe/display: Drop xe_display_driver_set_hooks()
Date: Tue, 12 May 2026 20:33:41 +0200
Message-ID: <20260512183342.3374-7-michal.wajdeczko@intel.com>
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

This function is now no-op.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 16 ----------------
 drivers/gpu/drm/xe/display/xe_display.h |  3 +--
 drivers/gpu/drm/xe/xe_device.c          |  2 --
 3 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7e5382fc161d..d6aea18025af 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -70,22 +70,6 @@ bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 	return intel_display_driver_probe_defer(pdev);
 }
 
-/**
- * xe_display_driver_set_hooks - Add driver flags and hooks for display
- * @driver: DRM device driver
- *
- * Set features and function hooks in @driver that are needed for driving the
- * display IP. This sets the driver's capability of driving display, regardless
- * if the device has it enabled
- *
- * Note: This is called before xe or display device creation.
- */
-void xe_display_driver_set_hooks(struct drm_driver *driver)
-{
-	if (!xe_modparam.probe_display)
-		return;
-}
-
 static void unset_display_features(struct xe_device *xe)
 {
 	xe->drm.driver_features &= ~XE_DISPLAY_DRIVER_FEATURES;
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index d2b105d5f2a1..60291cb154df 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -17,7 +17,7 @@ struct xe_device;
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
 bool xe_display_driver_probe_defer(struct pci_dev *pdev);
-void xe_display_driver_set_hooks(struct drm_driver *driver);
+
 int xe_display_driver_fbdev_probe(struct drm_fb_helper *fbh,
 				  struct drm_fb_helper_surface_size *sizes);
 
@@ -56,7 +56,6 @@ void xe_display_pm_runtime_resume(struct xe_device *xe);
 	.fbdev_probe = NULL
 
 static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
-static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
 
 static inline int xe_display_probe(struct xe_device *xe) { return 0; }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c053e4d2692f..7519cda3f42c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -491,8 +491,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		driver = &admin_only_driver;
 #endif
 
-	xe_display_driver_set_hooks(driver);
-
 	err = aperture_remove_conflicting_pci_devices(pdev, driver->name);
 	if (err)
 		return ERR_PTR(err);
-- 
2.47.1

