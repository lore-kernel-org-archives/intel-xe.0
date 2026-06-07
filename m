Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1644CD8C8C
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 17:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C1B10EADC;
	Sun,  7 Jun 2026 17:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqgEOrIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBFF10EADC
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780852774; x=1812388774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/0tAYdz4qLdlkUf8aj+0oH9PdEn1djDPSrhuWQfi47k=;
 b=OqgEOrILm+za48G2fjUw4IPBR1YMR6ajS2PiyJHUHO1g5Q1HNSGpMFX4
 nudE6Vol8Z5+H2sdVlPWxdGRkkDxvZGG3FgYpPSompfASsDEm90Ee5BSr
 dklKYwA8Mjay5obF3regvvL7Kg1jHBJCRLp2jUaJ8Oqsm2gdGUVuSVTif
 8sfs7W66swDDZ4C0Vq1HGrhYH/JKdlLpTUS/lQfwtQJXWAoAAJ3o5KxVG
 t2POlayux1kYPsMlhRY1LvpoEOTKgtCNdlQLBwkPEuphpc3vmQG1ssJmU
 46+9rIr36S5E64qwLOpTr3E0GOeIVhNQECj8xycUwpcQ/hIjBC35l7+Lr A==;
X-CSE-ConnectionGUID: 3j3K+v3lRmi11ADHa90lAw==
X-CSE-MsgGUID: PPJ0VhcZRfKemtDcVOLR/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80737536"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="80737536"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:19:34 -0700
X-CSE-ConnectionGUID: DBKD9PFtREuXSI/1f2pHbw==
X-CSE-MsgGUID: APrPUTj6TOWRRSFEmFux0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="275521573"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 10:19:31 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 0/5] Add fan control support
Date: Sun,  7 Jun 2026 22:58:43 +0530
Message-Id: <20260607172848.2970580-1-karthik.poosa@intel.com>
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

This series adds Xe fan control support through the hwmon sysfs ABI,
including fan maximum reporting, direct PWM control, mode control, and
programmable fan-curve points.

The patches are organized from backend initialization to user-visible
controls and full curve programming support.

Series overview

de81c70f39e4 (drm/xe/hwmon: initialize fan-control backend and table cache)
Initializes the fan-control backend, caches firmware stock/user fan tables,
and prepares runtime state so user-facing fan controls can be safely
exposed.

18e4289bccfc (drm/xe/hwmon: expose fanN_max)
Adds fan maximum RPM reporting through fan[1-3]_max.

04c11a69ba6d (drm/xe/hwmon: expose pwm[1-3])
Adds direct PWM duty control through pwm[1-3] with hwmon-compatible 0..255
scaling.

60b1f0ad9033 (drm/xe/hwmon: expose pwm[1-3]_enable)
Adds pwm mode control through pwm[1-3]_enable:
0 = full speed
1 = manual user control
2 = firmware automatic control

9dbda15128ca (drm/xe/hwmon: Enable fan curve control support)
Adds programmable per-fan curve points through:
pwm[1-3]_auto_point[1-10]_temp
pwm[1-3]_auto_point[1-10]_pwm

The ABI documentation is updated accordingly in
Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon, and implementation
is in drivers/gpu/drm/xe/xe_hwmon.c.

Sysfs nodes and usage

Read fan speed and max RPM
cat /sys/class/hwmon/hwmonX/fan1_input
cat /sys/class/hwmon/hwmonX/fan1_max

Set manual mode and direct pwm
echo 1 > /sys/class/hwmon/hwmonX/pwm1_enable
echo 120 > /sys/class/hwmon/hwmonX/pwm1

Return to firmware automatic control
echo 2 > /sys/class/hwmon/hwmonX/pwm1_enable

Program a hardware fan curve
echo 1 > /sys/class/hwmon/hwmonX/pwm1_enable
echo 30000 > /sys/class/hwmon/hwmonX/pwm1_auto_point1_temp
echo 20 > /sys/class/hwmon/hwmonX/pwm1_auto_point1_pwm
...
echo 85000 > /sys/class/hwmon/hwmonX/pwm1_auto_point10_temp
echo 200 > /sys/class/hwmon/hwmonX/pwm1_auto_point10_pwm

For hardware acceptance, fan curve temperatures must be in increasing
order.

Karthik Poosa (5):
  drm/xe/hwmon: initialize fan-control backend and table cache
  drm/xe/hwmon: expose fanN_max
  drm/xe/hwmon: expose pwm[1-3]
  drm/xe/hwmon: expose pwm[1-3]_enable
  drm/xe/hwmon: Enable fan curve control support

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   44 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 1200 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h             |    9 +
 3 files changed, 1237 insertions(+), 16 deletions(-)

-- 
2.25.1

