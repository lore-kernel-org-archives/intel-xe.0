Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D090EC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A3A10EAF9;
	Tue,  8 Sep 2026 10:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRW5NZsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55810EAF9;
 Tue,  8 Sep 2026 10:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862051; x=1820398051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HBhzUzpaFbtZUb1Zfgssi0AuwbWwqd49bwb8RgBcJsg=;
 b=gRW5NZsbmbcSfCu4pyrUN1aLJDp9v0JqXkOLIs48ghtiiKJ+3gcmiFjm
 VqjP7EZS/gS8ZxYEAhOyf6vZB9GigWeG3UbUvKA+8XHKddzZHFn2OwWK+
 GAHFoTNTlRhoUAIjrN6gogx6jVlsofC98i0dHyUDlLssltfD+MeestY3C
 yND4ZXb2ytfmsgHOHRUXYDaCB2mW2c2LtxYPl5F+8JcCS+QlFA+n1dHy2
 lBSlZpD0WbCEJGvmygTWlsalD6nsCToHUI5i2x4R9ApXzZntSw6KJy3Jw
 CuxbtZnld3Iff9i8JMDGQej9X+cqyt8XWg+IN2HShRVqyGqIEIuQIwQy6 A==;
X-CSE-ConnectionGUID: HzZ2JcuYQYqLIJ7JAQ1TVw==
X-CSE-MsgGUID: b+Y9xIDgQmOXRJzKRnDoOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="112037090"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="112037090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:07:31 -0700
X-CSE-ConnectionGUID: Ztg8iGRLT0eVkJJsC/zR1w==
X-CSE-MsgGUID: 5GP1rTb3R+ai12ykNR5MBg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.144])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:07:28 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	imre.deak@intel.com
Subject: [PATCH] drm/i915/display: check configuration index before shifting
Date: Tue,  8 Sep 2026 13:06:51 +0300
Message-ID: <20260908100659.113555-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

The calc_allowed_config_filter() function passes the return value of
iter_pos_to_idx() directly to BIT(), but the helper can return -1 for
an invalid iterator.

The iterator already rejects negative indices before doing a
configuration, so this should not matter in normal flows.  In any
case, for robustness, check the index explicitly and warn if it is
negative, avoiding an undefined shift.

Fixes: 39e30bdf2f92 ("drm/i915/dp_link_caps: Add link configuration iterator")
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 7b6cc6055da8..98657aa4d3d5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -426,12 +426,15 @@ calc_allowed_config_filter(struct intel_dp_link_caps *link_caps,
 			   const struct intel_dp_link_config *forced_params)
 {
 	struct intel_dp_link_caps_filter allowed_configs = INTEL_DP_LINK_CAPS_FILTER_NONE;
+	struct intel_display *display = to_intel_display(link_caps->dp);
 	struct intel_dp_link_caps_order order = bw_desc_config_order();
 	struct intel_dp_link_caps_iter iter;
 	struct intel_dp_link_config config;
 
 	iter_start(&iter, link_caps, order, enabled_configs);
 	for_each_dp_link_config(&iter, &config) {
+		int config_idx;
+
 		if (forced_params->rate &&
 		    forced_params->rate != config.rate)
 			continue;
@@ -446,7 +449,11 @@ calc_allowed_config_filter(struct intel_dp_link_caps *link_caps,
 		if (config.lane_count > max_limits->lane_count)
 			continue;
 
-		allowed_configs.config_mask |= BIT(iter_pos_to_idx(link_caps, order, iter.pos));
+		config_idx = iter_pos_to_idx(link_caps, order, iter.pos);
+		if (drm_WARN_ON(display->drm, config_idx < 0))
+			continue;
+
+		allowed_configs.config_mask |= BIT(config_idx);
 	}
 	intel_dp_link_caps_iter_end(&iter);
 
-- 
2.53.0

