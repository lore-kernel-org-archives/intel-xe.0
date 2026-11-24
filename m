Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12367606A322
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=in9V/+hg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C510310E51F;
	Tue, 24 Nov 2026 05:46:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2C10E21F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499187; x=1827035187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kwlepv5RioPQgzj2LuYi1F5q5dZzyaTcMGS3jVzXaeM=;
 b=in9V/+hgkb4QJEPql+PCwWtsw/I2qqY7NeOdARgQW/2ump3U94IH38A9
 USKmXv3kazP8vzgWaXVn/Xn39w4/h4xSEbu6TmV/Lw1Ez2Q4WtcSqv8Bh
 vL4a0N3bzYZAEu7zeuWGh3ZhmmBnFCZTlYbc9s4RYltli6Or4XoThlfK/
 oscmux1D/uHJ/sFhqj9cfFg2FISE5Pk3a/6/IVlQzIgrQsPXprvegu2YH
 DVGSdXVMsRIFA8SMzrGaY9PgRSpgNeB8A8XilrZ+nZmJKRbKdDFeH9j5A
 jUF7rPVKm2sG7SY3LYxzR2peO7YPAD2XCIcLcG1tmbVW3g0Ul32xsz/Mc A==;
X-CSE-ConnectionGUID: 10BAfASdSA+oI2lNieCjfA==
X-CSE-MsgGUID: TXr2ME3NRHW/kf37gIPqfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222632"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:26 -0800
X-CSE-ConnectionGUID: HdGskctSQh2lwuIj80e+dg==
X-CSE-MsgGUID: hfJ1HvtySTG18vRF9zOBdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354585"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:23 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 00/10] drm/xe/hwmon: Add fan control support
Date: Tue, 24 Nov 2026 11:18:01 +0530
Message-Id: <20261124054811.798763-1-karthik.poosa@intel.com>
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
curves. Supported platforms are BMG and CRI (device IDs 0x674E, 0x674F
and 0x6751).

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
 07 Add kernel-doc for fan control
 08 Preserve fan user table across suspend resume
 09 Update fan info after late binding
 10 Enable fan support for CRI

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
 - Enable CRI fan control only on 0x674E, 0x674F and 0x6751.
 - Rebase on drm-xe-next; update the ABI Date and KernelVersion.

Karthik Poosa (10):
  drm/xe/hwmon: Initialize fan-control backend and table cache
  drm/xe/hwmon: Expose fanN_max
  drm/xe/pcode: Add ordered write batch helper
  drm/xe/hwmon: Expose pwm[1-3]
  drm/xe/hwmon: Expose pwm[1-3]_enable
  drm/xe/hwmon: Enable fan curve control support
  drm/xe/hwmon: Add kernel-doc for fan control
  drm/xe/hwmon: Preserve fan user table across suspend resume
  drm/xe/hwmon: Update fan info after late binding
  drm/xe/hwmon: Enable fan support for CRI

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   33 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |    1 +
 drivers/gpu/drm/xe/xe_device.c                |    4 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 1180 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_hwmon.h                 |    6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c          |    3 +
 drivers/gpu/drm/xe/xe_pci.c                   |   23 +-
 drivers/gpu/drm/xe/xe_pcode.c                 |   39 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   12 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |    9 +
 drivers/gpu/drm/xe/xe_pm.c                    |    5 +
 11 files changed, 1292 insertions(+), 23 deletions(-)

-- 
2.34.1

