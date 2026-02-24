Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4FBE9B263
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F3210E587;
	Tue, 24 Feb 2026 13:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIi9ExFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD610E587;
 Tue, 24 Feb 2026 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941155; x=1803477155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7j2wElsBEy/pQPbKv+cRmAKkTBCW9xnzm3zK9mc7lqs=;
 b=HIi9ExFldXsAKujeEA0c1XqTKAY1DneDUi0MOcs1V2KfXOhbWQLsmAMW
 OTtkk6wEgUxMv1YKl0GzRl/CWTAZL1mWyZMUyDz3+A/FFyKecfqZQddyY
 +L6OEJ/lvdKwiUgm++V6/aesX470GtK2Ao2PNwvFEG9LZdhSr1uRz5k/o
 Y/FFuSCJtmiY0yqtd5+FKPeLLlyvNhZ7AhKNQ+9rG0fe41ch9Alnq9gtF
 sALUXCBO3LWVLfEkPXvRWmmrNcs+2932kpLHvx9e4s4QEzlveErBfrcpu
 ILKEQdRksDJUQo5zezgqA//FNaDpMZQrRXJv8A9V8Q9sXiUgCdZHuefF1 Q==;
X-CSE-ConnectionGUID: 9CGLJousSvGDWrE1GujVKQ==
X-CSE-MsgGUID: W7eC0QkXQGWsATXeXDSHcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60530996"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60530996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:35 -0800
X-CSE-ConnectionGUID: Kf+poBB4TkaexT7NEKtmjA==
X-CSE-MsgGUID: CTCH+6d+QDOMABsHpwW5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215925221"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:33 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v4 03/16] drm/i915/display: convert W/As in
 intel_display_power.c to new framework
Date: Tue, 24 Feb 2026 15:49:50 +0200
Message-ID: <20260224135208.140752-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260224135208.140752-1-luciano.coelho@intel.com>
References: <20260224135208.140752-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_display_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../drm/i915/display/intel_display_power.c    | 22 +++++++++----------
 .../gpu/drm/i915/display/intel_display_wa.c   | 18 +++++++++++++++
 .../gpu/drm/i915/display/intel_display_wa.h   |  7 ++++++
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 755935dcfe23..7312dba4f032 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -21,6 +21,7 @@
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dmc.h"
 #include "intel_dram.h"
 #include "intel_mchbar_regs.h"
@@ -1621,8 +1622,7 @@ static void tgl_bw_buddy_init(struct intel_display *display)
 	if (display->platform.dgfx && !display->platform.dg1)
 		return;
 
-	if (display->platform.alderlake_s ||
-	    (display->platform.rocketlake && IS_DISPLAY_STEP(display, STEP_A0, STEP_B0)))
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_1409767108))
 		/* Wa_1409767108 */
 		table = wa_1409767108_buddy_page_masks;
 	else
@@ -1645,7 +1645,7 @@ static void tgl_bw_buddy_init(struct intel_display *display)
 				       table[config].page_mask);
 
 			/* Wa_22010178259:tgl,dg1,rkl,adl-s */
-			if (DISPLAY_VER(display) == 12)
+			if (intel_display_wa(display, INTEL_DISPLAY_WA_22010178259))
 				intel_de_rmw(display, BW_BUDDY_CTL(i),
 					     BW_BUDDY_TLB_REQ_TIMER_MASK,
 					     BW_BUDDY_TLB_REQ_TIMER(0x8));
@@ -1662,8 +1662,7 @@ static void icl_display_core_init(struct intel_display *display,
 	gen9_set_dc_state(display, DC_STATE_DISABLE);
 
 	/* Wa_14011294188:ehl,jsl,tgl,rkl,adl-s */
-	if (INTEL_PCH_TYPE(display) >= PCH_TGP &&
-	    INTEL_PCH_TYPE(display) < PCH_DG1)
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011294188))
 		intel_de_rmw(display, SOUTH_DSPCLK_GATE_D, 0,
 			     PCH_DPMGUNIT_CLOCK_GATE_DISABLE);
 
@@ -1717,17 +1716,17 @@ static void icl_display_core_init(struct intel_display *display,
 		intel_dmc_load_program(display);
 
 	/* Wa_14011508470:tgl,dg1,rkl,adl-s,adl-p,dg2 */
-	if (IS_DISPLAY_VERx100(display, 1200, 1300))
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011508470))
 		intel_de_rmw(display, GEN11_CHICKEN_DCPR_2, 0,
 			     DCPR_CLEAR_MEMSTAT_DIS | DCPR_SEND_RESP_IMM |
 			     DCPR_MASK_LPMODE | DCPR_MASK_MAXLATENCY_MEMUP_CLR);
 
 	/* Wa_14011503030:xelpd */
-	if (DISPLAY_VER(display) == 13)
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011503030))
 		intel_de_write(display, XELPD_DISPLAY_ERR_FATAL_MASK, ~0);
 
 	/* Wa_15013987218 */
