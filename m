Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA6606A31D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 04:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+/O4Xam
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E1B10F9B3;
	Wed, 28 Oct 2026 04:53:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7D910E51C;
 Wed, 28 Oct 2026 04:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793163222; x=1824699222;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=rdwi19aPM3FDK5z1BSESdZJkyZdtcjErdED1N7t7zys=;
 b=Q+/O4XamRTk0ZZlHnucGrMG3KhK9gKrgBV3Hzw9S155WDHRFkZtEkHus
 X7dr+eVv9FdvkLso6z+A1jxPUnpbhu+DqR0iNOi9K2dw3LfVuYfQHXwD3
 mOfQ7wes/Z1XI/igt5GMFgOFBDLuinUyvqUmfJLEPvMJ0tl16rItLM9Hc
 pl2PJMIQO5Sdo9QAaOWh0O6M0Igxxtyw8Qg6vjHrnwE1nMZWJ414V5OcC
 VbYrjxLU4b3BzwpFRagZf2P99C1nTqBbx6Y0CnFVXTAwtkjSz7QDENLtO
 WwPi80okXDWBW4Gr4pM0zs8whn9fMORxNLmL39ZgpdMdiGRw8Rq64YRU7 A==;
X-CSE-ConnectionGUID: 3QRmsg4TSo6hu1HDzU74tQ==
X-CSE-MsgGUID: Kc8272o/QSuTyhbQhHzgrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1757340"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1757340"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 21:53:42 -0700
X-CSE-ConnectionGUID: hL0m1tpNT+aXjQS8HhM5PQ==
X-CSE-MsgGUID: +Cb172tFTemtV0CEo6hRdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4638298"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 27 Oct 2026 21:53:40 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 28 Oct 2026 10:18:14 +0530
Subject: [PATCH v2 4/6] drm/i915/dp: Compute the DP symbol based timing
 generator parameters
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-vlk-64036-dp-symbol-tg-v2-4-43849c325d32@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xe3p has a DP link layer (LL) symbol based timing generator, which
makes the per-line symbol insertion for 8b/10b MST and 128b/132b
SST/MST compliant with the DP 2.1 hblank symbol cycle count, reducing
the line-to-line hblank jitter that some sinks can't handle.

The Data M/N registers are 128 bits wide, so the Data M/N is computed as
128 bit values, without reducing them apart from the GCDs of the pixel
clock/link rate and of the SSC efficiency, to keep the full precision.

The timing generator is not used (yet) with the MSO/eDP splitter, and if
the values don't fit the hardware the pixel based timing generator is
kept. The Min Hblank mechanism must not be used together with the symbol
timing generator, so clear min_hblank when it is used.

Bspec: 68922
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  11 ++
 drivers/gpu/drm/i915/display/intel_display_types.h |  13 ++
 drivers/gpu/drm/i915/display/intel_dp.c            | 185 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h            |   3 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   6 +
 5 files changed, 218 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index c51b21222dc6e7c0e6621b903fa0c04cb7508b60..2e10c9a5bba63b026d1ce02e4e1580fb5aeecb02 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -262,6 +262,17 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   pipe_config->dip.pps_sdp_tl,
 			   pipe_config->dip.vsc_sdp_tl,
 			   pipe_config->dip.vsc_ext_sdp_tl);
