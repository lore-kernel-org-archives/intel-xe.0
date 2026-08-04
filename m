Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB06C5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CF110E927;
	Tue,  4 Aug 2026 09:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doyqZwaZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA20710E927;
 Tue,  4 Aug 2026 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785834150; x=1817370150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1dSv22Sg9W+d9jiFucndyISRVTaMhQ7Bo848YHaqWTc=;
 b=doyqZwaZdx1KgK5SG9qZ02p0pbcrQtwHgUQ/8BZnYOvnkCB+smmmSrxm
 t6weEg4fqWdgZDif81COje81v3m+/Q75BNAQluN99abGA50iBiK2Wuz6D
 ftJwCnnUnRDejV1DroAtYi3dRVT46w67WGZRQFy8esFTHpFhUkZFFivlh
 EvrY4XKd3LPvgC2Tl6t5rYTgfQjFzp/pkkkEf707DdXK2caSsQMHlCMWd
 n/1rl6eZFehRbUuOLx++M8QDGsxFowgbHjE+ZeU6sWxsOzmED2gpYUhqP
 qCB9Y8nlwOgW62Qs23n1u0IeqccqBBfam3ueIf2yXfwRLbcl8r3wU/Kec A==;
X-CSE-ConnectionGUID: CgdTU3TdSCCqq8QHk+A0HQ==
X-CSE-MsgGUID: 7f1np6LnRBmHOCj/o9HGpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86390524"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86390524"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:02:30 -0700
X-CSE-ConnectionGUID: 9A39Q5V+R9m/7Jb8QY54MA==
X-CSE-MsgGUID: twl1tFmPRF6E3J3zraElxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="257124661"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2026 01:57:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/dp: Use array size for intersect_rates() bound
Date: Tue,  4 Aug 2026 14:26:59 +0530
Message-Id: <20260804085658.1306761-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7f13595f40c1..dd0fbb0ba20d 100644
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
@@ -671,7 +671,8 @@ static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
 					    intel_dp->num_source_rates,
 					    intel_dp->sink_rates,
 					    intel_dp->num_sink_rates,
-					    common_rates);
+					    intel_dp->common_rates,
+					    ARRAY_SIZE(intel_dp->common_rates));
 
 	/* Paranoia, there should always be something in common. */
 	if (drm_WARN_ON(display->drm, *num_common_rates == 0)) {
-- 
2.34.1

