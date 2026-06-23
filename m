Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BE7CDB47F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7AD10ED3B;
	Tue, 23 Jun 2026 22:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNvVfcRk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A2A10ED3B;
 Tue, 23 Jun 2026 22:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254872; x=1813790872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a6VMNZ8MTAZTEi3aQeGU5wTnS1jQmmgILQzLjonQzs4=;
 b=mNvVfcRkLBdIOKF+kJDL1QIgnctr4m0DY1+fRDjpLF1/qj2SP0yQSScP
 Ztdo32bwLCqHblVpj1rGrw+p96HDC5JwunM78AaP0Q/tJdTxZLeWqF7mk
 7Zof5jgGKsDASB/0rHLKkzYfvwxPfkvK8koOkFY9YBwAHj7QRkw41pI45
 SDeW/MKqNZewwBQUIUTBaBVO2liqGl2PUfKSLnNDhwtR6ZYptsnYBPT6N
 w1UbbRhxTzyrBdwWTjcWs8g1lUNaD/GFnbpUt6ivqmOLr4HWwxvyARcr0
 M0Q6i5lvkw3r8ZDMAxtp0Ssg9ZHasmX8DCg5NGa4BFLTuvghTT981dGLv w==;
X-CSE-ConnectionGUID: 9ctiFUgyRo6Nh6tZrW/csA==
X-CSE-MsgGUID: L48vVfTfQySwgcapsn+qTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775609"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775609"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:52 -0700
X-CSE-ConnectionGUID: w32FD4OmRwKxfvjbz2HQFQ==
X-CSE-MsgGUID: DaCqm5cRRBKCkUXEK4LzKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497153"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:50 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 23/30] drm/i915/dp_link_caps: Add helper to reset max link
 limits
Date: Wed, 24 Jun 2026 00:46:12 +0200
Message-ID: <20260623224619.1949975-24-michal.grzelak@intel.com>
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

Add a helper to reset the link_caps::max_limits max link limits to the
maximum common supported rate and lane count.

This is needed by a follow-up change in the link training fallback code,
which temporarily resets max_limits before searching for a fallback
configuration.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_link_caps.c | 22 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_caps.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index e568f00720d31..ae10200bdd934 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -160,6 +160,16 @@ static void set_max_link_limits_no_update(struct intel_dp_link_caps *link_caps,
 	intel_dp->link.max_lane_count = max_link_limits->lane_count;
 }
 
+static void reset_max_link_limits_no_update(struct intel_dp_link_caps *link_caps)
+{
+	struct intel_dp_link_config max_link_limits = {
+		.rate = intel_dp_max_common_rate(link_caps->dp),
+		.lane_count = intel_dp_link_caps_max_common_lane_count(link_caps),
+	};
+
+	set_max_link_limits_no_update(link_caps, &max_link_limits);
+}
+
 /**
  * intel_dp_link_caps_get_max_limits - get the current maximum link limits
  * @link_caps: link capabilities state
@@ -216,6 +226,18 @@ bool intel_dp_link_caps_set_max_limits(struct intel_dp_link_caps *link_caps,
 	return true;
 }
 
+/**
+ * intel_dp_link_caps_reset_max_limits - reset the current maximum link limits
+ * @link_caps: link capabilities state
+ *
+ * Reset the current maximum link limits to the maximum supported common link
+ * rate and lane count.
+ */
+void intel_dp_link_caps_reset_max_limits(struct intel_dp_link_caps *link_caps)
+{
+	reset_max_link_limits_no_update(link_caps);
+}
+
 static int intel_dp_link_config_bw(struct intel_dp *intel_dp,
 				   const struct intel_dp_link_config_entry *lc)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
index c6c60b7888874..7baeb4359d2d4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
@@ -31,6 +31,7 @@ void intel_dp_link_caps_get_max_limits(struct intel_dp_link_caps *link_caps,
 				       struct intel_dp_link_config *max_link_limits);
 bool intel_dp_link_caps_set_max_limits(struct intel_dp_link_caps *link_caps,
 				       const struct intel_dp_link_config *max_link_limits);
+void intel_dp_link_caps_reset_max_limits(struct intel_dp_link_caps *link_caps);
 
 bool intel_dp_link_caps_update(struct intel_dp *intel_dp,
 			       const int *rates, int num_rates, int max_lane_count);
-- 
2.45.2

