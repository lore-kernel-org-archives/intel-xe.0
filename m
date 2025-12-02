Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C709D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 14:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7D710E17B;
	Tue,  2 Dec 2025 14:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVSqf5fB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C7610E17B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764687034; x=1796223034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AnFaP5p+cctWEW0MccWBCJz2Z6+02K6UT70dOx6lnfg=;
 b=OVSqf5fBHuWGV9HSS3he6c/2tXJf7ZSEmtjSALYDUz1QC/jkVjhuMqqN
 4KjcPAQY0no0XGvE/xvPRWIkK3wXMeKxVrNck5lU87WPosOGJr9rXqqW+
 vZjSbN7ms9VVIeAPEU7fgK/3kbDTm4ituuAGhY++D73VehU4bi/om6hWM
 snn1uw6lsR9xGVrOxzu33gKvg97bxH9W6sFn5fD/DMHMnkks6JZd1c8AO
 h+/dNE88dFpv2WcO/2PIXJr5RlGyDo1K6X/aWBdPuxyU6DoPxuZOGJz5U
 GX4xT2J8eK4O8gLL/F6t2REfV10DjdFj6pYQj0bFe2LyZEvyFpO6wOfZr w==;
X-CSE-ConnectionGUID: 4W0YbxUDSPCjuSfCY1txmw==
X-CSE-MsgGUID: XkKJB5vERg+axRqeoN2fTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70512421"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70512421"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:34 -0800
X-CSE-ConnectionGUID: hO56QixlRaWl4BWdhRl7iA==
X-CSE-MsgGUID: SYtc1GpNSGmA0nDAQVgZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198793327"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:32 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 2/3] drm/xe/hwmon: Expose tempX_emergency
Date: Tue,  2 Dec 2025 20:20:12 +0530
Message-Id: <20251202145013.3273400-3-karthik.poosa@intel.com>
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

Expose shutdown temperature as tempX_emergency for package
and vram.
Update Xe hwmon documentation for this entry.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 ++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 31 +++++++++++++++++--
 2 files changed, 44 insertions(+), 3 deletions(-)

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
index df1df55c2499..130d285ba434 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -698,8 +698,10 @@ static const struct attribute_group *hwmon_groups[] = {
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
@@ -827,6 +829,16 @@ static umode_t
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
@@ -847,10 +859,23 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 
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

