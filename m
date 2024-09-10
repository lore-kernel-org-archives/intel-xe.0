Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF5CEE0203
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E4610E955;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kn2mdtHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A6010E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012048; x=1757548048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IcDRSBkLaJYmbJHlvBBCPVhWgwLVg4/PkedhSwxD/9A=;
 b=kn2mdtHy9pZfnpO76hI7thNGVo++EhMvK3VG9uGRBx+Ascq+dslLSEvD
 bebW/q+NDSYwD5Z5GG7p2orxfV+a5oRB06Cm7lZpAXvMh3KHsSVne1g+c
 gk1RSs8y5hANj9OC4Pf77lSoegQlcXyQIl6IPkUj4y+l72ok77Si8z6SQ
 BF5T6CKqM+VsLbqQw7EGYHDazW7P2OJYWKd6Ru8TPLEVGVK2DWWr4JKUu
 RA4bp6rQX/ZscOJ3YBUrdDv2U7YMP3LrqI+eReJWlkAqiCHNOv5z5eGet
 W/vRO4JcXveXtt1+7rdz0HPN0oHs/EHnHB/nHEsuIXzsqa7+KTcoF9HkP w==;
X-CSE-ConnectionGUID: +oDiOGFjRHiAbNgUPSg+5w==
X-CSE-MsgGUID: p5n+3IMERaiY8q3B/vVzXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144314"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144314"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: MugiE9PyTjCIUpOK4GOUwQ==
X-CSE-MsgGUID: hz90uQBLT7+phCOkPLEDQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989613"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 23/43] drm/xe/gsc: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:43 -0700
Message-ID: <20240910234719.3335472-68-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

