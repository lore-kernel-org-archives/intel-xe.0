Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC3ACCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC91112463;
	Thu, 15 Oct 2026 19:09:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1631A112460
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091341; x=1823627341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YIyH0Kx5Zb8XAB2sYbJ1QzDg4pYYGNoeywpHR37x3Wk=;
 b=WT3xGp7Pem7F4TcnHYQwd+vcRuySQW2G+wqSQnK2DEM+1bnu651u28zR
 4zFOzh5VmmnsSkWSsktazvOECXCuUkMfD8JHSFq3tM8BZ7Kca9ZMoCHcF
 99KAdPETme56YzFQ7RnKdu6olQxqS19uTLdssjhh9EyQhU8i4vjc5+uCb
 vHLQ4CHZYyWzHoiyse1CTAgXCMryFIzXKfTcDqTDg71id2BT6x2V53J3w
 j1v7eACUoTxBf8PRVyg+hYXfd/EyqQ9wYCH9Jd6ZBrAk+0R4TLY1pv2BI
 qf8+ZNhCOkBEtUiQ2QFfdMrq7UDmtl0gDXZ0svYqPscmm+rqPytRcfALF w==;
X-CSE-ConnectionGUID: DK1AgaS8RwaVN46Ccyb4iA==
X-CSE-MsgGUID: MGEfUYtWSs+A6c8hZoXW1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770383"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:09:00 -0700
X-CSE-ConnectionGUID: BKiOD6E1SmmypxBSeYBQLg==
X-CSE-MsgGUID: C/vDeC8mSrWKtceVE6OoDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835257"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:08:58 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 7/9] drm/xe/hwmon: Add kernel-doc for fan control
Date: Fri, 16 Oct 2026 00:37:49 +0530
Message-Id: <20261015190751.1268916-8-karthik.poosa@intel.com>
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

Add kernel-doc for xe hwmon fan control and describe the fan control
model built around firmware stock tables and driver-managed user tables.

Document the exposed sysfs files for fan speed, maximum speed, pwm
control, pwm mode selection, and per-point fan curve temperature/PWM
programming.

This makes the hwmon fan control userspace interface easier to discover
and understand.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_hwmon.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de2adb56d15b..aa3c921407b5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -139,6 +139,49 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+/**
+ * DOC: Xe fan control
+ *
+ * Xe fan control is exposed through the hwmon pwm and fan interfaces when the
+ * platform advertises PCODE-backed fan management support.
+ *
+ * The implementation tracks two fan tables per fan:
+ *
+ * - A stock table read from firmware through PCODE.
+ * - A user table cached in the driver and programmed back through PCODE.
+ *
+ * The pwmN_enable sysfs mode selects how those tables are used:
+ *
+ * - ``XE_FAN_PWM_AUTO_STOCK_TABLE`` restores automatic control using the stock
+ *   firmware table.
+ * - ``XE_FAN_PWM_MANUAL_USER_TABLE`` enables the user table for manual control.
+ * - ``XE_FAN_PWM_FULL_SPEED`` reuses the user table path but programs every
+ *   point to 100 percent duty cycle as a full-speed override.
+ *
+ * The fan-control sysfs files are:
+ *
+ * - ``fanN_input`` reports the measured fan speed in RPM.
+ * - ``fanN_max`` reports the maximum supported fan speed in RPM.
+ * - ``pwmN`` reads or sets the manual PWM duty cycle in the hwmon 0..255
+ *   range. Manual writes are accepted only while ``pwmN_enable`` is set to
+ *   ``XE_FAN_PWM_MANUAL_USER_TABLE``.
+ * - ``pwmN_enable`` selects stock automatic mode, manual user-table mode, or
+ *   full-speed override.
+ * - ``pwmN_auto_pointM_temp`` exposes the temperature threshold for user-table
+ *   point ``M`` in millidegrees Celsius.
+ * - ``pwmN_auto_pointM_pwm`` exposes the PWM value for user-table point ``M``
+ *   in the hwmon 0..255 range.
+ *
+ * Writes to pwmN_auto_pointM_temp and pwmN_auto_pointM_pwm update the cached
+ * user table entries. The driver commits the full user table once the last
+ * point has both temperature and PWM values, which keeps intermediate sysfs
+ * writes from pushing partially updated curves to firmware.
+ *
+ * Writes to pwmN provide a constant manual duty cycle by rewriting every point
+ * in the active user table to the same PWM value, clamped against the minimum
+ * duty cycle reported by firmware for that fan.
+ */
+
 enum xe_fan_pwm_enable_mode {
 	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
 	XE_FAN_PWM_FULL_SPEED = 0,
-- 
2.25.1

