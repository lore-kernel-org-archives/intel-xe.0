Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5CB606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bFD9bwKL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63BE10E26F;
	Sat, 28 Nov 2026 05:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBD810E271
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845506; x=1827381506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ru6alTgddoL/nVJW3H2BClVNR2n0t2nKMpwaNOox6+s=;
 b=bFD9bwKLA5bJ+z4utD8SISmUrPZSKL1BdjUFGBvm50IMklQiXxtWTw9s
 bFKvzQPDkqeWd89iAdNKnaoJT88aduu0Sn/PL3zKorulqbuJE0BoNhfDc
 2UfOf0VOB0eL/y5vLe8kadt9Df2raf9kgp/6t18S2dPXEn9bnaTvsWBcw
 T2Ihk2swwcQqxF3d4ihOcAqXqqGX8GbDhcSaFGaJmclHUFsfSjsfI4BWw
 6Bl2WvlaAQ+G7iWtcM+NNVB9woi27X6sLZgNno3ycDYYwirZzrCbsxXKr
 YS9ODv+B+I3FDGUbLLyTLI8f8apiJ5MUy/mBjPGBA2MzQ6UuSymvIJ2TF Q==;
X-CSE-ConnectionGUID: ry/EY1NnT3GAX4YSR6INrg==
X-CSE-MsgGUID: 7/RxpHtWTAyKlOMsMbzQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754909"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:26 -0800
X-CSE-ConnectionGUID: JXJl1oroSce6fNZCKpuCMQ==
X-CSE-MsgGUID: cSMGgXkcSUKdbpLJb8VIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304389"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:23 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 10/10] drm/xe/hwmon: Add kernel-doc for fan control
Date: Sat, 28 Nov 2026 11:29:23 +0530
Message-Id: <20261128055923.3316956-11-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128055923.3316956-1-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
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

v2:
 - Clarify the registration-time visibility requirements.
 - Document how late binding affects existing fan attributes.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 92eb0aba6d4a..f5235dd33c57 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -140,6 +140,62 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+/**
+ * DOC: Xe fan control
+ *
+ * Xe fan control is exposed through the hwmon pwm and fan interfaces when the
+ * platform advertises PCODE-backed fan management support.
+ *
+ * Attribute visibility is determined during hwmon registration. ``fanN_max``
+ * requires maximum fan speed data, while ``pwmN`` and ``pwmN_enable`` require a
+ * readable stock fan table. Late binding refreshes cached data for existing
+ * fans but does not create attributes that were hidden at registration.
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
+ * rounded to the nearest percent step. Nonzero curve PWM writes are kept at
+ * least 1 percent so rounding cannot turn them into an end marker.
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

