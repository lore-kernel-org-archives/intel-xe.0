Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E62D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F0810E669;
	Wed, 10 Dec 2025 06:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJwc3TCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467C10E66A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347803; x=1796883803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5L+eXHnV5I4I4RtiC66iROTI8pkHFUywLx8JtAFNOe0=;
 b=QJwc3TCQQaWPjv0FnRKajDq39deO1G4/1grcqWXgR4dph6QJQkCF/efY
 MGdndagwsu4K6tIapWm0E+L5KMedfsXlOTXaU6yKhru8jvlY80cZZDtfv
 Sc7LmnYafVZFtdIXPL95IoMgmcE8FB2RQ85IY1W/P+qsEMHXupzxBT3A3
 CwahVS6utsdv491fDgb/BlpgmFt3PqzItwW3sxcV/dUWflvVAFayGh11Z
 CQxwbhUOK6yjZJXtJcqtUn+at5Pbfe19vwaKznCmJmxXWYo0PD/Wj/Sm9
 u/gg382Lc5MxBN9s1tLNyAs/X6qiIJK+ZMnHhSFuSZ/BcTeh3TRIgmfht g==;
X-CSE-ConnectionGUID: KZ73InMJRU6UDVtZpAGrHg==
X-CSE-MsgGUID: rPWYHBP2Q+GypUxQmyvaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176012"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176012"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:22 -0800
X-CSE-ConnectionGUID: buI+EnvJSqqSm3SWmeX5mQ==
X-CSE-MsgGUID: 3Y7O/fjgTl+Y2eR1T0A3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483801"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:18 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 2/7] drm/xe/hwmon: Expose tempX_emergency
Date: Wed, 10 Dec 2025 11:52:56 +0530
Message-Id: <20251210062301.4080549-3-karthik.poosa@intel.com>
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

Expose shutdown temperature as tempX_emergency for package
and vram.
Update Xe hwmon documentation for this entry.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 ++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 39 +++++++++++++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d9e2b17c6872..feb33e5ccabc 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -196,3 +196,19 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Package shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 16f0cc2a0ae4..2dcb9ad74a6e 100644
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
@@ -690,8 +698,10 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 static const struct hwmon_channel_info * const hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_LABEL,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
 			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
@@ -819,6 +829,16 @@ static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	switch (attr) {
+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
+		case CHANNEL_VRAM:
+			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
+		default:
+			return 0;
+		}
+		break;
 	case hwmon_temp_input:
 	case hwmon_temp_label:
 		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
@@ -839,10 +859,23 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 
 		/* HW register value is in degrees Celsius, convert to millidegrees. */
 		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
-		return 0;
+		break;
+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			break;
+		case CHANNEL_VRAM:
+			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+	return 0;
 }
 
 static umode_t
-- 
2.25.1

