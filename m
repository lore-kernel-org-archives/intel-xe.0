Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEEACD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 05:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65310E0A6;
	Fri, 15 May 2026 05:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeelVbDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CE710E0A6;
 Fri, 15 May 2026 05:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778823487; x=1810359487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oeOk4YaW2WNaaHPLYBiKDp1GHh8dNR86bu+JS/8cexM=;
 b=OeelVbDXOndpkueMPvcDiAP4imL87pfp+W7upgNcGoF9yL5dMel8EIpF
 EnwZV4V4xfI709lI50fp55HTUM1ZPel9uOjnBCORt91stH84+HlIAINQE
 OPZmp6IvcO2ld6fdk5wOIGnFiWueYblk0SbsADEFLolWQ260UfcL+IiBj
 BTDt3FRBMr23sTClDbSFtYWCUb0uGX1WR9LnRPsQ2PswKTG7OmXLC6XoV
 yfC/c2Rmrm0v+6WYz2JF5ap99fkg7u8nSnF7nwrwUZ3AWQXRRH6FV+JIZ
 7fE6rnnshK2zsoQmsCtPeTWIozvAXmrLRfjrzAIBMhLAp7vAiqWvCdlSl w==;
X-CSE-ConnectionGUID: g5dm/toIQv+CCvZH7foLeA==
X-CSE-MsgGUID: NSzl3CG9RqO+sra8jQwSoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97349256"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="97349256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 22:38:06 -0700
X-CSE-ConnectionGUID: 7M+P0v+0TvWjC0yGE7786Q==
X-CSE-MsgGUID: RTUGe2OWRdO67N+MXDG/2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="243564973"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa005.jf.intel.com with ESMTP; 14 May 2026 22:38:04 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/dp: Require DPCD backlight control mode for VESA AUX
 backlight
Date: Fri, 15 May 2026 11:07:57 +0530
Message-Id: <20260515053757.907081-1-suraj.kandpal@intel.com>
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

Read DP_EDP_BACKLIGHT_MODE_SET_REGISTER during VESA AUX backlight
capability checks and reject panels using
DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT.
i915 supports VESA AUX backlight only in
DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD. Reject panels that expose AUX
backlight capability bits when their active backlight control mode is
DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT.

Fixes: 40d2f5820951 ("drm/i915/backlight: Remove try_vesa_interface")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index a8d56ebf06a2..fadc4b2faa4c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -613,7 +613,7 @@ static bool
 check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
 {
 	int ret;
-	u8 bit_min, bit_max;
+	u8 bit_min, bit_max, mode_reg;
 
 	/*
 	 * Since we only support Fully AUX Based VESA Backlight interface make sure
@@ -623,6 +623,15 @@ check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
 	      intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
 		return false;
 
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
+				    &mode_reg);
+	if (ret < 0)
+		return false;
+
+	if ((mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) ==
+	    DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT)
+		return false;
+
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
 	if (ret < 0)
 		return false;
-- 
2.34.1

