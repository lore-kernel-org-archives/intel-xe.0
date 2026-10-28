Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F2606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iWZdTZcP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C0110F9BA;
	Wed, 28 Oct 2026 04:53:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6B610F9AC;
 Wed, 28 Oct 2026 04:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793163227; x=1824699227;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CPW3dfaNcgYPR/tR+FPkJcAUoCG6gveSIqY3DEBqoHw=;
 b=iWZdTZcPYfuwSDUx3gFSDwaWuYYVMvd6l+qGqVIXkJueLxpj3h6CEEsZ
 ags2aYKUhqqgbl/2qp986i+HfqL2slYchqoQSbXRb6PeiP+EBmVBsMeqy
 b95NMpQ+cSfuklqX1aG3f+DO5Zy7Di7Uk69AyPnFwbPD+xXW3RlLO6SqY
 pAgOkP3gOISj0eOvuZPIgRMYP/iXu/bnvZwI8lsQjy1HbC4rmBwIcVWBT
 vxNSLPwTUcZi09UW0TF7iXA/FXB92drzdATWsFmbjmTl7KX97UsW16cta
 QUpnutIqj0HeJTGX2PISgen1a3XRBSPaJuHNivjColgxNWrFJ93l/GgNv Q==;
X-CSE-ConnectionGUID: ++mEuP+DST2oOmNObI/Y/w==
X-CSE-MsgGUID: l8M1C96LQS65NYCq0nOvFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1757350"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1757350"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 21:53:47 -0700
X-CSE-ConnectionGUID: v8+GtpTLRemG1J0RgxJvKQ==
X-CSE-MsgGUID: usOGH4kiQvy7Y5O00Zbzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4638320"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa007.jf.intel.com with ESMTP; 27 Oct 2026 21:53:44 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 28 Oct 2026 10:18:16 +0530
Subject: [PATCH v2 6/6] drm/i915/dp: Don't limit the Link M/N ratio with
 the symbol timing generator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-vlk-64036-dp-symbol-tg-v2-6-43849c325d32@intel.com>
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

The limit on the Link M/N ratio only applies to the pixel based timing
generator, there is no such restriction when the symbol based timing
generator is used.

If the symbol based timing generator can't be used after compute
(timings out of range, M/N overflow, MSO/eDP splitter), fall back
to the pixel based one and check the ratio limit for that, failing
the modeset if it isn't met.

Bspec: 68922
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 77 ++++++++++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp.h     |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 3 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f08f0e7859a072d07b17afbfdc3462f749ef3bea..facaec0e5e218682051e3d8783e55982c22cd5d3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1297,15 +1297,25 @@ intel_dp_can_bypass_m_n_limit(struct intel_display *display, int link_rate,
 		intel_display_can_bypass_m_n_limit(display, m_n_ratio, cpu_transcoder);
 }
 
+/* The symbol based timing generator is used for 8b/10b MST and 128b/132b SST/MST */
+static bool intel_dp_has_symbol_tg(struct intel_display *display, bool is_mst, bool is_uhbr)
+{
+	return HAS_DP_SYMBOL_TG(display) && (is_mst || is_uhbr);
+}
+
 bool intel_dp_can_support_m_n(struct intel_display *display,
 			      const struct intel_crtc_state *crtc_state,
-			      int pixel_clock, int link_rate)
+			      bool is_mst, int pixel_clock, int link_rate)
 {
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
 	enum transcoder cpu_transcoder = TRANSCODER_A;
 	u32 link_m, link_n;
 	int m_n_ratio;
 
+	/* The Link M/N ratio isn't limited with the symbol based timing generator */
+	if (intel_dp_has_symbol_tg(display, is_mst, drm_dp_is_uhbr_rate(link_rate)))
+		return true;
+
 	intel_display_compute_link_m_n(&link_m, &link_n, pixel_clock,
 				       intel_dp_link_symbol_clock(link_rate));
 
@@ -1320,8 +1330,9 @@ bool intel_dp_can_support_m_n(struct intel_display *display,
 	return intel_dp_can_bypass_m_n_limit(display, link_rate, m_n_ratio, cpu_transcoder);
 }
 
-void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
-			      struct intel_link_m_n *m_n)
+/* Returns whether the Link M/N ratio is within the limit, or the limit can be bypassed */
+static bool __intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
+				       struct intel_link_m_n *m_n)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
@@ -1332,7 +1343,7 @@ void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
 	m_n_ratio = intel_dp_link_m_n_ratio(m_n->link_m, m_n->link_n);
 
 	if (m_n_ratio <= max_m_n_ratio)
-		return;
+		return true;
 
 	if (intel_dp_can_bypass_m_n_limit(display, crtc_state->port_clock, m_n_ratio,
 					  crtc_state->cpu_transcoder)) {
@@ -1340,12 +1351,34 @@ void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
 		drm_dbg_kms(display->drm,
 			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
 			    m_n_ratio);
-		return;
+		return true;
 	}
 
 	drm_dbg_kms(display->drm,
 		    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
 		    m_n_ratio, max_m_n_ratio);