-	if (DISPLAY_VER(display) == 20) {
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_15013987218)) {
 		intel_de_rmw(display, SOUTH_DSPCLK_GATE_D,
 			     0, PCH_GMBUSUNIT_CLOCK_GATE_DISABLE);
 		intel_de_rmw(display, SOUTH_DSPCLK_GATE_D,
@@ -2266,8 +2265,9 @@ void intel_display_power_suspend_late(struct intel_display *display, bool s2idle
 	}
 
 	/* Tweaked Wa_14010685332:cnp,icp,jsp,mcc,tgp,adp */
-	if (INTEL_PCH_TYPE(display) >= PCH_CNP && INTEL_PCH_TYPE(display) < PCH_DG1)
-		intel_de_rmw(display, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14010685332))
+		intel_de_rmw(display, SOUTH_CHICKEN1,
+			     SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
 }
 
 void intel_display_power_resume_early(struct intel_display *display)
@@ -2281,7 +2281,7 @@ void intel_display_power_resume_early(struct intel_display *display)
 	}
 
 	/* Tweaked Wa_14010685332:cnp,icp,jsp,mcc,tgp,adp */
-	if (INTEL_PCH_TYPE(display) >= PCH_CNP && INTEL_PCH_TYPE(display) < PCH_DG1)
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14010685332))
 		intel_de_rmw(display, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS, 0);
 
 	intel_power_domains_resume(display);
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index b383bfad3af6..011749b680e8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -9,6 +9,7 @@
 #include "intel_display_core.h"
 #include "intel_display_regs.h"
 #include "intel_display_wa.h"
+#include "intel_step.h"
 
 static void gen11_display_wa_apply(struct intel_display *display)
 {
@@ -69,23 +70,40 @@ static bool intel_display_needs_wa_16025573575(struct intel_display *display)
 bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name)
 {
 	switch (wa) {
+	case INTEL_DISPLAY_WA_1409767108:
+		return (display->platform.alderlake_s ||
+			(display->platform.rocketlake &&
+			 IS_DISPLAY_STEP(display, STEP_A0, STEP_B0)));
 	case INTEL_DISPLAY_WA_13012396614:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 3500;
+	case INTEL_DISPLAY_WA_14010685332:
+		return INTEL_PCH_TYPE(display) >= PCH_CNP &&
+			INTEL_PCH_TYPE(display) < PCH_DG1;
+	case INTEL_DISPLAY_WA_14011294188:
+		return INTEL_PCH_TYPE(display) >= PCH_TGP &&
+			INTEL_PCH_TYPE(display) < PCH_DG1;
+	case INTEL_DISPLAY_WA_14011503030:
 	case INTEL_DISPLAY_WA_14011503117:
 		return DISPLAY_VER(display) == 13;
+	case INTEL_DISPLAY_WA_14011508470:
+		return (IS_DISPLAY_VERx100(display, 1200, 1300));
 	case INTEL_DISPLAY_WA_14020863754:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
 			DISPLAY_VERx100(display) == 1401;
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
+	case INTEL_DISPLAY_WA_15013987218:
+		return DISPLAY_VER(display) == 20;
 	case INTEL_DISPLAY_WA_15018326506:
 		return display->platform.battlemage;
 	case INTEL_DISPLAY_WA_16023588340:
 		return intel_display_needs_wa_16023588340(display);
 	case INTEL_DISPLAY_WA_16025573575:
 		return intel_display_needs_wa_16025573575(display);
+	case INTEL_DISPLAY_WA_22010178259:
+		return DISPLAY_VER(display) == 12;
 	case INTEL_DISPLAY_WA_22014263786:
 		return IS_DISPLAY_VERx100(display, 1100, 1400);
 	case INTEL_DISPLAY_WA_22021048059:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index b1bcc18dd2c8..380cb64cf774 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -27,13 +27,20 @@ bool intel_display_needs_wa_16023588340(struct intel_display *display);
  * number.
  */
 enum intel_display_wa {
+	INTEL_DISPLAY_WA_1409767108,
 	INTEL_DISPLAY_WA_13012396614,
+	INTEL_DISPLAY_WA_14010685332,
+	INTEL_DISPLAY_WA_14011294188,
+	INTEL_DISPLAY_WA_14011503030,
 	INTEL_DISPLAY_WA_14011503117,
+	INTEL_DISPLAY_WA_14011508470,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
+	INTEL_DISPLAY_WA_15013987218,
 	INTEL_DISPLAY_WA_15018326506,
 	INTEL_DISPLAY_WA_16023588340,
 	INTEL_DISPLAY_WA_16025573575,
+	INTEL_DISPLAY_WA_22010178259,
 	INTEL_DISPLAY_WA_22014263786,
 	INTEL_DISPLAY_WA_22021048059,
 };
-- 
2.51.0

