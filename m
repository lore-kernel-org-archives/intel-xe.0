Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFC8C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 17:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4F110E137;
	Thu, 15 Aug 2024 17:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOrrHnxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F310E137
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 17:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723742719; x=1755278719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4x/ZErRf+aiQGpbhG5IQfdgMCHk+ZgLxoMnvb+tEx7Y=;
 b=aOrrHnxXSyJ4zUe981gwhV2iCCWnpt1KKSOs0UlJ15b0royTH1+Px47s
 5T/5YmBPLXlUFdcDSbE/vLzdSW7URdl+GQ/s6f0EJzru75Ey4f+f3KK0L
 X4tF0dPfexIsbBjp7L+gRTq5RVLGETaK4bxSKF38esdYWWmSkss3ScqXA
 3etKL7kx+WvuQmPN0KkBPOmM6Y35yWQDS0twsss8IbtqNG41zi77xv/Rw
 0f1JivWKUtKiysrufwhBkC7ZSgSbMIj5c7LQCXUq3QwcKo7xORYF/yL3+
 hR+mm1QN68rDpPvfAS8Bog5yoKqi4D43c9fBzDbmn2hiCZpJgKKW2KSRg w==;
X-CSE-ConnectionGUID: AoE/e5XmTzSLo6gqX6cAog==
X-CSE-MsgGUID: b75SWDERSGegwZgnRgHzLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21655978"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21655978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:25:19 -0700
X-CSE-ConnectionGUID: rFofcWneTDew7LMtbswFDg==
X-CSE-MsgGUID: 7wWcWUo4TmCAG4ZkosCdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="63588268"
Received: from vgovind2-mobl3.fi.intel.com ([10.237.66.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:25:17 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe/display: handle HPD polling in display runtime
 suspend/resume
Date: Thu, 15 Aug 2024 20:25:00 +0300
Message-Id: <20240815172500.78479-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

In XE, display runtime suspend / resume routines are called only
if d3cold is allowed. This makes the driver unable to detect any
HPDs once the device goes into runtime suspend state in platforms
like LNL. Update the display runtime suspend / resume routines
to include HPD polling regardless of d3cold status.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.c              |  5 +++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 982b9c5b440f..0cddf55351c8 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -294,6 +294,9 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	if (!xe->info.probe_display)
 		return;
 
+	if (!xe->d3cold.allowed)
+		goto enable_hpd_poll;
+
 	/*
 	 * We do a lot of poking in a lot of registers, make sure they work
 	 * properly.
@@ -308,6 +311,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	intel_dp_mst_suspend(xe);
 
 	intel_hpd_cancel_work(xe);
+	if (runtime)
+		intel_hpd_poll_enable(xe);
 
 	intel_encoder_suspend_all(&xe->display);
 
@@ -316,6 +321,12 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
 
 	intel_dmc_suspend(xe);
+
+	return;
+
+enable_hpd_poll:
+	if (runtime)
+		intel_hpd_poll_enable(xe);
 }
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
@@ -346,6 +357,9 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 	if (!xe->info.probe_display)
 		return;
 
+	if (!xe->d3cold.allowed)
+		goto disable_hpd_poll;
+
 	intel_dmc_resume(xe);
 
 	if (has_display(xe))
@@ -368,6 +382,12 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
 
 	intel_power_domains_enable(xe);
+
+	return;
+
+disable_hpd_poll:
+	intel_hpd_init(xe);
+	intel_hpd_poll_disable(xe);
 }
 
 static void display_device_remove(struct drm_device *dev, void *arg)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9f3c14fd9f33..2abfe70d2697 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -370,8 +370,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
-		xe_display_pm_suspend(xe, true);
 	}
+	xe_display_pm_suspend(xe, true);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
@@ -431,11 +431,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_gt_resume(gt);
 
 	if (xe->d3cold.allowed) {
-		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
 	}
+	xe_display_pm_resume(xe, true);
+
 out:
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.34.1

