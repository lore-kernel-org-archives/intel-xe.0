Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27AE606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9BXkzOv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C71610E57D;
	Fri, 23 Oct 2026 05:03:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40D1112974;
 Fri, 23 Oct 2026 05:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731776; x=1824267776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2rJRjh/yqhpvSGI2bJo+o6Wysivbk0qEBNNuD3wUa4c=;
 b=g9BXkzOvnu5oH8IS3EEVZY68+l9OvHdpWbKzpzE6NuQ3hC7iC/UEuuzU
 gjHEOFk/DKNXHxzoJQhDcGKwPD0qS9rii2cvSs4NFwzGajA97yCa59NeW
 +X2mI4HukvO7CLvwMuCMniIXfi4PnxqYYVcPB//LHQtzMM1q9Ex9pg9sR
 z4a/WMJX9oENbnwSaAKrNN805mftNvvH5zH831W08Tm9ZVWF9wYsIi1lu
 SoPeFRSLnmqdfHeBUCgamGKStwmhp5c06CHqsDv9o11x8oIVG9LNt15A0
 6TlPbJHiiBbTTHcW5sQI7cu2a5tZ01/JOXTOc5eBmqUwQOCBqRBN4Wmy1 g==;
X-CSE-ConnectionGUID: G1BstYsYSESfE/ypa4KGrw==
X-CSE-MsgGUID: 2j4YHKn9SAS41MeiAZPG6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499172"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:55 -0700
X-CSE-ConnectionGUID: bC5hGDT6Tsqaex6V05vAyA==
X-CSE-MsgGUID: MvOP6SeTR16FruMkf5M1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926674"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 13/14] drm/i915/dp: Extend intel_dp_can_support_m_n() for
 BMG M/N bypass
Date: Fri, 23 Oct 2026 10:32:26 +0530
Message-Id: <20261023050227.2068466-14-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
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

On BMG platforms, the standard M/N ratio limit of 10 can be bypassed
under specific conditions, as permitted by hardware capabilities.

Modify the helper intel_dp_can_support_m_n() to account for this by
checking whether the platform supports bypassing the limit. The
workaround is only intended for 128b/132b links, so restrict it to
those.

Put the bypass condition, a UHBR link rate plus
intel_display_can_bypass_m_n_limit(), into a helper and use it from
intel_dp_check_m_n_ratio() as well, so that the prediction and the
decision on the final state cannot drift apart.

During the mode_valid phase, the check assumes that TRANSCODER_A will be
used, to allow the mode where the M/N ratio is within the limits for the
workaround.

v2:
-Keep the helper static: the MST mode_valid now goes through the shared
intel_dp_mode_valid_m_n() rather than calling it directly, so it no
longer needs to be exported.
v3:
-Use the cpu transcoder instead of the pipe, following the change to
intel_display_can_bypass_m_n_limit(). (Mitul)
v4:
-Share the bypass condition with intel_dp_check_m_n_ratio() through
intel_dp_can_bypass_m_n_limit(). (Mitul)
-The helper is exported again, the MST mode_valid calls it directly to
check the ratio against the maximum BW configuration. (Mitul)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 28 ++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 73c67565a329..772006691882 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1286,10 +1286,20 @@ static int intel_dp_link_m_n_ratio(u32 link_m, u32 link_n)
 	return DIV_ROUND_UP(link_m, link_n);
 }
 
+static bool
+intel_dp_can_bypass_m_n_limit(struct intel_display *display, int link_rate,
+			      int m_n_ratio, enum transcoder cpu_transcoder)
+{
+	return drm_dp_is_uhbr_rate(link_rate) &&
+		intel_display_can_bypass_m_n_limit(display, m_n_ratio, cpu_transcoder);
+}
+
 bool intel_dp_can_support_m_n(struct intel_display *display,
+			      const struct intel_crtc_state *crtc_state,
 			      int pixel_clock, int link_rate)
 {
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	enum transcoder cpu_transcoder = TRANSCODER_A;
 	u32 link_m, link_n;
 	int m_n_ratio;
 
@@ -1298,7 +1308,13 @@ bool intel_dp_can_support_m_n(struct intel_display *display,
 
 	m_n_ratio = intel_dp_link_m_n_ratio(link_m, link_n);
 
-	return m_n_ratio <= max_m_n_ratio;
+	if (m_n_ratio <= max_m_n_ratio)
+		return true;
+
+	if (crtc_state)
+		cpu_transcoder = crtc_state->cpu_transcoder;
+
+	return intel_dp_can_bypass_m_n_limit(display, link_rate, m_n_ratio, cpu_transcoder);
 }
 
 void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
@@ -1315,9 +1331,8 @@ void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
 	if (m_n_ratio <= max_m_n_ratio)
 		return;
 
-	if (intel_dp_is_uhbr(crtc_state) &&
-	    intel_display_can_bypass_m_n_limit(display, m_n_ratio,
-					       crtc_state->cpu_transcoder)) {
+	if (intel_dp_can_bypass_m_n_limit(display, crtc_state->port_clock, m_n_ratio,
+					  crtc_state->cpu_transcoder)) {
 		m_n->bypass_m_n_ratio_limit = true;
 		drm_dbg_kms(display->drm,
 			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
@@ -1388,7 +1403,7 @@ static bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
 	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
 				      INTEL_DP_LINK_CAPS_FILTER_ALL);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
+		if (intel_dp_can_support_m_n(display, NULL, m_n_pixel_clock,
 					     link_config.rate)) {
 			found = true;
 
@@ -2777,7 +2792,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 
 	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_config_filter);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (!intel_dp_can_support_m_n(display, pixel_clock, link_config.rate))
+		if (!intel_dp_can_support_m_n(display, crtc_state, pixel_clock,
+					      link_config.rate))
 			continue;
 
 		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index ef5aa28617f0..1f4a3aff9abe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -241,6 +241,7 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 u8 intel_dp_as_sdp_transmission_time(void);
 
 bool intel_dp_can_support_m_n(struct intel_display *display,
+			      const struct intel_crtc_state *crtc_state,
 			      int pixel_clock, int link_rate);
 
 int intel_dp_link_init(struct intel_dp *intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 687a12e995c5..ed130df0b615 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1567,7 +1567,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
-	if (!intel_dp_can_support_m_n(display, mode->clock, max_link_clock)) {
+	if (!intel_dp_can_support_m_n(display, NULL, mode->clock, max_link_clock)) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
-- 
2.34.1

