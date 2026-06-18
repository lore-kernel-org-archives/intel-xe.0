Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17945CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 06:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFD210E5BF;
	Thu, 18 Jun 2026 06:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXcGLJTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A529E10E5BF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781762827; x=1813298827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJDBwp16GIHI7UmLuuYoWmzCxi7gHeeOUsSvmPiikuE=;
 b=hXcGLJTo9vkmepzgz90OBwxvB5XlQqdr5FvBMG/uRDQMMS8ZykrvvZxO
 mQU9K0fyw023Gsqc+/9sAD0HciGDuplj4oN9hkIgq0zpDJ6tnM8jx2mWZ
 M9UtlAKtc7ZgRoGYwfTGoUdP8cal8qNiTCzYFbDrk1XHAZ31x4rBVB3mx
 oBBhqc8ya56ZydwzStjxwfilW8IxQXzrYiF9p1XgXY8rnDd17HzxqSJ55
 RSXkSX6UyaTdfOG8wxoOdpAgF8MzaeeazYbvTMFLSPbt2zAPEWc3Hrz8m
 90P8kaBF5efP6SLry76SA6Mg+mJScSIeCwXX9IUvB0So2mUOOv+0wRfB9 w==;
X-CSE-ConnectionGUID: egFRg4HmQ0uVZoN0vmv+kg==
X-CSE-MsgGUID: gwP/wSScQuqbY6kT1H0KXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="92926208"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="92926208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:07:07 -0700
X-CSE-ConnectionGUID: 9UkskmieSJOOiI8lX2aPQg==
X-CSE-MsgGUID: yoz+Png+Qqu4Rg5K10kUbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="245901368"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:07:03 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v9 5/6] drm/xe: Move xe drm_ras initialization
Date: Thu, 18 Jun 2026 11:36:39 +0530
Message-ID: <20260618060633.2790109-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260618060633.2790109-8-riana.tauro@intel.com>
References: <20260618060633.2790109-8-riana.tauro@intel.com>
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

Move xe drm_ras registration to RAS initialization flow and keep
hardware error initialization for processing errors reported
via irq.

Move soc remapper and system controller initialization
up in xe_device_probe as RAS initialization depends on both.

Cc: Anoop Vijay <anoop.c.vijay@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: remove unnecessary log (Raag)
---
 drivers/gpu/drm/xe/xe_device.c   | 19 +++++++++++--------
 drivers/gpu/drm/xe/xe_hw_error.c | 13 -------------
 drivers/gpu/drm/xe/xe_ras.c      | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h      |  1 +
 4 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 089872507bdd..44a20fe0b17d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -61,6 +61,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -998,6 +999,16 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_soc_remapper_init(xe);
+	if (err)
+		return err;
+
+	err = xe_sysctrl_init(xe);
+	if (err)
+		return err;
+
+	xe_ras_init(xe);
+
 	/*
 	 * Now that GT is initialized (TTM in particular),
 	 * we can try to init display, and inherit the initial fb.
@@ -1038,10 +1049,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
-	err = xe_soc_remapper_init(xe);
-	if (err)
-		return err;
-
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -1080,10 +1087,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	err = xe_sysctrl_init(xe);
-	if (err)
-		goto err_unregister_display;
-
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 4b72959b2276..3c1dc9f83d1a 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -516,14 +516,6 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 	}
 }
 
-static int hw_error_info_init(struct xe_device *xe)
-{
-	if (xe->info.platform != XE_PVC)
-		return 0;
-
-	return xe_drm_ras_init(xe);
-}
-
 /*
  * Process hardware errors during boot
  */
@@ -550,16 +542,11 @@ static void process_hw_errors(struct xe_device *xe)
 void xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	int ret;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
-	ret = hw_error_info_init(xe);
-	if (ret)
-		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
-
 	process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index a11ea841f9f1..71ee9eeb1896 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_device.h"
+#include "xe_drm_ras.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -268,3 +269,17 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 
 	return 0;
 }
+
+/**
+ * xe_ras_init - Initialize Xe RAS
+ * @xe: xe device instance
+ *
+ * Register drm_ras nodes
+ */
+void xe_ras_init(struct xe_device *xe)
+{
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	xe_drm_ras_init(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index a2089fc3c3ff..ba0b0224df23 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -15,5 +15,6 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
+void xe_ras_init(struct xe_device *xe);
 
 #endif
-- 
2.47.1

