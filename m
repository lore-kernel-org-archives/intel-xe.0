Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F086C982EF
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D1110E21E;
	Mon, 21 Sep 2026 05:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yzu/Mdm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851AC10E03E;
 Mon, 21 Sep 2026 05:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969036; x=1821505036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cxINEWDRk/f0G6vZ8yjIs1s8k+Bx6ucO3Z/RxBmXtdw=;
 b=Yzu/Mdm0h44idaCrsLLEzcgLmETRZ67ukya7+FrCEEF4EI6thsUE4zUb
 9u7vw/bri3y3W7xFc1fmpyS8ELy1gQa7Fr9mVnahE9S9YNkq4x3Yo5qCa
 uR4q1bVcwWRq9EhNi0n3u7t3pZajY+T2eTVSoQwEhH7XIPATZFiZocB/z
 iOT61xFUne+lKf5tb0g8YbFXlwQVxnmNoFRXcem/wRoN4dn9Yzhcl5tjv
 t44dgD+wFVvQoDxxSagn6dO6cdKLkhcP8Znhk/YTN9NzL2YZfANzwIrIQ
 oEhT3mt3nLQCHjlmBCFwz74EVQuDanlHjbY/1PmZ4P0zXUIIiA7MkOXzA w==;
X-CSE-ConnectionGUID: ajy3yKJqRHS6fTHJ5lsM7g==
X-CSE-MsgGUID: eQTCgnbPScyTFsLqF05tOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966583"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:16 -0700
X-CSE-ConnectionGUID: SC2sDjEVQsKnPydxFCQY5w==
X-CSE-MsgGUID: fk4Rg4xURNinUN0yQOWKEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444451"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:15 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/8] drm/i915/lspcon: log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:03 +0530
Message-Id: <20260921053710.1586776-2-suraj.kandpal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_lspcon.c | 34 +++++++++++++--------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 07b5a9d010ff..82b40033728f 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -139,7 +139,8 @@ bool intel_lspcon_detect_hdr_capability(struct intel_digital_port *dig_port)
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, get_hdr_status_reg(lspcon), &hdr_caps);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "HDR capability detection failed\n");
+		drm_dbg_kms(display->drm, "HDR capability detection failed (%pe)\n",
+			    ERR_PTR(ret));
 		lspcon->hdr_supported = false;
 	} else if (hdr_caps & 0x1) {
 		drm_dbg_kms(display->drm, "LSPCON capable of HDR\n");
@@ -247,7 +248,7 @@ static bool lspcon_wake_native_aux_ch(struct intel_lspcon *lspcon)
 
 	ret = drm_dp_dpcd_read_byte(&lspcon_to_intel_dp(lspcon)->aux, DP_DPCD_REV, &rev);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "Native AUX CH down\n");
+		drm_dbg_kms(display->drm, "Native AUX CH down (%pe)\n", ERR_PTR(ret));
 		return false;
 	}
 
@@ -339,7 +340,8 @@ static bool lspcon_parade_fw_ready(struct drm_dp_aux *aux)
 
 		ret = drm_dp_dpcd_read_byte(aux, LSPCON_PARADE_AVI_IF_CTRL, &avi_if_ctrl);
 		if (ret < 0) {
-			drm_err(aux->drm_dev, "Failed to read AVI IF control\n");
+			drm_err(aux->drm_dev, "Failed to read AVI IF control (%pe)\n",
+				ERR_PTR(ret));
 			return false;
 		}
 
@@ -371,8 +373,8 @@ static bool _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
 		data = avi_buf + block_count * 8;
 		ret = drm_dp_dpcd_write_data(aux, reg, data, 8);
 		if (ret < 0) {
-			drm_err(aux->drm_dev, "Failed to write AVI IF block %d\n",
-				block_count);
+			drm_err(aux->drm_dev, "Failed to write AVI IF block %d (%pe)\n",
+				block_count, ERR_PTR(ret));
 			return false;
 		}
 
@@ -386,8 +388,8 @@ static bool _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
 		avi_if_ctrl = LSPCON_PARADE_AVI_IF_KICKOFF | block_count;
 		ret = drm_dp_dpcd_write_byte(aux, reg, avi_if_ctrl);
 		if (ret < 0) {
-			drm_err(aux->drm_dev, "Failed to update (0x%x), block %d\n",
-				reg, block_count);
+			drm_err(aux->drm_dev, "Failed to update (0x%x), block %d (%pe)\n",
+				reg, block_count, ERR_PTR(ret));
 			return false;
 		}
 
@@ -450,7 +452,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 				mdelay(50);
 				continue;
 			} else {
-				drm_err(aux->drm_dev, "DPCD write failed at:0x%x\n", reg);
+				drm_err(aux->drm_dev, "DPCD write failed at:0x%x (%pe)\n",
+					reg, ERR_PTR(ret));
 				return false;
 			}
 		}
@@ -462,7 +465,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 	reg = LSPCON_MCA_AVI_IF_CTRL;
 	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
-		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
+		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x (%pe)\n",
+			reg, ERR_PTR(ret));
 		return false;
 	}
 
@@ -472,13 +476,15 @@ static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 
 	ret = drm_dp_dpcd_write_byte(aux, reg, val);
 	if (ret < 0) {
-		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
+		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x (%pe)\n",
+			reg, ERR_PTR(ret));
 		return false;
 	}
 
 	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
-		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
+		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x (%pe)\n",
+			reg, ERR_PTR(ret));
 		return false;
 	}
 
@@ -615,7 +621,8 @@ static bool _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
 
 	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
-		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
+		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x (%pe)\n",
+			reg, ERR_PTR(ret));
 		return false;
 	}
 
@@ -630,7 +637,8 @@ static bool _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
 
 	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
-		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
+		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x (%pe)\n",
+			reg, ERR_PTR(ret));
 		return false;
 	}
 
-- 
2.34.1

