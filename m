Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB2CC982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A1110E03E;
	Mon, 21 Sep 2026 05:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJdhJChR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D410E2BA;
 Mon, 21 Sep 2026 05:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969046; x=1821505046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R6BAo/VGb0CryeuG1g+fXGbWYPOhelKGOOUrsYzbm5o=;
 b=UJdhJChRNaDK+dtaJ6nY/O/Y3QE5g9NFTZxWByL/UlcusrcnOZiHAWgX
 QY0xJdfPqZO17DPHcsEo++P8Ykk7sqrRcfdM9GnfVY2ayVwAqwfh2JZWa
 T6etPr5uggSczqJ3PAsKUJz8KgZ4KioEnh846lOLThSv+BMznvgov+RCq
 xYJ0E8izNcuJLW4XhNiHsHyVe7cQrCllf3aWHqyb3EuaU2eoD9ZCkdRyl
 kkDOjIjkkHDrEJ4LRTjSnlfAjw1Wxqz6clMzePO6DE/BvK+JnXtxgjnqN
 pE8gR6X3z+KAfSJjdruxYywALpWkkDDC/5DsFPNC2b4HcEYfzvIJOieUs g==;
X-CSE-ConnectionGUID: y/rzcNRPTQav/3mgPeCvqw==
X-CSE-MsgGUID: IbqIeOqOSLyE6hlncHiGjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966630"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966630"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:26 -0700
X-CSE-ConnectionGUID: AeMR06cXTXiLBBe0zINZHQ==
X-CSE-MsgGUID: IdVC8uGWTvq5BKHrwxB8nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444498"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:25 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 7/8] drm/i915/dptest: log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:09 +0530
Message-Id: <20260921053710.1586776-8-suraj.kandpal@intel.com>
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

Store the EDID checksum write result in ret as well, so that it can be
logged the same way.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_test.c | 24 +++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.c b/drivers/gpu/drm/i915/display/intel_dp_test.c
index 424183a65155..17cf27273124 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_test.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_test.c
@@ -157,7 +157,7 @@ static u8 intel_dp_autotest_link_training(struct intel_dp *intel_dp)
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_LANE_COUNT,
 				    &test_lane_count);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "Lane count read failed\n");
+		drm_dbg_kms(display->drm, "Lane count read failed (%pe)\n", ERR_PTR(ret));
 		return DP_TEST_NAK;
 	}
 	test_lane_count &= DP_MAX_LANE_COUNT_MASK;
@@ -165,7 +165,7 @@ static u8 intel_dp_autotest_link_training(struct intel_dp *intel_dp)
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_LINK_RATE,
 				    &test_link_bw);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "Link Rate read failed\n");
+		drm_dbg_kms(display->drm, "Link Rate read failed (%pe)\n", ERR_PTR(ret));
 		return DP_TEST_NAK;
 	}
 	test_link_rate = drm_dp_bw_code_to_link_rate(test_link_bw);
@@ -193,7 +193,7 @@ static u8 intel_dp_autotest_video_pattern(struct intel_dp *intel_dp)
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_PATTERN,
 				    &test_pattern);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "Test pattern read failed\n");
+		drm_dbg_kms(display->drm, "Test pattern read failed (%pe)\n", ERR_PTR(ret));
 		return DP_TEST_NAK;
 	}
 	if (test_pattern != DP_COLOR_RAMP)
@@ -201,20 +201,20 @@ static u8 intel_dp_autotest_video_pattern(struct intel_dp *intel_dp)
 
 	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_TEST_H_WIDTH_HI, &h_width, 2);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "H Width read failed\n");
+		drm_dbg_kms(display->drm, "H Width read failed (%pe)\n", ERR_PTR(ret));
 		return DP_TEST_NAK;
 	}
 
 	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_TEST_V_HEIGHT_HI,
 				    &v_height, 2);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "V Height read failed\n");
+		drm_dbg_kms(display->drm, "V Height read failed (%pe)\n", ERR_PTR(ret));
 		return DP_TEST_NAK;
 	}
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_MISC0, &test_misc);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "TEST MISC read failed\n");
+		drm_dbg_kms(display->drm, "TEST MISC read failed (%pe)\n", ERR_PTR(ret));
 		return DP_TEST_NAK;
 	}
 	if ((test_misc & DP_TEST_COLOR_FORMAT_MASK) != DP_COLOR_FORMAT_RGB)
@@ -247,6 +247,7 @@ static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
 	u8 test_result = DP_TEST_ACK;
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
 	struct drm_connector *connector = &intel_connector->base;
+	int ret;
 
 	if (!intel_connector->detect_edid || connector->edid_corrupt ||
 	    intel_dp->aux.i2c_defer_count > 6) {
@@ -271,10 +272,11 @@ static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
 		/* We have to write the checksum of the last block read */
 		block += block->extensions;
 
-		if (drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TEST_EDID_CHECKSUM,
-					   block->checksum) < 0)
+		ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TEST_EDID_CHECKSUM,
+					     block->checksum);
+		if (ret < 0)
 			drm_dbg_kms(display->drm,
-				    "Failed to write EDID checksum\n");
+				    "Failed to write EDID checksum (%pe)\n", ERR_PTR(ret));
 
 		test_result = DP_TEST_ACK | DP_TEST_EDID_CHECKSUM_WRITE;
 		intel_dp->compliance.test_data.edid = INTEL_DP_RESOLUTION_PREFERRED;
@@ -429,7 +431,7 @@ void intel_dp_test_request(struct intel_dp *intel_dp)
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_REQUEST, &request);
 	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Could not read test request from sink\n");
+			    "Could not read test request from sink (%pe)\n", ERR_PTR(ret));
 		goto update_status;
 	}
 
@@ -463,7 +465,7 @@ void intel_dp_test_request(struct intel_dp *intel_dp)
 	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TEST_RESPONSE, response);
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Could not write test response to sink\n");
+			    "Could not write test response to sink (%pe)\n", ERR_PTR(ret));
 }
 
 /* phy test */
-- 
2.34.1

