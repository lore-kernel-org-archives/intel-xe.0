Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ABFCDE002
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6146B10ED1D;
	Tue, 23 Jun 2026 22:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8hSxXqN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A655810ED1B;
 Tue, 23 Jun 2026 22:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254846; x=1813790846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fb6T7TzPQB8rAVvAjoLXQHV87p+1R7I9OcdrPkgo0WE=;
 b=L8hSxXqN2VCg7epSB1Z1zJrkhx3x1pzx0ToFhtsbBRk46zjbYFwEmZLc
 ZbVhtTnlzgYfcpPoMw3vuldf077ENr9usqWgHLTNsQ8kx9vc4bcSoLalK
 RyYssPJplMBToYw2PZwCxr/7YeicpDDzQZK9JQMouTQhl+GQZ4s7vMjPa
 YDPWQq3lEmOfxnxnzX/F+/7B6LmIH/zV21iCw3418Y57w3d83nqfNeIRD
 UekxoYXMD2vmaw3A9EWcMXLBGzLfb7GPCkJw4WfkINdBA9I8lQ37+ZpJc
 IukTb+ujYse2n0jUvB01C400+OG1/0C+uTbYcFYDlEyMcM/L4+2pWUCXn g==;
X-CSE-ConnectionGUID: pjPKIpmIR/WicF8LJ/D0cA==
X-CSE-MsgGUID: 2W1MYAppSrWpJYZwd2JFCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775569"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:26 -0700
X-CSE-ConnectionGUID: BiAczdjyRrSSgmdQqgtAiw==
X-CSE-MsgGUID: ZudpA00iT8uV3HK7PKyhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497113"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:23 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 10/30] drm/i915/dp_link_caps: Move link config helpers to
 link caps
Date: Wed, 24 Jun 2026 00:45:59 +0200
Message-ID: <20260623224619.1949975-11-michal.grzelak@intel.com>
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

Move the helpers handling link configurations to intel_dp_link_caps.c.
Their functionality is part of the link capability logic and will be
updated to use the link capability state in follow-up changes.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 101 -----------------
 drivers/gpu/drm/i915/display/intel_dp.h       |   2 -
 .../gpu/drm/i915/display/intel_dp_link_caps.c | 102 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_caps.h |   5 +
 4 files changed, 107 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c4ad386acc6db..c4b650431eff5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -33,7 +33,6 @@
 #include <linux/notifier.h>
 #include <linux/seq_buf.h>
 #include <linux/slab.h>
-#include <linux/sort.h>
 #include <linux/string_helpers.h>
 #include <linux/timekeeping.h>
 #include <linux/types.h>
@@ -677,106 +676,6 @@ int intel_dp_rate_index(const int *rates, int len, int rate)
 	return -1;
 }
 
