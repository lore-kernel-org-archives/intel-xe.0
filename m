Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D66C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 04:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC7C10E43E;
	Mon,  7 Sep 2026 04:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZf5GZ1W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74810E43E;
 Mon,  7 Sep 2026 04:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788755064; x=1820291064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DKlv0KXr+CP3BJ6uaeOjPOUsr/ZVzvEM1frxOSxj5gI=;
 b=RZf5GZ1WH3yhoqZDIyjxhMdN6ElEgq46E+zrALOKluXn5SH9nweW9kRh
 yAtmj92I4XIwLAhgBY/IZt8EfLzj+L9r2ovpfGVm15j779YwvaCIg6OtN
 ZSMoo1P4wHjKDJh1qsoQvL5SFlIrsRrYxL80Ak6RG8ulgYA/4Ie/O13pt
 Bp/k5yRMnMu0Q7+kc+5n6GJcldNMitSYZMyAVl0t7Zh7ZXq+mYaKDXH1t
 yufBQ3YbClNYZlA4rXSAFeN6yY/j4Np7Wv2xxb7+mZ5GpkQiQw1mv3yX/
 i5XkYdCXDdHms/VmIE6/3gkvxg+3K5oOxTw84QmA4zaHg73D+dkf7J3n9 g==;
X-CSE-ConnectionGUID: D1Dpk1u3SPWKxodYuXkTmw==
X-CSE-MsgGUID: ccELXoUHS2i2g/++6fvOJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88089496"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="88089496"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 21:24:24 -0700
X-CSE-ConnectionGUID: hHxiJRIJScael0JgRKuBQQ==
X-CSE-MsgGUID: U8tofDvSR3GoD280wyLHeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="294079090"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2026 21:24:23 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v2] drm/i915/display: Limit SEL_FETCH clear to supported pipes
Date: Mon,  7 Sep 2026 09:51:42 +0530
Message-Id: <20260907042142.3114009-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL
on plane disable") started clearing SEL_FETCH_PLANE_CTL and
SEL_FETCH_CUR_CTL on every plane and cursor disable.

Not all pipes implement these registers. Clearing them on a pipe
that does not have them leads to an unclaimed register access.

Skip the clear on pipes that do not implement the registers.

Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c   | 12 ++------
 drivers/gpu/drm/i915/display/intel_psr.c      | 30 +++++++++++++++++++
 .../drm/i915/display/skl_universal_plane.c    | 12 ++------
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index cce041e1da51..aa662b2cdf42 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -536,13 +536,7 @@ static void i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
 	struct intel_display *display = to_intel_display(plane);
 	enum pipe pipe = plane->pipe;
 
-	/*
-	 * Clear this whenever the hardware has selective fetch, not just when
-	 * the current state uses it. The cursor may have been enabled with
-	 * selective fetch earlier and had its enable bit orphaned when the
-	 * feature was switched off.
-	 */
-	if (!HAS_PSR2_SEL_FETCH(display))
+	if (!crtc_state->enable_psr2_sel_fetch)
 		return;
 
 	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);
@@ -592,7 +586,7 @@ static void i9xx_cursor_update_sel_fetch_arm(struct intel_dsb *dsb,
 		if (crtc_state->enable_psr2_su_region_et)
 			wa_16021440873(dsb, plane, crtc_state, plane_state);
 		else
-			i9xx_cursor_disable_sel_fetch_arm(dsb, plane);
+			i9xx_cursor_disable_sel_fetch_arm(dsb, plane, crtc_state);
 	}
 }
 
@@ -701,7 +695,7 @@ static void i9xx_cursor_update_arm(struct intel_dsb *dsb,
 	if (plane_state)
 		i9xx_cursor_update_sel_fetch_arm(dsb, plane, crtc_state, plane_state);
 	else
-		i9xx_cursor_disable_sel_fetch_arm(dsb, plane);
+		i9xx_cursor_disable_sel_fetch_arm(dsb, plane, crtc_state);
 
 	if (plane->cursor.base != base ||
 	    plane->cursor.size != fbc_ctl ||
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f490beb66629..702d4b6d62a4 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -58,6 +58,7 @@
 #include "intel_vdsc.h"
 #include "intel_vrr.h"
 #include "skl_universal_plane.h"
+#include "skl_universal_plane_regs.h"
 
 /**
  * DOC: Panel Self Refresh (PSR/SRD)
@@ -2162,6 +2163,33 @@ static bool psr_interrupt_error_check(struct intel_dp *intel_dp)
 	return true;
 }
 
+/*
+ * A plane disabled while selective fetch was off keeps its selective fetch
+ * enable bit set in hardware. The bit does nothing until selective fetch is
+ * turned back on, at which point the hardware would resume fetching for a
+ * plane that is no longer enabled and keep its DDB range reserved. Drop the
+ * bit for every inactive plane as selective fetch is enabled. The active
+ * planes are programmed by the selective fetch update that follows.
+ */
+static void psr2_sel_fetch_clear_inactive_planes(struct intel_display *display,
+						 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	enum pipe pipe = crtc->pipe;
+	struct intel_plane *plane;
+
+	for_each_intel_plane_on_crtc(display->drm, crtc, plane) {
+		if (crtc_state->active_planes & BIT(plane->id))
+			continue;
+
+		if (plane->id == PLANE_CURSOR)
+			intel_de_write(display, SEL_FETCH_CUR_CTL(pipe), 0);
+		else
+			intel_de_write(display,
+				       SEL_FETCH_PLANE_CTL(pipe, plane->id), 0);
+	}
+}
+
 static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 				    const struct intel_crtc_state *crtc_state)
 {
@@ -2180,6 +2208,8 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	val = usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
 	intel_dp->psr.dc3co_exit_delay = val;
 	intel_dp->psr.psr2_sel_fetch_enabled = crtc_state->enable_psr2_sel_fetch;
+	if (crtc_state->enable_psr2_sel_fetch)
+		psr2_sel_fetch_clear_inactive_planes(display, crtc_state);
 	intel_dp->psr.su_region_et_enabled = crtc_state->enable_psr2_su_region_et;
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.req_psr2_sdp_prior_scanline =
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 5cda1ab90e40..a7e2f44ebfca 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -884,13 +884,7 @@ static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
 	struct intel_display *display = to_intel_display(plane);
 	enum pipe pipe = plane->pipe;
 
-	/*
-	 * Clear this whenever the hardware has selective fetch, not just when
-	 * the current state uses it. The plane may have been enabled with
-	 * selective fetch earlier and had its enable bit orphaned when the
-	 * feature was switched off.
-	 */
-	if (!HAS_PSR2_SEL_FETCH(display))
+	if (!crtc_state->enable_psr2_sel_fetch)
 		return;
 
 	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id), 0);
@@ -926,7 +920,7 @@ icl_plane_disable_arm(struct intel_dsb *dsb,
 
 	skl_write_plane_wm(dsb, plane, crtc_state);
 
-	icl_plane_disable_sel_fetch_arm(dsb, plane);
+	icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
 
 	if (plane_has_normalizer(plane))
 		intel_de_write_dsb(display, dsb,
@@ -1646,7 +1640,7 @@ static void icl_plane_update_sel_fetch_arm(struct intel_dsb *dsb,
 		intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id),
 				   SEL_FETCH_PLANE_CTL_ENABLE);
 	else
-		icl_plane_disable_sel_fetch_arm(dsb, plane);
+		icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
 }
 
 static void
-- 
2.25.1

