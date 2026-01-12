Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FBFCF45CE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 20:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E952110E200;
	Mon, 12 Jan 2026 20:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdhEZCwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93F10E200
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 20:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768249755; x=1799785755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CNFble0VYc7QBsTvs9/nXfrkmLOqKSP7cAA+rOLsykU=;
 b=CdhEZCwpQGPHq7Wi76uppYSUQOubLVhY1+YSs8xUMFLCfFyyFk8dEw7f
 fKRDaZBFlA6TSJ7x2ZarSFUaNXMRnW26pOTNDBaZBagCk3m0uBjDMNDbi
 xbJQkIGGVcmD6R4ivKq8b1NYLilAfpALVMslQ2pdz3PnuUMUm4z/Na1x+
 u4Gk+VMRCVLjXpUW/+7UUu7nUiM8qa9pFktTW9JXTFwlYm+vrf8GCZtYB
 sfkRt9mwU3ZNr8FAprBbEhZQ1KcCDXUC/ML6miPBKFN8HgPzJL138wmKb
 DNyn0mQ1hIelsVEV+9ha2t8bgPfRuP1kkNPQ+wEmhT/N7gIdLEisgQSL+ g==;
X-CSE-ConnectionGUID: Gi+SL7wuTRCbdZzGX0rwhA==
X-CSE-MsgGUID: 3Uq6lpodSKS/rrpvfTps4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80896103"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80896103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:29:15 -0800
X-CSE-ConnectionGUID: PsVsEKP8RcKQ7PZcI+PcaA==
X-CSE-MsgGUID: wqPOdj4LT+mQHpE2LDobVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204275599"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:29:13 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 0/4] drm/xe/hwmon: Expose new temperature attributes
Date: Tue, 13 Jan 2026 02:05:17 +0530
Message-Id: <20260112203521.1014388-1-karthik.poosa@intel.com>
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

v6:
 - Address minor aesthetic and refactoring review comments from Raag
   in patch 1,2,3
 - Refactor is_vram_ch_available()
 - Check individual VRAM temperature limits in addition to VRAM
   availability in xe_hwmon_temp_is_visible. (Raag)
 - Move VRAM label change out of this patch.
 - Update drm_dbg to drm_warn to inform user of unavailability for thermal
   mailbox on expected to be supported platforms.

v7:
 - Address aesthetic review comments in patch 4.
 - Use in_range() for VRAM_N index check instead of if check. (Raag)

Karthik Poosa (4):
  drm/xe/hwmon: Expose temperature limits
  drm/xe/hwmon: Expose memory controller temperature
  drm/xe/hwmon: Expose GPU PCIe temperature
  drm/xe/hwmon: Expose individual VRAM channel temperature

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 110 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 279 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 7 files changed, 397 insertions(+), 8 deletions(-)

-- 
2.25.1

