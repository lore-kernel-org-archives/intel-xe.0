Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770B2D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 14:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45B10E613;
	Tue,  2 Dec 2025 14:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLeX6lZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5316710E613
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764687037; x=1796223037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6R2ptGRSCpk6QcK65rQye3vfpAcK7qSXjSn0WMgQkbs=;
 b=MLeX6lZOkiHEq7iBIXlL+9BpWrL1buK0KXb9S/aR4zF3ONWB06beEGGU
 eaNSt5MuhWIwtK77ogVJiwwigi21I8f6F99mrKvLUoWMbdNtsE2QkGtD8
 OI7sIgGi9hlLLX5SveH6dfAxhK87V7OxD5nkRRA/+zvd20YXZNpxQ/pwR
 PlpCylXKErjObauzmmOK5/nE/hHwbCFjm6+cfPxFoMYg74gyxWM28SkKn
 wiPNQLWevEDAVoiQ+Agvy3/V6Xg57V5vOGKb/Ewlep7D58bZFrw+pz7LO
 uT7Um9+M35CaHdMIurORsdjpyZaJKW/t1V8kZHKhCRMUhNPbuAHAl6VeH A==;
X-CSE-ConnectionGUID: BGthY5w6TFSRUPtwJAUDEg==
X-CSE-MsgGUID: 4FbKaRC3SpCLwm5LRPdGTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70512424"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70512424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:37 -0800
X-CSE-ConnectionGUID: 08XYbhgaRGqqaNe+sa5RYw==
X-CSE-MsgGUID: 8ZigWcPbT0+tQ/8j66jYVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198793335"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:50:35 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 3/3] drm/xe/hwmon: Expose tempX_crit
Date: Tue,  2 Dec 2025 20:20:13 +0530
Message-Id: <20251202145013.3273400-4-karthik.poosa@intel.com>
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

Expose critical temperature of as tempX_crit for package and
vram.
Update Xe hwmon documentation for this entry.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 28 +++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index feb33e5ccabc..60bc71ce9951 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -212,3 +212,19 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. VRAM shutdown temperature in millidegree Celsius.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Package critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. VRAM critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 130d285ba434..e035dc08fc31 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -700,8 +700,8 @@ static const struct attribute_group *hwmon_groups[] = {
 static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_LABEL,
-			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY,
-			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY),
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
 			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
@@ -839,6 +839,16 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return 0;
 		}
 		break;
+	case hwmon_temp_crit:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
+		case CHANNEL_VRAM:
+			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
+		default:
+			return 0;
+		}
+		break;
 	case hwmon_temp_input:
 	case hwmon_temp_label:
 		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
@@ -869,6 +879,20 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
 			break;
 		default:
+			*val = 0;
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_temp_crit:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
+			break;
+		case CHANNEL_VRAM:
+			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
+			break;
+		default:
+			*val = 0;
 			return -EOPNOTSUPP;
 		}
 		break;
-- 
2.25.1

