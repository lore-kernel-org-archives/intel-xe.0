Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F057ACDB47F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED9210ED2C;
	Tue, 23 Jun 2026 22:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgZvuQNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA7D10ED24;
 Tue, 23 Jun 2026 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254856; x=1813790856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIINNQOCDnBy1Ys+4RSo16jTa1FuYCGvCmjUuHee3AA=;
 b=OgZvuQNm579tzzRXgxEccoElIhJOPZGGXDK5Jf6XhgDvQvJ3jApGiPlx
 xgDD7ZZuyp2WeQ859bxcTmpIYWyY3t/j8tVpqtQ7pVtYYRgR6qj/i8tJZ
 RlQlkC47If7cJWdG3xVBrEYFLfjZvOqYBPfUBONEFz5uAB6zX3QwXxgII
 3OlLH7yTTOXsUYMIgdoshV9DWdwcPfPdMNuK/qLbtSzvXQDaobuFy9kQH
 NjIjAK0LPjYhU7wNkRLsheOSJhriWikxyx9x2T86NX64lhEsA5JYsxyZr
 0cMw2Wy/5JRO1CEee5b9JZ4VehSoJOR50xv1MZsK7NNbNgt0nOy6B+K8A A==;
X-CSE-ConnectionGUID: 3L3SkudzQrWhqLKUdprtfQ==
X-CSE-MsgGUID: N/R9WpduQV6hrsqOjWPV7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775593"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:36 -0700
X-CSE-ConnectionGUID: JuHJxcqURyOmcqUkUesbZQ==
X-CSE-MsgGUID: 6xVhgEPZQQuVXPZ31KnHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497128"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:33 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 15/30] drm/i915/dp_link_caps: Add helper to print all
 supported link rates
Date: Wed, 24 Jun 2026 00:46:04 +0200
Message-ID: <20260623224619.1949975-16-michal.grzelak@intel.com>
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

Add intel_dp_link_caps_print_rates() to print all the supported link
rates tracked by the link_caps module. This prepares for tracking
these capabilities internally within the link caps module.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c           |  4 +---
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_link_caps.h |  2 ++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d2b9b6fce2b32..f9c3d3561c417 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1543,9 +1543,7 @@ static void intel_dp_print_rates(struct intel_dp *intel_dp)
 	seq_buf_print_array(&s, intel_dp->sink_rates, intel_dp->num_sink_rates);
 	drm_dbg_kms(display->drm, "sink rates: %s\n", seq_buf_str(&s));
 
-	seq_buf_clear(&s);
-	seq_buf_print_array(&s, intel_dp->common_rates, intel_dp->num_common_rates);
-	drm_dbg_kms(display->drm, "common rates: %s\n", seq_buf_str(&s));
+	intel_dp_link_caps_print_common_rates(intel_dp->link.caps);
 }
 
 int
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 679d59cc256c9..13f9bfd5d7bad 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -6,6 +6,7 @@
 #include <linux/bitops.h>
 #include <linux/debugfs.h>
 #include <linux/log2.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/string.h>
@@ -66,6 +67,19 @@ int intel_dp_max_common_rate(struct intel_dp *intel_dp)
 	return intel_dp_common_rate(intel_dp, intel_dp->num_common_rates - 1);
 }
 
+void intel_dp_link_caps_print_common_rates(struct intel_dp_link_caps *link_caps)
+{
+	struct intel_dp *intel_dp = link_caps->dp;
+	struct intel_display *display = to_intel_display(intel_dp);
+	DECLARE_SEQ_BUF(s, 128);
+	int i;
+
+	for (i = 0; i < intel_dp->num_common_rates; i++)
+		seq_buf_printf(&s, "%s%d", i ? ", " : "", intel_dp->common_rates[i]);
+
+	drm_dbg_kms(display->drm, "common rates: %s\n", seq_buf_str(&s));
+}
+
 static int forced_lane_count(struct intel_dp *intel_dp)
 {
 	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
index 09e580bc5c9b3..7333df6b82f97 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
@@ -16,6 +16,8 @@ int intel_dp_common_len_rate_limit(const struct intel_dp *intel_dp,
 int intel_dp_common_rate(struct intel_dp *intel_dp, int index);
 int intel_dp_max_common_rate(struct intel_dp *intel_dp);
 
+void intel_dp_link_caps_print_common_rates(struct intel_dp_link_caps *link_caps);
+
 void intel_dp_link_caps_get_forced_params(struct intel_dp_link_caps *link_caps,
 					  struct intel_dp_link_config *forced_params);
 
-- 
2.45.2

