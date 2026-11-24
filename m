Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0D606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L6DFMdTE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB34910E68C;
	Tue, 24 Nov 2026 05:46:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635F10E0DE
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499207; x=1827035207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HFWllF0ox5y6G6hZ94xMNKOiEIZMiGYZpEpL5Qe0ktA=;
 b=L6DFMdTE08/50cEQrfRuThaFUbQ+1k9cgEYSp1HkJkNj1E8aNiQj3yrb
 JKxxwQvgfdb5B9sPfrEXn37vyfXbntw7Zy4pFVPkBum0eE1Le3JHilExz
 cZUrcNOSW7pYuxJYfI0RMt44ju19c3LesX4N8XSSFAWDfwfiV35AVYMgL
 YCVzAEXlPqLxEVyHq9h/HtBp3wBAPrzUFCO2/ARtt5kNQIGCTeQwVfb/1
 U8bokjx6B2+27/hP1Jo/PB0X1aTJiO5o/cCGidlnYppzT5PUvwBh+hWVQ
 5mdoPAsUWUA3GOmORvXhEQf+qYqyCiupedzb/u6j2JfX64wtUlGYC7lqO g==;
X-CSE-ConnectionGUID: /vpR5LVoQLayvGqiDf3Wyw==
X-CSE-MsgGUID: Zgg91UGETCuxcXZzHA9C1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222651"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222651"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:47 -0800
X-CSE-ConnectionGUID: IU9jRSR4S3WzIRvEAAoQsA==
X-CSE-MsgGUID: Jwy3UakJQ3e+yuWpf5BdXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354614"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:44 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 07/10] drm/xe/hwmon: Add kernel-doc for fan control
Date: Tue, 24 Nov 2026 11:18:08 +0530
Message-Id: <20261124054811.798763-8-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124054811.798763-1-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add kernel-doc for xe hwmon fan control and describe the fan control
model built around firmware stock tables and driver-managed user tables.

Document the exposed sysfs files for fan speed, maximum speed, pwm
control, pwm mode selection, and per-point fan curve temperature/PWM
programming.

This makes the hwmon fan control userspace interface easier to discover
and understand.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

v2:
 - Document the numeric pwmN_enable values. (Soham)
 - Note that pwmN and curve point writes need manual mode. (Soham)
 - Document the (0, 0) end marker, the two-point minimum and the
   non-decreasing rule for curves. (Soham)
 - Describe pwmN writes as a two-point table and note percent rounding
   and the minimum duty cycle clamp.
 - Remove trailing whitespace.

 drivers/gpu/drm/xe/xe_hwmon.c | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f52d689507a6..42b6d67e3879 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -139,6 +139,58 @@ struct xe_hwmon_energy_info {
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
+ * The pwmN_enable sysfs value selects how those tables are used:
+ *
+ * - 0 (``XE_FAN_PWM_FULL_SPEED``) programs a two-point user table at 100
+ *   percent duty cycle as a full-speed override.
+ * - 1 (``XE_FAN_PWM_MANUAL_USER_TABLE``) enables the user table for manual
+ *   control.
+ * - 2 (``XE_FAN_PWM_AUTO_STOCK_TABLE``) restores automatic control using the
+ *   stock firmware table.
+ *
+ * The fan-control sysfs files are:
+ *
+ * - ``fanN_input`` reports the measured fan speed in RPM.
+ * - ``fanN_max`` reports the maximum supported fan speed in RPM.
+ * - ``pwmN`` reads or sets the manual PWM duty cycle in the hwmon 0..255
+ *   range.
+ * - ``pwmN_enable`` selects the mode described above.
+ * - ``pwmN_auto_pointM_temp`` exposes the temperature threshold for user-table
+ *   point ``M`` in millidegrees Celsius.
+ * - ``pwmN_auto_pointM_pwm`` exposes the PWM value for user-table point ``M``
+ *   in the hwmon 0..255 range.
+ *
+ * Writes to ``pwmN``, ``pwmN_auto_pointM_temp`` and ``pwmN_auto_pointM_pwm``
+ * are accepted only while ``pwmN_enable`` is 1; otherwise they fail with
+ * -EINVAL. Firmware stores duty cycle in percent, so PWM values read back
+ * rounded to the nearest percent step. PWM values below the minimum duty cycle
+ * reported by firmware for that fan are raised to it, except a curve point PWM
+ * of 0, which is kept for the end marker.
+ *
+ * Writes to ``pwmN_auto_pointM_temp`` and ``pwmN_auto_pointM_pwm`` are staged
+ * in the driver, so intermediate writes never reach firmware as a partial
+ * curve. The staged curve is committed once points 1..K all have both a
+ * temperature and a PWM value and either point K+1 is set to (0, 0) or K is
+ * the last supported point. The (0, 0) end marker is not part of the curve.
+ * A curve must have at least two points, and temperature and PWM must not
+ * decrease from one point to the next; otherwise the completing write fails
+ * with -EINVAL.
+ *
+ * Writes to ``pwmN`` replace the user table with a two-point table at a
+ * constant duty cycle.
+ */
+
 /**
  * enum xe_fan_pwm_enable_mode - fan PWM enable modes
  */
-- 
2.34.1

