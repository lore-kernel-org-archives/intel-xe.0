Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA896C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 04:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793A610E61F;
	Mon,  7 Sep 2026 04:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmishkZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE51010E612;
 Mon,  7 Sep 2026 04:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788755536; x=1820291536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AYc7ind9MtD4a9a3oPs0IqhL8zp/itbTizWoco+/Joo=;
 b=NmishkZU8jR+hWlTaN8wcY6G3yQqoXZq/rg6dexcO6kp2gUZxgIXeiZs
 MB7ZZYkPkYRh2gq9OYiEDfu4V2OT9fZKVyCWqJNRWWPYmTx6eyyFLHSbq
 lA4ScupMfgetIIn2x1U2srG5qFlLFwVZv4TXDVtdAf0dr9l20QNbdq4o5
 5ZgGU6TTHbYZ3Krs2qiR6DR42GpXUwWNoIxj6Ns8PjrqLOMbvObropyEm
 Rw4bDn0VyuGT3JO9dJXbAVUun4iH/kjoz8aNnA5iXi5GyTLid4BGdq3kk
 DDY4eMO0JHIvWygU2ZsDtUqNWjhcwzIA5v9eMvklQ4a4vQIP+C6ZVQU2l Q==;
X-CSE-ConnectionGUID: CSO3RXXERyGHuMq5ARnbiA==
X-CSE-MsgGUID: 8k2NYKN3QhWfp9FMSI2uew==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88089795"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="88089795"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 21:32:15 -0700
X-CSE-ConnectionGUID: W23YsUpGS6Ggr8u6R+603A==
X-CSE-MsgGUID: nWnhDoAeT0m7ttCtTQww2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="294079767"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2026 21:32:14 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v3] drm/i915/display: Limit SEL_FETCH clear to supported pipes
Date: Mon,  7 Sep 2026 09:59:44 +0530
Message-Id: <20260907042944.3127031-1-nemesa.garg@intel.com>
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

v2: Write SEL_FETCH to 0 only when enable_psr2_sel_fetch is true.
v3: Build fix.

Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c   | 15 ++++------
 drivers/gpu/drm/i915/display/intel_psr.c      | 30 +++++++++++++++++++
 .../drm/i915/display/skl_universal_plane.c    | 15 ++++------
 3 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index cce041e1da51..90173040d825 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -531,18 +531,13 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 }
 
 static void i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
-					      struct intel_plane *plane)
+					      struct intel_plane *plane,
+					      const struct intel_crtc_state *crtc_state)
 {
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
@@ -592,7 +587,7 @@ static void i9xx_cursor_update_sel_fetch_arm(struct intel_dsb *dsb,
 		if (crtc_state->enable_psr2_su_region_et)
 			wa_16021440873(dsb, plane, crtc_state, plane_state);
 		else
-			i9xx_cursor_disable_sel_fetch_arm(dsb, plane);
+			i9xx_cursor_disable_sel_fetch_arm(dsb, plane, crtc_state);
 	}
 }
 
@@ -701,7 +696,7 @@ static void i9xx_cursor_update_arm(struct intel_dsb *dsb,
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
index 5cda1ab90e40..07a683293352 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -879,18 +879,13 @@ skl_plane_disable_arm(struct intel_dsb *dsb,
 }
 
 static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
-					    struct intel_plane *plane)
+					    struct intel_plane *plane,
+					    const struct intel_crtc_state *crtc_state)
 {
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
@@ -926,7 +921,7 @@ icl_plane_disable_arm(struct intel_dsb *dsb,
 
 	skl_write_plane_wm(dsb, plane, crtc_state);
 
-	icl_plane_disable_sel_fetch_arm(dsb, plane);
+	icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
 
 	if (plane_has_normalizer(plane))
 		intel_de_write_dsb(display, dsb,
@@ -1646,7 +1641,7 @@ static void icl_plane_update_sel_fetch_arm(struct intel_dsb *dsb,
 		intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id),
 				   SEL_FETCH_PLANE_CTL_ENABLE);
 	else
-		icl_plane_disable_sel_fetch_arm(dsb, plane);
+		icl_plane_disable_sel_fetch_arm(dsb, plane, crtc_state);
 }
 
 static void
-- 
2.25.1

