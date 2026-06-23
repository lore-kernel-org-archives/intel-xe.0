Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22742CDB47F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D392A10ED27;
	Tue, 23 Jun 2026 22:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgYISY96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8080510ED24;
 Tue, 23 Jun 2026 22:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254852; x=1813790852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gty7qzFkRURBFu6fWtg5arEBoTK4B0UPR/NgF8klzbQ=;
 b=lgYISY96wewoE+PexvrA4B32lWdaHFGYlcFIOwT4/lyBS2flQOPOtAFL
 469zwkbrbffn34BEUcnZOnylEVg+t+yE7Z1cCNP+c8ykVhpCGZSVA+E3d
 vDkRC8Iom6GnGSAErfSKfVkw3QTI8nloWjO+h8Z+eJf8gQPH4TBlyNXLy
 Oic39LKYKPKrrEOk/82U4u5vkViRyYStJQ0NuTaPMlctTvSt7TETaJ2F5
 IqM25Mq8WsLl1JXNz37GfTxXsb7EKvSjV8aSyMnH+lWLlIuGgWkhKubDa
 RaHHUprEOyTLhHg6H+XFnq+7ApG6M4HBCGpUsPuWGvwWPjcZP0X646Ucm g==;
X-CSE-ConnectionGUID: sbtkjnVARTOXJpDvJogRSg==
X-CSE-MsgGUID: TosP8LhcQp+gGV7blBiTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775589"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775589"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:32 -0700
X-CSE-ConnectionGUID: XJRZnmW9S1mb3d0QOcgSKg==
X-CSE-MsgGUID: vhJtwEW/SvOx4NCHDageAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497122"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:29 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 13/30] drm/i915/dp: Factor out helper to get link rate
 capabilities
Date: Wed, 24 Jun 2026 00:46:02 +0200
Message-ID: <20260623224619.1949975-14-michal.grzelak@intel.com>
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

Factor out a helper to get the supported link rates. This allows to
gather all the link capabilities and pass these to the link capability
module from a single place. A follow-up change will extend this to
gather and pass the maximum lane count capability in the same way.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 37 +++++++++++++++----------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 65a13b2f7584d..635e3ede0d41e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -676,33 +676,40 @@ int intel_dp_rate_index(const int *rates, int len, int rate)
 	return -1;
 }
 
-/* Return %true if the common rates changed. */
-static bool intel_dp_set_common_rates(struct intel_dp *intel_dp)
+static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
+				      int common_rates[DP_MAX_SUPPORTED_RATES],
+				      int *num_common_rates)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	int num_old_common_rates = intel_dp->num_common_rates;
-	int old_common_rates[DP_MAX_SUPPORTED_RATES];
 
 	drm_WARN_ON(display->drm,
 		    !intel_dp->num_source_rates || !intel_dp->num_sink_rates);
 
+	*num_common_rates = intersect_rates(intel_dp->source_rates,
+					    intel_dp->num_source_rates,
+					    intel_dp->sink_rates,
+					    intel_dp->num_sink_rates,
+					    common_rates);
+
+	/* Paranoia, there should always be something in common. */
+	if (drm_WARN_ON(display->drm, *num_common_rates == 0)) {
+		common_rates[0] = 162000;
+		*num_common_rates = 1;
+	}
+}
+
+static bool intel_dp_set_common_rates(struct intel_dp *intel_dp)
+{
+	int num_old_common_rates = intel_dp->num_common_rates;
+	int old_common_rates[DP_MAX_SUPPORTED_RATES];
+
 	/* TODO: Add a struct containing both rates and number of rates. */
 	static_assert(__same_type(old_common_rates[0], intel_dp->common_rates[0]) &&
 		      sizeof(old_common_rates) == sizeof(intel_dp->common_rates));
 	memcpy(old_common_rates, intel_dp->common_rates,
 	       num_old_common_rates * sizeof(old_common_rates[0]));
 
-	intel_dp->num_common_rates = intersect_rates(intel_dp->source_rates,
-						     intel_dp->num_source_rates,
-						     intel_dp->sink_rates,
-						     intel_dp->num_sink_rates,
-						     intel_dp->common_rates);
-
-	/* Paranoia, there should always be something in common. */
-	if (drm_WARN_ON(display->drm, intel_dp->num_common_rates == 0)) {
-		intel_dp->common_rates[0] = 162000;
-		intel_dp->num_common_rates = 1;
-	}
+	intel_dp_get_common_rates(intel_dp, intel_dp->common_rates, &intel_dp->num_common_rates);
 
 	return num_old_common_rates != intel_dp->num_common_rates ||
 	       memcmp(old_common_rates, intel_dp->common_rates,
-- 
2.45.2

