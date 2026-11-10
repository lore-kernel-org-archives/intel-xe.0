Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF46606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CLmsf+mK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB8510F58B;
	Tue, 10 Nov 2026 11:56:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17CA10F58B;
 Tue, 10 Nov 2026 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794311780; x=1825847780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zrl/iXcSo4U7xaeos39byfcUdiEYLRBjnH/OX4sZSec=;
 b=CLmsf+mKv2QLTeWAEFSXhXB1ZDullztOV1NQLbzW2VlRiWnv11GNd9iH
 yR0odQMyb6cdZmTV/kCeS9UiAQHgYGQeKA4k9eKRkkJPYnTidyBAVF8lM
 4XdPtyx8n7tdV2V+phOUdfr4bzCu0KKA4TKtN1+pSIAcw8/MLJgQsAu/X
 eHf3C9uTlK2ywtW/dszRTuQFF2sYw+QpTlanwe4bCKbxMyAHYjc7E/1Mc
 QW0fMNak2adNQBQEee9a7D3cZjgjz7TXF+vO+l82V6evkSxzJkAnsLR3X
 66bBNZ/H5UzYBZ0NYVqCP7YRZ8zhWJw6IKWqSgbJaTTVwsRS3azVd0QbB w==;
X-CSE-ConnectionGUID: EjjnN35yTTSi7BE7nJhoeg==
X-CSE-MsgGUID: e41htmH0TXi3Rjyrk6wDkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3055640"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3055640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:56:17 -0800
X-CSE-ConnectionGUID: IkEGyKDDRCiVAbw5BZ5YFQ==
X-CSE-MsgGUID: FZyGK2r2RdKLgvNVQdtVPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8004341"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa005.jf.intel.com with ESMTP; 10 Nov 2026 03:56:16 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 4/4] drm/i915/dp: Use the VBT fast link training link config
 for eDP
Date: Tue, 10 Nov 2026 11:54:32 +0000
Message-ID: <20261110115432.894616-5-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110115432.894616-1-shawn.c.lee@intel.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When eDP fast link training is enabled, restrict the link configs
considered during compute config to VBT fast link training link
rate and lane count.

If none of the allowed link configs match, ignore the VBT params and
select the link config as before.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797618..0390bd62d759 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2824,6 +2824,62 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 	return true;
 }
 
+/*
+ * If the VBT enables eDP fast link training for the panel, restrict the
+ * candidate link configs to the VBT fast link training link rate and/or
+ * lane count (a zero value means no restriction for that parameter). The
+ * filter is intersected with any filter already set in @limits. If no
+ * allowed config matches (e.g. the VBT values are not supported by the
+ * source/sink, or link training fallback has disabled all such configs),
+ * the VBT params are ignored.
+ */
+static void
+intel_dp_apply_vbt_edp_link_config(struct intel_dp *intel_dp,
+				   struct intel_connector *connector,
+				   struct link_config_limits *limits)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
+	struct intel_dp_link_caps_filter vbt_filter = INTEL_DP_LINK_CAPS_FILTER_NONE;
+	struct intel_dp_link_caps_iter iter;
+	struct intel_dp_link_config config;
+	int vbt_rate = connector->panel.vbt.edp.rate;
+	int vbt_lanes = connector->panel.vbt.edp.lanes;
+
+	if (!intel_dp_is_edp(intel_dp) ||
+	    !connector->panel.vbt.edp.fast_link_training ||
+	    (!vbt_rate && !vbt_lanes))
+		return;
+
+	intel_dp_link_caps_iter_start(&iter, link_caps,
+				      intel_dp_link_caps_connector_compute_order(connector),
+				      limits->link_config_filter);
+	for_each_dp_link_config(&iter, &config) {
+		if (vbt_rate && config.rate != vbt_rate)
+			continue;
+		if (vbt_lanes && config.lane_count != vbt_lanes)
+			continue;
+
+		intel_dp_link_caps_filter_add(link_caps, &vbt_filter, &config);
+	}
+	intel_dp_link_caps_iter_end(&iter);
+
+	if (!vbt_filter.config_mask) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] VBT eDP link config (lanes %d, rate %d) not in allowed link configs, ignoring\n",
+			    connector->base.base.id, connector->base.name,
+			    vbt_lanes, vbt_rate);
+		return;
+	}
+
+	drm_dbg_kms(display->drm,
+		    "[CONNECTOR:%d:%s] Limiting link configs to VBT eDP lanes %d, rate %d\n",
+		    connector->base.base.id, connector->base.name,
+		    vbt_lanes, vbt_rate);
+
+	limits->link_config_filter = vbt_filter;
+}
+
 bool
 intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 			       struct drm_connector_state *conn_state,
@@ -2940,6 +2996,8 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		limits->link_config_filter = new_filter;
 	}
 
+	intel_dp_apply_vbt_edp_link_config(intel_dp, connector, limits);
+
 	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state, limits))
 		return false;
 
-- 
2.53.0

