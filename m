Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D6E606A32D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WIH26IS0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055710F4BE;
	Tue,  3 Nov 2026 10:03:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEAC10F4BB;
 Tue,  3 Nov 2026 10:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793700229; x=1825236229;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gU55s/7e03Hub07VEY+BIh9NS9RF6T67ptNEu5sP2Lg=;
 b=WIH26IS0X8V7w1aA4pqM6DOURQ0ovwRF5zMFu4cpssKUtY4NC+rte2oV
 mrdPJdf98+KxLLjUTYnpTa+giiG9pFsHOw2z6IDLeHdv63Ejh0pZ20jwY
 1kwRaA4ceGkhzsDcA8gELXcBPSWYpbqmb9DoI192mbkTVLJsQ18ogc3Tx
 ZhNPBwtzOYBacFmXVgocTG6ta0TSuUDClMIGgr1hJE0WJCVNNZP7c7YTD
 Ojm5WkEs9wcmKbVUyYT7TQO4xtuRP7pWtwOpdgRPLCFZK8b0iZoCF96OK
 rPbba0saEXzMO6gV5UUQ9vWd7O3oifqyy1sJzug8aCwl9Pt+n1AnONMZP A==;
X-CSE-ConnectionGUID: LXYBw2lLSDaXVPQhHk7DLw==
X-CSE-MsgGUID: 2Hq7FW1JSsCwbUdrpp30jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2296979"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2296979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 02:03:49 -0800
X-CSE-ConnectionGUID: Fqo2unQSQpG1QTmkw+i7wg==
X-CSE-MsgGUID: c83iKzVKTOGi74JhFjQHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6718611"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2026 02:03:46 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 03 Nov 2026 15:28:20 +0530
Subject: [PATCH v4 5/7] drm/i915/dp: Compute the DP symbol based timing
 generator parameters
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vlk-64036-dp-symbol-tg-v4-5-6cf8a588b54c@intel.com>
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

v3: Move crtc parameters, checker and dump to new patch (Suraj)
v4: dpcd caps bases ssc capability => intel_panel_use_ssc (Suraj)
    Use gcd() from linux/gcd.h

Bspec: 68922
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 171 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h     |   3 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c |   6 +
 3 files changed, 180 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index db7c8fcc8683aae1a2bc7050ef7c87ed5155c8dc..788c16df9801131294c73420c2c0d4d3ec848310 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -26,6 +26,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/gcd.h>
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
 #include <linux/log2.h>
@@ -1269,6 +1270,12 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 	return true;
 }
 
+/* The symbol based timing generator is used for 8b/10b MST and 128b/132b SST/MST */
+static bool intel_dp_has_symbol_tg(struct intel_display *display, bool is_mst, bool is_uhbr)
+{
+	return HAS_DP_SYMBOL_TG(display) && (is_mst || is_uhbr);
+}
+
 static int
 intel_dp_get_max_m_n_ratio(struct intel_display *display)
 {
@@ -3734,6 +3741,165 @@ int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 	return 0;
 }
 
+/* Number of symbols the transcoder link layer processes in a symbol cycle */
+#define LL_SYMBOLS_PER_CYCLE	4
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
+	u32 rate_gcd, ssc_gcd;
+	u64 data_m[2], data_n[2];
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
+	ret = intel_dp_compute_dsc_slices_and_link_bpp(crtc_state, connector,
+						       &dsc_slices, &link_bpp_x16);
+	if (ret)
+		return ret;
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
+	 *
+	 * SSC is used only if both the panel/VBT policy and the sink allow it,
+	 * same as for the PHY PLL programming.
+	 */
+	ssc_den = 100000;
+	spread_x1000 = intel_panel_use_ssc(display) &&
+		       intel_dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5 ? 500 : 0;
+	ssc_num = ssc_den - DIV_ROUND_CLOSEST(ssc_den * spread_x1000, 200 * 1000);
+
+	/* The link rate in Mbps, port_clock is in 10 kbps units */
+	link_rate_mbps = crtc_state->port_clock / 100;
+
+	rate_gcd = gcd(adjusted_mode->crtc_clock, link_rate_mbps);
+	ssc_gcd = gcd(ssc_num, ssc_den);
+
+	intel_dp_mul_u64_u64((u64)(adjusted_mode->crtc_clock / rate_gcd) *
+			     LL_SYMBOLS_PER_CYCLE * symbol_size * ch_den,
+			     (u64)(hactive_cycles + hblank_cycles) * (ssc_den / ssc_gcd),
+			     data_m);
+	intel_dp_mul_u64_u64((u64)(link_rate_mbps / rate_gcd) * crtc_state->lane_count *
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
@@ -3834,6 +4000,11 @@ intel_dp_compute_config(struct intel_atomic_state *state,
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
index 1e6190689e6b2616ed850d61c5bfbf60a62c5422..81ac454603603df42db477ddb26cfb2f620dcfea 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -732,6 +732,12 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 	if (ret)
 		return ret;
 
+	/* Clears min_hblank if the symbol based timing generator gets enabled */
+	ret = intel_dp_compute_symbol_tg(connector->mst.dp,
+					 pipe_config, conn_state);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.25.1

