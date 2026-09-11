Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C618C88E41
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CD210E50A;
	Fri, 11 Sep 2026 04:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SML3zKQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F7210F33A;
 Fri, 11 Sep 2026 04:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100104; x=1820636104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7zum9sXpa2Grga/rbFcZPY1FdNzhRi/WicViG7pnaEY=;
 b=SML3zKQgnELUTeDhGqOku2BMzsvoceWdOCoUJots3dDAHl4fkSYPTWRK
 2jD7OfIIEZb/hJuyMFptAr2XNGMi4c0ADBNZauawzNo+O45EfVgL/VcyG
 rePOd1s0bra+yUqolR3yx/mFJJSm7zfBhb01Sx502+nfKWJ1cW/b8uJmP
 V72SCFJIfRRgkI4eNKZPisk0ACnZK8GjJN/9Hb3PrshHs3cUIiZlTFh5G
 6Y589zcTvIkbLPh451fT+vsZZjAsRfPe/2LIYkNJrjtZygiQ0g5r5nVqk
 Qw86WpqjoeHR9I+0+1N26MbzVKBc/Gsd/9AGFc3azV6zPZp8CBxxUjjql w==;
X-CSE-ConnectionGUID: 6cn7qQNKSPekZ8psnm+9Fg==
X-CSE-MsgGUID: E2CHYY3lQt659ftEtS3l8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599953"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:15:04 -0700
X-CSE-ConnectionGUID: RvaJgmNjSfODZH3w+t2dmw==
X-CSE-MsgGUID: p/8QdjxRQ3yJF6EvIwcs1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334423"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:15:02 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Date: Fri, 11 Sep 2026 09:44:42 +0530
Message-Id: <20260911041449.3699400-4-suraj.kandpal@intel.com>
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

The hardware does not support DisplayPort configurations where the
ceiling of the Link M/Link N ratio exceeds the limit. Enforce this
constraint for MST as well.

The compute config path needs no change: MST goes through
intel_dp_compute_config_limits() too, so the link config filter set up
there already excludes the configurations violating the ratio limit, and
MST fails there if none is left.

What is still missing is pruning such modes, so add the check to
mst_connector_mode_valid_ctx() using the highest link rate available,
mirroring the SST mode_valid.

v2:
-Drop the checks in the MST link config helpers, redundant now that the
constraint is applied while computing the link config limits. (Imre)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.h     | 3 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index dbece80c7a06..715314d3684e 100644
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
index 6a869d0f6ffc..796374cebf05 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1564,6 +1564,11 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
+	if (!intel_dp_can_support_m_n(display, mode->clock, max_link_clock)) {
+		*status = MODE_CLOCK_HIGH;
+		return 0;
+	}
+
 	/*
 	 * TODO:
 	 * - Also check if compression would allow for the mode
-- 
2.34.1

