Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A111DCA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFE410E48F;
	Thu,  1 Oct 2026 19:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYktOjHP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1EA10E025
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790884317; x=1822420317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iR6qqRiAf7eXxi5pTewBZcGW+7rO4Ik6l5CEE3ZI/O0=;
 b=fYktOjHPvjZuF3nfkAmqVIFfQMSKibW9ujc4HoVs9MjCSwmmJai/R9TF
 AiwavejmZs5SklJ2NoMpJMKjDbXMxyJkUsSI/DwahUD02/30HyVTGQ1yt
 EdRmdFX+YzpCMU445DiQmtBW2uHwmMKrmHC8DaleiZa9kxPwgDG2Y9X7T
 D0D65LBo1Q5DbIvb5xJ0TpSpxSxamBDujE3U21F8PV+2MUD4Wc19cj3WG
 xjRboqf4+HegHS5buQrY2BEUQlSZ92ZZXedPOJcHLFD9xGqu7v98EoLXQ
 rxtHFmXa3su+GcJsVlflGvsly8eAcKvcdL5VUyYbqvyKELMIGlkAoUg2A w==;
X-CSE-ConnectionGUID: xHIBuvfYQH2ibeJfeE+VIw==
X-CSE-MsgGUID: m36aiMyuTTGkvUGKDNa/Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102177952"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102177952"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:52 -0700
X-CSE-ConnectionGUID: hPqelubkSwKsgN1VreIA3Q==
X-CSE-MsgGUID: nUtNPxpdTaWGVHH+l0rPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273893853"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:49 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 11/15] drm/xe/hwmon: Decode CRI temperature registers as
 IEEE-754
Date: Fri,  2 Oct 2026 01:20:29 +0530
Message-Id: <20261001195033.3466205-12-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001195033.3466205-1-karthik.poosa@intel.com>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
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

v2: Add missing description for parameter 'temperature' in
    xe_hwmon_temperature_decode().

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 93 +++++++++++++++++++++++++++++------
 1 file changed, 79 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5329cb696683..a9423f6a447e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1238,6 +1238,70 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+#define IEEE754_SIGN		REG_BIT(31)
+#define IEEE754_EXP_MASK	REG_GENMASK(30, 23)
+#define IEEE754_MANTISSA_MASK	REG_GENMASK(22, 0)
+#define IEEE754_EXP_BIAS	127 /* Exponent bias to obtain the actual exponent */
+#define IEEE754_MANTISSA_BITS	23 /* Mantissa width and implicit leading-1 bit position */
+#define IEEE754_EXP_SPECIAL	0xff /* reserved exponent value encoding infinity or NaN */
+
+/**
+ * xe_hwmon_temperature_decode - Decode an IEEE-754 temperature register value
+ * @reg_val: The raw register value to decode
+ * @temperature: Pointer to store the decoded temperature in millidegrees Celsius.
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
+	u32 exponent = REG_FIELD_GET(IEEE754_EXP_MASK, reg_val);
+	u32 mantissa = REG_FIELD_GET(IEEE754_MANTISSA_MASK, reg_val);
+	s64 value;
+	int shift;
+
+	/* Exponent 0xff encodes infinity or NaN. */
+	if (exponent == IEEE754_EXP_SPECIAL)
+		return -EINVAL;
+
+	/* Subnormal values are smaller than one millidegree Celsius. */
+	if (!exponent) {
+		*temperature = 0;
+		return 0;
+	}
+
+	value = (s64)(mantissa | BIT(IEEE754_MANTISSA_BITS)) * MILLIDEGREE_PER_DEGREE;
+	shift = exponent - (IEEE754_EXP_BIAS + IEEE754_MANTISSA_BITS);
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
+	if (reg_val & IEEE754_SIGN)
+		value = -value;
+
+	*temperature = value;
+	return 0;
+}
+
 static int
 xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
@@ -1247,26 +1311,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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

