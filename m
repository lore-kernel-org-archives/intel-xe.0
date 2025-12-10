Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CCFD2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E6E10E66B;
	Wed, 10 Dec 2025 06:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njbE4geP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DCA10E66B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347808; x=1796883808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wLlJfE8e9y5lnywMdVOSgcQ+sEmCCBepM0FOSkFAQLc=;
 b=njbE4gePUqAFPv1Td22/J0oqwba8/NeLWgqVCiT+CZDnRd+w725sfYyQ
 +7WV/lWZRl9TsZFZZWjUPpRPTtAMyOmlqvI9KeIXqzO1NEeEXN1XjvrJL
 oe89ZRE6xpA/Euq+St8sDmAbtMXpiqpE2C+dOUs85VyMerR5swxlNJFge
 gIkLNTK7Jn/DruoMD8MAV1Lxw+DApuvwR6IRWQuHGE5xGHYvnFNn6x0CS
 cC5aO57vq0iLbTx9qwqQ3u/Zce7q02ODJyQEfJwjhn+7wO4ouCyhGtTJZ
 bD0aMCi5ql2bLzcPtEqHxP7bqA13bhzi1HcRadjJAsKawhTNKH8c9qQFz g==;
X-CSE-ConnectionGUID: VWRN7WXmRpygmn+7ODTh5Q==
X-CSE-MsgGUID: j1Z6oIA6RRqEIRit/Pm+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176016"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:28 -0800
X-CSE-ConnectionGUID: J927GrtETUCO9teNjiNM5w==
X-CSE-MsgGUID: EpseFWEYSR2uyJ1ljcXe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483811"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:26 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 4/7] drm/xe/hwmon: Read thermal sensors count
Date: Wed, 10 Dec 2025 11:52:58 +0530
Message-Id: <20251210062301.4080549-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251210062301.4080549-1-karthik.poosa@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
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

Read number of thermal sensors available.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c4a200cc2c23..e843021d13ec 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -99,6 +99,11 @@ enum sensor_attr_power {
  */
 #define PL_WRITE_MBX_TIMEOUT_MS	(1)
 
+/*
+ * Number of thermal sensors.
+ */
+#define MAX_THERMAL_SENSORS    (11)
+
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
  */
@@ -126,9 +131,11 @@ struct xe_hwmon_thermal_info {
 	union {
 		/** @limits: temperatures limits */
 		u8 limit[8];
-		/** @data: limits data dwords */
-		u32 data[2];
+		/** @dword: limit dwords */
+		u32 dword[2];
 	};
+	/** @count: no of temperature sensors */
+	u8 count;
 };
 
 /**
@@ -716,18 +723,31 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	int ret = 0;
+	u32 val = 0;
 
 	if (!hwmon->xe->info.has_mbx_power_limits)
 		return -ENXIO;
 
 	/* Read thermal info */
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
-			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+			    &hwmon->temp.dword[0], &hwmon->temp.dword[1]);
 	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
-		hwmon->temp.data[0], hwmon->temp.data[1]);
+		hwmon->temp.dword[0], hwmon->temp.dword[1]);
 	if (ret)
 		return ret;
 
+	/* Read thermal config */
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
+			    &val, NULL);
+	drm_dbg(&hwmon->xe->drm, "thermal config read ret %d, count %d\n", ret, val);
+	if (ret)
+		return ret;
+
+	hwmon->temp.count = val & TEMP_MASK;
+	if (hwmon->temp.count > MAX_THERMAL_SENSORS)
+		drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds supported limit %d\n",
+			 hwmon->temp.count, MAX_THERMAL_SENSORS);
+
 	return 0;
 }
 
-- 
2.25.1

