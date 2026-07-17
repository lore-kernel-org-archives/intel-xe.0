Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739F2C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C785210E3D9;
	Fri, 17 Jul 2026 04:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UH4S2OHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB24810E3D9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261333; x=1815797333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BvFcyp9rxuv0z92W9hlHEjy3PX0J3VQNMXfh/wubIK0=;
 b=UH4S2OHtVQrXzx/khqMyQNu3sBqMfC3RL9iJpR+sNWy5YWw4jQgOaKHm
 xOm9Sm1i7gNvn5jGn7epqIZs6cygU4sKFi6nWoify54NCZwcZTR1HgN4F
 oMwkORRsfuiBGVc7cIkI27cdgEFRWsWp2Wrrowoct4X6775cgqHEtL7NP
 SGzrKeTZ1K3nR6RYhdNiacxdbfqg+aG0EPr88Hg/RBXm4XOj8Vqyw+rKn
 w9ZsRu+CCk3SeP+MxL1irKOflSnztWV/Cp5CDbslZocsHsGXlqsj83y6A
 QFX6o3g3C0yAwatN9GXOsCYnDVG5QgeiaTmypaxAXCQyi/rT6laBzi8uk w==;
X-CSE-ConnectionGUID: 0p/ccEtTRkiGmLmutOvduQ==
X-CSE-MsgGUID: 3hsBM3CyT/6c/8i0DQb2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129340"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129340"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:08:53 -0700
X-CSE-ConnectionGUID: VdZTAM4ISPGivKKyOjzz/w==
X-CSE-MsgGUID: EVvB2ZJYSDy/oNx5BjXZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538795"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:08:50 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/9] Add fan control support
Date: Fri, 17 Jul 2026 09:47:48 +0530
Message-Id: <20260717041757.2759084-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series adds Intel Xe fan control support through the hwmon sysfs ABI,
including fan maximum reporting, direct PWM control, mode control, and
programmable fan-curve points.

The patch set is ordered from backend enablement to user-visible controls
and full curve programming support.

Series overview

drm/xe/hwmon: initialize fan-control backend and runtime state
Initializes the fan-control backend and runtime state needed to safely
expose fan controls through hwmon.

drm/xe/hwmon: expose fanN_max
Adds fan maximum RPM reporting through fan1_max, fan2_max, and fan3_max.

drm/xe/hwmon: expose pwm1-3
Adds direct PWM duty control through pwm1-3 with hwmon-compatible 0..255
scaling.

drm/xe/hwmon: expose pwm1-3_enable
Adds PWM mode control through pwm1-3_enable:
0 = full speed
1 = manual user control
2 = firmware automatic control

drm/xe/hwmon: enable fan curve control support
Adds programmable per-fan curve points through:
pwm1-3_auto_point1-10_temp
pwm1-3_auto_point1-10_pwm

ABI updates are included in
Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon, with implementation
in drivers/gpu/drm/xe/xe_hwmon.c.

Sysfs nodes and usage

Read fan speed and max RPM:
cat /sys/class/hwmon/hwmonX/fan1_input
cat /sys/class/hwmon/hwmonX/fan1_max

Set manual mode and direct PWM:
echo 1 > /sys/class/hwmon/hwmonX/pwm1_enable
echo 120 > /sys/class/hwmon/hwmonX/pwm1

Return to firmware automatic control:
echo 2 > /sys/class/hwmon/hwmonX/pwm1_enable

Program a fan curve:
echo 1 > /sys/class/hwmon/hwmonX/pwm1_enable
echo 30000 > /sys/class/hwmon/hwmonX/pwm1_auto_point1_temp
echo 20 > /sys/class/hwmon/hwmonX/pwm1_auto_point1_pwm
...
echo 85000 > /sys/class/hwmon/hwmonX/pwm1_auto_point10_temp
echo 200 > /sys/class/hwmon/hwmonX/pwm1_auto_point10_pwm

Note:

Package temperature (temp2_input) is used as the temperature reference for
fan table control.
For hardware acceptance, fan-curve temperatures must be strictly
increasing.
The user fan table is committed to hardware only after the last curve point
is written.
Fan curve currently supports only 10 fan curve points.

v2:

 - Added kernel-doc for fan control flow and sysfs behavior.
 - Added save/restore support for user fan table across suspend/resume.
 - Added late-binding handling to refresh fan information after late
   binding completes.
 - Preserved user-selected PWM mode across late-binding updates (do not
   force auto mode).
 - Fan curve points show stock table points when pwmX_enable=2.

Karthik Poosa (9):
  drm/xe/pcode: Introduce xe_pcode_read_timeout() API
  drm/xe/hwmon: initialize fan-control backend and table cache
  drm/xe/hwmon: expose fanN_max
  drm/xe/hwmon: expose pwm[1-3]
  drm/xe/hwmon: expose pwm[1-3]_enable
  drm/xe/hwmon: Enable fan curve control support
  drm/xe/hwmon: Add kernel-doc for fan control
  drm/xe/hwmon: preserve fan user table across suspend resume
  drm/xe/hwmon: Update fan info after late binding

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   44 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 1408 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_hwmon.h                 |    6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c          |    3 +
 drivers/gpu/drm/xe/xe_pcode.c                 |   11 +
 drivers/gpu/drm/xe/xe_pcode.h                 |    1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |    9 +
 drivers/gpu/drm/xe/xe_pm.c                    |    9 +
 8 files changed, 1476 insertions(+), 15 deletions(-)

-- 
2.25.1

