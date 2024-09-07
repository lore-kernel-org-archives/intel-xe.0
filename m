Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0ECE6FE4C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDED10EB4D;
	Sat,  7 Sep 2024 00:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AA+Rc3v4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE31410EB2F
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11R66hYrvyM0r3CevH5gpIZ+IYCeCTPvL4zkz9Mvm1Y=;
 b=AA+Rc3v4oXBT5C610gepup37I8O9CUymVvfCZ2OWwMaLD1TsvT8f5/bJ
 ayQH4oCK0jQ4i1hVFomftIsNEjAgapiCa0M1OrHA3f4qdksaBUbXWdUXg
 PXYSXUcfQu9QkKjIzYJ+AJJVsjAKDifCw9jbESZyyB1Z0prCvIbAhLrrM
 jZmVv2vaENLXQ0xOcEmku72iaKZ5a4BRHXBj3irK/d6exkGJHprFGhHZ9
 zYsMe8VXgz3BVLI3gXPzjZX881eGQ2Z2I/vMLFYFS4C6j4u80KCttRk+r
 QwGrMDyh5MGNxZv4F6PjXen2NeLuhnVvzzoGkDSr3gL5s4uTwde5R/Kz/ A==;
X-CSE-ConnectionGUID: NhbuBko6Rx2LhRGp2bXJOQ==
X-CSE-MsgGUID: r1YT4HRrRKu3BwQiHdAnpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855313"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855313"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: cAr3Z/laTs6iKYy/JiTmxA==
X-CSE-MsgGUID: tkZ99XuQTO+hmiiwKnjdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792686"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 23/43] drm/xe/gsc: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:12 -0700
Message-ID: <20240907000748.2614020-68-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c       | 23 ++++++++++++-----------
 drivers/gpu/drm/xe/xe_gsc_proxy.c |  4 ++--
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 6fbea70d3d36..9cb326af5931 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -179,7 +179,7 @@ static int query_compatibility_version(struct xe_gsc *gsc)
 
 static int gsc_fw_is_loaded(struct xe_gt *gt)
 {
-	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
+	return xe_mmio_read32(&gt->mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
 			      HECI1_FWSTS1_INIT_COMPLETE;
 }
 
@@ -190,7 +190,7 @@ static int gsc_fw_wait(struct xe_gt *gt)
 	 * executed by the GSCCS. To account for possible submission delays or
 	 * other issues, we use a 500ms timeout in the wait here.
 	 */
-	return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
+	return xe_mmio_wait32(&gt->mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
 			      HECI1_FWSTS1_INIT_COMPLETE,
 			      HECI1_FWSTS1_INIT_COMPLETE,
 			      500 * USEC_PER_MSEC, NULL, false);
@@ -330,7 +330,7 @@ static int gsc_er_complete(struct xe_gt *gt)
 	 * so in that scenario we're always guaranteed to find the correct
 	 * value.
 	 */
-	er_status = xe_mmio_read32(gt, GSCI_TIMER_STATUS) & GSCI_TIMER_STATUS_VALUE;
+	er_status = xe_mmio_read32(&gt->mmio, GSCI_TIMER_STATUS) & GSCI_TIMER_STATUS_VALUE;
 
 	if (er_status == GSCI_TIMER_STATUS_TIMER_EXPIRED) {
 		/*
@@ -581,11 +581,11 @@ void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
 	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
 		return;
 
-	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
+	xe_mmio_rmw32(&gt->mmio, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
 
 	if (prep) {
 		/* make sure the reset bit is clear when writing the CSR reg */
-		xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+		xe_mmio_rmw32(&gt->mmio, HECI_H_CSR(MTL_GSC_HECI2_BASE),
 			      HECI_H_CSR_RST, HECI_H_CSR_IG);
 		msleep(200);
 	}
@@ -599,6 +599,7 @@ void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
 void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_mmio *mmio = &gt->mmio;
 	int err;
 
 	xe_uc_fw_print(&gsc->fw, p);
@@ -613,12 +614,12 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 		return;
 
 	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
-			xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(gt, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(gt, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(gt, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(gt, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(gt, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
+			xe_mmio_read32(mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(mmio, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(mmio, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 2d6ea8c01445..6d89c22ae811 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -65,7 +65,7 @@ gsc_to_gt(struct xe_gsc *gsc)
 bool xe_gsc_proxy_init_done(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
-	u32 fwsts1 = xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE));
+	u32 fwsts1 = xe_mmio_read32(&gt->mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE));
 
 	return REG_FIELD_GET(HECI1_FWSTS1_CURRENT_STATE, fwsts1) ==
 	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
@@ -78,7 +78,7 @@ static void __gsc_proxy_irq_rmw(struct xe_gsc *gsc, u32 clr, u32 set)
 	/* make sure we never accidentally write the RST bit */
 	clr |= HECI_H_CSR_RST;
 
-	xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE), clr, set);
+	xe_mmio_rmw32(&gt->mmio, HECI_H_CSR(MTL_GSC_HECI2_BASE), clr, set);
 }
 
 static void gsc_proxy_irq_clear(struct xe_gsc *gsc)
-- 
2.45.2

