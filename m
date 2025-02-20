Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8CC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 09:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915010E4BC;
	Thu, 20 Feb 2025 09:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCSTs0+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A58610E4A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740044852; x=1771580852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=41u4Vx/tmUd0U6KGW4NliNwD+lijEtY1KtK6LrcnPdQ=;
 b=hCSTs0+01NcYAaH9VEZaLGf3qxR1/NWlBuqO8utefcm3lcNhqmcVPwP2
 JmqmkEAppnl8Hleffs31nbrSnqeCISW+4kQwOfWggC+909QxGl3FXj3dX
 b9z0DYVCpY91gImdxz3DgOxZP3BZYZyjiqaQVIchORghKUDeApt5onXNR
 DlXFSoWIUGEVhIcdF90iBAjPb3LCn57LBDiUOr5dA4ozc6vIxUlMgq2RG
 EKzi6NKv9PBp0wRU9opSt4hDT0fnemzVVdGI8EdWfJdbLNO5jVMddGJWr
 N4TkBRcCbEtTXVqQBxuaXnmK0GvGrYZD1goCUaYNPn/VRhlzKWNvrhuZQ A==;
X-CSE-ConnectionGUID: 1qXlmfjwQGSIbf+KH+9JsA==
X-CSE-MsgGUID: z9c8b2K4RMet+4VVkpG3oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40004637"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40004637"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 01:47:25 -0800
X-CSE-ConnectionGUID: XibuupFaT0eDx0C10JiVkQ==
X-CSE-MsgGUID: wGNWjHXMRPecWI+zO1IHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120215769"
Received: from unknown (HELO aradhyab-desk.iind.intel.com) ([10.190.216.90])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 01:47:23 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v5 2/2] drm/xe/oa: Refactor WAs to use XE_WA() macro
Date: Thu, 20 Feb 2025 15:16:45 +0530
Message-Id: <20250220094645.358647-3-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220094645.358647-1-aradhya.bhatia@intel.com>
References: <20250220094645.358647-1-aradhya.bhatia@intel.com>
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

Refactor Wa_18013179988, Wa_14015568240, Wa_1508761755, and
Wa_1509372804, to use the proper workaround-check implementation for
out-of-band workarounds, XE_WA(), and drop the use of the platform
based WA selection.

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c         | 30 +++++++++---------------------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d89e6cabf5a5..00e9bf8bae09 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -12,6 +12,8 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "abi/guc_actions_slpc_abi.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
@@ -35,6 +37,7 @@
 #include "xe_sched_job.h"
 #include "xe_sriov.h"
 #include "xe_sync.h"
+#include "xe_wa.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -811,11 +814,8 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 	struct xe_mmio *mmio = &stream->gt->mmio;
 	u32 sqcnt1;
 
-	/*
-	 * Wa_1508761755:xehpsdv, dg2
-	 * Enable thread stall DOP gating and EU DOP gating.
-	 */
-	if (stream->oa->xe->info.platform == XE_DG2) {
+	/* Enable thread stall DOP gating and EU DOP gating. */
+	if (XE_WA(stream->gt, 1508761755)) {
 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
 					  _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
@@ -1064,11 +1064,10 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	int ret;
 
 	/*
-	 * Wa_1508761755:xehpsdv, dg2
 	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
 	 * Disable thread stall DOP gating and EU DOP gating.
 	 */
-	if (stream->oa->xe->info.platform == XE_DG2) {
+	if (XE_WA(stream->gt, 1508761755)) {
 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
 					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
@@ -1719,12 +1718,10 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	}
 
 	/*
-	 * Wa_1509372804:pvc
-	 *
 	 * GuC reset of engines causes OA to lose configuration
 	 * state. Prevent this by overriding GUCRC mode.
 	 */
-	if (stream->oa->xe->info.platform == XE_PVC) {
+	if (XE_WA(stream->gt, 1509372804)) {
 		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
 						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
 		if (ret)
@@ -1856,23 +1853,14 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
 {
 	u32 reg, shift;
 
-	/*
-	 * Wa_18013179988:dg2
-	 * Wa_14015568240:pvc
-	 * Wa_14015846243:mtl
-	 */
-	switch (gt_to_xe(gt)->info.platform) {
-	case XE_DG2:
-	case XE_PVC:
-	case XE_METEORLAKE:
+	if (XE_WA(gt, 18013179988) || XE_WA(gt, 14015568240)) {
 		xe_pm_runtime_get(gt_to_xe(gt));
 		reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 		xe_pm_runtime_put(gt_to_xe(gt));
 
 		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
 		return gt->info.reference_clock << (3 - shift);
-
-	default:
+	} else {
 		return gt->info.reference_clock;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ea72bcc02e1e..1dd02a231926 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -47,3 +47,8 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION(1300)
 14016712196	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 1274)
+14015568240	GRAPHICS_VERSION_RANGE(1255, 1260)
+18013179988	GRAPHICS_VERSION(1255)
+		GRAPHICS_VERSION_RANGE(1270, 1274)
+1508761755	GRAPHICS_VERSION(1255)
+		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
-- 
2.34.1

