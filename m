Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDBAC88E42
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A204C10F33A;
	Fri, 11 Sep 2026 04:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQOqPtuM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A106D10EFFD;
 Fri, 11 Sep 2026 04:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100115; x=1820636115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S50BR7c0ZzkBeZTg8xZrspIjVuRk7O5gkk4/gjFDPqQ=;
 b=jQOqPtuMG1oNOQnhwdPSM1TxWRXqIaxPoSwHcpZQf0yNHXY+9snDBtFP
 Ayad4bAd3FSULfSch/QPkA5zdJ7csClsk71Bk+cAgUqGBDDf6Uc20gpwN
 wC31Tslk8VsPdm6uPc6n/lQKEShukTZiRHrn8fMaQ/PwgSvTgBvvphpUv
 pIm815YQFD+upf3olR/C+6oPzron6uH/XmQXKu4pmDHCteVdysGXg/0qg
 7VK9G0p6pTjif8KRm6uD3LdGkPs0rNebo1X/ZLYitdNFxbwn+5WzoVypC
 Rq3uUTReBpSak4pYl30+76zCnxaSInLcqd4+c5rh3bhQMOno7skACL7WC g==;
X-CSE-ConnectionGUID: LuLzDos9T3CK72q2dBAHKQ==
X-CSE-MsgGUID: 6D+XBSpTRDGJV7DDrmchog==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599964"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599964"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:15:15 -0700
X-CSE-ConnectionGUID: EUEYMsDRRaSF0BzfFXaGWw==
X-CSE-MsgGUID: 3mYAqj8BQ8WlwwEWlID7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334467"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:15:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 09/10] drm/i915/dp: Extend intel_dp_can_support_m_n() for BMG
 M/N bypass
Date: Fri, 11 Sep 2026 09:44:48 +0530
Message-Id: <20260911041449.3699400-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911041449.3699400-1-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On BMG platforms, the standard M/N ratio limit of 10 can be bypassed
under specific conditions, as permitted by hardware capabilities.

Modify the helper intel_dp_can_support_m_n() to account for this by
checking whether the platform supports bypassing the limit. The
workaround is only intended for 128b/132b links, so restrict it to
those.

During the mode_valid phase, the check assumes that PIPE_A will be used,
to allow the mode where the M/N ratio is within the limits for the
workaround.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 18 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 27ffd937c75f..c2db83f80c7e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1277,9 +1277,11 @@ intel_dp_get_max_m_n_ratio(struct intel_display *display)
 
 bool
 intel_dp_can_support_m_n(struct intel_display *display,
+			 const struct intel_crtc_state *crtc_state,
 			 int pixel_clock, int link_rate)
 {
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	enum pipe pipe = PIPE_A;
 	u32 link_m, link_n;
 	int m_n_ratio;
 
@@ -1291,7 +1293,16 @@ intel_dp_can_support_m_n(struct intel_display *display,
 
 	m_n_ratio = DIV_ROUND_UP(link_m, link_n);
 
-	return m_n_ratio <= max_m_n_ratio;
+	if (m_n_ratio <= max_m_n_ratio)
+		return true;
+
+	if (!drm_dp_is_uhbr_rate(link_rate))
+		return false;
+
+	if (crtc_state)
+		pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
+
+	return intel_display_can_bypass_m_n_limit(display, m_n_ratio, pipe);
 }
 
 static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel_clock)
@@ -1496,7 +1507,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 					      INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
 					      INTEL_DP_LINK_CAPS_FILTER_ALL,
 					      &max_rate_config) &&
-	    !intel_dp_can_support_m_n(display,
+	    !intel_dp_can_support_m_n(display, NULL,
 				      intel_dp_mso_pixel_clock(intel_dp, target_clock),
 				      max_rate_config.rate))
 		return MODE_CLOCK_HIGH;
@@ -2721,7 +2732,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 
 	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_config_filter);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (!intel_dp_can_support_m_n(display, pixel_clock, link_config.rate))
+		if (!intel_dp_can_support_m_n(display, crtc_state, pixel_clock,
+					      link_config.rate))
 			continue;
 
 		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 13e9432f98c6..a3abd0e140e6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -244,6 +244,7 @@ int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
 bool intel_dp_can_support_m_n(struct intel_display *display,
+			      const struct intel_crtc_state *crtc_state,
 			      int pixel_clock, int link_rate);
 void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
 			      struct intel_link_m_n *m_n);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4faa0a86dda3..02b994570323 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1566,7 +1566,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
-	if (!intel_dp_can_support_m_n(display, mode->clock, max_link_clock)) {
+	if (!intel_dp_can_support_m_n(display, NULL, mode->clock, max_link_clock)) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
-- 
2.34.1

