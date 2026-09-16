Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E374C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8519B10E90B;
	Wed, 16 Sep 2026 08:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbG0bUMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4561A10E909;
 Wed, 16 Sep 2026 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547427; x=1821083427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ka3VsCmwOWvalIVVk+l4Su88ORDql8oUL0Y7Lm27Jw8=;
 b=dbG0bUMzPtCy8KCPV1b36HlQ3/j4j9hdAlQ80Lwga7PWXt2vBmOPD4Pv
 ASFG7BAgFLWndMafCnQ03xFTsVdWgBL8LAUBQEUhWWE8a6Z3od4beN1hk
 nzSr/T3MgqVItRUGKVLYC4xeUCbKJpJuO+f5YmYcmN/5NSOp1Y3Z8pjlv
 l03ahrbz4nY5euwg1sgyTrMDHp9ANmPXIuprJ9cwWFcqV0lfEZb6bp1bc
 89BdaOOcWlvKzDCRG2B/rojoaMSx7rt8gXfOtd6ahFohj90hbQHaspZMi
 ykrfXVfzP7mGd9cTiq4XFVZVD4GKiHrv0ftObLcKWqEX4cEi5MzAzrRgK g==;
X-CSE-ConnectionGUID: 22ZonZrMRWe0JOUBwglnaA==
X-CSE-MsgGUID: YbN51XNvTQSIbhde5pF4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429646"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:27 -0700
X-CSE-ConnectionGUID: WTT/RwwvSqyPT1+C/E0meQ==
X-CSE-MsgGUID: /EuZiHCKRyuFZgidJPpiBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276796845"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 10/11] drm/i915/dp-test: switch to drm_dp_dpcd_{read_byte,
 read_data, write_byte, write_data}()
Date: Wed, 16 Sep 2026 11:29:41 +0300
Message-ID: <ddf90aeb0dae3779d92381f550d95111398e7e02.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

This flags incomplete reads, and simplifies error handling all over the
place. Rename local int status to ret for clarity and consistency.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_test.c | 57 ++++++++++----------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.c b/drivers/gpu/drm/i915/display/intel_dp_test.c
index 0551a1ce60d3..424183a65155 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_test.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_test.c
@@ -147,25 +147,24 @@ bool intel_dp_test_compute_config(struct intel_connector *connector,
 static u8 intel_dp_autotest_link_training(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	int status = 0;
+	int ret;
 	int test_link_rate;
 	u8 test_lane_count, test_link_bw;
 	/* (DP CTS 1.2)
 	 * 4.3.1.11
 	 */
 	/* Read the TEST_LANE_COUNT and TEST_LINK_RTAE fields (DP CTS 3.1.4) */
-	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_LANE_COUNT,
-				   &test_lane_count);
-
-	if (status <= 0) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_LANE_COUNT,
+				    &test_lane_count);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "Lane count read failed\n");
 		return DP_TEST_NAK;
 	}
 	test_lane_count &= DP_MAX_LANE_COUNT_MASK;
 
-	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_LINK_RATE,
-				   &test_link_bw);
-	if (status <= 0) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_LINK_RATE,
+				    &test_link_bw);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "Link Rate read failed\n");
 		return DP_TEST_NAK;
 	}
@@ -188,35 +187,33 @@ static u8 intel_dp_autotest_video_pattern(struct intel_dp *intel_dp)
 	u8 test_pattern;
 	u8 test_misc;
 	__be16 h_width, v_height;
-	int status = 0;
+	int ret;
 
 	/* Read the TEST_PATTERN (DP CTS 3.1.5) */
-	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_PATTERN,
-				   &test_pattern);
-	if (status <= 0) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_PATTERN,
+				    &test_pattern);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "Test pattern read failed\n");
 		return DP_TEST_NAK;
 	}
 	if (test_pattern != DP_COLOR_RAMP)
 		return DP_TEST_NAK;
 
-	status = drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_H_WIDTH_HI,
-				  &h_width, 2);
-	if (status <= 0) {
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_TEST_H_WIDTH_HI, &h_width, 2);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "H Width read failed\n");
 		return DP_TEST_NAK;
 	}
 
-	status = drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_V_HEIGHT_HI,
-				  &v_height, 2);
-	if (status <= 0) {
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_TEST_V_HEIGHT_HI,
+				    &v_height, 2);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "V Height read failed\n");
 		return DP_TEST_NAK;
 	}
 
-	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_MISC0,
-				   &test_misc);
-	if (status <= 0) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_MISC0, &test_misc);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "TEST MISC read failed\n");
 		return DP_TEST_NAK;
 	}
@@ -274,8 +271,8 @@ static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
 		/* We have to write the checksum of the last block read */
 		block += block->extensions;
 
-		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TEST_EDID_CHECKSUM,
-				       block->checksum) <= 0)
+		if (drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TEST_EDID_CHECKSUM,
+					   block->checksum) < 0)
 			drm_dbg_kms(display->drm,
 				    "Failed to write EDID checksum\n");
 
@@ -397,8 +394,8 @@ static void intel_dp_process_phy_request(struct intel_dp *intel_dp,
 
 	intel_dp_phy_pattern_update(intel_dp, crtc_state);
 
-	drm_dp_dpcd_write(&intel_dp->aux, DP_TRAINING_LANE0_SET,
-			  intel_dp->train_set, crtc_state->lane_count);
+	drm_dp_dpcd_write_data(&intel_dp->aux, DP_TRAINING_LANE0_SET,
+			       intel_dp->train_set, crtc_state->lane_count);
 
 	drm_dp_set_phy_test_pattern(&intel_dp->aux, data,
 				    intel_dp->dpcd[DP_DPCD_REV]);
@@ -427,10 +424,10 @@ void intel_dp_test_request(struct intel_dp *intel_dp)
 	struct intel_display *display = to_intel_display(intel_dp);
 	u8 response = DP_TEST_NAK;
 	u8 request = 0;
-	int status;
+	int ret;
 
-	status = drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_REQUEST, &request);
-	if (status <= 0) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_REQUEST, &request);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
 			    "Could not read test request from sink\n");
 		goto update_status;
@@ -463,8 +460,8 @@ void intel_dp_test_request(struct intel_dp *intel_dp)
 		intel_dp->compliance.test_type = request;
 
 update_status:
-	status = drm_dp_dpcd_writeb(&intel_dp->aux, DP_TEST_RESPONSE, response);
-	if (status <= 0)
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TEST_RESPONSE, response);
+	if (ret < 0)
 		drm_dbg_kms(display->drm,
 			    "Could not write test response to sink\n");
 }
-- 
2.47.3

