Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7941DCD8C89
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 17:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5610EAE1;
	Sun,  7 Jun 2026 17:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJUgQgpi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8A310EAE1
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780852803; x=1812388803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=21vqBZ6Py0Yin6V0CPPqE6P8R7c6ahatpRsFNZae/Ug=;
 b=cJUgQgpi0+YkWNRXM9lldVDpMAezyPiLoXiUSnlo1RqHvpgXv4peuaOi
 U4HwF0F40ZvQcTeouLFj8ZPnFhCoR/nbg10vv2rIOEIm+8/dOK3HBFxl8
 asw6hOY9EpLYdRUpLPFIY8X4IcafJh5lu+QnOMk61gjcy85PoqjDJI2UN
 AZJ/4xdgk0FC+4kWLBxpO1BS22wAKzTKNiWF0CgCGxajtQozoeLCJjLyH
 9YPqOMePGh1r76UQt1lWKm8ucu09cCAHE2dkUXU6lXumndC8Gjs4CThO3
 wlqADlUHIHJz1vBcVmhI3dc7B5LYQteN2e0xJM0lmIZyKX4zHE+3RJn/Z g==;
X-CSE-ConnectionGUID: lU0E0y5PSC6bAZ4ml73H7w==
X-CSE-MsgGUID: EU7Tv/n7RMCtDK4Eug/0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80737544"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="80737544"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:20:03 -0700
X-CSE-ConnectionGUID: Bras4PRgR42rTFZeJsrdAw==
X-CSE-MsgGUID: iGrYE5XYR3CxTts2GbXL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="275521625"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:20:01 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 4/5] drm/xe/hwmon: expose pwm[1-3]_enable
Date: Sun,  7 Jun 2026 22:58:47 +0530
Message-Id: <20260607172848.2970580-5-karthik.poosa@intel.com>
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

Expose pwm[1-3]_enable for fan control mode selection.
Value of 0 runs fan at full speed.
A value of 1 keeps user fan-table control active, while value 2
switches back to firmware control.

Update Xe hwmon ABI documentation for pwm[1-3]_enable.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 11 ++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 53 ++++++++++++++++++-
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 58086eb2beda..a8cf93908558 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -323,3 +323,14 @@ Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
                 fan speed and 255 is 100% fan speed.
 
                 Only supported for particular Intel Xe graphics platforms.
+
+What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
+Date:          June 2026
+KernelVersion: 7.1
+Contact:       intel-xe@lists.freedesktop.org
+Description:   RW. Fan control mode selector.
+
+               Use value 0 to run fans at full speed. Use value 1 to enable
+               user table control and value 2 to use firmware-controlled behavior.
+
+               Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c00d36e3fbe5..2aa66918b549 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -815,7 +815,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
@@ -1619,6 +1621,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
 		return 0644;
 	default:
 		return 0;
@@ -1700,6 +1703,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 			return -ENODATA;
 		}
 		return 0;
+	case hwmon_pwm_enable:
+			*val = fi->is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi->pwm_enable_mode;
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1708,6 +1714,7 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static int
 xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	struct xe_hwmon_fan_info *fi;
 	int ret = 0;
 
@@ -1736,13 +1743,55 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 
 		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
 		break;
+	case hwmon_pwm_enable:
+		if (val == XE_FAN_PWM_FULL_SPEED) {
+			/* Set fans at full speed. */
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, true);
+			if (ret) {
+				drm_dbg(&hwmon->xe->drm,
+					"failed to activate full speed fan table for fan %d, ret=%d\n",
+					channel, ret);
+			}
+		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
+			/*
+			 * Manual fan speed control using user fan table.
+			 * If user fan table is not programmed, it would be initialized with
+			 * clamped stock points which allows manual control with some
+			 * default points.
+			 */
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false);
+			if (ret) {
+				drm_dbg(&hwmon->xe->drm,
+					"failed to activate user fan table for fan %d, ret=%d\n",
+					channel, ret);
+			}
+		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+			/* Automatic fan speed control, uses stock fan table */
+			ret = xe_pcode_write(root_tile,
+					     PCODE_MBOX(FAN_SPEED_CONTROL,
+							FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+							channel),
+					     0);
+			if (ret) {
+				drm_dbg(&hwmon->xe->drm,
+					"failed to disable user fan table for fan %d, ret=%d\n",
+					channel, ret);
+				break;
+			}
+			drm_dbg(&hwmon->xe->drm,
+				"automatic control enabled for fan %d using stock table\n",
+				channel);
+		} else {
+			ret = -EINVAL;
+		}
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
 	}
 
 	/* Update PWM enable mode and full speed status if no error occurred */
-	if (!ret) {
+	if (!ret && attr == hwmon_pwm_enable) {
 		fi->pwm_enable_mode = val;
 		fi->is_full_speed = (val == XE_FAN_PWM_FULL_SPEED);
 	}
-- 
2.25.1

