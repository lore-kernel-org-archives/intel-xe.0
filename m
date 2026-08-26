Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422CFC61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D569410EE16;
	Wed, 26 Aug 2026 22:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSrq7rzR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A3C10E364;
 Wed, 26 Aug 2026 22:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787784843; x=1819320843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZBEh4Fr7sY8PAItJq4EcxxChYEkmovvYzjkXI08VTI=;
 b=eSrq7rzRY5IXD2ENi+Nm71GQG1BxpmKGTv4skXqcMitBB7HxI1iHq7lz
 9xbcz0AGv5oGuXnrTzM6T6AJXJpTUiFen1COoU7/RcY1DoYSyTCM31lri
 jsQ4wKeba1FmLseEbnbI+VFLcoH2LdUB2ibzzfWc1d6i26INCg9bXb0XX
 uCi6/5C6XbMc71Uz4UhjoOpt7bgo4icEvBhYBXC4yfm6rrgG8SirneT0Q
 pdk9JzmK9QvOmamZFj57O7qGcTL9FHANgVIqeKm1T5eHGOP/0NGaJSfJI
 6ixk1Oz2WAyMeR87iE0Nh64RETf5gQGQnNcpVGNS5l/NVZWLtQH318/kM w==;
X-CSE-ConnectionGUID: tM4UhNuvTgmBg1qj9S1Mhg==
X-CSE-MsgGUID: OsLd+jNxTgKP4qIksmjYFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87223491"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="87223491"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:54:03 -0700
X-CSE-ConnectionGUID: vakVwB0PQeWRbfWV+TYwZA==
X-CSE-MsgGUID: RKFvkmDVQIii5w1T9opxig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="272946058"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:54:00 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, pranay.samala@intel.com
Subject: [PATCH 2/4] drm/xe/pm: plumb PME capability to runtime suspend handler
Date: Thu, 27 Aug 2026 01:53:35 +0300
Message-ID: <20260826225338.804902-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826225338.804902-1-vinod.govindapillai@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
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

If the device is PME capable, we don't need to start the HPD polling
during the runtime suspend. So to differentiate, plumb pme_capable
flag which is set to true only if the platform supports PME and
the device is PME capable. In i915, this is set to false. But for xe
it will be set based on the PME capability. Until the PME capability
support is added, this flag hard coded to false. Also cases like
D3Cold where PME is not supported, this is set to false by default.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_display_driver.h | 3 ++-
 drivers/gpu/drm/i915/i915_driver.c                  | 2 +-
 drivers/gpu/drm/xe/display/xe_display.c             | 4 ++--
 drivers/gpu/drm/xe/display/xe_display.h             | 4 ++--
 drivers/gpu/drm/xe/xe_pci.c                         | 2 +-
 drivers/gpu/drm/xe/xe_pm.c                          | 7 ++++---
 drivers/gpu/drm/xe/xe_pm.h                          | 2 +-
 8 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 70d112fd4287..ba494827c9cb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -904,7 +904,8 @@ void intel_display_driver_pm_runtime_suspend(struct intel_display *display)
 }
 
 /* after irq suspend */
-void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display)
+void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display,
+						  bool pme_capable)
 {
 	intel_display_power_runtime_suspend(display);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 1ae2ad7e95f6..a8bc663bb840 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -47,7 +47,8 @@ void intel_display_driver_runtime_pm_enable(struct intel_display *display);
 void intel_display_driver_runtime_pm_disable(struct intel_display *display);
 
 void intel_display_driver_pm_runtime_suspend(struct intel_display *display);
-void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display);
+void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display,
+						  bool pme_capable);
 void intel_display_driver_pm_runtime_resume_early(struct intel_display *display);
 void intel_display_driver_pm_runtime_resume(struct intel_display *display);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce6d20958320..2899683c6b0b 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1518,7 +1518,7 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
-	intel_display_driver_pm_runtime_suspend_late(display);
+	intel_display_driver_pm_runtime_suspend_late(display, false);
 
 	ret = vlv_suspend_complete(dev_priv);
 	if (ret) {
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 6f1f8e0b25b5..16085b85444f 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -362,7 +362,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 }
 
 /* after irq suspend */
-void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
+void xe_display_pm_runtime_suspend_late(struct xe_device *xe, bool pme_capable)
 {
 	struct intel_display *display = xe->display;
 
@@ -376,7 +376,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 		return;
 	}
 
-	intel_display_driver_pm_runtime_suspend_late(display);
+	intel_display_driver_pm_runtime_suspend_late(display, pme_capable);
 }
 
 /* before irq resume */
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 19f313eba6fb..636b3768d882 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -42,7 +42,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
-void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
+void xe_display_pm_runtime_suspend_late(struct xe_device *xe, bool pme_capable);
 void xe_display_pm_runtime_resume_early(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
 
@@ -80,7 +80,7 @@ static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_resume(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
-static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe) {}
+static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe, bool pme_capable) {}
 static inline void xe_display_pm_runtime_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..c22b40045f7b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1392,7 +1392,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 	xe_assert(xe, !pci_num_vf(pdev));
 
-	err = xe_pm_runtime_suspend(xe);
+	err = xe_pm_runtime_suspend(xe, false);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 1488c4dfcc05..c3a53c5f8b33 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -574,10 +574,11 @@ bool xe_pm_runtime_suspended(struct xe_device *xe)
 /**
  * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
  * @xe: xe device instance
+ * @pme_capable: indicates if the device can raise PME from runtime D3hot.
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_pm_runtime_suspend(struct xe_device *xe)
+int xe_pm_runtime_suspend(struct xe_device *xe, bool pme_capable)
 {
 	struct xe_bo *bo, *on;
 	struct xe_gt *gt;
@@ -639,9 +640,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 			goto out_resume;
 	}
 
-	xe_irq_suspend(xe, false);
+	xe_irq_suspend(xe, pme_capable);
 
-	xe_display_pm_runtime_suspend_late(xe);
+	xe_display_pm_runtime_suspend_late(xe, pme_capable);
 
 	xe_i2c_pm_suspend(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6d5ab09cb769..27455a8d2061 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -21,7 +21,7 @@ int xe_pm_probe(struct xe_device *xe);
 int xe_pm_init(struct xe_device *xe);
 void xe_pm_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
-int xe_pm_runtime_suspend(struct xe_device *xe);
+int xe_pm_runtime_suspend(struct xe_device *xe, bool pme_capable);
 int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
-- 
2.43.0