+
+	return false;
+}
+
+void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
+			      struct intel_link_m_n *m_n)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	/*
+	 * The Link M/N ratio isn't limited with the symbol based timing
+	 * generator. If that can't be used after all, intel_dp_compute_symbol_tg()
+	 * checks the ratio for the pixel based one.
+	 */
+	if (intel_dp_has_symbol_tg(display,
+				   intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST),
+				   intel_dp_is_uhbr(crtc_state))) {
+		m_n->bypass_m_n_ratio_limit = false;
+		return;
+	}
+
+	__intel_dp_check_m_n_ratio(crtc_state, m_n);
 }
 
 static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel_clock)
@@ -1406,7 +1439,7 @@ static bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
 	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
 				      INTEL_DP_LINK_CAPS_FILTER_ALL);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (intel_dp_can_support_m_n(display, NULL, m_n_pixel_clock,
+		if (intel_dp_can_support_m_n(display, NULL, false, m_n_pixel_clock,
 					     link_config.rate)) {
 			found = true;
 
@@ -2795,8 +2828,10 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 
 	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_config_filter);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (!intel_dp_can_support_m_n(display, crtc_state, pixel_clock,
-					      link_config.rate))
+		if (!intel_dp_can_support_m_n(display, crtc_state,
+					      intel_crtc_has_type(crtc_state,
+								  INTEL_OUTPUT_DP_MST),
+					      pixel_clock, link_config.rate))
 			continue;
 
 		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
@@ -3734,12 +3769,6 @@ int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 	return 0;
 }
 
-/* The symbol based timing generator is used for 8b/10b MST and 128b/132b SST/MST */
-static bool intel_dp_has_symbol_tg(struct intel_display *display, bool is_mst, bool is_uhbr)
-{
-	return HAS_DP_SYMBOL_TG(display) && (is_mst || is_uhbr);
-}
-
 /* Number of symbols the transcoder link layer processes in a symbol cycle */
 #define LL_SYMBOLS_PER_CYCLE	4
 
@@ -3776,6 +3805,18 @@ static int intel_dp_cmp_u128(const u64 a[2], const u64 b[2])
 	return 0;
 }
 
+/*
+ * The symbol based timing generator can't be used after all, fall back to the
+ * pixel based one, which has a limit for the Link M/N ratio.
+ */
+static int intel_dp_symbol_tg_fallback(struct intel_crtc_state *crtc_state)
+{
+	if (!__intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n))
+		return -EINVAL;
+
+	return 0;
+}
+
 /* Compute the DP link layer (LL) symbol based timing generator parameters */
 int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state,
@@ -3805,7 +3846,7 @@ int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
 
 	/* TODO: Support the symbol based timing generator with MSO/eDP splitter */
 	if (crtc_state->splitter.enable)
-		return 0;
+		return intel_dp_symbol_tg_fallback(crtc_state);
 
 	ret = intel_dp_get_dsc_slices_and_link_bpp(crtc_state, connector,
 						   &dsc_slices, &link_bpp_x16);
@@ -3816,7 +3857,7 @@ int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
 		dsc_slices = intel_dsc_line_slice_count(&crtc_state->dsc.slice_config);
 
 	if (crtc_state->dsc.compression_enable && !dsc_slices)
-		return 0;
+		return intel_dp_symbol_tg_fallback(crtc_state);
 
 	if (crtc_state->dsc.compression_enable) {
 		int slice_width = DIV_ROUND_UP(adjusted_mode->hdisplay, dsc_slices);
@@ -3851,7 +3892,7 @@ int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
 		drm_dbg_kms(display->drm,
 			    "LL symbol timings out of range (hactive %d, hblank %d, chunk %d), using pixel TG\n",
 			    hactive_cycles, hblank_cycles, chunk_cycles);
-		return 0;
+		return intel_dp_symbol_tg_fallback(crtc_state);
 	}
 
 	if (is_uhbr) {
@@ -3896,7 +3937,7 @@ int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
 	if (intel_dp_cmp_u128(data_m, data_n) > 0) {
 		drm_dbg_kms(display->drm,
 			    "LL symbol data M/N ratio exceeds 1.0, using pixel TG\n");
-		return 0;
+		return intel_dp_symbol_tg_fallback(crtc_state);
 	}
 
 	tg->enable = true;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 352c656299e3b2d81e0612a71da6247d02b5aa17..9ba53dd30f59571fc20bdb983afe9aefccd8cf0d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -245,7 +245,7 @@ u8 intel_dp_as_sdp_transmission_time(void);
 
 bool intel_dp_can_support_m_n(struct intel_display *display,
 			      const struct intel_crtc_state *crtc_state,
-			      int pixel_clock, int link_rate);
+			      bool is_mst, int pixel_clock, int link_rate);
 
 int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 215927d8f277308b39578c8433e940a44ed96658..da84dac64a64141f6bf95e17f093a475befcc8a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1570,7 +1570,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
-	if (!intel_dp_can_support_m_n(display, NULL, mode->clock, max_link_clock)) {
+	if (!intel_dp_can_support_m_n(display, NULL, true, mode->clock, max_link_clock)) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}

-- 
2.25.1

