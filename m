Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183BCC982C7
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018710E3B5;
	Wed, 16 Sep 2026 02:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jj0saRLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC4F10E232;
 Wed, 16 Sep 2026 02:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527440; x=1821063440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+NgnWBWX1MLA+rcjZaYe81G6ArZwNl4kfZqhvpE4880=;
 b=Jj0saRLFFNu4ltjTOvU0Y9S6+Yu9V9SOt2OQM/B8OCE85Cli60/7GWYs
 Rr6ge3c7wbw/oGQNXIcmJc3tscD4f9IjGrEnhELh90E8zOi6II5OMYPSf
 EWb8/y5PsU5TASv+lj16VcNKfyNKNe736/rtRSOYCyJLVeUcBlfm/4T5G
 neSBL1QFEduGUA3RxtAlvzaHGAcqaArUiUUmi0JYZNknJ0zzi9Dd9lIZx
 8rfXTrkYyyFckstSn7Bx8kjak82pjaHoOV2TBLbB5AjCCU9FF1t8/xLHY
 pYYT7OQDmS6ZddaZazeltNpPhMX69oE1wGBSFxmY/qMPce/5L4g3te+/O g==;
X-CSE-ConnectionGUID: cN3nPlgpQ3eQjXg5hHHJsw==
X-CSE-MsgGUID: upGk8sKMT5yyHXeWD2ibqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498332"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:19 -0700
X-CSE-ConnectionGUID: 8ELEv/KLSR+fBHIN3Pf4Dg==
X-CSE-MsgGUID: FytRxAK3R6SHd8/rw7rUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473396"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:18 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Date: Wed, 16 Sep 2026 08:27:03 +0530
Message-Id: <20260916025710.432281-4-suraj.kandpal@intel.com>
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

The hardware does not support DisplayPort configurations where the
ceiling of the Link M/Link N ratio exceeds the limit. Enforce this
constraint for MST as well.

The compute config path needs no change: MST goes through
intel_dp_compute_config_limits() too, so the link config filter set up
there already excludes the configurations violating the ratio limit, and
MST fails there if none is left.

What is still missing is pruning such modes, so add the check to
mst_connector_mode_valid_ctx(), mirroring the SST mode_valid.

The ratio shrinks as the link rate grows, so the check uses the highest
available link rate rather than the rate of the maximum bandwidth
configuration the rest of the function works with. Those are not always
the same one: link training failures disable individual configurations,
after which the highest bandwidth configuration can be a slower rate with
more lanes, and using it here would prune modes a narrower but faster
configuration could still drive.

v2:
-Drop the checks in the MST link config helpers, redundant now that the
constraint is applied while computing the link config limits. (Imre)

v3
-Use the maximum rate rather than the maximum bandwidth configuration
for the ratio check. (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.h     |  3 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 28c9461a7723..4a1934d4eca4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1275,7 +1275,7 @@ intel_dp_get_max_m_n_ratio(struct intel_display *display)
 	return 10;
 }
 
-static bool
+bool
 intel_dp_can_support_m_n(struct intel_display *display,
 			 int pixel_clock, int link_rate)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 04fae203bb69..757e74ca8696 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -242,4 +242,7 @@ u8 intel_dp_as_sdp_transmission_time(void);
 int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
+bool intel_dp_can_support_m_n(struct intel_display *display,
+			      int pixel_clock, int link_rate);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 6a869d0f6ffc..3f4ab9573d0c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1521,6 +1521,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 		DRM_DP_BW_OVERHEAD_MST | DRM_DP_BW_OVERHEAD_SSC_REF_CLK;
 	int min_link_bpp_x16 = fxp_q4_from_int(18);
 	struct intel_dp_link_config max_bw_config;
+	struct intel_dp_link_config max_rate_config;
 	static bool supports_dsc;
 	int ret;
 	bool dsc = false;
@@ -1564,6 +1565,15 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
+	if (intel_dp_link_caps_get_max_config(intel_dp->link.caps,
+					      INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
+					      INTEL_DP_LINK_CAPS_FILTER_ALL,
+					      &max_rate_config) &&
+	    !intel_dp_can_support_m_n(display, mode->clock, max_rate_config.rate)) {
+		*status = MODE_CLOCK_HIGH;
+		return 0;
+	}
+
 	/*
 	 * TODO:
 	 * - Also check if compression would allow for the mode
-- 
2.34.1

