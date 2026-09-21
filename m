Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48351C982EF
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ABB10E285;
	Mon, 21 Sep 2026 05:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNgHUZe7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380FD10E253;
 Mon, 21 Sep 2026 05:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969045; x=1821505045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ZieTW5J4dc83IHlaNzQ1d1jW/29EEkRkKAJY/s8clY=;
 b=bNgHUZe7ffhBogJ4KnwKWxU/O6TS6zGe26QSlz0/LWfSIx4//ad3y6jK
 fC1QkWFnk4+Pz0S36mwXy5dgzSbHUEps4ZQcBRxaQjv1Te8isx/aUpB7a
 ueb0vphWtUnqzzUFiEEFAyR44lPbRDwqcyUMYuSiJ5y3W64SQwOthLjct
 Wqi2EMaf1XniAkBngCwkco300XlP9B2ui2Muj06H1M7gZ8bYq8ywUmFQa
 4wfHJ/W1eGUso6GKtZIRAfHlgXyoT3Nzqt+0YAXzVX0G+01KXlBBuQR9C
 RnZ0HmiXbnfO8Y3b9pgN4Lkp0RS84r8KDDHbVqd0+B49o1PcffET9nZPC w==;
X-CSE-ConnectionGUID: jqj8Qy8ZQly8GbLyL7LBdA==
X-CSE-MsgGUID: 6zmjC145QamdaloRwrrYBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966629"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:25 -0700
X-CSE-ConnectionGUID: IHPrJM+aRkiJtVDmeWNh/w==
X-CSE-MsgGUID: YCFlJBywQlq3S1jTwvBhqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444489"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:23 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 6/8] drm/i915/linktraining: log link training DPCD access
 errors
Date: Mon, 21 Sep 2026 11:07:08 +0530
Message-Id: <20260921053710.1586776-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921053710.1586776-1-suraj.kandpal@intel.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
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

Now that the DPCD accessors return a proper error code, include it in
the error messages using %pe and ERR_PTR(), instead of just stating
that the access failed.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index b6e8b13ee4db..ac1aff6edf05 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1635,7 +1635,8 @@ intel_dp_128b132b_intra_hop(struct intel_dp *intel_dp,
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SINK_STATUS, &sink_status);
 	if (ret < 0) {
-		lt_dbg(intel_dp, DP_PHY_DPRX, "Failed to read sink status\n");
+		lt_dbg(intel_dp, DP_PHY_DPRX, "Failed to read sink status (%pe)\n",
+		       ERR_PTR(ret));
 		return ret;
 	}
 
@@ -2180,7 +2181,8 @@ intel_dp_128b132b_lane_cds(struct intel_dp *intel_dp,
 	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
 				     DP_TRAINING_PATTERN_2_CDS);
 	if (ret < 0) {
-		lt_err(intel_dp, DP_PHY_DPRX, "Failed to start 128b/132b TPS2 CDS\n");
+		lt_err(intel_dp, DP_PHY_DPRX, "Failed to start 128b/132b TPS2 CDS (%pe)\n",
+		       ERR_PTR(ret));
 		return false;
 	}
 
-- 
2.34.1

