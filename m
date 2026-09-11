Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76774C88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254A310F548;
	Fri, 11 Sep 2026 08:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBTD98CQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B7C10F548;
 Fri, 11 Sep 2026 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113938; x=1820649938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CHvo1uWgD8P3lLCQGPZ34TKRZXdZ0XzLggr9VBU7Cic=;
 b=NBTD98CQ3wIxUHtGnHVwJ/FdKhQKKP9L4uasW8Ht94TuFAb0Z55S1VZd
 nGZVIeyk3+/n758FR8aZPIine+a8xuo2zS+AQXQTNMgcKlGoYpB6yB7Ie
 W+CiBkakKxODx3PwXlW4Za3mR4gPH6U7Ow2S+z95p/UMOaNUrTzdtxhRS
 haOPqPwZ5XTvyb4IdcCqAQh1MM9cWkaLlux/w2oK0JS0ze96SQ2EkOVRD
 eiGle0p3fbai1OAT5do/EhKzbprv3tlT/eeDsigcs7JP8o+F4aF6brIdy
 NTXbG8FUgcc8IbpZjYvrFdsxzT15n1XjOf25JrhuOh46hb1IJZ738rDCF w==;
X-CSE-ConnectionGUID: IPgMdb/PRqC9RvCY3BzTcg==
X-CSE-MsgGUID: QFfRMKVaSbaU8i2ZspX/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094756"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094756"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:38 -0700
X-CSE-ConnectionGUID: z4g42hD7Sv+Qoom0NB+KIQ==
X-CSE-MsgGUID: /QGzRja0Q8CHzlEj4Zz1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295334346"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:34 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 08/10] drm/xe/pm: clear PME HPD flag on runtime suspend
 error handler
Date: Fri, 11 Sep 2026 11:04:46 +0300
Message-ID: <20260911080448.778316-9-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
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

The HPD can generate PME flag in the intel_hotplug is set based
one PME status during early pm_runtime_suspend routine before
any IRQ reset calls and cleared during early pm_runtime_resume()
before any IRQ reset/resume calls. But in case of any error
scenario during xe_pm_runtime_suspend(), we end up in a situation
where this flag is never cleared in the "out_resume" path.

So change to global scope for intel_display_driver_pm_runtime_clear_pme()
and get it called from the error handler path as well. To have
this in cleanly, get it wrapped with corresponding xe_display wrapper.
The alternative could be to call the clear the flag from both
runtime_resume_early() and the late runtime_resume(). But the
former approach seems clean.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_driver.h | 1 +
 drivers/gpu/drm/xe/display/xe_display.c             | 9 +++++++++
 drivers/gpu/drm/xe/display/xe_display.h             | 2 ++
 drivers/gpu/drm/xe/xe_pm.c                          | 7 +++++++
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 263eb3e08ea1..99aaceb39048 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -944,7 +944,7 @@ void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display)
 		intel_hpd_poll_enable(display);
 }
 
-static void intel_display_driver_pm_runtime_clear_pme(struct intel_display *display)
+void intel_display_driver_pm_runtime_clear_pme(struct intel_display *display)
 {
 	intel_hpd_set_pme_capable(display, false);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 1ae2ad7e95f6..51f82b6fb2f5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -49,6 +49,7 @@ void intel_display_driver_runtime_pm_disable(struct intel_display *display);
 void intel_display_driver_pm_runtime_suspend(struct intel_display *display);
 void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display);
 void intel_display_driver_pm_runtime_resume_early(struct intel_display *display);
+void intel_display_driver_pm_runtime_clear_pme(struct intel_display *display);
 void intel_display_driver_pm_runtime_resume(struct intel_display *display);
 
 #endif /* __INTEL_DISPLAY_DRIVER_H__ */
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7b25c0814674..79166aeeed85 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -409,6 +409,15 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 	intel_display_driver_pm_runtime_resume(display);
 }
 
+void xe_display_clear_pme_hpd(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	intel_display_driver_pm_runtime_clear_pme(display);
+}
 
 static void display_device_remove(struct drm_device *dev, void *arg)
 {
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 0babb50bfc77..92bb5ee76e06 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -45,6 +45,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
 void xe_display_pm_runtime_resume_early(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
+void xe_display_clear_pme_hpd(struct xe_device *xe);
 
 #define XE_DISPLAY_DRIVER_FEATURES	(DRIVER_MODESET | DRIVER_ATOMIC)
 #define XE_DISPLAY_DRIVER_OPS						\
@@ -83,6 +84,7 @@ static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
+static inline void xe_display_clear_pme_hpd(struct xe_device *xe) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c79f55b66a41..5e7263316683 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -663,6 +663,13 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	return 0;
 
 out_resume:
+	/*
+	 * We need to explicitly clear the PME HPD flag in this error handler.
+	 * Normally this is set during early runtime suspend and cleared during
+	 * early runtime resume call.
+	 */
+	xe_display_clear_pme_hpd(xe);
+
 	xe_display_pm_runtime_resume(xe);
 	xe_pxp_pm_resume(xe->pxp);
 out:
-- 
2.43.0

