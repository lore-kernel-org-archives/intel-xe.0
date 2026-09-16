Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD23C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A3C10E5E9;
	Wed, 16 Sep 2026 08:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0On8OP8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B30410E5E9;
 Wed, 16 Sep 2026 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547395; x=1821083395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iGji3fKazvfCZv9xM4Dp87gTOXE7j9Iggfgd7UwoXF8=;
 b=Z0On8OP8JUmU2lOB1vHOr3ahfjlOIwdAdsUgK2V2tCVYZgAGBqQxjKnz
 OnUZzpdUoYhRdl7P5Rx3C+KSBfbM629sTYzEIfAc8lDoasBqm6ePpv6SM
 bxAddEDcobRxQwX0SLv9cKI3u0X2Ohy4Zsv3rV6mpe6zDTePGmv06JfEx
 jEGsI9hrUvQ8CNWZiUfVoC6zPN/gfj2xyGzvtwNPGAkGV9NARUjO3eR1d
 Ag3Er+4FxN5FnoiyRmtLJBfLKCKmKVoF+igbfUW8xu72shCj8kc5LLfst
 WOD2qy+Fr57oKlmQhvpYs9Ql5p2TsGWAeRHHzolDm1SEvRlBdJvb+P9Lz g==;
X-CSE-ConnectionGUID: r77ngyhCS+Sk0rwzRoJWKg==
X-CSE-MsgGUID: VEvU86+eQE2heByr75Nogw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429600"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429600"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:55 -0700
X-CSE-ConnectionGUID: 3eRkQ7A4ReW/DYQrF67zlg==
X-CSE-MsgGUID: munbFxPbRjSxLd3QrCQGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276796675"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 02/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte,
 write_byte, write_data}
Date: Wed, 16 Sep 2026 11:29:33 +0300
Message-ID: <a890746215c6c7a1e36a6bc880ae644dd06f1956.1789547331.git.jani.nikula@intel.com>
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

Use 1-byte accessors where sensible. Use local ret variables for the
return value instead of checking inline.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 34 +++++++++------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index b306bf5f6130..07b5a9d010ff 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -137,9 +137,7 @@ bool intel_lspcon_detect_hdr_capability(struct intel_digital_port *dig_port)
 	u8 hdr_caps;
 	int ret;
 
-	ret = drm_dp_dpcd_read(&intel_dp->aux, get_hdr_status_reg(lspcon),
-			       &hdr_caps, 1);
-
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, get_hdr_status_reg(lspcon), &hdr_caps);
 	if (ret < 0) {
 		drm_dbg_kms(display->drm, "HDR capability detection failed\n");
 		lspcon->hdr_supported = false;
@@ -244,10 +242,11 @@ static bool lspcon_wake_native_aux_ch(struct intel_lspcon *lspcon)
 {
 	struct intel_dp *intel_dp = lspcon_to_intel_dp(lspcon);
 	struct intel_display *display = to_intel_display(intel_dp);
+	int ret;
 	u8 rev;
 
-	if (drm_dp_dpcd_readb(&lspcon_to_intel_dp(lspcon)->aux, DP_DPCD_REV,
-			      &rev) != 1) {
+	ret = drm_dp_dpcd_read_byte(&lspcon_to_intel_dp(lspcon)->aux, DP_DPCD_REV, &rev);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "Native AUX CH down\n");
 		return false;
 	}
@@ -331,15 +330,14 @@ static bool lspcon_parade_fw_ready(struct drm_dp_aux *aux)
 {
 	u8 avi_if_ctrl;
 	u8 retry;
-	ssize_t ret;
+	int ret;
 
 	/* Check if LSPCON FW is ready for data */
 	for (retry = 0; retry < 5; retry++) {
 		if (retry)
 			usleep_range(200, 300);
 
-		ret = drm_dp_dpcd_read(aux, LSPCON_PARADE_AVI_IF_CTRL,
-				       &avi_if_ctrl, 1);
+		ret = drm_dp_dpcd_read_byte(aux, LSPCON_PARADE_AVI_IF_CTRL, &avi_if_ctrl);
 		if (ret < 0) {
 			drm_err(aux->drm_dev, "Failed to read AVI IF control\n");
 			return false;
@@ -371,7 +369,7 @@ static bool _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
 
 		reg = LSPCON_PARADE_AVI_IF_WRITE_OFFSET;
 		data = avi_buf + block_count * 8;
-		ret = drm_dp_dpcd_write(aux, reg, data, 8);
+		ret = drm_dp_dpcd_write_data(aux, reg, data, 8);
 		if (ret < 0) {
 			drm_err(aux->drm_dev, "Failed to write AVI IF block %d\n",
 				block_count);
@@ -386,7 +384,7 @@ static bool _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
 		 */
 		reg = LSPCON_PARADE_AVI_IF_CTRL;
 		avi_if_ctrl = LSPCON_PARADE_AVI_IF_KICKOFF | block_count;
-		ret = drm_dp_dpcd_write(aux, reg, &avi_if_ctrl, 1);
+		ret = drm_dp_dpcd_write_byte(aux, reg, avi_if_ctrl);
 		if (ret < 0) {
 			drm_err(aux->drm_dev, "Failed to update (0x%x), block %d\n",
 				reg, block_count);
@@ -445,8 +443,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 	while (written < len) {
 		/* DPCD write for AVI IF can fail on a slow FW day, so retry */
 		for (retry = 0; retry < 5; retry++) {
-			ret = drm_dp_dpcd_write(aux, reg, (void *)data, 1);
-			if (ret == 1) {
+			ret = drm_dp_dpcd_write_byte(aux, reg, *data);
+			if (!ret) {
 				break;
 			} else if (retry < 4) {
 				mdelay(50);
@@ -461,9 +459,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 		data++;
 	}
 
-	val = 0;
 	reg = LSPCON_MCA_AVI_IF_CTRL;
-	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
+	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
 		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
 		return false;
@@ -473,14 +470,13 @@ static bool _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
 	val &= ~LSPCON_MCA_AVI_IF_HANDLED;
 	val |= LSPCON_MCA_AVI_IF_KICKOFF;
 
-	ret = drm_dp_dpcd_write(aux, reg, &val, 1);
+	ret = drm_dp_dpcd_write_byte(aux, reg, val);
 	if (ret < 0) {
 		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
 		return false;
 	}
 
-	val = 0;
-	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
+	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
 		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
 		return false;
@@ -617,7 +613,7 @@ static bool _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
 	u16 reg = LSPCON_MCA_AVI_IF_CTRL;
 	u8 val;
 
-	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
+	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
 		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
 		return false;
@@ -632,7 +628,7 @@ static bool _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
 	u16 reg = LSPCON_PARADE_AVI_IF_CTRL;
 	u8 val;
 
-	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
+	ret = drm_dp_dpcd_read_byte(aux, reg, &val);
 	if (ret < 0) {
 		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n", reg);
 		return false;
-- 
2.47.3

