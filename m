Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75704C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 10:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F307610E15D;
	Tue,  4 Aug 2026 10:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/9iedj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5129610E15D;
 Tue,  4 Aug 2026 10:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785840957; x=1817376957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O6wwMAM+fEfHTgIXkcvGQvpIvUA2nEyOammVU/2TQsc=;
 b=l/9iedj3TQCyDZyHtQuOkKXyC6YHCg7r5No7aU05cwbGiYYxJQVLhI1R
 i8ghM3+UA5Y9kYiP1e8dDbBf7hA0dE69QXoPvzmFUZN8TS2xKeiblUrU6
 P2uZ+HtXzKbPT0aj3DPIQnuuw5lAAxADfGHbIsGDebzF8/w/66AwK8vYe
 92Ki4v5UzKKLCWDLCCHSPabtxTihblFyQY1NrG780E9vsLoWFhdHlQo/f
 TRMH5Xv2M1m87NAVczjwqEllWkaDLY9NQl+Vz7RsfcRXgvrv/sBgKARzo
 JPJ4otpIbb50r4dYN4tj2lYpjKrCvbQWn0rn5ypdzOceKnfscFgohQxfM g==;
X-CSE-ConnectionGUID: GSWPzPhWR2eTIMoVdw3ckw==
X-CSE-MsgGUID: mRteFlLxQOa1wbo/WyBQnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97546861"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97546861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:55:56 -0700
X-CSE-ConnectionGUID: ieuHBROmQJm9tinwaiFTyw==
X-CSE-MsgGUID: 468n4fpOQrm56V3Kweqyvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="262086291"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa009.jf.intel.com with ESMTP; 04 Aug 2026 03:55:54 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2] drm/i915/dp: Use array size for intersect_rates() bound
Date: Tue,  4 Aug 2026 16:25:49 +0530
Message-Id: <20260804105549.1435154-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804085658.1306761-1-suraj.kandpal@intel.com>
References: <20260804085658.1306761-1-suraj.kandpal@intel.com>
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

Take an explicit common_len parameter and pass
ARRAY_SIZE(intel_dp->common_rates) at the call site, so the bound is
tied to the destination array.

Fixes: e6bda3e4cb43 ("drm/i915: Avoid overflowing the DP link rate arrays")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
-Use latest baseline (Jani)

 drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7f13595f40c1..1f1324c99130 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -625,13 +625,13 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
 
 static int intersect_rates(const int *source_rates, int source_len,
 			   const int *sink_rates, int sink_len,
-			   int *common_rates)
+			   int *common_rates, int common_len)
 {
 	int i = 0, j = 0, k = 0;
 
 	while (i < source_len && j < sink_len) {
 		if (source_rates[i] == sink_rates[j]) {
-			if (WARN_ON(k >= DP_MAX_SUPPORTED_RATES))
+			if (WARN_ON(k >= common_len))
 				return k;
 			common_rates[k] = source_rates[i];
 			++k;
@@ -660,6 +660,7 @@ int intel_dp_rate_index(const int *rates, int len, int rate)
 
 static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
 				      int common_rates[DP_MAX_SUPPORTED_RATES],
+				      int common_len,
 				      int *num_common_rates)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
@@ -671,7 +672,8 @@ static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
 					    intel_dp->num_source_rates,
 					    intel_dp->sink_rates,
 					    intel_dp->num_sink_rates,
-					    common_rates);
+					    common_rates,
+					    common_len);
 
 	/* Paranoia, there should always be something in common. */
 	if (drm_WARN_ON(display->drm, *num_common_rates == 0)) {
@@ -687,7 +689,8 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
 	int common_rates[DP_MAX_SUPPORTED_RATES];
 	bool params_changed = false;
 
-	intel_dp_get_common_rates(intel_dp, common_rates, &num_common_rates);
+	intel_dp_get_common_rates(intel_dp, common_rates, ARRAY_SIZE(common_rates),
+				  &num_common_rates);
 	if (intel_dp_link_caps_update(intel_dp->link.caps,
 				      common_rates, num_common_rates,
 				      intel_dp_get_max_common_lane_count(intel_dp),
-- 
2.34.1

