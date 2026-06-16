Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD61ACD98ED
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5989610EB01;
	Tue, 16 Jun 2026 12:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XD/0uEiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37A010EAF8;
 Tue, 16 Jun 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613929; x=1813149929;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FAMAQ0d7wtORzZmCksa/cb8Gs0DUx+1obW8xZfBD/uo=;
 b=XD/0uEiVKT00NADraC3BWRjolW+etYqOYZb1LnV/IIODpFtzWNwMmcTS
 mKy5EyHJmy1vSyDZfg936JVBRUYftwwLRyYFV8qhuXXasgauGS8tujcWd
 3PPmABzv4B4Jx1HNxwAagfxWHd05abU2B+eRAEt0lWTn+xN84kqnNjdgv
 RxzWdJ0GjbD15M/yWUjFILb4N2hDl4o3auoJb5EPx0YN7f0oJGel+w2rM
 FBPQiMXTD6o0ybO7VkRXwsWLBrMahD1knUMu6rDzsAWrUjAja5jBGyLk3
 MwAzGogLGgBwqT4B5aR9CMWB1JJLUM8zwX+KSh4GdHZTGpj66jdUSF0gC Q==;
X-CSE-ConnectionGUID: s7cS5IseQYSVgMjjGkOHrg==
X-CSE-MsgGUID: KlnGkU4FQJizBDL9tM/syw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513235"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:29 -0700
X-CSE-ConnectionGUID: f0bZCLjdTyW9w/atMevt+w==
X-CSE-MsgGUID: M1dLS7pbTDKG+wyyH4AdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876263"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:28 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 09/39] drm/i915/cmtg: Set timings for CMTG by using transcoder
 timing helpers
Date: Tue, 16 Jun 2026 18:13:45 +0530
Message-ID: <20260616124416.2442161-10-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

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

v7:
- Introduce enum for set_timing_type. [Uma]
- Add check for INVALID_TRANSCODER. [Uma]

Bspec: 68989
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c    | 28 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h    |  6 +++++
 drivers/gpu/drm/i915/display/intel_display.c | 13 ++++-----
 drivers/gpu/drm/i915/display/intel_display.h |  4 +++
 4 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index fbc8a4f2b9cb..cb1d69c17830 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -81,6 +81,18 @@ static void intel_cmtg_dump_config(struct intel_display *display,
 		    str_yes_no(cmtg_config->trans_b_secondary));
 }
 
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
 static bool intel_cmtg_transcoder_is_secondary(struct intel_display *display,
 					       enum transcoder trans)
 {
@@ -219,3 +231,19 @@ void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state)
 	if (clk_sel_set)
 		intel_de_rmw(display, CMTG_CLK_SEL, clk_sel_clr, clk_sel_set);
 }
+
+void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, enum set_timing_type type)
+{
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+
+	if (cmtg_transcoder == INVALID_TRANSCODER)
+		return;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	if (type == LRR)
+		intel_set_transcoder_timings_lrr(crtc_state, cmtg_transcoder);
+	else
+		intel_set_transcoder_timings(crtc_state, cmtg_transcoder);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 87092ce6d67b..e3c678019815 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,12 @@
 struct intel_display;
 struct intel_crtc_state;
 
+enum set_timing_type {
+	MODESET = 0,
+	LRR
+};
+
+void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, enum set_timing_type type);
 void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index edb9acb1da5c..8455ad878e66 100644
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
+	intel_cmtg_set_timings(crtc_state, MODESET);
 
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
@@ -6693,6 +6693,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 
 	if (new_crtc_state->update_lrr) {
 		intel_set_transcoder_timings_lrr(new_crtc_state, new_crtc_state->cpu_transcoder);
+		intel_cmtg_set_timings(new_crtc_state, LRR);
 		intel_vrr_set_fixed_rr_timings(new_crtc_state);
 		intel_vrr_transcoder_enable(new_crtc_state);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 98b589e8360d..57ea4f2edf2a 100644
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
2.43.0

