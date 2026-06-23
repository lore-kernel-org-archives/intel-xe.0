Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68668CDB481
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC4610ED35;
	Tue, 23 Jun 2026 22:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQn+2+7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DE210ED28;
 Tue, 23 Jun 2026 22:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254858; x=1813790858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7bqmdPVx0zMj0KryvMOvaLdRjHndjsEDf655U9DgrfM=;
 b=BQn+2+7iiB8YbTYIjyeNtie++4bQYbew/ykK0/Fq6ICtVIwDiki22YGS
 ZITkXhA4g2P8SGhwDZ6PQaOe77awRfoqblU9d9WoIVEHcN61A8MSV0mNi
 9ee2J+6z6DdyrThnaBFrrdGDW85suTh9baP/mJGyjoaN5eLEvFMHDWrq9
 xcOT4pppTmqsNyh2LhqzNcW+WiMYzHC5Y/yoHqwRuXqnzt/5vVnGXZohZ
 SwpoyTxkW8hHlMJBMMGRt2V8vBXCv8TiPBS1r55O+ICVLIneWJbhgsrZQ
 mH3MqTVwyfjPhUHxkBl+vNRqdJ6L6r/J/ICjJR53jo0NnPJPPOIIreybi w==;
X-CSE-ConnectionGUID: HSyQaBeeSCCzlIbB9zyfqg==
X-CSE-MsgGUID: O08snoyyQpG9MPVpXuJLVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775595"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:38 -0700
X-CSE-ConnectionGUID: eidB4W/BRq6+vUXYb3UNqw==
X-CSE-MsgGUID: G4glb4w3TSKWU1IJRHZI2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497131"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:36 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 16/30] drm/i915/dp_link_caps: Add helper to get the number
 of supported link rates
Date: Wed, 24 Jun 2026 00:46:05 +0200
Message-ID: <20260623224619.1949975-17-michal.grzelak@intel.com>
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

Add intel_dp_link_caps_num_common_rates() to return the number of
supported link rates tracked by the link_caps module. This prepares for
tracking these capabilities internally within the link caps module.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c           | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_dp_link_caps.h | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f9c3d3561c417..84640c8394534 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1766,7 +1766,7 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
 		int link_bpp_x16 =
 			intel_dp_output_format_link_bpp_x16(pipe_config->output_format, bpp);
 
-		for (i = 0; i < intel_dp->num_common_rates; i++) {
+		for (i = 0; i < intel_dp_link_caps_num_common_rates(intel_dp->link.caps); i++) {
 			link_rate = intel_dp_common_rate(intel_dp, i);
 			if (link_rate < limits->min_rate ||
 			    link_rate > limits->max_rate)
@@ -1995,7 +1995,7 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
 	int link_rate, lane_count;
 	int i;
 
-	for (i = 0; i < intel_dp->num_common_rates; i++) {
+	for (i = 0; i < intel_dp_link_caps_num_common_rates(intel_dp->link.caps); i++) {
 		link_rate = intel_dp_common_rate(intel_dp, i);
 		if (link_rate < limits->min_rate || link_rate > limits->max_rate)
 			continue;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 13f9bfd5d7bad..09b60a0cd6fbb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -67,6 +67,11 @@ int intel_dp_max_common_rate(struct intel_dp *intel_dp)
 	return intel_dp_common_rate(intel_dp, intel_dp->num_common_rates - 1);
 }
 
+int intel_dp_link_caps_num_common_rates(struct intel_dp_link_caps *link_caps)
+{
+	return link_caps->dp->num_common_rates;
+}
+
 void intel_dp_link_caps_print_common_rates(struct intel_dp_link_caps *link_caps)
 {
 	struct intel_dp *intel_dp = link_caps->dp;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
index 7333df6b82f97..3413f6f760453 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
@@ -15,6 +15,7 @@ int intel_dp_common_len_rate_limit(const struct intel_dp *intel_dp,
 				   int max_rate);
 int intel_dp_common_rate(struct intel_dp *intel_dp, int index);
 int intel_dp_max_common_rate(struct intel_dp *intel_dp);
+int intel_dp_link_caps_num_common_rates(struct intel_dp_link_caps *link_caps);
 
 void intel_dp_link_caps_print_common_rates(struct intel_dp_link_caps *link_caps);
 
-- 
2.45.2

