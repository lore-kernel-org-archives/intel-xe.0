Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8648ACD8C9D
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 17:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4222010EADF;
	Sun,  7 Jun 2026 17:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DywFRsi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5110EADC
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780852797; x=1812388797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BIyMZenlLojyd5PWCk/n3FTZseUSIICcfKtykCV27wY=;
 b=DywFRsi490pDAHrBx5v+z32xI+DHbtHYL91P9b5LiZlYO9yR3stgWSS/
 BTL9hzzaj342gmRrkEdK4fMho9/TnZm+Tn/AjldtaGdsmV+ETjYZRSFIo
 bwHZEM7aeHakyZrDAP2cox3B1H3izeURp3Qo5hgWwMeOWIeQ9La8wterk
 TZkdeqYU69s72AOVjyvYm3ytjrBlMJjYY6S156IE9C1q13jIiBiL9ZRf3
 faA+QuLGgtPTIUTO6jiJ0YkwJasS9QcaI9ORzLJuC4qL4VEBBTfJTxeJv
 E69VT+JuFs3rQ7V2YFpD0bHFI6KUpb1TlY4LKXHkbo3HJu9N/JmbSWRLj g==;
X-CSE-ConnectionGUID: SsJk95XEStiIHJtiYJ4hFQ==
X-CSE-MsgGUID: pQwjnMDuRJWnhL0aR2lNGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80737542"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="80737542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:19:57 -0700
X-CSE-ConnectionGUID: dH2Zeu7RTw+lPU6NOmf72Q==
X-CSE-MsgGUID: FBgF4tekS6KdYym7RlCV3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="275521603"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:19:54 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 2/5] drm/xe/hwmon: expose fanN_max
Date: Sun,  7 Jun 2026 22:58:45 +0530
Message-Id: <20260607172848.2970580-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260607172848.2970580-1-karthik.poosa@intel.com>
References: <20260607172848.2970580-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  8 +++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 21 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h             |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 55ab45f669ac..557e0f68aba6 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -259,6 +259,14 @@ Description:	RO. Fan 3 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
+Date:           June 2026
+KernelVersion:  7.1
+Contact:        intel-xe@lists.freedesktop.org
+Description:    RO. Maximum fan speed in RPM for each fan channel.
+
+                Only supported for particular Intel Xe graphics platforms.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
 Date:		May 2025
 KernelVersion:	6.15
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 8d9ddbbc95ef..5548d0a3df66 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -163,6 +163,8 @@ struct xe_hwmon_fan_info {
 		/** @last_point_speed_valid: last user PWM point was written */
 		bool last_point_speed_valid;
 	} fan_table[FAN_TABLE_MAX];
+		/** @max_rps: maximum fan RPS */
+		u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
 	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
@@ -810,7 +812,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
-	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_MAX,
+			   HWMON_F_INPUT | HWMON_F_MAX),
 	NULL
 };
 
@@ -1074,6 +1078,16 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 
 		drm_dbg(&hwmon->xe->drm, "fan %d min PWM %u\n", fan, fi->min_pwm);
 
+		/* Read max fan RPS*/
+		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
+						      &fi->max_rps);
+		if (ret)
+			drm_dbg(&hwmon->xe->drm,
+				"failed to read fan %d max RPS, ret=%d\n", fan, ret);
+		else
+			drm_dbg(&hwmon->xe->drm,
+				"fan %d max RPS %u\n", fan, fi->max_rps);
+
 		/*
 		 * Initialize user table same as stock table during initialization so that it will
 		 * be ready for use.
@@ -1527,6 +1541,7 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	switch (attr) {
 	case hwmon_fan_input:
+	case hwmon_fan_max:
 		return channel < hwmon->num_fans ? 0444 : 0;
 	default:
 		return 0;
@@ -1578,6 +1593,10 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
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
index 84384f1b0257..5c5fdc650a97 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -86,6 +86,7 @@
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
 #define     FSC_WRITE_FAN_TABLE			0x1
+#define     FSC_READ_MAX_FAN_RPS        0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
 #define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
-- 
2.25.1

