Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262DF606A32D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 03:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bDVBdj9J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E349710F9A8;
	Wed,  4 Nov 2026 03:30:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C031A10F99D;
 Wed,  4 Nov 2026 03:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793763016; x=1825299016;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=IHDI4eKx8jK4HwDiRDDPtwISyfjvn/Z3sUFpe3BAiXw=;
 b=bDVBdj9JWNplM1Jev1lKxngRlJsfJqODOeac/08zoESmHOzx0uoDu7vv
 g6n1cL0RSWAauD1YWmQR/gbYsxk87TUdms6JZxEYQj0RCoAsXJ8cE3k00
 /jJTuNiroQdHR6kLQhXeocL4XUp95JapqDtoRBWEm6hbUcqTdyZOO3DVB
 eOmAmOsicPzctxhpVqCo8tqnK6V62zGmxsC2O88wqwuj++/aVNbTh/h7M
 EJH9AmpmWQAB2n3svF1JWmaOgXKFtvXs0FTTrxPPepuu44ucJeKUknuF5
 n9mMaer+vDBb29xrzr/9j64eahcgUxChm9ZqCbDZcuZ4pfX8BlErU0ozE w==;
X-CSE-ConnectionGUID: TXHo2d/CQ7WEePXmEJcvUQ==
X-CSE-MsgGUID: CG38f+sXSYOoezZ2Zh+OLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2505335"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2505335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 19:30:16 -0800
X-CSE-ConnectionGUID: pdMpmejjSCmsvGahOAzSrw==
X-CSE-MsgGUID: 5AgCTZ2SSWy0FBNDmCxo6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7155725"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 19:30:13 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 04 Nov 2026 08:54:51 +0530
Subject: [PATCH v4 7/7] drm/i915/dp: Don't limit the Link M/N ratio with
 the symbol timing generator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-vlk-64036-dp-symbol-tg-v4-7-d06fe6c466a9@intel.com>
References: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
In-Reply-To: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
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

The limit on the Link M/N ratio only applies to the pixel based timing
generator, there is no such restriction when the symbol based timing
generator is used.

Bspec: 68922
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 18 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  4 +++-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 788c16df9801131294c73420c2c0d4d3ec848310..b16286c8b0720d8961d3cabc28b86d881c7ed9cb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1277,8 +1277,12 @@ static bool intel_dp_has_symbol_tg(struct intel_display *display, bool is_mst, b
 }
 
 static int
-intel_dp_get_max_m_n_ratio(struct intel_display *display)
+intel_dp_get_max_m_n_ratio(struct intel_display *display, bool is_mst, int link_rate)
 {
+	/* No Link M/N ratio limit with the symbol based timing generator */
+	if (intel_dp_has_symbol_tg(display, is_mst, drm_dp_is_uhbr_rate(link_rate)))
+		return INT_MAX;
+
 	if (DISPLAY_VER(display) >= 35)
 		return 22;
 
@@ -1308,7 +1312,9 @@ bool intel_dp_can_support_m_n(struct intel_display *display,
 			      const struct intel_crtc_state *crtc_state,
 			      int pixel_clock, int link_rate)
 {
-	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	bool is_mst = crtc_state &&
+		      intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
+	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display, is_mst, link_rate);
 	enum transcoder cpu_transcoder = TRANSCODER_A;
 	u32 link_m, link_n;
 	int m_n_ratio;
@@ -1331,7 +1337,10 @@ void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
 			      struct intel_link_m_n *m_n)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
-	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	int max_m_n_ratio =
+		intel_dp_get_max_m_n_ratio(display,
+					   intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST),
+					   crtc_state->port_clock);
 	int m_n_ratio;
 
 	m_n->bypass_m_n_ratio_limit = false;
@@ -2815,7 +2824,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 		drm_dbg_kms(display->drm,
 			    "[CONNECTOR:%d:%s] No link config with a Link M/N ratio <= %d\n",
 			    connector->base.base.id, connector->base.name,
-			    intel_dp_get_max_m_n_ratio(display));
+			    intel_dp_get_max_m_n_ratio(display, false,
+						       crtc_state->port_clock));
 
 		return false;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 81ac454603603df42db477ddb26cfb2f620dcfea..fe9cdf771f481fc8a8b8f3f29e4a24aa53a53f94 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1570,7 +1570,9 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
-	if (!intel_dp_can_support_m_n(display, NULL, mode->clock, max_link_clock)) {
+	/* MST always uses the symbol based timing generator, which has no Link M/N ratio limit */
+	if (!HAS_DP_SYMBOL_TG(display) &&
+	    !intel_dp_can_support_m_n(display, NULL, mode->clock, max_link_clock)) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}

-- 
2.25.1

