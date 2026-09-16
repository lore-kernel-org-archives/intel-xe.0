Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222DAC88E7F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC3E10E357;
	Wed, 16 Sep 2026 02:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBYrTJL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7050A10E4EC;
 Wed, 16 Sep 2026 02:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527451; x=1821063451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dhtNHc/kYTFSW0UZ1K145kF5G2kVqzZ6oRpR/kkLZ8=;
 b=kBYrTJL+E6N5luAWe0z9D5bX51biLUIgMTU66Jn//R+dpQU+Z9mkXboh
 I7L19/3up1iTR1v6792auQYtlsggpJ6/Aw6ITqteWTgylZwyEsJ7xR57S
 9z0JDAudEI477AjvZz1G81xrYaGtErDOk0cwKFLBF9vaVXFeFdBt7NHzS
 pu+9kdWNkNPhOCZ89rWx8jN3jgesm6mTlBDhq59uK4NJvqKW8fifCLKKQ
 5+QnODExT3TOYehwPORbmsXfDGlNGR8ar5lgqYoaWM8nGhsotlyYym+1n
 1F2scrQsR9j5sECEA+GU0NrlsVI9HhFXpb1de6i/8TNaTnvgzIrV/HHIL w==;
X-CSE-ConnectionGUID: x7f6hqN7QdGIC4pwjzEIaw==
X-CSE-MsgGUID: Z0BbfstoROKproQvI5hjlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498343"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:30 -0700
X-CSE-ConnectionGUID: a2A9GjOpTNa837ky+I7iQw==
X-CSE-MsgGUID: M8vUfihFSOOrviVaak1eEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473430"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:29 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 09/10] drm/i915/dp: Extend intel_dp_can_support_m_n() for
 BMG M/N bypass
Date: Wed, 16 Sep 2026 08:27:09 +0530
Message-Id: <20260916025710.432281-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916025710.432281-1-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  3 ++-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e89ff8677664..9a3955c6697b 100644
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
index d375fff3fe4c..31fc1564890e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1571,7 +1571,8 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					      INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
 					      INTEL_DP_LINK_CAPS_FILTER_ALL,
 					      &max_rate_config) &&
-	    !intel_dp_can_support_m_n(display, mode->clock, max_rate_config.rate)) {
+	    !intel_dp_can_support_m_n(display, NULL, mode->clock,
+				      max_rate_config.rate)) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
-- 
2.34.1