-static int intel_dp_link_config_rate(struct intel_dp *intel_dp,
-				     const struct intel_dp_link_config_entry *lc)
-{
-	return intel_dp_common_rate(intel_dp, lc->link_rate_idx);
-}
-
-static int intel_dp_link_config_lane_count(const struct intel_dp_link_config_entry *lc)
-{
-	return 1 << lc->lane_count_exp;
-}
-
-static int intel_dp_link_config_bw(struct intel_dp *intel_dp,
-				   const struct intel_dp_link_config_entry *lc)
-{
-	return drm_dp_max_dprx_data_rate(intel_dp_link_config_rate(intel_dp, lc),
-					 intel_dp_link_config_lane_count(lc));
-}
-
-static int link_config_cmp_by_bw(const void *a, const void *b, const void *p)
-{
-	struct intel_dp *intel_dp = (struct intel_dp *)p;	/* remove const */
-	const struct intel_dp_link_config_entry *lc_a = a;
-	const struct intel_dp_link_config_entry *lc_b = b;
-	int bw_a = intel_dp_link_config_bw(intel_dp, lc_a);
-	int bw_b = intel_dp_link_config_bw(intel_dp, lc_b);
-
-	if (bw_a != bw_b)
-		return bw_a - bw_b;
-
-	return intel_dp_link_config_rate(intel_dp, lc_a) -
-	       intel_dp_link_config_rate(intel_dp, lc_b);
-}
-
-static void intel_dp_link_config_init(struct intel_dp *intel_dp)
-{
-	struct intel_display *display = to_intel_display(intel_dp);
-	struct intel_dp_link_config_entry *lc;
-	int num_common_lane_configs;
-	int i;
-	int j;
-
-	if (drm_WARN_ON(display->drm, !is_power_of_2(intel_dp_max_common_lane_count(intel_dp))))
-		return;
-
-	num_common_lane_configs = ilog2(intel_dp_max_common_lane_count(intel_dp)) + 1;
-
-	if (drm_WARN_ON(display->drm, intel_dp->num_common_rates * num_common_lane_configs >
-				    ARRAY_SIZE(intel_dp->link.configs)))
-		return;
-
-	intel_dp->link.num_configs = intel_dp->num_common_rates * num_common_lane_configs;
-
-	lc = &intel_dp->link.configs[0];
-	for (i = 0; i < intel_dp->num_common_rates; i++) {
-		for (j = 0; j < num_common_lane_configs; j++) {
-			lc->lane_count_exp = j;
-			lc->link_rate_idx = i;
-
-			lc++;
-		}
-	}
-
-	sort_r(intel_dp->link.configs, intel_dp->link.num_configs,
-	       sizeof(intel_dp->link.configs[0]),
-	       link_config_cmp_by_bw, NULL,
-	       intel_dp);
-}
-
-void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *link_rate, int *lane_count)
-{
-	struct intel_display *display = to_intel_display(intel_dp);
-	const struct intel_dp_link_config_entry *lc;
-
-	if (drm_WARN_ON(display->drm, idx < 0 || idx >= intel_dp->link.num_configs))
-		idx = 0;
-
-	lc = &intel_dp->link.configs[idx];
-
-	*link_rate = intel_dp_link_config_rate(intel_dp, lc);
-	*lane_count = intel_dp_link_config_lane_count(lc);
-}
-
-int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate, int lane_count)
-{
-	int link_rate_idx = intel_dp_rate_index(intel_dp->common_rates, intel_dp->num_common_rates,
-						link_rate);
-	int lane_count_exp = ilog2(lane_count);
-	int i;
-
-	for (i = 0; i < intel_dp->link.num_configs; i++) {
-		const struct intel_dp_link_config_entry *lc = &intel_dp->link.configs[i];
-
-		if (lc->lane_count_exp == lane_count_exp &&
-		    lc->link_rate_idx == link_rate_idx)
-			return i;
-	}
-
-	return -1;
-}
-
 /* Return %true if the common rates changed. */
 static bool intel_dp_set_common_rates(struct intel_dp *intel_dp)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 8cc6ea04e000c..fdf9bd88859e7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -108,8 +108,6 @@ int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
 int intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
 int intel_dp_rate_index(const int *rates, int len, int rate);
