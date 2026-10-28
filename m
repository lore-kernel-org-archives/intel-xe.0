Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1F606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 04:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h08EQiTA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844710E17E;
	Wed, 28 Oct 2026 04:53:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4EF10E17E;
 Wed, 28 Oct 2026 04:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793163225; x=1824699225;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=He9rv6xCLpk2ypkA9ZM+m/T9L0hRL9FXH6Cl1IF0M98=;
 b=h08EQiTAZWvBiFgmh3hRlj5muzbJ4+fNpm7oX7GkObB5T691UIhfcGPN
 gQtAGteI15ZT0wK6KBayG6Bg86H6ehc8kFa2CwPxOHLZqyP3S72YsJiO7
 9+qweIlSUz9LYY0nH0TJ4cmlspVBJYzWoRAwuzwOdhrR6jzeo0oSjFW3y
 341YhpqPlOq6QapSRbeA0QUUC8jKref2ap53W1Vccf3E6SLWBHC1rcJuM
 Tj7xH/6fFMs0Kp4yywxti2NO8GmW9cJutJcD8DwLgh3/MKo+APsT1D9We
 rux7fP0gVjlLluzpgSCaPx+4Ax6q56TccGO5uYQHUnMIA+OznHCVNZVmL Q==;
X-CSE-ConnectionGUID: irPjtoF2Ql+QNewpJPQrOg==
X-CSE-MsgGUID: YN7G3pGnTIKgObEoKQltgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1757346"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1757346"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 21:53:44 -0700
X-CSE-ConnectionGUID: 3D9oBYRUQbqLx77yj2MMHQ==
X-CSE-MsgGUID: OBCG1rUvT4KlFaHNnxY4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4638310"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 27 Oct 2026 21:53:42 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 28 Oct 2026 10:18:15 +0530
Subject: [PATCH v2 5/6] drm/i915/display: Program and enable the DP symbol
 based timing generator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-vlk-64036-dp-symbol-tg-v2-5-43849c325d32@intel.com>
References: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
In-Reply-To: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, uma.shankar@intel.com, 
 suraj.kandpal@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Program the 128 bit LL symbol Data M/N before the LINK_N write which
arms the double buffered update, the LL symbol HACT/HTOTAL/CHUNK_SIZE
along with the other transcoder timings, and enable the timing
generator via TRANSCONF.DP_Symbol_TG_Enable before the transcoder is
enabled.

Bspec: 68849, 68922, 69961
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 100 ++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index afe70e9ce34739b67e4d87754f9c361ff77f37a6..0698fb2b7b66ef4216d0ae237227713bce3cb7e5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -521,9 +521,14 @@ void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 		return;
 	}
 
-	/* Wa_1409098942:adlp+ */
-	if (DISPLAY_VER(display) >= 13 &&
-	    new_crtc_state->dsc.compression_enable) {
+	/* The early pixel count is in symbols with the DP symbol TG, no scaling */
+	if (HAS_DP_SYMBOL_TG(display) && new_crtc_state->dp_symbol_tg.enable) {
+		val &= ~TRANSCONF_PIXEL_COUNT_SCALING_MASK;
+		val |= REG_FIELD_PREP(TRANSCONF_PIXEL_COUNT_SCALING_MASK,
+				      TRANSCONF_PIXEL_COUNT_SCALING_X1);
+	} else if (DISPLAY_VER(display) >= 13 &&
+		   new_crtc_state->dsc.compression_enable) {
+		/* Wa_1409098942:adlp+ */
 		val &= ~TRANSCONF_PIXEL_COUNT_SCALING_MASK;
 		val |= REG_FIELD_PREP(TRANSCONF_PIXEL_COUNT_SCALING_MASK,
 				      TRANSCONF_PIXEL_COUNT_SCALING_X4);
@@ -588,6 +593,14 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
 
 	if ((val & TRANSCONF_ENABLE) == 0)
 		intel_wait_for_pipe_off(old_crtc_state);
+
+	/* Disable the DP symbol based timing generator */
+	if (HAS_DP_SYMBOL_TG(display) && old_crtc_state->dp_symbol_tg.enable) {
+		intel_de_rmw(display, TRANSCONF(display, cpu_transcoder),
+			     TRANSCONF_DP_SYMBOL_TG_ENABLE, 0);
+		intel_de_write(display, TRANS_LLSYM_HACT(cpu_transcoder), 0);
+		intel_de_write(display, TRANS_LLSYM_HTOTAL(cpu_transcoder), 0);
+	}
 }
 
 u32 intel_plane_fb_max_stride(struct intel_display *display,
@@ -1683,6 +1696,43 @@ static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
 		     HSW_FRAME_START_DELAY(crtc_state->framestart_delay - 1));
 }
 
