Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5494C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 10:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A12C10EE9B;
	Wed,  1 Jul 2026 10:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR/+UfXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6110EE9B;
 Wed,  1 Jul 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782900507; x=1814436507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dVu4sUbvqRaReOOdc2m83mge/8sAl5BsvaOj5F0OF30=;
 b=nR/+UfXyXhGdv9NkXUCVPS38u0AcATM9TqiwJMFBM5SZFmm/DyJSFcl3
 USsu3XQtB0aqU7/UTYQ6K+xm7/UPgJchsq0Qx9QL7BBVkc2tCitWTGDfM
 Bw3sFG5rBAL4MOLPzIdlLCrPdyPwNScZlV9vui5EryHfPhVdiTTAgh5S4
 c6ZKW/aKqPJ3IFb3EZClvokngvQZKWqYlDI8j8pip2LV8gtWNkuiGMa24
 UBSrtEzcus/s+dBKBaYOaGQQHcdiu+/W5KmpDAWIyR4sBgsTeQgFKQF+B
 FrmOovGel49WOsE6EFOz4MsCkRwn0E2CRzXxfLDiw5j7PBM3o4gIqrNHu w==;
X-CSE-ConnectionGUID: 6GafEhNoRH+1em7/ZO7m4Q==
X-CSE-MsgGUID: QGd55++NS/GJ+46uwOj1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83827733"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83827733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 03:08:26 -0700
X-CSE-ConnectionGUID: oOZgdEyxTK2ZiDqgV9yQAg==
X-CSE-MsgGUID: jLasZXSnSD6eLOoEe1PvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="248064831"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 03:08:24 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	uma.shankar@intel.com,
	suraj.kandpal@intel.com
Subject: [PATCH v2 1/1] drm/i915/psr: Block DC3CO entry during active frame
Date: Wed,  1 Jul 2026 15:36:50 +0530
Message-ID: <20260701100650.1689665-2-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701100650.1689665-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260701100650.1689665-1-dibin.moolakadan.subrahmanian@intel.com>
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

On Xe3P, when PSR2 is enabled on a panel that does not support
Early Transport, DC3CO can be entered in the middle of an
active frame. This prevents the pipe from completing the frame
and leaves it in a bad state that does not recover well,
causing visible corruption on screen.

Set CHICKEN_DCPR_4 bit 24 in the PSR2 enable path when Early Transport
is not in use, to notify DMC to prevent DC3CO entry.

v2:
- Remove display from commit header (Suraj Kandpal).
- Add HSD number to intel_display_wa framework (Suraj Kandpal).
- Change register prefix from XE3LPD_ to XE3P_ (Suraj Kandpal).

BSpec: 71483, 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 .../gpu/drm/i915/display/intel_display_regs.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_display_wa.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h  |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c         | 16 ++++++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 39e50423132f..0f5018482497 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1747,6 +1747,9 @@
 #define XELPD_CHICKEN_DCPR_3			_MMIO(0x46438)
 #define   DMD_RSP_TIMEOUT_DISABLE		REG_BIT(19)
 
+#define XE3P_CHICKEN_DCPR_4			_MMIO(0x454a0)
+#define   DCPR4_BLOCK_DC3CO_ACTIVE_FRAME	REG_BIT(24)
+
 #define SKL_DFSM			_MMIO(0x51000)
 #define   SKL_DFSM_DISPLAY_PM_DISABLE	(1 << 27)
 #define   SKL_DFSM_DISPLAY_HDCP_DISABLE	(1 << 25)
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 2094eda09c91..b4c49816f7eb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -112,6 +112,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			DISPLAY_VERx100(display) == 1401;
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
+	case INTEL_DISPLAY_WA_14026643300:
+		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_15013987218:
 		return DISPLAY_VER(display) == 20;
 	case INTEL_DISPLAY_WA_15018326506:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 9cdd148ea4fa..92b3980bea84 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -43,6 +43,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
+	INTEL_DISPLAY_WA_14026643300,
 	INTEL_DISPLAY_WA_15013987218,
 	INTEL_DISPLAY_WA_15018326506,
 	INTEL_DISPLAY_WA_16011181250,
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 92af21d823a3..40e3d7095996 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2100,6 +2100,18 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 		else if (display->platform.alderlake_p)
 			intel_de_rmw(display, CLKGATE_DIS_MISC, 0,
 				     CLKGATE_DIS_MISC_DMASC_GATING_DIS);
+
+		/*
+		 * Wa_14026643300
+		 * On Xe3P, restrict DC3CO entry during active frame when PSR2 is
+		 * enabled without panel Early Transport; required to avoid pipe bad state.
+		 * DMC honours CHICKEN_DCPR_4 bit 24 to block DC3CO entry during active frame.
+		 */
+		if (intel_display_wa(display, INTEL_DISPLAY_WA_14026643300) &&
+		    !intel_dp->psr.panel_replay_enabled &&
+		    !intel_dp->psr.su_region_et_enabled)
+			intel_de_rmw(display, XE3P_CHICKEN_DCPR_4,
+				     0, DCPR4_BLOCK_DC3CO_ACTIVE_FRAME);
 	}
 
 	/* Wa_16025596647 */
@@ -2341,6 +2353,10 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 		else if (display->platform.alderlake_p)
 			intel_de_rmw(display, CLKGATE_DIS_MISC,
 				     CLKGATE_DIS_MISC_DMASC_GATING_DIS, 0);
+
+		if (intel_display_wa(display, INTEL_DISPLAY_WA_14026643300))
+			intel_de_rmw(display, XE3P_CHICKEN_DCPR_4,
+				     DCPR4_BLOCK_DC3CO_ACTIVE_FRAME, 0);
 	}
 
 	if (intel_dp_is_edp(intel_dp))
-- 
2.43.0

