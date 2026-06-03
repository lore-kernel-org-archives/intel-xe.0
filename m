Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952F1CD6E6B
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 20:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5564A112262;
	Wed,  3 Jun 2026 20:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jne5pzKN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163DB10FBE5;
 Wed,  3 Jun 2026 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780518393; x=1812054393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qr0jOJnyGvFJ52p78VMfYmfbLwcW0cuKLgJ7QsySMDk=;
 b=Jne5pzKNnHHeQN5XONhBTFj23mv5Ij1vD2tWKZHo4K2sa4V86WY/clBx
 4085Q09TKzMNIbjhaCEcUZO+5Xq9YPmZn1HchJyKmqRW+hHMIWIrkV5QZ
 6FNJZs3vsl22gZgHKFlw9daHLXlDnh2BLCdxpGhPO8t8pESwg5gIEmyz0
 1gEjar6axLeYrPlPAsGFcNooF7RKbVYlgFkT2W0XQXpkIDAX1wJy0G658
 2bwUjvl3yh6Da7ywX8lviJTAQ8Vw1xXh1t1fZUXRfHET+sjcM9AXLlrsC
 Xy717g/bP8hl7wpRQzHC3vAhechKKNEUizoEeE/jmpar5T1mcfHatdlxJ w==;
X-CSE-ConnectionGUID: B0hg/vtRQn2ecRbAYbLrLQ==
X-CSE-MsgGUID: oz0/4bf3QPWAM5FMX8gbdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81337403"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81337403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 13:26:33 -0700
X-CSE-ConnectionGUID: Cq6YBcHnSL6N2Vj0rf1/Zg==
X-CSE-MsgGUID: mwyFRMSBTVCkRAbTEw0siQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244424796"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa009.jf.intel.com with ESMTP; 03 Jun 2026 13:26:31 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v8 07/20] drm/i915/cmtg: Set timings for CMTG by using
 transcoder timing helpers
Date: Thu,  4 Jun 2026 01:24:03 +0530
Message-Id: <20260603195416.91639-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260603195416.91639-1-animesh.manna@intel.com>
References: <20260603195416.91639-1-animesh.manna@intel.com>
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

Expose intel_set_transcoder_timings() & intel_set_transcoder_timings_lrr()
so that they can program timings on any transcoder, and use them from a
new intel_cmtg_set_timings() helper instead of duplicating the timing
register write sequence for CMTG.

intel_cmtg_set_timings() maps the CPU transcoder to the corresponding
CMTG transcoder (TRANSCODER_A->TRANSCODER_CMTG0, TRANSCODER_B->
TRANSCODER_CMTG1) and calls the shared helper, gated by
intel_cmtg_is_allowed(). It is invoked from hsw_configure_cpu_transcoder()
for the full modeset path and from intel_pipe_fastset() for the LRR
update path.

v2:
- Use sw state instead of reading directly from hardware. [Jani]
- Move set_timing later after encoder enable. [Dibin]

v3:
- Replace id with trans. [Jani]
- Program cmtg set_timing() along with primary transcoder timing.

v4:
- Use _MMIO_TRANS() for cmtg registers instead of direct
multiplication. [Jani]

v5:
- Modify register definition approach and match existing
transcoder definition. [Ville]

v6:
- Reuse transcoder timing helpers. [Ville]

Bspec: 68989
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c    | 25 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++-----
 drivers/gpu/drm/i915/display/intel_display.h |  4 ++++
 4 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index fbc8a4f2b9cb..082c04bec9ee 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -219,3 +219,28 @@ void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state)
 	if (clk_sel_set)
 		intel_de_rmw(display, CMTG_CLK_SEL, clk_sel_clr, clk_sel_set);
 }
+
+static inline enum transcoder to_cmtg_transcoder(enum transcoder cpu_transcoder)
+{
+	switch (cpu_transcoder) {
+	case TRANSCODER_A:
+		return TRANSCODER_CMTG0;
+	case TRANSCODER_B:
+		return TRANSCODER_CMTG1;
+	default:
+		return INVALID_TRANSCODER;
+	}
+}
+
+void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr)
+{
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	if (lrr)
+		intel_set_transcoder_timings_lrr(crtc_state, cmtg_transcoder);
+	else
+		intel_set_transcoder_timings(crtc_state, cmtg_transcoder);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 87092ce6d67b..53a44f505dd2 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,7 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr);
 void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 17621f66501f..a6a1da4bd98d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -60,6 +60,7 @@
 #include "intel_bw.h"
 #include "intel_cdclk.h"
 #include "intel_clock_gating.h"
+#include "intel_cmtg.h"
 #include "intel_color.h"
 #include "intel_crt.h"
 #include "intel_crtc.h"
@@ -132,8 +133,6 @@
 #include "vlv_dsi_pll.h"
 #include "vlv_dsi_regs.h"
 
-static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
-					 enum transcoder transcoder);
 static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state);
 static void hsw_set_transconf(const struct intel_crtc_state *crtc_state);
 static void bdw_set_pipe_misc(struct intel_dsb *dsb,
@@ -1637,6 +1636,7 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
 	}
 
 	intel_set_transcoder_timings(crtc_state, crtc_state->cpu_transcoder);
+	intel_cmtg_set_timings(crtc_state, false);
 
 	if (cpu_transcoder != TRANSCODER_EDP)
 		intel_de_write(display, TRANS_MULT(display, cpu_transcoder),
@@ -2665,8 +2665,8 @@ transcoder_has_vrr(const struct intel_crtc_state *crtc_state)
 	return HAS_VRR(display) && !transcoder_is_dsi(cpu_transcoder);
 }
 
-static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
-					 enum transcoder transcoder)
+void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
+				  enum transcoder transcoder)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -2777,8 +2777,8 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 	}
 }
 
-static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
-					     enum transcoder transcoder)
+void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
+				      enum transcoder transcoder)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -6673,6 +6673,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 
 	if (new_crtc_state->update_lrr) {
 		intel_set_transcoder_timings_lrr(new_crtc_state, new_crtc_state->cpu_transcoder);
+		intel_cmtg_set_timings(new_crtc_state, true);
 		intel_vrr_set_fixed_rr_timings(new_crtc_state);
 		intel_vrr_transcoder_enable(new_crtc_state);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 1963dbc80221..ef7e0506f77f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -424,6 +424,10 @@ void intel_set_m_n(struct intel_display *display,
 		   const struct intel_link_m_n *m_n,
 		   intel_reg_t data_m_reg, intel_reg_t data_n_reg,
 		   intel_reg_t link_m_reg, intel_reg_t link_n_reg);
+void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
+				  enum transcoder transcoder);
+void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
+				      enum transcoder transcoder);
 void intel_get_m_n(struct intel_display *display,
 		   struct intel_link_m_n *m_n,
 		   intel_reg_t data_m_reg, intel_reg_t data_n_reg,
-- 
2.29.0

