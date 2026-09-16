Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9496C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A7910E97F;
	Wed, 16 Sep 2026 09:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFwuT0WE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6630210E8B3;
 Wed, 16 Sep 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789549812; x=1821085812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ep1NROHcxzTGiLorbdVWG26bY8w+TBJykz7x0pgJfJk=;
 b=TFwuT0WE7KS3kPfHPKu/LBhI+qQuSr0fNRWUdNwdDdzgnn4mT/Ewb9XJ
 O5WAIXB/GVbjLiaKyTs18Qa6WxqzIlJzvGe6sQDRao39TnaHf7TSl7O1d
 gz6AnDDrZRife0EM6zK2P2E+1Fuz0xl7wyXxONakuhzAUvr4rIwR6tBBb
 p+Ddk12UkVfMXKth2S/7z7NYVF6X23pUlbeA/v3eKL8I9Mt5hMXn6wdXi
 AzHFXimoWbDic1fpvSv9Kh8f2bCSydTxHyQnfHGBMJEfYQKBZ+vLqNyDj
 j8IQMcrhaC5FzClrDaZo+XJA/C9s+rBQfYMQdv6UtHwbf4n7kOUmoLETs g==;
X-CSE-ConnectionGUID: 9Xrj/MZQTnuWH9hm5YVs2g==
X-CSE-MsgGUID: l07baMgvR66q9VOgniFaJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88858893"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88858893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:10:08 -0700
X-CSE-ConnectionGUID: PdFzn62lRP6SYHUsuURe4g==
X-CSE-MsgGUID: C4AWF62nR7uY4UqqloeJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277030257"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 16 Sep 2026 02:10:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 09/10] drm/i915/dp: Extend intel_dp_can_support_m_n() for
 BMG M/N bypass
Date: Wed, 16 Sep 2026 14:39:45 +0530
Message-Id: <20260916090946.677564-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916090946.677564-1-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3911942de8e5..04a492a0b369 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1277,9 +1277,11 @@ intel_dp_get_max_m_n_ratio(struct intel_display *display)
 
 static bool
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
@@ -1352,7 +1363,7 @@ bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
 	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
 				      INTEL_DP_LINK_CAPS_FILTER_ALL);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
+		if (intel_dp_can_support_m_n(display, NULL, m_n_pixel_clock,
 					     link_config.rate)) {
 			found = true;
 
@@ -2741,7 +2752,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 
 	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_config_filter);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (!intel_dp_can_support_m_n(display, pixel_clock, link_config.rate))
+		if (!intel_dp_can_support_m_n(display, crtc_state, pixel_clock,
+					      link_config.rate))
 			continue;
 
 		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
-- 
2.34.1