+static void intel_dp_symbol_tg_set_m_n(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder transcoder = crtc_state->cpu_transcoder;
+	const struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
+
+	if (!tg->enable)
+		return;
+
+	/*
+	 * These are double buffered, updated by the LINK_N write in
+	 * intel_set_m_n(), so must be written before that.
+	 */
+	intel_de_write(display, DP_LLSYM_DATAM(transcoder, 0), lower_32_bits(tg->data_m[0]));
+	intel_de_write(display, DP_LLSYM_DATAM(transcoder, 1), upper_32_bits(tg->data_m[0]));
+	intel_de_write(display, DP_LLSYM_DATAM_EXT(transcoder, 0), lower_32_bits(tg->data_m[1]));
+	intel_de_write(display, DP_LLSYM_DATAM_EXT(transcoder, 1), upper_32_bits(tg->data_m[1]));
+	intel_de_write(display, DP_LLSYM_DATAN(transcoder, 0), lower_32_bits(tg->data_n[0]));
+	intel_de_write(display, DP_LLSYM_DATAN(transcoder, 1), upper_32_bits(tg->data_n[0]));
+	intel_de_write(display, DP_LLSYM_DATAN_EXT(transcoder, 0), lower_32_bits(tg->data_n[1]));
+	intel_de_write(display, DP_LLSYM_DATAN_EXT(transcoder, 1), upper_32_bits(tg->data_n[1]));
+}
+
+static void intel_dp_symbol_tg_get_m_n(struct intel_display *display,
+				       enum transcoder transcoder,
+				       struct intel_dp_symbol_tg *tg)
+{
+	tg->data_m[0] = intel_de_read(display, DP_LLSYM_DATAM(transcoder, 0)) |
+		(u64)intel_de_read(display, DP_LLSYM_DATAM(transcoder, 1)) << 32;
+	tg->data_m[1] = intel_de_read(display, DP_LLSYM_DATAM_EXT(transcoder, 0)) |
+		(u64)intel_de_read(display, DP_LLSYM_DATAM_EXT(transcoder, 1)) << 32;
+	tg->data_n[0] = intel_de_read(display, DP_LLSYM_DATAN(transcoder, 0)) |
+		(u64)intel_de_read(display, DP_LLSYM_DATAN(transcoder, 1)) << 32;
+	tg->data_n[1] = intel_de_read(display, DP_LLSYM_DATAN_EXT(transcoder, 0)) |
+		(u64)intel_de_read(display, DP_LLSYM_DATAN_EXT(transcoder, 1)) << 32;
+}
+
 static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -1693,6 +1743,7 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
 		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
 					       &crtc_state->fdi_m_n);
 	} else if (intel_crtc_has_dp_encoder(crtc_state)) {
+		intel_dp_symbol_tg_set_m_n(crtc_state);
 		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
 					       &crtc_state->dp_m_n);
 		intel_cpu_transcoder_set_m2_n2(crtc, cpu_transcoder,
@@ -2929,6 +2980,17 @@ void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
 		intel_de_write(display, DP_MIN_HBLANK_CTL(transcoder),
 			       crtc_state->min_hblank);
 	}
