Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C5606A32D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nRvLBqm4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43A210F4BF;
	Tue,  3 Nov 2026 10:03:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B06910F4BF;
 Tue,  3 Nov 2026 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793700232; x=1825236232;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=BLWDUPJptH5W6KNlO9eKLC52oE0zc/1dM5HreZbLjLE=;
 b=nRvLBqm4uQbRwvFVm0qMQlNYC+Vo8dPPAVBoQQANP5KzNsP7RNwUNJFC
 EypdHN5otg4b6dr17ALWkZdWkRFVDLOZng+pNDuWx95jGa74ue2CH7Z7G
 4Odxav0jj5FMw5T+ipXoQk0gI9CD4PbZ/wrKVvn8uupSCO1KljhzvzQ4+
 d6qzdOMUJVvR12Ys2J2hvcOFcMefuhNKTTF0WftCKSlHOP3sYxnYMrbpu
 jQlgY8nzuGW0i4Wzabkn7xk/iOljrE/GRskGrHnsr0eOj1vy84OFW7K+4
 A04yq32ac1uYJo7/Lc/lA0mmepkCR3yof/Z0HAas0HDim2yFl/ru30S93 w==;
X-CSE-ConnectionGUID: kdeqJQiaRpeyGIysveBa9w==
X-CSE-MsgGUID: IHO/XAuJRmuv0cZHt9/C4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2296982"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2296982"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 02:03:52 -0800
X-CSE-ConnectionGUID: NvmAWFcsQ021sC+7Sj2aaw==
X-CSE-MsgGUID: rmDo7KIsRJyPNycEJRPXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6718618"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2026 02:03:49 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 03 Nov 2026 15:28:21 +0530
Subject: [PATCH v4 6/7] drm/i915/display: Program and enable the DP symbol
 based timing generator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vlk-64036-dp-symbol-tg-v4-6-6cf8a588b54c@intel.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
In-Reply-To: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
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

v3: Remove redundant HAS_DP_SYMBOL_TG (Jani)
    Use intel_de_read64_2x32()

Bspec: 68849, 68922, 69961
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c     |   2 +
 drivers/gpu/drm/i915/display/intel_display.c | 101 ++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.h |   1 +
 3 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a46ab5d3d70fc75c6975f46e14d1b0c24dc1ba5e..c814e0740aa064f56d844e304c0a93d1047475c6 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4083,6 +4083,7 @@ static void intel_ddi_read_func_ctl_dp_sst(struct intel_encoder *encoder,
 			REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, ddi_func_ctl);
 
 	intel_cpu_transcoder_get_m1_n1(crtc, cpu_transcoder, &crtc_state->dp_m_n);
+	intel_cpu_transcoder_get_llsym_m_n(crtc_state);
 	intel_cpu_transcoder_get_m2_n2(crtc, cpu_transcoder, &crtc_state->dp_m2_n2);
 
 	crtc_state->enhanced_framing =
@@ -4119,6 +4120,7 @@ static void intel_ddi_read_func_ctl_dp_mst(struct intel_encoder *encoder,
 			REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, ddi_func_ctl);
 
 	intel_cpu_transcoder_get_m1_n1(crtc, cpu_transcoder, &crtc_state->dp_m_n);
+	intel_cpu_transcoder_get_llsym_m_n(crtc_state);
 
 	if (DISPLAY_VER(display) >= 11)
 		crtc_state->fec_enable =
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7caf5bee8718729667376b487b0584b47891f05a..71a2f96b5e8f8474fd9ef24ac1c1ac89bcdeff0a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -521,9 +521,14 @@ void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 		return;
 	}
 
-	/* Wa_1409098942:adlp+ */
-	if (DISPLAY_VER(display) >= 13 &&
-	    new_crtc_state->dsc.compression_enable) {
+	/* The early pixel count is in symbols with the DP symbol TG, no scaling */
+	if (new_crtc_state->dp_symbol_tg.enable) {
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
+	if (old_crtc_state->dp_symbol_tg.enable) {
+		intel_de_rmw(display, TRANSCONF(display, cpu_transcoder),
+			     TRANSCONF_DP_SYMBOL_TG_ENABLE, 0);
+		intel_de_write(display, TRANS_LLSYM_HACT(display, cpu_transcoder), 0);
+		intel_de_write(display, TRANS_LLSYM_HTOTAL(display, cpu_transcoder), 0);
+	}
 }
 
 u32 intel_plane_fb_max_stride(struct intel_display *display,
@@ -1683,6 +1696,52 @@ static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
 		     HSW_FRAME_START_DELAY(crtc_state->framestart_delay - 1));
 }
 