-int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate, int lane_count);
-void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *link_rate, int *lane_count);
 void intel_dp_update_sink_caps(struct intel_dp *intel_dp);
 void intel_dp_reset_link_params(struct intel_dp *intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 8ecdc01af70eb..6a37ba8c35e27 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -4,7 +4,9 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/log2.h>
 #include <linux/slab.h>
+#include <linux/sort.h>
 
 #include <drm/drm_print.h>
 
@@ -81,6 +83,106 @@ void intel_dp_link_caps_get_forced_params(struct intel_dp_link_caps *link_caps,
 	forced_params->lane_count = forced_lane_count(link_caps->dp);
 }
 
+static int intel_dp_link_config_rate(struct intel_dp *intel_dp,
+				     const struct intel_dp_link_config_entry *lc)
+{
+	return intel_dp_common_rate(intel_dp, lc->link_rate_idx);
+}
+
+static int intel_dp_link_config_lane_count(const struct intel_dp_link_config_entry *lc)
+{
+	return 1 << lc->lane_count_exp;
+}
+
+static int intel_dp_link_config_bw(struct intel_dp *intel_dp,
+				   const struct intel_dp_link_config_entry *lc)
+{
+	return drm_dp_max_dprx_data_rate(intel_dp_link_config_rate(intel_dp, lc),
+					 intel_dp_link_config_lane_count(lc));
+}
+
+static int link_config_cmp_by_bw(const void *a, const void *b, const void *p)
+{
+	struct intel_dp *intel_dp = (struct intel_dp *)p;	/* remove const */
+	const struct intel_dp_link_config_entry *lc_a = a;
+	const struct intel_dp_link_config_entry *lc_b = b;
+	int bw_a = intel_dp_link_config_bw(intel_dp, lc_a);
+	int bw_b = intel_dp_link_config_bw(intel_dp, lc_b);
+
+	if (bw_a != bw_b)
+		return bw_a - bw_b;
+
+	return intel_dp_link_config_rate(intel_dp, lc_a) -
+	       intel_dp_link_config_rate(intel_dp, lc_b);
+}
+
+void intel_dp_link_config_init(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_dp_link_config_entry *lc;
+	int num_common_lane_configs;
+	int i;
+	int j;
+
+	if (drm_WARN_ON(display->drm, !is_power_of_2(intel_dp_max_common_lane_count(intel_dp))))
+		return;
+
+	num_common_lane_configs = ilog2(intel_dp_max_common_lane_count(intel_dp)) + 1;
+
+	if (drm_WARN_ON(display->drm, intel_dp->num_common_rates * num_common_lane_configs >
+				    ARRAY_SIZE(intel_dp->link.configs)))
+		return;
+
+	intel_dp->link.num_configs = intel_dp->num_common_rates * num_common_lane_configs;
+
+	lc = &intel_dp->link.configs[0];
+	for (i = 0; i < intel_dp->num_common_rates; i++) {
+		for (j = 0; j < num_common_lane_configs; j++) {
+			lc->lane_count_exp = j;
+			lc->link_rate_idx = i;
+
+			lc++;
+		}
+	}
+
+	sort_r(intel_dp->link.configs, intel_dp->link.num_configs,
+	       sizeof(intel_dp->link.configs[0]),
+	       link_config_cmp_by_bw, NULL,
+	       intel_dp);
+}
+
+void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *link_rate, int *lane_count)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	const struct intel_dp_link_config_entry *lc;
+
+	if (drm_WARN_ON(display->drm, idx < 0 || idx >= intel_dp->link.num_configs))
+		idx = 0;
+
+	lc = &intel_dp->link.configs[idx];
+
+	*link_rate = intel_dp_link_config_rate(intel_dp, lc);
+	*lane_count = intel_dp_link_config_lane_count(lc);
+}
+
+int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate, int lane_count)
+{
+	int link_rate_idx = intel_dp_rate_index(intel_dp->common_rates, intel_dp->num_common_rates,
+						link_rate);
+	int lane_count_exp = ilog2(lane_count);
+	int i;
+
+	for (i = 0; i < intel_dp->link.num_configs; i++) {
+		const struct intel_dp_link_config_entry *lc = &intel_dp->link.configs[i];
+
+		if (lc->lane_count_exp == lane_count_exp &&
+		    lc->link_rate_idx == link_rate_idx)
+			return i;
+	}
+
+	return -1;
+}
+
 static int i915_dp_force_link_rate_show(struct seq_file *m, void *data)
 {
 	struct intel_connector *connector = to_intel_connector(m->private);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
index c6a84891db464..dab956e804b95 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
@@ -17,6 +17,11 @@ int intel_dp_max_common_rate(struct intel_dp *intel_dp);
 void intel_dp_link_caps_get_forced_params(struct intel_dp_link_caps *link_caps,
 					  struct intel_dp_link_config *forced_params);
 
+int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate, int lane_count);
+void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *link_rate, int *lane_count);
+
+void intel_dp_link_config_init(struct intel_dp *intel_dp);
+
 void intel_dp_link_caps_debugfs_add(struct intel_connector *connector);
 
 struct intel_dp_link_caps *intel_dp_link_caps_init(struct intel_dp *intel_dp);
-- 
2.45.2

