Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590ADCC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D32011244C;
	Thu, 15 Oct 2026 19:08:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3A6112459
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091325; x=1823627325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MjDzL2y7MX3yXpuLrKp8jdC+JaLgs0mWYM7/ARV+4pA=;
 b=kePziGRY6Aj3PU0SF9rYw5/pQXAvXjTAbKAEORLkml6XO0FoVO2dfpP3
 JNd3js66G7Gpt7rdNU4hujfESjOpyBWWTA//67HJ3i0hnQ4n2cRJVe8e/
 I3UCpPcDvp3BJr5RefFEAzFOl0J79Kv3NSvSC+4tD9fa6ZTOxDOvyZPbu
 TGQM7Bzz0Q0YUGykIrCO73NCfsKvR+FbVBxTye3cFj/W/d1tlmR+SPTHX
 yJK8nx5aUBxJ/g9aZIi/59wObvrjpuGv7Fo9vEaJi83Dq2YSiEzCwCpgA
 3UpqbAXCHG9mJ7ksCwM2cgnjbvLrwk2vk5AZf9tjQCCPqmi5UM0rLKWGb Q==;
X-CSE-ConnectionGUID: HFqB1/sOShSZzjXdJ7NsQQ==
X-CSE-MsgGUID: KlhUqraMQKyOARS+igUIXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770360"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770360"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:45 -0700
X-CSE-ConnectionGUID: mrW4h1jbSX24uGEv9Ee+Hw==
X-CSE-MsgGUID: oPjfic8/RxiG3tewmld5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835224"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:43 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 2/9] drm/xe/hwmon: expose fanN_max
Date: Fri, 16 Oct 2026 00:37:44 +0530
Message-Id: <20261015190751.1268916-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015190751.1268916-1-karthik.poosa@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
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

