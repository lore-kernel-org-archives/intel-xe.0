Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EBED26D99
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 20:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677A210E91A;
	Fri,  9 Jan 2026 20:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAdGehww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE22A10E91A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767989444; x=1799525444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w0m9u08JxgWYg7nT30e0TShJ/iuHmT89am4g1YZhJms=;
 b=DAdGehwwm7V6bBUOX9E7d/ml2iQ8PZEC7vwgzPaNoBMzM31talNtnOaA
 YyDw+uCfFFRLXJhZ8OaAJpFotbCK/91GgA1d1T8OPq3ZgmjyD6b6pxBEO
 0yz2HPUzstAWVn99bEqJUBGF4FYk2/XvWvIhtzPcpeEdbIFh6/QzmefOf
 iUhWXYpNAPuNmNNDcCUD42YC1FLdvhX6vm7agojYlkZrkRGi+BoDo9jXj
 y74pPqFf835g8ebbNHoDzELXSr22Da9ltQUjLAiaRAu8gru5V2HIn45F3
 K4s5BSrEs02oU2byPQDFhcTrtq5Tgx2byxuhXWb4ETs/e77Da3Cq19X4r g==;
X-CSE-ConnectionGUID: 4ztz1m/DQQqf6Jc3mGUeiw==
X-CSE-MsgGUID: RZVOPEwDRhegWVG3LOFRnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68377668"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="68377668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:44 -0800
X-CSE-ConnectionGUID: pcuXBNUKS32sgzWpfkVWWw==
X-CSE-MsgGUID: LiTSawRYQOG7ajNtu+oxfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234245014"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 12:10:42 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 0/4] drm/xe/hwmon: Expose new temperature attributes
Date: Sat, 10 Jan 2026 01:46:40 +0530
Message-Id: <20260109201644.736483-1-karthik.poosa@intel.com>
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

Expose tempX_emergency and tempX_crit for package and vram,
representing shutdown and critical temperature thresholds.
These values are read via pcode thermal mailbox commands.

These are read using pcode thermal mailbox commands

v2:
 - Expose memory controller, pcie and individual vram
   temperatures also.
 - Addressed some of review comments of v1 from KVP.

v3:
 - Combine patches 1,2,3 into patch 1.
 - Combine patches 4,5 to patch 2.
 - Addressed review comments from v2.
 - Update kernel version in Xe hwmon documentation.

v4:
 - Address review comments of v3.
 - Update kernel version to 7.0 in Xe hwmon documentation.

v5:
- Address review comments in v4 from Raag.
- Group new temperature attributes with existing temperature attributes as
  per channel index in Xe hwmon documentation.
- Minor aesthetic refinements.
- Minor code improvements.
- Use DIV_ROUND_UP to calculate dwords needed for temperature limits.
- Use TEMP_MASK instead of TEMP_MASK_MAILBOX.
- Add PCIE_SENSOR_MASK which uses REG_FIELD_GET as replacement of
  PCIE_SENSOR_SHIFT.
- Improve VRAM label handling to eliminate temp variable by introducing a
  dedicated array vram_label in xe_hwmon_thermal_info.
- Change the label from vram_X to vram_ch_X.
- Remove a magic numbers.

Karthik Poosa (4):
  drm/xe/hwmon: Expose temperature limits
  drm/xe/hwmon: Expose memory controller temperature
  drm/xe/hwmon: Expose GPU pcie temperature
  drm/xe/hwmon: Expose individual vram channel temperature

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 110 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 281 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   5 +
 7 files changed, 396 insertions(+), 9 deletions(-)

-- 
2.25.1

