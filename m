Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2100CCA465
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8399711244E;
	Thu, 15 Oct 2026 19:02:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FEF10E3AA
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792090928; x=1823626928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MjDzL2y7MX3yXpuLrKp8jdC+JaLgs0mWYM7/ARV+4pA=;
 b=IFXIx+FSuYzssupgGxh2H/pqeAshCLeaXupkMPAaLxA8ux8WkDR2kcjo
 jNc1MN6uD3yuAAHeWqTmH6QPBeGm1F7AvFezA/o7dbn258J5nGhP63yA9
 05hORoEsjhdMH78ZRt4UtF2NDJ/Cq3maAtVyA2ggLyQ0LK1aboLj6g4VS
 gs4yUq7kSU3lit29Q+2L0i9Dqtt8WUCKIH7qk4Bld5ZKvEjJeelDjjITx
 F37UL8iLKlvU3zdvRJCnjMOA6RTRcOGnYM/XoxwJegDEc7b0QpbIMBldn
 QEjs9MX9v+1RoniO8yZNybFG0g5AJPSc8s2iprp2edxgmxA0ByFdj2JjV g==;
X-CSE-ConnectionGUID: /o9l8ce9RO6RI1S9D5NGRA==
X-CSE-MsgGUID: Y4niaCyvQ9636snq2qcUjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="751506"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="751506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:02:08 -0700
X-CSE-ConnectionGUID: X23Hiib9RJmIbIxhqEwgNg==
X-CSE-MsgGUID: 02pqn7/MSZCGdzY/Bxv0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1774583"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:02:05 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 2/9] drm/xe/hwmon: expose fanN_max
Date: Fri, 16 Oct 2026 00:31:05 +0530
Message-Id: <20261015190113.1268522-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015190113.1268522-1-karthik.poosa@intel.com>
References: <20261015190113.1268522-1-karthik.poosa@intel.com>
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

Expose fan maximum RPM via fanN_max.

The value is derived from the firmware-reported maximum fan RPS and
converted to RPM in the fan hwmon read path.

Update Xe hwmon ABI documentation for fanN_max.

v2: Use xe helper for dmesg logs.

v3:
 - Fix indentation of the max_rps struct member.
 - Enable fanN_max only when fanN is supported.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  8 ++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 19 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h             |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 0da739d9a816..5ee68aefa485 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -266,6 +266,14 @@ Description:	RO. Fan 3 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
+Date:           October 2026
+KernelVersion:  7.3
+Contact:        intel-xe@lists.freedesktop.org
+Description:    RO. Maximum fan speed in RPM for each fan channel.
+
+                Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
 Date:		May 2025
 KernelVersion:	6.15
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f2bd20f8b0a2..32016c5d4770 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -181,6 +181,8 @@ struct xe_hwmon_fan_info {
 			u8 speed;
 		} fcp[MAX_FAN_CONTROL_POINTS];
 	} fan_table[FAN_TABLE_MAX];
+	/** @max_rps: maximum fan RPS */
+	u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
 };
@@ -909,7 +911,8 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
-	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_MAX),
 	NULL
 };
 
@@ -1219,6 +1222,14 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 			xe_warn(hwmon->xe, "fan %d min pwm unavailable, ret=%d\n", fan, ret);
 		else
 			xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
+
+		/* Read max fan RPS*/
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
+						      &fi->max_rps);
+		if (ret)
+			xe_warn(hwmon->xe, "failed to read fan %d max RPS, ret=%d\n", fan, ret);
+		else
+			xe_dbg(hwmon->xe, "fan %d max RPS %u\n", fan, fi->max_rps);
 	}
 	return 0;
 }
@@ -1756,6 +1767,8 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_fan_input:
 		return IS_FAN_ENABLED(channel) ? 0444 : 0;
+	case hwmon_fan_max:
+		return IS_FAN_ENABLED(channel) && hwmon->fi[channel].max_rps ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1806,6 +1819,10 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	switch (attr) {
 	case hwmon_fan_input:
 		return xe_hwmon_fan_input_read(hwmon, channel, val);
+	case hwmon_fan_max:
+		/* Convert RPS to RPM */
+		*val = (long)hwmon->fi[channel].max_rps * 60;
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 0349b24a8259..32bac74c4281 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -82,6 +82,7 @@
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
 #define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_READ_MAX_FAN_RPS        0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
 #define     FSC_READ_FAN_TABLE			0x7
-- 
2.25.1

