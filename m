Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848BB606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=USovw7Zc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1CA10E271;
	Sat, 28 Nov 2026 05:57:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B3710E26F
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845470; x=1827381470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dp1+8Rh892SW7CGFSEk9orub9eHCT/nHirx96dI7yHs=;
 b=USovw7ZcIBMrW/+YLAiz7CYHUh+KSY6OfbZtjbEoTuRQOlV9u3N0Qu/X
 gsnsUlU1XaUfxvEHE3IdP+c8AtHlPRLU2gjdaasPBaaX8o/HIaR+/QgaS
 bxbE7UemNeSF2qdRV0c2AffXaGHqebXJIQvBX6BCc4w0FwunDAcxxuPnE
 TI+h6QUGNGPdf6A9sO16h+yo4i14dbMcoJ0y22zXyssPGU5q0WPhFFee3
 9xacft+hXjHo/qpzgh3MKdzwBKsdgvhz5575TZ9gfE0pHSimKC85G6Osd
 oruZo/kb77R+gEOuNXFDP1UnXhsEQa0RUEGKOKuXt3tVQ9MzNyLbbdlsO g==;
X-CSE-ConnectionGUID: lKx2q8/XQ7ykoBf6p4CWDQ==
X-CSE-MsgGUID: OcZNsVWdRteUgryyO5aCDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754885"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754885"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:57:49 -0800
X-CSE-ConnectionGUID: W/OzJrEwS/6nclZzoE2Cyw==
X-CSE-MsgGUID: qVKtGXFOTtGljPii/qn5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304237"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:57:46 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 00/10] drm/xe/hwmon: Add fan control support
Date: Sat, 28 Nov 2026 11:29:13 +0530
Message-Id: <20261128055923.3316956-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds Intel Xe fan control through the hwmon sysfs ABI: fan
maximum speed, direct PWM control, mode selection and programmable fan
curves. Supported platforms are BMG in this series.

Each fan has a stock table read from firmware and a user table cached in
the driver and written back through PCODE.

Series overview

 01 Initialize fan-control backend and table cache
    Read the fan enable mask, max RPS, minimum PWM and stock fan tables.
 02 Expose fanN_max
    Maximum fan speed in RPM.
 03 Add ordered write batch helper
    PCODE helper that writes a fan table in order.
 04 Expose pwm[1-3]
    Constant duty cycle in the hwmon 0..255 range.
 05 Expose pwm[1-3]_enable
    0 = full speed, 1 = manual user table, 2 = firmware automatic.
 06 Enable fan curve control support
    pwm[1-3]_auto_point[1-10]_{temp,pwm}.
 07 Restore fan user tables after resume
 08 Refresh fan data after late binding
 09 Expose tjmax_fan_control_enable device sysfs
 10 Add kernel-doc for fan control

The ABI is documented in
Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon.

Usage

Read fan speed and max RPM:
  cat /sys/class/hwmon/hwmonX/fan1_input
  cat /sys/class/hwmon/hwmonX/fan1_max

Manual mode with a fixed PWM:
  echo 1 > /sys/class/hwmon/hwmonX/pwm1_enable
  echo 120 > /sys/class/hwmon/hwmonX/pwm1

Back to firmware automatic control:
  echo 2 > /sys/class/hwmon/hwmonX/pwm1_enable

Program a 3-point fan curve:
  echo 1 > /sys/class/hwmon/hwmonX/pwm1_enable
  echo 30000 > /sys/class/hwmon/hwmonX/pwm1_auto_point1_temp
  echo 50 > /sys/class/hwmon/hwmonX/pwm1_auto_point1_pwm
  echo 60000 > /sys/class/hwmon/hwmonX/pwm1_auto_point2_temp
  echo 120 > /sys/class/hwmon/hwmonX/pwm1_auto_point2_pwm
  echo 85000 > /sys/class/hwmon/hwmonX/pwm1_auto_point3_temp
  echo 200 > /sys/class/hwmon/hwmonX/pwm1_auto_point3_pwm
  echo 0 > /sys/class/hwmon/hwmonX/pwm1_auto_point4_temp
  echo 0 > /sys/class/hwmon/hwmonX/pwm1_auto_point4_pwm

Notes
 - Package temperature (temp2_input) is the fan table temperature
   reference.
 - pwmN and curve point writes need pwmN_enable = 1.
 - A curve has 2 to 10 points. Temperature and PWM must not decrease
   from one point to the next.
 - Curve writes are staged and committed once point K+1 is (0, 0) or
   all 10 points are set.
 - PWM values below the fan's minimum duty cycle are raised to it.

v2:
 - Add kernel-doc for fan control.
 - Save/restore the user fan table across suspend/resume.
 - Refresh fan info after late binding; keep the user's PWM mode.
 - Show stock table points in the curve attributes when pwmN_enable = 2.

v3:
 - Address v2 review comments.
 - Add an ordered PCODE write batch helper.
 - Support a variable number of fan curve points.
 - Add missing failure checks.
 - Use only 2 fan curve points when setting pwmN.

v4:
 - Address v3 https://patchwork.freedesktop.org/series/176241/ review
   comments. (Soham)
 - Clamp oversized fan masks and stock tables; continue when one fan's
   stock table fails to read.
 - Clear cached values on failed pcode reads.
 - Use percent for fan speed and clamp min PWM to 100%.
 - Fail pwmN writes if pcode reports the wrong user point count.
 - Create fan curve attributes at probe time; add the (0, 0) end
   marker; points must not decrease.
 - Document pwmN_enable values and the curve rules.
 - Call the system PM hooks from xe_device_suspend()/xe_device_resume(),
   which also covers FLR; check d3cold only for runtime PM.
 - Fix the late binding firmware ID check; start fans enabled after
   late binding in automatic mode.
 - Rebase on drm-xe-next; update the ABI Date and KernelVersion.

v5:
 - Address review comments on v4 patch
   https://patchwork.freedesktop.org/series/179435/ from sashiko.
 - Add new sysfs tjmax_fan_control_enable for enable/disable of
   tjmax fan control.
 - Move CRI fan control support out of this patch series.
 - Add kgdoc patch at the end of the patch series.

Karthik Poosa (10):
  drm/xe/hwmon: Initialize fan-control backend and table cache
  drm/xe/hwmon: Expose fanN_max
  drm/xe/pcode: Add ordered write batch helper
  drm/xe/hwmon: Expose pwm[1-3]
  drm/xe/hwmon: Expose pwm[1-3]_enable
  drm/xe/hwmon: Enable fan curve control support
  drm/xe/hwmon: Restore fan user tables after resume
  drm/xe/hwmon: Refresh fan data after late binding
  drm/xe: Expose tjmax_fan_control_enable device sysfs
  drm/xe/hwmon: Add kernel-doc for fan control

 .../ABI/testing/sysfs-driver-intel-xe-gpu     |   15 +
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   32 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |    5 +
 drivers/gpu/drm/xe/xe_device.c                |    3 +
 drivers/gpu/drm/xe/xe_device_sysfs.c          |   76 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 1322 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_hwmon.h                 |    6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c          |   10 +
 drivers/gpu/drm/xe/xe_pcode.c                 |   39 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   12 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   10 +
 drivers/gpu/drm/xe/xe_pm.c                    |   11 +-
 12 files changed, 1512 insertions(+), 29 deletions(-)

-- 
2.34.1

