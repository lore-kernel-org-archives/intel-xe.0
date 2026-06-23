Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C457CDB481
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031CF10ED24;
	Tue, 23 Jun 2026 22:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjyKBOfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5E210ED21;
 Tue, 23 Jun 2026 22:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254850; x=1813790850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+L5rfqsRYMmq6h7AKBSZht+omvP8O2V6u5buiApY7XQ=;
 b=YjyKBOfkBQXcXQ8zYOYQy/5eVbEn8eONNJSXVwsZWvfmmH/ccalsP7yg
 NX0rlA2msc7vZppvkjdJ1QhEbcwBiRmyM9vtmiGikedG8oyS9X43hSIew
 y0bu2Ne7pEN0fira3xY26I6oMFgV0wTKOofXEVDNs1PXGX1kyF+q8LE0U
 rk9+qkIwpha55KRJNudvsFa1TrPDE88AY2pHawDYhFuiftiO6jJqZlHVt
 NHAhbn+NeAdg/p0jUjR7fbgwh3EwgO/DNNNoQdY4uIHJPZUjIT9aOB1IV
 rwExxrNxmFijgtOK4mCrXfRV8ui0c9fcp+lszyjEKQP8NlEDAF5JS9AaJ A==;
X-CSE-ConnectionGUID: pjZttrV+RQOfQ0gLSSI07Q==
X-CSE-MsgGUID: wt46jgV2RhqDICbiTUQ4HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775578"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775578"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:30 -0700
X-CSE-ConnectionGUID: 57BCOVdeSFuVr1DKvW20sg==
X-CSE-MsgGUID: CAHC0wkuQ0SPJjiMOH0HWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497119"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:28 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 12/30] drm/i915/dp_link_caps: Rename helper updating the
 link configurations
Date: Wed, 24 Jun 2026 00:46:01 +0200
Message-ID: <20260623224619.1949975-13-michal.grzelak@intel.com>
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

Rename the helper updating link configurations to
intel_dp_link_caps_update() to better reflect its functionality.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c           | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_link_caps.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c4b650431eff5..65a13b2f7584d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -720,7 +720,7 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
 	if (intel_dp_set_max_common_lane_count(intel_dp))
 		params_changed = true;
 
-	intel_dp_link_config_init(intel_dp);
+	intel_dp_link_caps_update(intel_dp);
 
 	return params_changed;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 05ec933c74407..2074952931738 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -131,7 +131,7 @@ static int link_config_cmp_by_bw(const void *a, const void *b, const void *p)
 	       intel_dp_link_config_rate(intel_dp, lc_b);
 }
 
-void intel_dp_link_config_init(struct intel_dp *intel_dp)
+void intel_dp_link_caps_update(struct intel_dp *intel_dp)
 {
 	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
 	struct intel_display *display = to_intel_display(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
index dab956e804b95..aed2122a05d24 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
@@ -20,7 +20,7 @@ void intel_dp_link_caps_get_forced_params(struct intel_dp_link_caps *link_caps,
 int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate, int lane_count);
 void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *link_rate, int *lane_count);
 
-void intel_dp_link_config_init(struct intel_dp *intel_dp);
+void intel_dp_link_caps_update(struct intel_dp *intel_dp);
 
 void intel_dp_link_caps_debugfs_add(struct intel_connector *connector);
 
-- 
2.45.2

