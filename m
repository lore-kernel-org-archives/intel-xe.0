Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84276CD5BAB
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 23:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD8510E044;
	Thu, 21 May 2026 23:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEYkToey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A5C10F43C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779406300; x=1810942300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ndgTF6QGoT5ijQON9c4kB2eMDZ5n+tu6UcVeb3F3dnQ=;
 b=JEYkToeypRNmo2IviMXNCniVrmvKP8A6Ct7+1ESmJLUE2QVtmWVCh1Z9
 VLOXHQ5LPCbbLkqD7+7iMYokaBG6pi8JX2A3YWBnvqic+4D9Ka86wA2Lp
 aot81aL5HG8nIVfo14HJY95yviRpCqSczTi81gw+GBnBxWTX6j1gGoskY
 wLnmKQ2dbMUeow0SlhL/6oMxQbZvr+/Wp2ojZ1fafB4xOAhabcboicqEB
 rPq5EaZyP22rw03sGj0xjEM+Rs5LNpUZOJugGODJ5pY70izw6qle1seVD
 Ye+NLx5fm0WnedvdQrpJPGvt05MDkyJBEyD/6NqCR1uW5RB+IyQ3yALwz w==;
X-CSE-ConnectionGUID: TcIaJ+ePQNSD6Zmc2tbJRA==
X-CSE-MsgGUID: qQqUh8dVTAG87wcBXTbf7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79370000"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="79370000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 16:31:39 -0700
X-CSE-ConnectionGUID: w9UuW6uXQ3SqK4GtmNGu6Q==
X-CSE-MsgGUID: knv5PP63Q52fRrzyXDB6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="240742547"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 16:31:40 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/xe/pxp: PXP no longer requires HuC from media 35 onwards
Date: Thu, 21 May 2026 16:31:33 -0700
Message-ID: <20260521233132.883021-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Starting from media 35 the HuC is loaded by userspace instead of the
kernel, so it is no longer considered a requirement to start a PXP
session.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 968b7e70b3f9..fea3d8ceeddb 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -59,6 +59,7 @@ bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
 static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
+	bool huc_ok;
 	bool ready;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -73,9 +74,14 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 	 */
 	XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL));
 
-	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
-	ready = xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
-		xe_gsc_proxy_init_done(&gt->uc.gsc);
+	/*
+	 * PXP requires GSC proxy to be initialized. On platforms where the HuC
+	 * is loaded by the kernel driver (i.e., pre media 35) PXP also requires
+	 * the HuC to be authenticated by GSC.
+	 */
+	huc_ok = MEDIA_VER(gt_to_xe(gt)) >= 35 ||
+		 xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC);
+	ready = huc_ok && xe_gsc_proxy_init_done(&gt->uc.gsc);
 
 	return ready;
 }
@@ -97,9 +103,13 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
 	if (!xe_pxp_is_enabled(pxp))
 		return -ENODEV;
 
-	/* if the GSC or HuC FW are in an error state, PXP will never work */
-	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
-	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
+	/* If the GSC FW is in an error state, PXP will never work */
+	if (xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
+		return -EIO;
+
+	/* Same for HuC FW, but only if the kernel owns HuC-loading (i.e. pre-NVL) */
+	if (MEDIA_VER(gt_to_xe(pxp->gt)) < 35 &&
+	    xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status))
 		return -EIO;
 
 	guard(xe_pm_runtime)(pxp->xe);
@@ -361,6 +371,7 @@ static void pxp_fini(void *arg)
 int xe_pxp_init(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe->tiles[0].media_gt;
+	bool gsc_ok, huc_ok;
 	struct xe_pxp *pxp;
 	int err;
 
@@ -375,10 +386,14 @@ int xe_pxp_init(struct xe_device *xe)
 	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
 		return 0;
 
-	/* PXP requires both GSC and HuC firmwares to be available */
-	if (!xe_uc_fw_is_loadable(&gt->uc.gsc.fw) ||
-	    !xe_uc_fw_is_loadable(&gt->uc.huc.fw)) {
-		drm_info(&xe->drm, "skipping PXP init due to missing FW dependencies");
+	/* PXP requires GSC FW to be available. Pre-NVL it also requires HuC FW */
+	gsc_ok = xe_uc_fw_is_loadable(&gt->uc.gsc.fw);
+	huc_ok = MEDIA_VER(xe) >= 35 || xe_uc_fw_is_loadable(&gt->uc.huc.fw);
+
+	if (!gsc_ok || !huc_ok) {
+		drm_info(&xe->drm, "Skipping PXP due to unsatisfied FW deps - GSC=%s, HuC=%s\n",
+			 str_yes_no(gsc_ok),
+			 MEDIA_VER(xe) >= 35 ? "not needed" : str_yes_no(huc_ok));
 		return 0;
 	}
 
-- 
2.43.0