+static void intel_cpu_transcoder_set_llsym_m_n(const struct intel_crtc_state *crtc_state)
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
+	intel_de_write(display, DP_LLSYM_DATAM(display, transcoder, 0),
+		       lower_32_bits(tg->data_m[0]));
+	intel_de_write(display, DP_LLSYM_DATAM(display, transcoder, 1),
+		       upper_32_bits(tg->data_m[0]));
+	intel_de_write(display, DP_LLSYM_DATAM_EXT(display, transcoder, 0),
+		       lower_32_bits(tg->data_m[1]));
+	intel_de_write(display, DP_LLSYM_DATAM_EXT(display, transcoder, 1),
+		       upper_32_bits(tg->data_m[1]));
+	intel_de_write(display, DP_LLSYM_DATAN(display, transcoder, 0),
+		       lower_32_bits(tg->data_n[0]));
+	intel_de_write(display, DP_LLSYM_DATAN(display, transcoder, 1),
+		       upper_32_bits(tg->data_n[0]));
+	intel_de_write(display, DP_LLSYM_DATAN_EXT(display, transcoder, 0),
+		       lower_32_bits(tg->data_n[1]));
+	intel_de_write(display, DP_LLSYM_DATAN_EXT(display, transcoder, 1),
+		       upper_32_bits(tg->data_n[1]));
+}
+
+void intel_cpu_transcoder_get_llsym_m_n(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder transcoder = crtc_state->cpu_transcoder;
+	struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
+
+	if (!tg->enable)
+		return;
+
+	tg->data_m[0] = intel_de_read64_2x32(display, DP_LLSYM_DATAM(display, transcoder, 0));
+	tg->data_m[1] = intel_de_read64_2x32(display, DP_LLSYM_DATAM_EXT(display, transcoder, 0));
+	tg->data_n[0] = intel_de_read64_2x32(display, DP_LLSYM_DATAN(display, transcoder, 0));
+	tg->data_n[1] = intel_de_read64_2x32(display, DP_LLSYM_DATAN_EXT(display, transcoder, 0));
+}
+
 static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -1693,6 +1752,7 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
 		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
 					       &crtc_state->fdi_m_n);
 	} else if (intel_crtc_has_dp_encoder(crtc_state)) {
+		intel_cpu_transcoder_set_llsym_m_n(crtc_state);
 		intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
 					       &crtc_state->dp_m_n);
 		intel_cpu_transcoder_set_m2_n2(crtc, cpu_transcoder,
@@ -2929,6 +2989,17 @@ void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
 		intel_de_write(display, DP_MIN_HBLANK_CTL(transcoder),
 			       crtc_state->min_hblank);
 	}
+
+	if (crtc_state->dp_symbol_tg.enable) {
+		const struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
+
+		intel_de_write(display, TRANS_LLSYM_HACT(display, transcoder),
+			       TRANS_LLSYM_HACT_VAL(tg->hactive - 1));
+		intel_de_write(display, TRANS_LLSYM_HTOTAL(display, transcoder),
+			       TRANS_LLSYM_HTOTAL_VAL(tg->htotal - 1));
+		intel_de_write(display, TRANS_LLSYM_CHUNK_SIZE(display, transcoder),
+			       TRANS_LLSYM_CHUNK_SIZE_VAL(tg->chunk_size));
+	}
 }
 
 void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
@@ -3095,6 +3166,26 @@ static void intel_get_transcoder_timings(struct intel_crtc *crtc,
 	if (DISPLAY_VER(display) >= 30)
 		pipe_config->min_hblank = intel_de_read(display,
 							DP_MIN_HBLANK_CTL(cpu_transcoder));
+
+	if (HAS_DP_SYMBOL_TG(display)) {
+		tmp = intel_de_read(display, TRANSCONF(display, cpu_transcoder));
+
+		if (tmp & TRANSCONF_DP_SYMBOL_TG_ENABLE) {
+			struct intel_dp_symbol_tg *tg = &pipe_config->dp_symbol_tg;
+			u32 hact, htotal, chunk_size;
+
+			hact = intel_de_read(display, TRANS_LLSYM_HACT(display, cpu_transcoder));
+			htotal = intel_de_read(display,
+					       TRANS_LLSYM_HTOTAL(display, cpu_transcoder));
+			chunk_size = intel_de_read(display,
+						   TRANS_LLSYM_CHUNK_SIZE(display, cpu_transcoder));
+
+			tg->enable = true;
+			tg->hactive = REG_FIELD_GET(TRANS_LLSYM_HACT_MASK, hact) + 1;
+			tg->htotal = REG_FIELD_GET(TRANS_LLSYM_HTOTAL_MASK, htotal) + 1;
+			tg->chunk_size = REG_FIELD_GET(TRANS_LLSYM_CHUNK_SIZE_MASK, chunk_size);
+		}
+	}
 }
 
 static void intel_joiner_adjust_pipe_src(struct intel_crtc_state *crtc_state)
@@ -3419,6 +3510,10 @@ static void hsw_set_transconf(const struct intel_crtc_state *crtc_state)
 	    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB)
 		val |= TRANSCONF_OUTPUT_COLORSPACE_YUV_HSW;
 
+	/* Must be set before the transcoder is enabled, so only on modeset */
+	if (crtc_state->dp_symbol_tg.enable)
+		val |= TRANSCONF_DP_SYMBOL_TG_ENABLE;
+
 	intel_de_write(display, TRANSCONF(display, cpu_transcoder), val);
 	intel_de_posting_read(display, TRANSCONF(display, cpu_transcoder));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index d53b7b4a80e75f8cb3a76d923d05648ffe505e2d..fa9ae8799a1999d9dd6a1f4e4d56983b6536ba26 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -446,6 +446,7 @@ void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    enum transcoder cpu_transcoder,
 				    struct intel_link_m_n *m_n);
 int intel_dotclock_calculate(int link_freq, const struct intel_link_m_n *m_n);
+void intel_cpu_transcoder_get_llsym_m_n(struct intel_crtc_state *crtc_state);
 int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config);
 int intel_max_uncompressed_dotclock(struct intel_display *display);
 enum intel_display_power_domain intel_port_to_power_domain(struct intel_digital_port *dig_port);

-- 
2.25.1

