Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91568CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 14:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55910E0A7;
	Tue,  2 Dec 2025 14:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edMX6eK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEAE10E0A7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764687030; x=1796223030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bfs6+fx/6bP5cocUAIGk1ozmAXNy9/wKeRNHiRVD1Q0=;
 b=edMX6eK8kwMwh8aOd9THxwn9UM/0LNcpBC/KNwWpxx35vaYS95degcGk
 h8PXbox74oITkqXm919Oq5l2oUd8JKegS8QfpPcetEKVtP0HJN4WkRjZk
 NIaS+CkFM9Qnc9Z+Dcy5ByCythhAujVCGQ6WdAuht6xNwTAG9LgQNlhci
 i3PWppf+vJQZUt7n3/3jJmVNT+OIdYPGDIsPa2AxhfLv7BOxu/+DoCHLK
 XQtObSoGpvDzd2tMK6SSwBuktcuE/S6KKzM9S1Hz8zYZ/zwUO6UTBpXAt
 9pWFJXgDUxCoggG0DzRmc7DutaG3U67RtbwERKbDiNyoeDCEZPIDjyZks g==;
X-CSE-ConnectionGUID: Jmud6JsRTHWTpnKpfiWK2A==
X-CSE-MsgGUID: uYcrSB6EQFOoa6MYJDsn1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70512410"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70512410"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:30 -0800
X-CSE-ConnectionGUID: wRW3+7XFRQqAu5QBwNHuNw==
X-CSE-MsgGUID: KLHAlqqzTpyPtsXyul2/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198793321"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:28 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 1/3] drm/xe/hwmon: Read temperature limits using pcode
 mailbox
Date: Tue,  2 Dec 2025 20:20:11 +0530
Message-Id: <20251202145013.3273400-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251202145013.3273400-1-karthik.poosa@intel.com>
References: <20251202145013.3273400-1-karthik.poosa@intel.com>
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

Add support to read temperature limits using pcode
thermal mailbox commands.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 44 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h |  5 ++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ff2aea52ef75..df1df55c2499 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -53,6 +53,14 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+enum xe_temp_limit {
+	TEMP_LIMIT_PKG_SHUTDOWN,
+	TEMP_LIMIT_PKG_TJMAX,
+	TEMP_LIMIT_MEM_SHUTDOWN,
+	TEMP_LIMIT_PKG_CRIT,
+	TEMP_LIMIT_MEM_TJMAX,
+};
+
 /* Attribute index for powerX_xxx_interval sysfs entries */
 enum sensor_attr_power {
 	SENSOR_INDEX_PSYS_PL1,
@@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
 	u64 time_prev;
 };
 
+/**
+ * struct xe_hwmon_thermal_info - to store temperature data
+ */
+struct xe_hwmon_thermal_info {
+	union {
+		/** @limits: temperature limits */
+		u8 limit[8];
+		/** @data: limits data dwords */
+		u32 data[2];
+	};
+};
+
 /**
  * struct xe_hwmon - xe hwmon data structure
  */
@@ -137,7 +157,8 @@ struct xe_hwmon {
 	u32 pl1_on_boot[CHANNEL_MAX];
 	/** @pl2_on_boot: power limit PL2 on boot */
 	u32 pl2_on_boot[CHANNEL_MAX];
-
+	/** @thermal_limits: Temperature info */
+	struct xe_hwmon_thermal_info temp;
 };
 
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
@@ -689,6 +710,25 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	NULL
 };
 
+static int xe_hwmon_pcode_read_thermal_limits(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
+	int ret = 0;
+
+	if (hwmon->xe->info.platform <= XE_PVC)
+		return -ENXIO;
+
+	/* Read thermal info */
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
+			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
+		hwmon->temp.data[0], hwmon->temp.data[1]);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -1263,6 +1303,8 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	for (channel = 0; channel < FAN_MAX; channel++)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+
+	xe_hwmon_pcode_read_thermal_limits(hwmon);
 }
 
 int xe_hwmon_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 70dcd6625680..16201da0cf6b 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -65,6 +65,11 @@
 #define       FAN_TABLE				1
 #define       VR_CONFIG				2
 
+#define	PCODE_THERMAL_INFO			0x25
+#define	READ_THERMAL_LIMITS			0x0
+#define	READ_THERMAL_CONFIG			0x1
+#define	READ_THERMAL_DATA			0x2
+
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
-- 
2.25.1

