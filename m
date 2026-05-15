Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4203CD4F25
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 16:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6210F589;
	Fri, 15 May 2026 16:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyaQVwiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199A410F583;
 Fri, 15 May 2026 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778861462; x=1810397462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kjkfywNHxl/uItXweCrTEh2p5VmOonndEClKUAIur4c=;
 b=AyaQVwiq11yEEGBK+CHyS4F2kvLxg+RcYbPsFKAM7bj4cGOzvtzgrwUw
 vb/LJltb5jhk8KeHvJtlQbAU8SisyfQ5Nbrkzlz0eFUoB6/FfT41BZPH1
 7tqexRZTfXxk7UTqzc9bb5AogQFG15eTBRXRXe046j1TOn7x64pV+MOep
 o2yOL6e7LA+34KLE3hpx0Al4TrxUOIiL5C8ezyjzCVfkF3jvO9fqtwq+9
 4LXoD/Xw/FVLSgJEwyTHv/Y0LvW38gYYXjNnfyl3NDH+QdodAjJ2eSAqJ
 MQeD0iWrEeh7hkcjm1NMgvMSAW4v+fMPQ6xa0tQTAtt0odcw5XmjH1bap w==;
X-CSE-ConnectionGUID: VmDiMhMWQaaDw0ArH21lXg==
X-CSE-MsgGUID: XeDPKjsSRMyNOwInv3yb+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79798549"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79798549"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 09:11:01 -0700
X-CSE-ConnectionGUID: i+esdDu8R+uIbORGc+/jNg==
X-CSE-MsgGUID: lRzRcIEvRqy1IJFuzMXZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="243705492"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa005.jf.intel.com with ESMTP; 15 May 2026 09:10:58 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 gustavo.sousa@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/display: Use PIPEDMC_FRMTMSTMP on display ver >= 30
Date: Fri, 15 May 2026 21:40:56 +0530
Message-Id: <20260515161056.1007030-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515155340.1000997-1-suraj.kandpal@intel.com>
References: <20260515155340.1000997-1-suraj.kandpal@intel.com>
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

Starting with display version 30, the per-pipe frame timestamp is read
from the PIPEDMC register block (PIPEDMC_FRMTMSTMP) instead of the
legacy PIPE_FRMTMSTMP MMIO. Extend PIPE_FRMTMSTMP() to take the display
and select the appropriate register based on DISPLAY_VER(), and update
all callers intel_vblank accordingly.

Bspec: 79482
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Define registers in correct location (Jani)
- Use the intel_display_wa() helper to select the correct register (Gustavo)
- Fix early vblank timeout issue when DMC is not loaded

 .../gpu/drm/i915/display/intel_display_wa.c    |  2 ++
 .../gpu/drm/i915/display/intel_display_wa.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h  |  6 ++++++
 drivers/gpu/drm/i915/display/intel_vblank.c    | 18 ++++++++++++++----
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 7d3d63a59882..44c2a503c911 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -110,6 +110,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
 			DISPLAY_VERx100(display) == 1401;
+	case INTEL_DISPLAY_WA_14022946399:
+		return DISPLAY_VER(display) >= 30;
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_15013987218:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 15fec843f15e..884463a894c8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -42,6 +42,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14014143976,
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
+	INTEL_DISPLAY_WA_14022946399,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_15013987218,
 	INTEL_DISPLAY_WA_15018326506,
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index 38e342b45af0..985642a79a52 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -644,4 +644,10 @@ enum pipedmc_event_id {
 #define _PIPEDMC_DCB_BALANCE_RESET_B		0x986a8
 #define PIPEDMC_DCB_BALANCE_RESET(pipe)		_MMIO_PIPE(pipe, _PIPEDMC_DCB_BALANCE_RESET_A,\
 							   _PIPEDMC_DCB_BALANCE_RESET_B)
+
+#define _PIPEDMC_FRMTMSTMP_A			0x5f0ac
+#define _PIPEDMC_FRMTMSTMP_B			0x5f4ac
+#define PIPEDMC_FRMTMSTMP(pipe)			\
+	_MMIO_PIPE(pipe, _PIPEDMC_FRMTMSTMP_A, _PIPEDMC_FRMTMSTMP_B)
+
 #endif /* __INTEL_DMC_REGS_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 28d81199792e..145c342f445f 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -15,6 +15,8 @@
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
+#include "intel_dmc_regs.h"
 #include "intel_vblank.h"
 #include "intel_vrr.h"
 
@@ -156,8 +158,12 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 		 * pipe frame time stamp. The time stamp value
 		 * is sampled at every start of vertical blank.
 		 */
-		scan_prev_time = intel_de_read_fw(display,
-						  PIPE_FRMTMSTMP(crtc->pipe));
+		if (intel_display_wa(display, INTEL_DISPLAY_WA_14022946399))
+			scan_prev_time = intel_de_read_fw(display,
+							  PIPEDMC_FRMTMSTMP(crtc->pipe));
+		else
+			scan_prev_time = intel_de_read_fw(display,
+							  PIPE_FRMTMSTMP(crtc->pipe));
 
 		/*
 		 * The TIMESTAMP_CTR register has the current
@@ -165,8 +171,12 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 		 */
 		scan_curr_time = intel_de_read_fw(display, IVB_TIMESTAMP_CTR);
 
-		scan_post_time = intel_de_read_fw(display,
-						  PIPE_FRMTMSTMP(crtc->pipe));
+		if (intel_display_wa(display, INTEL_DISPLAY_WA_14022946399))
+			scan_post_time = intel_de_read_fw(display,
+							  PIPEDMC_FRMTMSTMP(crtc->pipe));
+		else
+			scan_post_time = intel_de_read_fw(display,
+							  PIPE_FRMTMSTMP(crtc->pipe));
 	} while (scan_post_time != scan_prev_time);
 
 	return div_u64(mul_u32_u32(scan_curr_time - scan_prev_time,
-- 
2.34.1

