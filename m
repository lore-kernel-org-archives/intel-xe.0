Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB487CDB471
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA4C10ED4A;
	Tue, 23 Jun 2026 22:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOf3PU+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E3C10ED43;
 Tue, 23 Jun 2026 22:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254876; x=1813790876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bTEPnOdSM8GG+KJSimNmSM18YQDKnKYwdCvt3Xp4yEU=;
 b=BOf3PU+hZ+BT/YQoo35hsk3/eISQAoXzfN7mGraZgeI1bnHFSBtc4b77
 Bu1e3OZWCRGxIuEks54pqggCVEbX1da5TwhWKNqY9Q9VbPEl8ukbp1Y3s
 L42kgqGU/qVUaXeBeTlF2qTXss+2i7IlQXC+S95GDw7whUpab7IYEfrNz
 FHASjnJeP6iof1WU0tAydokhcdp7FWcgLFqRrBWaqmGi7WcW3eWcI5cg8
 OSJsV+EL+kZMdLJOjvretV66eCF8mMliVaWTieQL1Uptlzo6eQsf5KKqF
 HOjZG+Qfp60kHtrcMQS2mAQPNVU60UI6TNLY+d7xu0m6WkO9ZDVbsk573 w==;
X-CSE-ConnectionGUID: DS1dZGk3R6GW8fInc1AHLQ==
X-CSE-MsgGUID: 22v1NP8jQGW90ynpAihLJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775611"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775611"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:56 -0700
X-CSE-ConnectionGUID: oT2ez/RDTdmF2/Vf9THmWg==
X-CSE-MsgGUID: pAOv9I0PSa6mtPki49+nFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497162"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 25/30] drm/i915/dp_link_caps: Move max link limits to
 link_caps
Date: Wed, 24 Jun 2026 00:46:14 +0200
Message-ID: <20260623224619.1949975-26-michal.grzelak@intel.com>
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

Now that all users access the max link limits via helpers, move tracking
of these limits from struct intel_dp to the link_caps state.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  4 ----
 .../gpu/drm/i915/display/intel_dp_link_caps.c | 21 ++++++++++++-------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8610c6e967ec8..3a957106d6d42 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1837,10 +1837,6 @@ struct intel_dp {
 	struct {
 		/* TODO: move the rest of link specific fields to here */
 		bool active;
-		/* Max lane count for the current link */
-		int max_lane_count;
-		/* Max rate for the current link */
-		int max_rate;
 		/*
 		 * Link parameters for which the MST topology was probed.
 		 * Tracking these ensures that the MST path resources are
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 9b7da5a64ee25..43427e7cf422a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -46,6 +46,17 @@ struct intel_dp_link_caps {
 	 * disconnects.
 	 */
 	struct intel_dp_link_config forced_params;
+
+	/*
+	 * User set maximum limits. These limits constrain the currently
+	 * allowed set of configurations and are not adjusted when sink
+	 * capabilities change.
+	 *
+	 * max_limits.rate/lane_count may come from different allowed
+	 * configurations, i.e. the (max_limits.rate, max_limits.lane_count)
+	 * tuple itself may not be an allowed configuration.
+	 */
+	struct intel_dp_link_config max_limits;
 };
 
 /* Get length of common rates array potentially limited by max_rate. */
@@ -154,10 +165,7 @@ static int intel_dp_link_config_lane_count(const struct intel_dp_link_config_ent
 static void set_max_link_limits_no_update(struct intel_dp_link_caps *link_caps,
 					  const struct intel_dp_link_config *max_link_limits)
 {
-	struct intel_dp *intel_dp = link_caps->dp;
-
-	intel_dp->link.max_rate = max_link_limits->rate;
-	intel_dp->link.max_lane_count = max_link_limits->lane_count;
+	link_caps->max_limits = *max_link_limits;
 }
 
 static void reset_max_link_limits_no_update(struct intel_dp_link_caps *link_caps)
@@ -194,10 +202,7 @@ static void reset_max_link_limits_no_update(struct intel_dp_link_caps *link_caps
 void intel_dp_link_caps_get_max_limits(struct intel_dp_link_caps *link_caps,
 				       struct intel_dp_link_config *max_link_limits)
 {
-	struct intel_dp *intel_dp = link_caps->dp;
-
-	max_link_limits->rate = intel_dp->link.max_rate;
-	max_link_limits->lane_count = intel_dp->link.max_lane_count;
+	*max_link_limits = link_caps->max_limits;
 }
 
 /**
-- 
2.45.2

