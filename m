Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B0A606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+Qe6cV6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54D111201D;
	Thu, 29 Oct 2026 07:55:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBF2112016;
 Thu, 29 Oct 2026 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793260544; x=1824796544;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=muZQ3FSn8OJ4uzyGFUtDqyDk050KNqCxw8d8r2BEov0=;
 b=H+Qe6cV6vTTKBtljOECdrGb0OdHjK5rhcYkWDvlMibj3aDes5yBOgJzQ
 pmv9twBtrY6EQ79pvDt6OjIfrPHH15fvST5N1epgGmJnH4WZbTu14bFjp
 8yT3WMMbm2Yrb5787aFrLFj3IrLjTuCWJMgoJemGUzeW85BN5Oy5A8MkP
 4JOgv7Kn3ENnJsNPjff3hIwT+pDamXp0k80sSO0r80zvWOdXobyu0j/sh
 kTRN/3szRgZ6CGsKa3RXHBMxQqmOZFrlgGSNGM3Rkozx4jaUfr8q4ZdFR
 Y0WbkIC2R0fYNYLZQEgUhX8Zw5n4p7S9VHuiNVlRIS5jajqbxG1uhsk8L Q==;
X-CSE-ConnectionGUID: Y96edpxnQnGV45ORyF5tKQ==
X-CSE-MsgGUID: Gb03gYyETdu2M0WMkYHbjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1873310"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1873310"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 00:55:43 -0700
X-CSE-ConnectionGUID: DCY26I0PSieCqMkWIYYpSw==
X-CSE-MsgGUID: HcDkYflsSOO4tk5QMB4zUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5079915"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2026 00:55:41 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Oct 2026 13:20:27 +0530
Subject: [PATCH v3 1/7] drm/i915/dp: Factor out the DSC slice count and
 link bpp lookup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-vlk-64036-dp-symbol-tg-v3-1-69022424ef17@intel.com>
References: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
In-Reply-To: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
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

Move the DSC slice count and link bpp determination out of
intel_dp_compute_min_hblank() into a helper, so that it can be shared
with the upcoming DP symbol based timing generator computation.
No functional change.

v3: change intel_dp_get_sclice_and_link_bpp -> intel_dp_compute_ (Suraj)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 51 ++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index bf5e87a72108eaf274f24bc997f2e8e2cc8320a0..db7c8fcc8683aae1a2bc7050ef7c87ed5155c8dc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3628,6 +3628,35 @@ intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
 	}
 }
 
+static int intel_dp_compute_dsc_slices_and_link_bpp(const struct intel_crtc_state *crtc_state,
+						    struct intel_connector *connector,
+						    int *dsc_slices, int *link_bpp_x16)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	const struct drm_display_mode *adjusted_mode =
+					&crtc_state->hw.adjusted_mode;
+
+	*dsc_slices = 0;
+
+	if (crtc_state->dsc.compression_enable) {
+		*dsc_slices = intel_dp_dsc_get_slice_count(connector,
+							   adjusted_mode->crtc_clock,
+							   adjusted_mode->crtc_hdisplay,
+							   intel_crtc_num_joined_pipes(crtc_state));
+		if (!*dsc_slices) {
+			drm_dbg(display->drm, "failed to calculate dsc slice count\n");
+			return -EINVAL;
+		}
+
+		*link_bpp_x16 = crtc_state->dsc.compressed_bpp_x16;
+	} else {
+		*link_bpp_x16 = intel_dp_output_format_link_bpp_x16(crtc_state->output_format,
+								    crtc_state->pipe_bpp);
+	}
+
+	return 0;
+}
+
 int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 				const struct drm_connector_state *conn_state)
 {
@@ -3642,12 +3671,12 @@ int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 	 */
 	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;
 	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
-	int num_joined_pipes = intel_crtc_num_joined_pipes(crtc_state);
 	int min_hblank;
 	int max_lane_count = 4;
 	int hactive_sym_cycles, htotal_sym_cycles;
 	int dsc_slices = 0;
 	int link_bpp_x16;
+	int ret;
 
 	if (DISPLAY_VER(display) < 30)
 		return 0;
@@ -3656,22 +3685,10 @@ int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 	if (!is_mst && !intel_dp_is_uhbr(crtc_state))
 		return 0;
 
-	if (crtc_state->dsc.compression_enable) {
-		dsc_slices = intel_dp_dsc_get_slice_count(connector,
-							  adjusted_mode->crtc_clock,
-							  adjusted_mode->crtc_hdisplay,
-							  num_joined_pipes);
-		if (!dsc_slices) {
-			drm_dbg(display->drm, "failed to calculate dsc slice count\n");
-			return -EINVAL;
-		}
-	}
-
-	if (crtc_state->dsc.compression_enable)
-		link_bpp_x16 = crtc_state->dsc.compressed_bpp_x16;
-	else
-		link_bpp_x16 = intel_dp_output_format_link_bpp_x16(crtc_state->output_format,
-								   crtc_state->pipe_bpp);
+	ret = intel_dp_compute_dsc_slices_and_link_bpp(crtc_state, connector,
+						       &dsc_slices, &link_bpp_x16);
+	if (ret)
+		return ret;
 
 	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
 	hactive_sym_cycles = drm_dp_link_symbol_cycles(max_lane_count,

-- 
2.25.1

