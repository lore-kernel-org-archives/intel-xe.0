Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A2CCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EFA10E58F;
	Mon, 12 Oct 2026 13:05:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E3710E58F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 13:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791810299; x=1823346299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhfsQ1PRY0mviZKHadAWY04PiyjGPnAV6S/agg782k8=;
 b=FatMj0tr0d2SVWziZUtXwFS4O4py+gGhbcMfbN8wgKEDUCwq8h69LeHm
 rogt7ylfa9EeWyTdRPZ5olZwYG7q+ZWBmHNdp8zVZfxny72Uk/0Vo5aM3
 Gu7saOy8HUymvSEMsRKa03ZVUaSOpuasAtlqDG/AYS+SQf4OUEsGt4mIc
 S3i8slG5Mn+nj1NQFD/kPnCtZAr22Sgfdjj4wdNtibI4rDhebXsTtgMKD
 lvKf7hKzah3IT2wSl11YLvGz30uJyaRRadqcX0eU1JKoEAXHeOto9w3tQ
 lOm+N5A+WEqKu1rBKe6IhKSqGsRj7davSE7NUyqzL/t/tR90StfjiHO4u w==;
X-CSE-ConnectionGUID: 5Uol3NiWTvKzJbxq9mZvAw==
X-CSE-MsgGUID: exWCvQmvRhy3iBiSWppyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="527241"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="527241"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:04:58 -0700
X-CSE-ConnectionGUID: ZcZF3jumSZiRY3G9Z/yS4Q==
X-CSE-MsgGUID: EVIpX4UtTAKSRUg2V/nd2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2681939"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:04:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v10 03/16] drm/xe/hwmon: Fix thermal sensor data handling
Date: Mon, 12 Oct 2026 18:33:49 +0530
Message-Id: <20261012130401.443473-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012130401.443473-1-karthik.poosa@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
Fixes: c332fba805d6 ("drm/xe/hwmon: Expose temperature limits")
---

v2:
- Store thermal data and limit words as little-endian to fix the
  byte-view decoding on big-endian hosts. (Sashiko)

 drivers/gpu/drm/xe/xe_hwmon.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c63aa708ab6f..2d1fa9159c58 100644
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
@@ -798,16 +802,17 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
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
@@ -831,16 +836,18 @@ static int mbx_temp_decode(u8 value)
 static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 *dword = (u32 *)hwmon->temp.value;
 	s32 average = 0;
 	int ret, i;
 
-	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
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

