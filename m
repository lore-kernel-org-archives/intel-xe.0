Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD93D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162C210E666;
	Wed, 10 Dec 2025 06:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpCKJ/IC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F0510E66B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347805; x=1796883805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vHN7055TkfI5jYNBSAVbGKbOMkxQ0X8rSikeOiioGBE=;
 b=RpCKJ/ICyDfe4Ulsn+mIg+u26SzGBnnZrYcUmZjlyTIk9dw7A675UeBA
 2WtJVLVK9bQJrJkC+mz9yDdIxqBdL0Ig4AVJbF1/jcj5ZFqUfZQT3b4zb
 Z/LoKAJYLSfi8MWR2tyjL2AXAXE0iypr2xu24CbRt6wHPUnOrRYuk8D9G
 pKOdQif38WOskS+rTumQR+Bl7OFCd0l80FDWjK2hg8EOhjwV0JrbjT+NV
 sOe0bwSiuLqiYnr4nIzWfHBXhVdibStOkWBrgbqBTbEAAGt+VjLwv8Kzf
 EUmbsBifC29o4ZMI692AF94VkxsC0pkEdaUbthvmxkl20LpEViBx1PbyE g==;
X-CSE-ConnectionGUID: s2imo6zmTuCmAGTneNUyYA==
X-CSE-MsgGUID: P8JpvW2GR2exECDVVe2XfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71176014"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71176014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:25 -0800
X-CSE-ConnectionGUID: CYKo5h0qQ8uP5pp3VMHrBA==
X-CSE-MsgGUID: aT8XkW7QTsyp81kyqOnvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196483804"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:23:22 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 3/7] drm/xe/hwmon: Expose tempX_crit
Date: Wed, 10 Dec 2025 11:52:57 +0530
Message-Id: <20251210062301.4080549-4-karthik.poosa@intel.com>
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
index 2dcb9ad74a6e..c4a200cc2c23 100644
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

