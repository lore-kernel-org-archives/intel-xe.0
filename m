Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E4E7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4998710E2B7;
	Tue,  3 Oct 2023 14:35:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6655410E2B7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343746; x=1727879746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFeCbhmP9wTTRVUBKanpgpWzVkMGIg+j9NzGUBo8vGs=;
 b=a+aKqMz6/h89tzAcvyvgyGLoIYP3NZwEWR8Bw43xPjtmm+8DMATqGdlT
 e+3Mmz5NO8TAwaR9/gHUQ91nbDKofDD0xjBZkiR/15AICJbH//O4lEtii
 1KnssGtI/WB1yQmzj0HS2xOGkAWNSEqt/fDnX4CzLxc8wdHSfgUTOiSgP
 3ieq7mpVwm2VdcsUQsBIjmhSAKlwcUx4c6/qa6ikW6WBomKLMhgoTxPsD
 cSnRTJt+M7UEY2VrLs4w90xM/8Tse/sjpXusv5XM33OA/LOpNxMgPPPMy
 rIfQqmVSYAGZ0FPEimWubX7UhnLMMCCKwcPxjy5AbaYiiPQVyUGikv1Zq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449375145"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="449375145"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754462255"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="754462255"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:56 +0300
Message-Id: <696d81bccaca9c3b0a29996ba12afd1f09b69400.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/10] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let the display code decide whether display hardware is there or
not. Remove has_display member from struct xe_device_desc, and
enable_display from struct xe_device.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 --
 drivers/gpu/drm/xe/xe_display.c      | 51 ++++++++++++----------------
 drivers/gpu/drm/xe/xe_pci.c          | 13 -------
 3 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 62e1a875980b..01ab0b3d1954 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -236,8 +236,6 @@ struct xe_device {
 		u8 has_llc:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
 		u8 has_range_tlb_invalidation:1;
-		/** @enable_display: display enabled */
-		u8 enable_display:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 75054f78d7ae..70e7afc0a890 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -57,7 +57,7 @@ static void xe_display_last_close(struct drm_device *dev)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
-	if (xe->info.enable_display)
+	if (has_display(xe))
 		intel_fbdev_restore_mode(to_xe_device(dev));
 }
 
@@ -138,7 +138,7 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_power_domains_cleanup(xe);
@@ -148,7 +148,7 @@ int xe_display_init_nommio(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return 0;
 
 	/* Fake uncore lock */
@@ -168,7 +168,7 @@ static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_display_driver_remove_noirq(xe);
@@ -179,7 +179,7 @@ int xe_display_init_noirq(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return 0;
 
 	intel_display_driver_early_probe(xe);
@@ -208,7 +208,7 @@ static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_display_driver_remove_nogem(xe);
@@ -218,7 +218,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return 0;
 
 	err = intel_display_driver_probe_nogem(xe);
@@ -230,7 +230,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 
 int xe_display_init(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return 0;
 
 	return intel_display_driver_probe(xe);
@@ -238,7 +238,7 @@ int xe_display_init(struct xe_device *xe)
 
 void xe_display_fini(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	/* poll work can call into fbdev, hence clean that up afterwards */
@@ -251,7 +251,7 @@ void xe_display_fini(struct xe_device *xe)
 
 void xe_display_register(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_display_driver_register(xe);
@@ -261,7 +261,7 @@ void xe_display_register(struct xe_device *xe)
 
 void xe_display_unregister(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_unregister_dsm_handler();
@@ -271,7 +271,7 @@ void xe_display_unregister(struct xe_device *xe)
 
 void xe_display_driver_remove(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_display_driver_remove(xe);
@@ -281,7 +281,7 @@ void xe_display_driver_remove(struct xe_device *xe)
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	if (master_ctl & DISPLAY_IRQ)
@@ -290,7 +290,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 
 void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	if (gu_misc_iir & GU_MISC_GSE)
@@ -299,7 +299,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 
 void xe_display_irq_reset(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	gen11_display_irq_reset(xe);
@@ -307,7 +307,7 @@ void xe_display_irq_reset(struct xe_device *xe)
 
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	if (gt->info.id == XE_GT0)
@@ -341,7 +341,7 @@ static bool suspend_to_idle(void)
 void xe_display_pm_suspend(struct xe_device *xe)
 {
 	bool s2idle = suspend_to_idle();
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	/*
@@ -370,7 +370,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
 	bool s2idle = suspend_to_idle();
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_power_domains_suspend(xe, s2idle);
@@ -380,7 +380,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_display_power_resume_early(xe);
@@ -390,7 +390,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 
 void xe_display_pm_resume(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!has_display(xe))
 		return;
 
 	intel_dmc_resume(xe);
@@ -418,15 +418,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 void xe_display_probe(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
-		goto no_display;
-
 	intel_display_device_probe(xe);
 
-	if (has_display(xe))
-		return;
-
-no_display:
-	xe->info.enable_display = false;
-	unset_display_features(xe);
+	if (!has_display(xe))
+		unset_display_features(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8ee430c6f8b1..cbbfe75eb2d2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -56,7 +56,6 @@ struct xe_device_desc {
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
-	u8 has_display:1;
 
 	u8 has_llc:1;
 };
@@ -207,7 +206,6 @@ static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_TIGERLAKE),
-	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
 };
@@ -216,7 +214,6 @@ static const struct xe_device_desc rkl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ROCKETLAKE),
-	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
 };
@@ -225,7 +222,6 @@ static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_S),
-	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
 };
@@ -236,7 +232,6 @@ static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_P),
-	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -249,7 +244,6 @@ static const struct xe_device_desc adl_n_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_N),
-	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
 };
@@ -262,7 +256,6 @@ static const struct xe_device_desc dg1_desc = {
 	.media = &media_xem,
 	DGFX_FEATURES,
 	PLATFORM(XE_DG1),
-	.has_display = true,
 	.require_force_probe = true,
 };
 
@@ -286,7 +279,6 @@ static const struct xe_device_desc ats_m_desc = {
 	.require_force_probe = true,
 
 	DG2_FEATURES,
-	.has_display = false,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -295,14 +287,12 @@ static const struct xe_device_desc dg2_desc = {
 	.require_force_probe = true,
 
 	DG2_FEATURES,
-	.has_display = true,
 };
 
 static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
-	.has_display = false,
 	.require_force_probe = true,
 };
 
@@ -310,7 +300,6 @@ static const struct xe_device_desc mtl_desc = {
 	/* .graphics and .media determined via GMD_ID */
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
-	.has_display = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
@@ -574,8 +563,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
-- 
2.39.2

