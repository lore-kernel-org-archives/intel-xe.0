Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532B7CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF6010FD16;
	Wed, 14 Oct 2026 11:59:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE82910FD10
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979149; x=1823515149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iaBSqRMVIwfdVkq4b1H6q7GIdfjboBQCpLYMBN+JkXA=;
 b=BGjXTRF9X+y2t4LWQc6VvH+LZOXlNWuST2c4t+0v2gzINZlx4GfNn/c1
 2sjxgGESIBGCDbHBTvZhs2aKaKNAAYC8wJG3M6Wp4aYjFJfS1QbwglJKX
 bsYjM/oer9pQuDM15XvJsYjZoN0H75CM18Yh2qEnBpz2uaFaYdkkwAiY0
 NLR9X92WtxPGvCfK2Klz4xRTKohgnUiS1sX+/DxWSkmdpOHSViWnPbFzS
 XltO+sPl1xjJomGTot/vWdmE+KBYhhjEYTr8wIHrQ1wpjAyNWQsqo3aA1
 1SAxcW1UZUOKM2J5MAufXVVf7vZFFy/L4jNPE2DfDnZXa1MPKGijxuhEY w==;
X-CSE-ConnectionGUID: eK7OmDJ9Ska300kQpJcIPw==
X-CSE-MsgGUID: Fqs1L8QcQAySEnZjEF/bhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="609562"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="609562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:58:58 -0700
X-CSE-ConnectionGUID: 2tZ3VcjDQMmeVNXcNFbbRQ==
X-CSE-MsgGUID: aDHmUF+GSe256jDWq9sjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1752135"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:58:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v13 02/16] drm/xe/hwmon: Decode mailbox temperature as
 sign-magnitude
Date: Wed, 14 Oct 2026 17:27:52 +0530
Message-Id: <20261014115806.831459-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014115806.831459-1-karthik.poosa@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
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

The mailbox temperature is an 8-bit sign-magnitude value (bit 7 sign,
bits 6:0 magnitude, range -127..127), not two's-complement. Casting the
raw byte to s8 decodes negative readings incorrectly.

Add mbx_temp_decode(), store the raw byte as u8, and use it in
get_mc_temp() and get_pcie_temp() so temperatures are decoded correctly.

Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c7f936892512..382bf9625a8b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -104,6 +104,10 @@ enum sensor_attr_power {
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
 
+/* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
+#define TEMP_MBX_SIGN		BIT(7)
+#define TEMP_MBX_MAG		GENMASK(6, 0)
+
 /* Maximum characters in hwmon label name */
 #define MAX_LABEL_SIZE		16
 
@@ -139,8 +143,8 @@ struct xe_hwmon_thermal_info {
 	};
 	/** @count: no of temperature sensors available for the platform */
 	u8 count;
-	/** @value: signed value from each sensor */
-	s8 value[U8_MAX];
+	/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
+	u8 value[U8_MAX];
 	/** @vram_label: vram label names */
 	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
 };
@@ -825,6 +829,14 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	return ret;
 }
 
+/* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
+static int mbx_temp_decode(u8 value)
+{
+	int temp = value & TEMP_MBX_MAG;
+
+	return (value & TEMP_MBX_SIGN) ? -temp : temp;
+}
+
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
@@ -841,7 +853,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	}
 
 	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
-		average += hwmon->temp.value[i];
+		average += mbx_temp_decode(hwmon->temp.value[i]);
 
 	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
 	*val = average * MILLIDEGREE_PER_DEGREE;
@@ -864,7 +876,7 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
 
 	data = REG_FIELD_GET(TEMP_MASK, data);
-	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
+	*val = mbx_temp_decode(data) * MILLIDEGREE_PER_DEGREE;
 
 	return 0;
 }
-- 
2.25.1

