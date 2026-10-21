Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E7606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lW1X26Uu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA4F10FA9A;
	Wed, 21 Oct 2026 07:14:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64E210FA83;
 Wed, 21 Oct 2026 07:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566857; x=1824102857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IC+ZhI2EvKb9Awspun3aezjEra6Dp4mMSNLgXruYT64=;
 b=lW1X26Uu8t0Q19pxSa43+KyEFa7ggiEIzLoXlFrEtblto3rJE0+DRUG1
 WADrXSMmMy+g+rQFTGwqZf5quxYh9Qt62cla6gSSc1eHTwnAxH9pwZ9r1
 et3Rh7NotWwMJv1G9qPn7WEBk1n+K5rwEVG/sxz7b5zSPVSuyHlsOTXBb
 tq8X3sFnKgCqeIfTsPiMoz55HjHpar5DnyqS2xmJKJtqySCTs1un8zm0R
 YStfX1C3pDRpmb47n4dbdPz+2fmnDimo5s1bQgWX6eM5J1mSDDoTuCN/f
 gfkaJbQJzVXqJJ0EbGB74Y09homeSBjJPVjh2cqYuyiqLTWReZQoF5jOJ Q==;
X-CSE-ConnectionGUID: QehkGtsyRJqFODqDV3q7cA==
X-CSE-MsgGUID: GT53eVOYQVSc+cISVEXsHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1383992"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1383992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:14:17 -0700
X-CSE-ConnectionGUID: n3uTwjm3TVWP+nl04p2fIg==
X-CSE-MsgGUID: QoYZhuXGSNmpaYldrxGtdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3357027"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2026 00:14:15 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v6 05/11] drm/i915/dp: Add M/N ratio check for DP link config
Date: Wed, 21 Oct 2026 12:43:55 +0530
Message-Id: <20261021071401.1161586-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021071401.1161586-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Introduce intel_dp_check_m_n_ratio() to validate the computed link M/N
ratio against the maximum allowed value, and log it if the ratio exceeds
the limit.

The link config limits computed in the previous commits only restrict
the configurations that may be selected; this catches anything that
still slips through.

Log it rather than warn about it: the link config filter already
excludes the configurations violating the limit, so the only way to get
here is with link parameters forced through debugfs, which are applied
after that filter. A user triggerable drm_WARN() with its backtrace
would be out of proportion for that.

For MST the check goes after the bpp loop rather than inside it. The
link M/N is computed from the pixel clock and the link symbol clock, so
it does not depend on the bpp being tried and the result is the same on
every iteration.

v2:
-Use the platform specific ratio limit. (Wa_14014191401)
-Use the MSO adjusted pixel clock when predicting the ratio, matching
what the link M/N is actually computed from. (Imre)
-Drop the check from ilk_fdi_compute_config(): it was passing dp_m_n
rather than the fdi_m_n it had just computed, and an FDI link cannot get
anywhere near the ratio limit anyway.
v3:
-Check the ratio once after the MST bpp loop instead of on every
iteration, the result does not depend on the bpp. (Sashiko)
-Log instead of warning, since the link config filter already excludes
these configurations and only forced link parameters can reach it.
(Sashiko)
v4:
-Move the MSO adjusted pixel clock to the commit adding the prediction,
so that one is correct on its own. (Mitul)
-Reuse intel_dp_link_m_n_ratio() instead of open coding the ratio.
(Mitul)
-Drop the m_n and link_n checks, neither can be NULL or 0. Make the
parameters const and move it next to intel_dp_can_support_m_n().
(Mitul)
-Drop the check on dp_m2_n2, the dp_m_n one already covers it. (Mitul)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 17 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h     |  4 ++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f3a79ae49b18..8ef6b4c4fc8e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1299,6 +1299,21 @@ intel_dp_can_support_m_n(struct intel_display *display,
 	return m_n_ratio <= max_m_n_ratio;
 }
 
+void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
+			      const struct intel_link_m_n *m_n)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	int m_n_ratio;
+
+	m_n_ratio = intel_dp_link_m_n_ratio(m_n->link_m, m_n->link_n);
+
+	if (m_n_ratio > max_m_n_ratio)
+		drm_dbg_kms(display->drm,
+			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
+			    m_n_ratio, max_m_n_ratio);
+}
+
 static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel_clock)
 {
 	if (!intel_dp->mso_link_count)
@@ -3755,6 +3770,8 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 				       pipe_config->port_clock,
 				       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
 				       &pipe_config->dp_m_n);
+
+		intel_dp_check_m_n_ratio(pipe_config, &pipe_config->dp_m_n);
 	}
 
 	ret = intel_dp_compute_min_hblank(pipe_config, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index aa58833a405b..1e3da678c9b6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -26,6 +26,7 @@ struct intel_display;
 struct intel_dp;
 struct intel_dp_link_config;
 struct intel_encoder;
+struct intel_link_m_n;
 
 struct link_config_limits {
 	struct intel_dp_link_caps_filter link_config_filter;
@@ -244,4 +245,7 @@ bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock);
 int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
+void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
+			      const struct intel_link_m_n *m_n);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index f00edfb66a10..8db84975f36b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -429,6 +429,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 		return slots;
 	}
 
+	intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
+
 	if (!dsc)
 		crtc_state->pipe_bpp = fxp_q4_to_int(bpp_x16);
 	else
-- 
2.34.1

