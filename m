Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC4CC79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E3B10E1FA;
	Thu, 10 Sep 2026 18:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bU7C0GWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C4F10E69C
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789064938; x=1820600938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XzUhpIoKwdIinVYxotpQ4M3UXhTr56pID2FqWoPCtYM=;
 b=bU7C0GWg3lwQsb52SrykSeZ/y/wgjMRVidQ1z9XLWEjtE7XucyScM9c4
 arPFj6Vk6fFh4DqxBh4a7Vat5GlaVPPhMpzN7zJNogJDcG+GNosM4cQB0
 2QXJebmmzYPi5zpdalh+1uxA3X5XHAWsoTvhhCaQygZQz0+KDLyyZGKol
 pNq/aucQTa2ljKYAL5KwDwZB1yy2m++gD/TYNzdhrot91Fx42Ti6c/RWo
 tjzjb3cTwBX7sb2MWFOI/8evXyE6MrP0C7FXQC1bB3d8485l8pvfAcvcV
 6mJIG/Af9S34sIgU9ejOLfDN7IkMqk2GokdsWQuUC4CZVwhR4lOyjEXec Q==;
X-CSE-ConnectionGUID: 5c7yoMWVS6GGwPD7TR28lA==
X-CSE-MsgGUID: knHM7oWRTmeSfMGN87pYig==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89397581"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89397581"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:58 -0700
X-CSE-ConnectionGUID: 1KEtem78QHuyMtCE0YxoEg==
X-CSE-MsgGUID: us4rW+1wTcC7YyRUiTnslg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="296701084"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 4/5] drm/xe/hwmon: Decode CRI temperature registers as
 IEEE-754
Date: Thu, 10 Sep 2026 23:57:55 +0530
Message-Id: <20260910182756.638830-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910182756.638830-1-karthik.poosa@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

CRI temperature registers encode package and VRAM temperatures as
IEEE-754 floating-point values. Decode these values before exposing
them through hwmon.
 
Use integer-based IEEE-754 decoding since kernel code does not use
floating-point operations and hwmon reports integer temperatures.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: GitHub Copilot; Model: MAI-Code-1.1-Flash
---

v2: Reject temperatures that overflow long on 32-bit (Sashiko).

 drivers/gpu/drm/xe/xe_hwmon.c | 85 +++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c682c5a33650..e4a210916df2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1159,6 +1159,62 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+/**
+ * xe_hwmon_temperature_decode - Decode an IEEE-754 temperature register value
+ * @reg_val: The raw register value to decode
+ *
+ * IEEE-754 single-precision format:
+ *
+ *  31 30                         23 22                         0
+ * +--+-----------------------------+----------------------------+
+ * | S|          exponent           |          fraction          |
+ * +--+-----------------------------+----------------------------+
+ *
+ * value = (-1)^S * 1.fraction * 2^(exponent - 127)
+ *
+ * Return: 0 on success or an error if @reg_val is non-finite or cannot be
+ * represented in millidegrees Celsius.
+ */
+static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
+{
+	u32 exponent = (reg_val >> 23) & 0xff;
+	u32 mantissa = reg_val & 0x7fffff;
+	s64 value;
+	int shift;
+
+	/* Exponent 0xff encodes infinity or NaN. */
+	if (exponent == 0xff)
+		return -EINVAL;
+
+	/* Subnormal values are smaller than one millidegree Celsius. */
+	if (!exponent) {
+		*temperature = 0;
+		return 0;
+	}
+
+	value = (s64)(mantissa | BIT(23)) * MILLIDEGREE_PER_DEGREE;
+	shift = exponent - 150;
+	if (shift >= 0) {
+		if (shift >= BITS_PER_LONG || value > (LONG_MAX >> shift))
+			return -ERANGE;
+		value <<= shift;
+	} else if (shift > -64) {
+		value >>= -shift;
+	} else {
+		value = 0;
+	}
+
+	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
+	if (value > LONG_MAX)
+		return -ERANGE;
+
+	if (reg_val & BIT(31))
+		value = -value;
+
+	*temperature = value;
+	return 0;
+}
+
 static int
 xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
@@ -1168,26 +1224,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	switch (attr) {
 	case hwmon_temp_input:
 		switch (channel) {
-		case CHANNEL_PKG:
-		case CHANNEL_VRAM:
-			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
-
-			/* HW register value is in degrees Celsius, convert to millidegrees. */
-			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
-			return 0;
 		case CHANNEL_MCTRL:
 			return get_mc_temp(hwmon, val);
 		case CHANNEL_PCIE:
 			return get_pcie_temp(hwmon, val);
+		case CHANNEL_PKG:
+		case CHANNEL_VRAM:
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
 			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
-			/*
-			 * This temperature format is 24 bit [31:8] signed integer and 8 bit
-			 * [7:0] fraction.
-			 */
-			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
-				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
-				 MILLIDEGREE_PER_DEGREE;
+			if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
+				return xe_hwmon_temperature_decode((u32)reg_val, val);
+			} else if (channel >= CHANNEL_VRAM_N) {
+				/*
+				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
+				 * [7:0] fraction for platforms before CRI.
+				 */
+				*val = (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
+					(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
+					MILLIDEGREE_PER_DEGREE;
+			} else {
+				*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
+			}
 			return 0;
 		default:
 			return -EOPNOTSUPP;
-- 
2.25.1