+
+	if (HAS_DP_SYMBOL_TG(display) && crtc_state->dp_symbol_tg.enable) {
+		const struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
+
+		intel_de_write(display, TRANS_LLSYM_HACT(transcoder),
+			       TRANS_LLSYM_HACT_VAL(tg->hactive - 1));
+		intel_de_write(display, TRANS_LLSYM_HTOTAL(transcoder),
+			       TRANS_LLSYM_HTOTAL_VAL(tg->htotal - 1));
+		intel_de_write(display, TRANS_LLSYM_CHUNK_SIZE(transcoder),
+			       TRANS_LLSYM_CHUNK_SIZE_VAL(tg->chunk_size));
+	}
 }
 
 void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
@@ -3095,6 +3157,23 @@ static void intel_get_transcoder_timings(struct intel_crtc *crtc,
 	if (DISPLAY_VER(display) >= 30)
 		pipe_config->min_hblank = intel_de_read(display,
 							DP_MIN_HBLANK_CTL(cpu_transcoder));
+
+	if (HAS_DP_SYMBOL_TG(display) &&
+	    intel_de_read(display, TRANSCONF(display, cpu_transcoder)) &
+	    TRANSCONF_DP_SYMBOL_TG_ENABLE) {
+		struct intel_dp_symbol_tg *tg = &pipe_config->dp_symbol_tg;
+		u32 hact, htotal, chunk_size;
+
+		hact = intel_de_read(display, TRANS_LLSYM_HACT(cpu_transcoder));
+		htotal = intel_de_read(display, TRANS_LLSYM_HTOTAL(cpu_transcoder));
+		chunk_size = intel_de_read(display, TRANS_LLSYM_CHUNK_SIZE(cpu_transcoder));
+
+		tg->enable = true;
+		tg->hactive = REG_FIELD_GET(TRANS_LLSYM_HACT_MASK, hact) + 1;
+		tg->htotal = REG_FIELD_GET(TRANS_LLSYM_HTOTAL_MASK, htotal) + 1;
+		tg->chunk_size = REG_FIELD_GET(TRANS_LLSYM_CHUNK_SIZE_MASK, chunk_size);
+		intel_dp_symbol_tg_get_m_n(display, cpu_transcoder, tg);
+	}
 }
 
 static void intel_joiner_adjust_pipe_src(struct intel_crtc_state *crtc_state)
@@ -3419,6 +3498,10 @@ static void hsw_set_transconf(const struct intel_crtc_state *crtc_state)
 	    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB)
 		val |= TRANSCONF_OUTPUT_COLORSPACE_YUV_HSW;
 
+	/* Must be set before the transcoder is enabled, so only on modeset */
+	if (HAS_DP_SYMBOL_TG(display) && crtc_state->dp_symbol_tg.enable)
+		val |= TRANSCONF_DP_SYMBOL_TG_ENABLE;
+
 	intel_de_write(display, TRANSCONF(display, cpu_transcoder), val);
 	intel_de_posting_read(display, TRANSCONF(display, cpu_transcoder));
 }
@@ -5515,6 +5598,17 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_I(min_hblank);
 
+	PIPE_CONF_CHECK_BOOL(dp_symbol_tg.enable);
+	if (pipe_config->dp_symbol_tg.enable) {
+		PIPE_CONF_CHECK_I(dp_symbol_tg.hactive);
+		PIPE_CONF_CHECK_I(dp_symbol_tg.htotal);
+		PIPE_CONF_CHECK_I(dp_symbol_tg.chunk_size);
+		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_m[0]);
+		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_m[1]);
+		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_n[0]);
+		PIPE_CONF_CHECK_LLI(dp_symbol_tg.data_n[1]);
+	}
+
 	if (HAS_DOUBLE_BUFFERED_M_N(display)) {
 		if (!fastset || !pipe_config->update_m_n)
 			PIPE_CONF_CHECK_M_N(dp_m_n);

-- 
2.25.1

