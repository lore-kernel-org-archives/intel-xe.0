Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9DAC44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050BA10F268;
	Fri, 17 Jul 2026 04:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlnEMlat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D605310E74D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261353; x=1815797353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zW4XC0oCxGxW4g4m3ZIj1zZCqqQTt53v/BFzPvNC5sY=;
 b=SlnEMlatOD2yrAno/MKZW2JdCUhExF92EgxtNrz2iWSIszSAMJRGa2pI
 wD8iPuuuDddWLQIbsrRERVLgAvUCUJBv5J3gZdQQE/1NpBetd5FCE3Frm
 DJPS4+hQsjTrXxMdSTTASzD0qeZu/zZG9okZBLOzbecixtcGuqeTW/LkH
 UzPkqHtvKkk9MMwwBNKiQlehf+90/0kjD/O/DVNec8c/71tdMzqjS43vB
 mmJOwpOenYyoc6l98BlqZwFoexpO3uoyHq3FIbNGYyuBKZ8+IT6kTrnme
 QCwrZmn/CbQtojTBYgTWjna6xQ5CjV3Ie5ENwzX6+EKUlhSH2u5nrRiRe Q==;
X-CSE-ConnectionGUID: KjfS66O4R3SY0mHRhiVnrA==
X-CSE-MsgGUID: 2uRmCuSvQPmW+LdNLE9izA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129351"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129351"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:13 -0700
X-CSE-ConnectionGUID: oGSlbCguS3e9cy2RpjuZ+A==
X-CSE-MsgGUID: ZqW7W7yNQU+8VD8ltdCAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538889"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:10 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 3/9] drm/xe/hwmon: expose fanN_max
Date: Fri, 17 Jul 2026 09:47:51 +0530
Message-Id: <20260717041757.2759084-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717041757.2759084-1-karthik.poosa@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon    |  8 ++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                  | 18 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h              |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 0da739d9a816..ec0b94d76e22 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -266,6 +266,14 @@ Description:	RO. Fan 3 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
+Date:           July 2026
+KernelVersion:  7.2
+Contact:        intel-xe@lists.freedesktop.org
+Description:    RO. Maximum fan speed in RPM for each fan channel.
+
+                Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
 Date:		May 2025
 KernelVersion:	6.15
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0a416e3e7b8c..769f4d1da83e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -165,6 +165,8 @@ struct xe_hwmon_fan_info {
 			u8 speed;
 		} fcp[MAX_FAN_CONTROL_POINTS];
 	} fan_table[FAN_TABLE_MAX];
+		/** @max_rps: maximum fan RPS */
+		u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
 };
@@ -799,7 +801,8 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
-	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_MAX),
 	NULL
 };
 
@@ -987,6 +990,14 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 		}
 
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
@@ -1406,6 +1417,7 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_fan_input:
+	case hwmon_fan_max:
 		return channel < hwmon->num_fans ? 0444 : 0;
 	default:
 		return 0;
@@ -1457,6 +1469,10 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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
index 669010f1e2d0..419ab4f416fa 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -84,6 +84,7 @@
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
 #define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_READ_MAX_FAN_RPS        0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
 #define     FSC_READ_FAN_TABLE			0x7
-- 
2.25.1

