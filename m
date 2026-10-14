Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EC2CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54B710FD17;
	Wed, 14 Oct 2026 11:59:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEF110FD07
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979147; x=1823515147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LhqfoE7P0vctwAd0SSdv6GkAicAbdKtn68IhDKNg1QM=;
 b=XDCpRL9Zy2fC9IPqBlrBIkLHbtmrS+oolO/QOWbqsM+tAgVMXmhXD5TS
 x1v4LnPZEuoWM+KzdgVJ2UPBri3hNyMJC3fLMnD0oz2l9g8FiB40ADqNa
 PrZbBDIbelrmengmBtAaO7Mh+84YQWvxdm7KPHBZFiDJi9umShT1FAme5
 Giqwo8rFNR5PuuD/kQXRCtwYeeAHvmCXIpiysKUjw2sXLqXVbLfF3AYYg
 eS9fbokS7eIuwnlRq5WN9TN1jCeiQt/FLb/Ca7sNqHVbaLvbajeELwMIu
 cd8l1YWBIne0CBTYbodX/ivlb1HZC0T9K01ARIejTYiXkEPRZmssVe+Mi w==;
X-CSE-ConnectionGUID: jup2ReP9SLuS9/45wf4kHQ==
X-CSE-MsgGUID: 2yTw92GWTBOJeXnwMBSHew==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="609565"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="609565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:59:00 -0700
X-CSE-ConnectionGUID: bVXI7Iz6RxipU4JaHsvzAQ==
X-CSE-MsgGUID: D8ktDzgjQya8rY6fYHBb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1752142"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:58:57 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v13 03/16] drm/xe/hwmon: Fix thermal sensor data handling
Date: Wed, 14 Oct 2026 17:27:53 +0530
Message-Id: <20261014115806.831459-4-karthik.poosa@intel.com>
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

Read all required thermal groups in get_mc_temp() and store them in a
dword-aligned buffer, avoiding unaligned pcode accesses and ensuring
correct memory controller temperature reporting.

Store the pcode thermal data and thermal limit words as little-endian,
so their per-byte views match the hardware layout on big-endian hosts.

Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
Fixes: c332fba805d6 ("drm/xe/hwmon: Expose temperature limits")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
v2: Protect the shared thermal data buffer while fetching and averaging
memory controller temperatures.

 drivers/gpu/drm/xe/xe_hwmon.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 382bf9625a8b..1b4efbf4ac99 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -138,13 +138,17 @@ struct xe_hwmon_thermal_info {
 	union {
 		/** @limit: temperatures limits */
 		u8 limit[TEMP_LIMIT_MAX];
-		/** @data: temperature limits in dwords */
-		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
+		/** @data: temperature limits as little-endian dwords */
+		__le32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
 	};
 	/** @count: no of temperature sensors available for the platform */
 	u8 count;
-	/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
-	u8 value[U8_MAX];
+	union {
+		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
+		u8 value[U8_MAX + 1];
+		/** @dword: sensor values as little-endian dwords, u32-aligned for pcode reads */
+		__le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
+	};
 	/** @vram_label: vram label names */
 	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
 };
@@ -807,16 +811,17 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 config = 0;
+	u32 config = 0, data0 = 0, data1 = 0;
 	int ret;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
-			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+			    &data0, &data1);
 	if (ret)
 		return ret;
 
-	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
-		hwmon->temp.data[0], hwmon->temp.data[1]);
+	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n", data0, data1);
+	hwmon->temp.data[0] = cpu_to_le32(data0);
+	hwmon->temp.data[1] = cpu_to_le32(data1);
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
 			    &config, NULL);
@@ -840,16 +845,20 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 *dword = (u32 *)hwmon->temp.value;
 	s32 average = 0;
 	int ret, i;
 
-	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
+	guard(mutex)(&hwmon->hwmon_lock);
+
+	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
+		u32 data = 0;
+
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
-				    (dword + i), NULL);
+				    &data, NULL);
 		if (ret)
 			return ret;
-		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
+		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, data);
+		hwmon->temp.dword[i] = cpu_to_le32(data);
 	}
 
 	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
-- 
2.25.1

