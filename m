Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384DCCD6E41
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 13:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E587C10E7B9;
	Wed, 27 May 2026 13:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tvi9dM4B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC18B10E7B5;
 Wed, 27 May 2026 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779887196; x=1811423196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/KssNUA8AmsJ5AHWNlq9jV+FIAKZ+Xhl/jwpOjmvIwQ=;
 b=Tvi9dM4Bo/b4pLazvsxRxjqgBsRbFqYLB+VH+wLF8Ok9qcGeaeT48zSA
 oQfSNCWBMpEDB1bhDCblENR7jM5gqvbZ2lAVRz460frU5wU4WwAw92Fai
 LaXAzS2iq3QVAeZfrDb0+Ojd2tdTxl330qNcUqiA9sxhbTKmDhU69Zjdz
 xUq+U46LWS/52XByejiC5WpDUImzhEubpEKU0VGCK5RmErsTcSp6VT/I9
 jOEDScPiuCfL9ROVc+YqLFM/tBAPdX+fr9MwjxLELV31OBjM2vQE9bvYg
 eZbRy8ZyN0WtNiiwTKQKZmiON2cDUmz54A8HA+O0NMVjpsURfYCFJ3VXm Q==;
X-CSE-ConnectionGUID: 0TzWjfxkRn2idy1OMsCVlw==
X-CSE-MsgGUID: 1tRV/ImOS7az5sjX7iP2Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79751346"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="79751346"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:06:36 -0700
X-CSE-ConnectionGUID: lh+236/nTM6mDy3U9ASEFQ==
X-CSE-MsgGUID: pI5u3tv5Rbm7KOJvByYy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="246512514"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.38])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:06:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/3] drm/xe/display: rename xe_display_pm_shutdown*() to
 xe_display_shutdown*()
Date: Wed, 27 May 2026 16:06:24 +0300
Message-ID: <8c3a6eda724d8d1f8284534cf64a117dea8d74e3.1779887154.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779887154.git.jani.nikula@intel.com>
References: <cover.1779887154.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The shutdown functions get called from the struct pci_driver .shutdown
hook, not through the struct dev_pm_ops hooks. Name accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c |  4 ++--
 drivers/gpu/drm/xe/display/xe_display.h | 10 ++++++----
 drivers/gpu/drm/xe/xe_device.c          |  4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 810d93fefcbc..a18af4d96dd1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -328,7 +328,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	intel_dmc_suspend(display);
 }
 
-void xe_display_pm_shutdown(struct xe_device *xe)
+void xe_display_shutdown(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
@@ -404,7 +404,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	intel_dmc_wl_flush_release_work(display);
 }
 
-void xe_display_pm_shutdown_late(struct xe_device *xe)
+void xe_display_shutdown_late(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 60291cb154df..e5f9aed93206 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -29,15 +29,16 @@ int xe_display_init(struct xe_device *xe);
 void xe_display_register(struct xe_device *xe);
 void xe_display_unregister(struct xe_device *xe);
 
+void xe_display_shutdown(struct xe_device *xe);
+void xe_display_shutdown_late(struct xe_device *xe);
+
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe);
 
 void xe_display_pm_suspend(struct xe_device *xe);
-void xe_display_pm_shutdown(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
-void xe_display_pm_shutdown_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
@@ -65,15 +66,16 @@ static inline int xe_display_init(struct xe_device *xe) { return 0; }
 static inline void xe_display_register(struct xe_device *xe) {}
 static inline void xe_display_unregister(struct xe_device *xe) {}
 
+static inline void xe_display_shutdown(struct xe_device *xe) {}
+static inline void xe_display_shutdown_late(struct xe_device *xe) {}
+
 static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
 static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
 
 static inline void xe_display_pm_suspend(struct xe_device *xe) {}
-static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
-static inline void xe_display_pm_shutdown_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_resume(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d224861b6f6f..ec065b168bb9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1128,14 +1128,14 @@ void xe_device_shutdown(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
-	xe_display_pm_shutdown(xe);
+	xe_display_shutdown(xe);
 
 	xe_irq_suspend(xe);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_shutdown(gt);
 
-	xe_display_pm_shutdown_late(xe);
+	xe_display_shutdown_late(xe);
 
 	if (!xe_driver_flr_disabled(xe)) {
 		/* BOOM! */
-- 
2.47.3