+
+		drm_printf(&p,
+			   "dp symbol tg: %s, hactive: %d, htotal: %d, chunk size: %d, data m: 0x%016llx%016llx, data n: 0x%016llx%016llx\n",
+			   str_enabled_disabled(pipe_config->dp_symbol_tg.enable),
+			   pipe_config->dp_symbol_tg.hactive,
+			   pipe_config->dp_symbol_tg.htotal,
+			   pipe_config->dp_symbol_tg.chunk_size,
+			   pipe_config->dp_symbol_tg.data_m[1],
+			   pipe_config->dp_symbol_tg.data_m[0],
+			   pipe_config->dp_symbol_tg.data_n[1],
+			   pipe_config->dp_symbol_tg.data_n[0]);
 	}
 
 	drm_printf(&p, "audio: %i, infoframes: %i, infoframes enabled: 0x%x\n",
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d0748837ce97ce6291b36adeb0014686f7d699f9..73fc6125a84a07a002cb7202d807833c75da130c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1196,6 +1196,19 @@ struct intel_crtc_state {
 	int max_pipe_bpp;	/* in 1 bpp units */
 	int pipe_bpp;		/* in 1 bpp units */
 	int min_hblank;
+
+	/* DP link layer (LL) symbol based timing generator, 8b/10b MST and 128b/132b SST/MST */
+	struct intel_dp_symbol_tg {
+		bool enable;
+		/* in LL symbol cycles, as opposed to the zero based register values */
+		u16 hactive;
+		u16 htotal;
+		u16 chunk_size;
+		/* 128 bit Data M/N as {low 64 bits, high 64 bits} */
+		u64 data_m[2];
+		u64 data_n[2];
+	} dp_symbol_tg;
+
 	struct intel_link_m_n dp_m_n;
 
 	/* m2_n2 for eDP downclock */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3827737c0d808229413ef969082d59249a6b96b2..f08f0e7859a072d07b17afbfdc3462f749ef3bea 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3734,6 +3734,186 @@ int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 	return 0;
 }
 
+/* The symbol based timing generator is used for 8b/10b MST and 128b/132b SST/MST */
+static bool intel_dp_has_symbol_tg(struct intel_display *display, bool is_mst, bool is_uhbr)
+{
+	return HAS_DP_SYMBOL_TG(display) && (is_mst || is_uhbr);
+}
+
+/* Number of symbols the transcoder link layer processes in a symbol cycle */
+#define LL_SYMBOLS_PER_CYCLE	4
+
+static u64 intel_dp_gcd_u64(u64 a, u64 b)
+{
+	while (b) {
+		u64 t;
+
+		div64_u64_rem(a, b, &t);
+
+		a = b;
+		b = t;
+	}
+
+	return a;
+}
+
+/* 64 x 64 -> 128 bit multiplication, result as {lo, hi} */
+static void intel_dp_mul_u64_u64(u64 a, u64 b, u64 res[2])
+{
+	res[0] = a * b;
+	res[1] = mul_u64_u64_shr(a, b, 64);
+}
+
+/* Compare two {lo, hi} 128 bit values */
+static int intel_dp_cmp_u128(const u64 a[2], const u64 b[2])
+{
+	if (a[1] != b[1])
+		return a[1] > b[1] ? 1 : -1;
+
+	if (a[0] != b[0])
+		return a[0] > b[0] ? 1 : -1;
+
+	return 0;
+}
+
+/* Compute the DP link layer (LL) symbol based timing generator parameters */
+int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
+			       struct intel_crtc_state *crtc_state,
+			       const struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	const struct drm_display_mode *adjusted_mode =
+					&crtc_state->hw.adjusted_mode;
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
+	bool is_uhbr = intel_dp_is_uhbr(crtc_state);
+	int symbol_size = is_uhbr ? 32 : 8;
+	int hactive_cycles, hblank_cycles, chunk_cycles = 0;
+	int hblank_pixels;
+	int dsc_slices, link_bpp_x16;
+	u32 ch_num, ch_den, ssc_num, ssc_den, spread_x1000, link_rate_mbps;
+	u64 gcd, ssc_gcd, data_m[2], data_n[2];
+	int ret;
+
+	memset(tg, 0, sizeof(*tg));
+
+	/* The symbol based timing generator is used for 8b/10b MST and 128b/132b SST/MST */
+	if (!intel_dp_has_symbol_tg(display,
+				    intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST),
+				    is_uhbr))
+		return 0;
+
+	/* TODO: Support the symbol based timing generator with MSO/eDP splitter */
+	if (crtc_state->splitter.enable)
+		return 0;
+
+	ret = intel_dp_get_dsc_slices_and_link_bpp(crtc_state, connector,
+						   &dsc_slices, &link_bpp_x16);
+	if (ret)
+		return ret;
+
+	if (crtc_state->dsc.compression_enable)
+		dsc_slices = intel_dsc_line_slice_count(&crtc_state->dsc.slice_config);
+
+	if (crtc_state->dsc.compression_enable && !dsc_slices)
+		return 0;
+
+	if (crtc_state->dsc.compression_enable) {
+		int slice_width = DIV_ROUND_UP(adjusted_mode->hdisplay, dsc_slices);
+		int chunk_bytes = DIV_ROUND_UP(slice_width * link_bpp_x16, 16 * 8);
+
+		chunk_cycles = DIV_ROUND_UP(chunk_bytes * 8,
+					    LL_SYMBOLS_PER_CYCLE * symbol_size);
+		hactive_cycles = dsc_slices * (chunk_cycles + 1);
+	} else {
+		int hact_width = adjusted_mode->hdisplay;
+		int pix_bpp_x16 = link_bpp_x16;
+
+		/* YUV 4:2:0 without DSC: half the Hactive at twice the bpp */
+		if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+			hact_width /= 2;
+			pix_bpp_x16 *= 2;
+		}
+
+		hactive_cycles = DIV_ROUND_UP(DIV_ROUND_UP(hact_width, LL_SYMBOLS_PER_CYCLE) *
+					      pix_bpp_x16, 16 * symbol_size);
+	}
+
+	hblank_pixels = adjusted_mode->htotal - adjusted_mode->hdisplay;
+	hblank_cycles = DIV_ROUND_UP(DIV_ROUND_UP(hblank_pixels, LL_SYMBOLS_PER_CYCLE) *
+				     link_bpp_x16, 16 * symbol_size);
+
+	/* DP 2.1: the minimum Hblank is 5 LL symbol cycles for 8b/10b, 3 for 128b/132b */
+	hblank_cycles = max(hblank_cycles, is_uhbr ? 3 : 5);
+
+	if (hactive_cycles + hblank_cycles > TRANS_LLSYM_HTOTAL_MASK + 1 ||
+	    chunk_cycles > TRANS_LLSYM_CHUNK_SIZE_MASK) {
+		drm_dbg_kms(display->drm,
+			    "LL symbol timings out of range (hactive %d, hblank %d, chunk %d), using pixel TG\n",
+			    hactive_cycles, hblank_cycles, chunk_cycles);
+		return 0;
+	}
+
+	if (is_uhbr) {
+		ch_num = 1568768;
+		ch_den = 1622115;
+	} else if (crtc_state->fec_enable) {
+		ch_num = 51200;
+		ch_den = 65537;
+	} else {
+		ch_num = 8;
+		ch_den = 10;
+	}
+
+	/*
+	 * spread_x1000 is the spread in % multiplied by 1000, so 500 means 0.5%.
+	 * ssc_den * spread_x1000 / (200 * 1000) is ssc_den * (Spread_Amount / 200).
+	 *
+	 * With 0.5% spread: 100000 * 500 / 200000 = 250, so ssc_num = 99750.
+	 * The efficiency is 99750 / 100000 = 0.9975, which equals 1 - 0.5 / 200.
+	 * With no SSC the spread is 0, so ssc_num = ssc_den and the efficiency
+	 * is 1.
+	 */
+	ssc_den = 100000;
+	spread_x1000 = intel_dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5 ? 500 : 0;
+	ssc_num = ssc_den - DIV_ROUND_CLOSEST(ssc_den * spread_x1000, 200 * 1000);
+
+	/* The link rate in Mbps, port_clock is in 10 kbps units */
+	link_rate_mbps = crtc_state->port_clock / 100;
+
+	gcd = intel_dp_gcd_u64(adjusted_mode->crtc_clock, link_rate_mbps);
+	ssc_gcd = intel_dp_gcd_u64(ssc_num, ssc_den);
+
+	intel_dp_mul_u64_u64((u64)(adjusted_mode->crtc_clock / gcd) *
+			     LL_SYMBOLS_PER_CYCLE * symbol_size * ch_den,
+			     (u64)(hactive_cycles + hblank_cycles) * (ssc_den / ssc_gcd),
+			     data_m);
+	intel_dp_mul_u64_u64((u64)(link_rate_mbps / gcd) * crtc_state->lane_count *
+			     adjusted_mode->htotal * 1000,
+			     (u64)ch_num * (ssc_num / ssc_gcd),
+			     data_n);
+
+	if (intel_dp_cmp_u128(data_m, data_n) > 0) {
+		drm_dbg_kms(display->drm,
+			    "LL symbol data M/N ratio exceeds 1.0, using pixel TG\n");
+		return 0;
+	}
+
+	tg->enable = true;
+	tg->hactive = hactive_cycles;
+	tg->htotal = hactive_cycles + hblank_cycles;
+	tg->chunk_size = chunk_cycles;
+	tg->data_m[0] = data_m[0];
+	tg->data_m[1] = data_m[1];
+	tg->data_n[0] = data_n[0];
+	tg->data_n[1] = data_n[1];
+
+	/* The Min Hblank mechanism must not be used with the symbol TG */
+	crtc_state->min_hblank = 0;
+
+	return 0;
+}
+
 int
 intel_dp_compute_config(struct intel_atomic_state *state,
 			struct intel_encoder *encoder,
@@ -3834,6 +4014,11 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	/* Clears min_hblank if the symbol based timing generator gets enabled */
+	ret = intel_dp_compute_symbol_tg(intel_dp, pipe_config, conn_state);
+	if (ret)
+		return ret;
+
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1f4a3aff9abebdb2bf8cd17a77231e5af66f47ac..352c656299e3b2d81e0612a71da6247d02b5aa17 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -215,6 +215,9 @@ int intel_dp_dsc_min_src_input_bpc(void);
 int intel_dp_dsc_min_src_compressed_bpp(void);
 int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 				const struct drm_connector_state *conn_state);
+int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
+			       struct intel_crtc_state *crtc_state,
+			       const struct drm_connector_state *conn_state);
 
 int intel_dp_dsc_bpp_step_x16(const struct intel_connector *connector);
 void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool force_on_external);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1e6190689e6b2616ed850d61c5bfbf60a62c5422..215927d8f277308b39578c8433e940a44ed96658 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -732,6 +732,12 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 	if (ret)
 		return ret;
 
+	/* Clears min_hblank if the symbol based timing generator gets enabled */
+	ret = intel_dp_compute_symbol_tg(to_intel_connector(conn_state->connector)->mst.dp,
+					 pipe_config, conn_state);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.25.1

