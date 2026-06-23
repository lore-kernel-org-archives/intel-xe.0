Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72832CDB471
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E5B10ED30;
	Tue, 23 Jun 2026 22:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvwwNyyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27BB10ED2F;
 Tue, 23 Jun 2026 22:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254864; x=1813790864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PoMzHykfxq4mVRArIO+EN1KPYorupILzGL5dqRg9xkQ=;
 b=NvwwNyyOhkGlC25ARmJGWi1O0piiJ50u+3ZoCf56HpW4F/o6IWAv66k4
 9K/KDNSkwcKOcNF6jzYN40+QKFkINqx1SeQviGyMhL+yJJAdWbKBLuFVO
 1zUu26NPB4TzDxSuKM0vhw28ICimMcY4uh1nYXOPCiqG8dxrOYCjzQH+U
 Neo3SU4Q92aOwUubq6ajVT38UQfuqoH8CzyVDTThtyV7WF589oC2Nki68
 G2hgvbyL3XuwcDbJ9FQ+F1sIW5vZViPx5RHwsnEmP3ZmLNJkqRM22eNfH
 1KpliyPBFKLTTUaYFfirKxM9M+wB4WBR/edgQ9jlspk4x241dRHl3+tc3 w==;
X-CSE-ConnectionGUID: ia3yeBXJQ7if5CngpqCl8A==
X-CSE-MsgGUID: WoKtZak0Q1CciYanU6leuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775600"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:44 -0700
X-CSE-ConnectionGUID: 37K2j36PR6ymtQTxbs9MMA==
X-CSE-MsgGUID: D+/WZuVKQMqVocWpdf+arQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497140"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:42 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 19/30] drm/i915/dp_link_caps: Track max common lane count
 in link_caps
Date: Wed, 24 Jun 2026 00:46:08 +0200
Message-ID: <20260623224619.1949975-20-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260623224619.1949975-1-michal.grzelak@intel.com>
References: <20260623224619.1949975-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: Imre Deak <imre.deak@intel.com>

Pass the maximum common lane count to intel_dp_link_caps_update() and
track it together with the supported link rates. This prepares for
converting all users of intel_dp_max_common_lane_count() to query the
value from the link caps module instead.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c           | 14 +++++---------
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 13 +++++++++----
 drivers/gpu/drm/i915/display/intel_dp_link_caps.h |  2 +-
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 84640c8394534..2873b2df29f84 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -339,23 +339,19 @@ int intel_dp_max_source_lane_count(struct intel_digital_port *dig_port)
 
 /*
  * Theoretical max between source and sink.
- * Return %true if the max common lane count changed.
  */
-static bool intel_dp_set_max_common_lane_count(struct intel_dp *intel_dp)
+static int intel_dp_get_max_common_lane_count(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	int source_max = intel_dp_max_source_lane_count(dig_port);
 	int sink_max = intel_dp->max_sink_lane_count;
 	int lane_max = intel_tc_port_max_lane_count(dig_port);
 	int lttpr_max = drm_dp_lttpr_max_lane_count(intel_dp->lttpr_common_caps);
-	int old_max_common_lane_count = intel_dp->max_common_lane_count;
 
 	if (lttpr_max)
 		sink_max = min(sink_max, lttpr_max);
 
-	intel_dp->max_common_lane_count = min3(source_max, sink_max, lane_max);
-
-	return intel_dp->max_common_lane_count != old_max_common_lane_count;
+	return min3(source_max, sink_max, lane_max);
 }
 
 int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
@@ -705,12 +701,12 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
 	int common_rates[DP_MAX_SUPPORTED_RATES];
 	bool params_changed = false;
 
-	if (intel_dp_set_max_common_lane_count(intel_dp))
-		params_changed = true;
+	intel_dp->max_common_lane_count = intel_dp_get_max_common_lane_count(intel_dp);
 
 	intel_dp_get_common_rates(intel_dp, common_rates, &num_common_rates);
 	if (intel_dp_link_caps_update(intel_dp,
-				      common_rates, num_common_rates))
+				      common_rates, num_common_rates,
+				      intel_dp_get_max_common_lane_count(intel_dp)))
 		params_changed = true;
 
 	return params_changed;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index e28f7308283ce..bb727bcf4de18 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -25,6 +25,7 @@ struct intel_dp_link_caps {
 	/* Rate, lane count caps common to source and sink. */
 	int num_rates;
 	int rates[DP_MAX_SUPPORTED_RATES];
+	int max_lane_count;
 
 	/* common rate,lane_count configs in bw order */
 	int num_configs;
@@ -169,7 +170,7 @@ static int link_config_cmp_by_bw(const void *a, const void *b, const void *p)
 
 /* Return %true if the supported link parameters have changed. */
 bool intel_dp_link_caps_update(struct intel_dp *intel_dp,
-			       const int *rates, int num_rates)
+			       const int *rates, int num_rates, int max_lane_count)
 {
 	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
 	struct intel_display *display = to_intel_display(intel_dp);
@@ -179,13 +180,13 @@ bool intel_dp_link_caps_update(struct intel_dp *intel_dp,
 	int i;
 	int j;
 
-	if (drm_WARN_ON(display->drm, !is_power_of_2(intel_dp_max_common_lane_count(intel_dp))))
+	if (drm_WARN_ON(display->drm, !is_power_of_2(max_lane_count)))
 		return false;
 
 	if (drm_WARN_ON(display->drm, num_rates > ARRAY_SIZE(link_caps->rates)))
 		return false;
 
-	num_common_lane_configs = ilog2(intel_dp_max_common_lane_count(intel_dp)) + 1;
+	num_common_lane_configs = ilog2(max_lane_count) + 1;
 
 	if (drm_WARN_ON(display->drm, num_rates * num_common_lane_configs >
 				    ARRAY_SIZE(link_caps->configs)))
@@ -197,8 +198,13 @@ bool intel_dp_link_caps_update(struct intel_dp *intel_dp,
 	    memcmp(rates, link_caps->rates, num_rates * sizeof(rates[0])))
 		link_params_changed = true;
 
+	if (max_lane_count != link_caps->max_lane_count)
+		link_params_changed = true;
+
 	memcpy(link_caps->rates, rates, num_rates * sizeof(rates[0]));
 	link_caps->num_rates = num_rates;
+	link_caps->max_lane_count = max_lane_count;
+
 	link_caps->num_configs = num_rates * num_common_lane_configs;
 
 	lc = &link_caps->configs[0];
@@ -216,7 +222,6 @@ bool intel_dp_link_caps_update(struct intel_dp *intel_dp,
 	       link_config_cmp_by_bw, NULL,
 	       intel_dp);
 
-	/* TODO: Also detect a change in the max lane count. */
 	return link_params_changed;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
index 7d7d3d11ba3fe..e2f53eb167a8e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
@@ -27,7 +27,7 @@ int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate, int lan
 void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *link_rate, int *lane_count);
 
 bool intel_dp_link_caps_update(struct intel_dp *intel_dp,
-			       const int *rates, int num_rates);
+			       const int *rates, int num_rates, int max_lane_count);
 
 void intel_dp_link_caps_debugfs_add(struct intel_connector *connector);
 
-- 
2.45.2

