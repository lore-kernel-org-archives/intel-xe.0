Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBFCC9EC7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 12:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153AA10E0C9;
	Mon, 12 Jan 2026 12:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrO0vdBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FD010E0C9
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768219877; x=1799755877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r9w3QNlsZ4iC1kfmTwqtMkl2Fna7ox87lqHyF3zco7E=;
 b=hrO0vdBPKLBlSpP/3MGvYnzXsG1m9m0fcGn4vgkDM5eXQydIiA9rta+B
 v8PVfPixChOsbZVdB81/si17kp7jE1QzHmalt5LMY6iE4SruvoFqSPnQi
 CHeoS88Fc5LYy211T3FclKCDzYK5DPuYdqPNaZ4GMf1jFKU3ktA67XmKY
 ct2m2/ovyNaJJjgClFYecDavJAZ9hrKWjYCTJAPseZ23JDTVDR9ih3JLk
 XFaqc5OuXkHvNnEv0cJw5qRWTOwDdxauGNGX9LHz0tD1FUEM4aVw+KZ7x
 VyUik4COrM6vd5JvYIMaNlmxvf3uA3l4mYJYrsYW+6yrjmvjDDlkhB4G5 g==;
X-CSE-ConnectionGUID: 1CFHIXMaR8KaH67y3RlY0Q==
X-CSE-MsgGUID: fTMjcjgESuGb4ywra67clw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69227220"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69227220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 04:11:17 -0800
X-CSE-ConnectionGUID: wkPitsVeSCmUT0z/P7CVcg==
X-CSE-MsgGUID: LGe2Uug+RWSyaLDAcknqCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204355639"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 04:11:14 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v6 0/4] drm/xe/hwmon: Expose new temperature attributes
Date: Mon, 12 Jan 2026 17:47:20 +0530
Message-Id: <20260112121724.951867-1-karthik.poosa@intel.com>
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

