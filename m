Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C782BC04FF9
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 08:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCA110E85E;
	Mon, 15 Apr 2024 08:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP1gk5rB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE5610E778;
 Mon, 15 Apr 2024 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713168836; x=1744704836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7SxbZ0L2Ix9jsCUA08H4tQCnNcNjF80OG+GJf4ibvIM=;
 b=PP1gk5rB8CIeKCTcnuhhozIuA3+sbfZNDzYnbxqi37oQkYv+HiotfaNi
 0y8+C14NAnSH4ejPfZfTgRIbYvbTYosBgIZqqy2yC331yTS65jJ6Q31AM
 4E+XJGhR4HDw9uIwan70bUDAMf3Alv4OuySGoh2svmEVmD9sa4uYzfP0W
 qa1ugab4UHMqy5EtJWqOpg/NkmhGcbPd2Kc8iW5mOZNqFK+zHQVX51MLp
 VX61NFdgyL4XqzAY3Oo+0qqQsBY0Q2/+NiyDKJXvsTOcHzGtrEZ0Zto1m
 0MC8NeG8oHfSV2OK9AQw02uK+YaLlNiKjzcTB39VcIfBSqf5n4BJh9Byi g==;
X-CSE-ConnectionGUID: ly/Io2hdTpO7woOwjUcwpw==
X-CSE-MsgGUID: m62melrGSeCikAWJsGb21g==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="9096293"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="9096293"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:13:55 -0700
X-CSE-ConnectionGUID: l6eMfJluRACh68iPpp1WpA==
X-CSE-MsgGUID: E/wSCUhfR8GH3llGWS/w4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26400078"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:13:54 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 00/21] Enable display support for Battlemage
Date: Mon, 15 Apr 2024 13:44:02 +0530
Message-Id: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Adds display support for Battlemage.

v3:
* use s/XE_LPDP_FEATURES/XE_LPD_FEATURE as base for BMG display info
  structure
* Limit "BW Credits" programming only to xelpdp
* Removed UHBR20 support
* Commit description improved for patch - "Skip CCS modifiers for Xe2 platforms"
* Still retained the patch "Enable RM timeout detection" in this series
  hoping there are no further comments and could be merged with this
  series.
* Removed the check where RM timeout interrupt was enabled only for
  xe2hpd
* Redesigned how the right C20 PHY offsets are selected for different
  display IP versions

v2: Rebased on latest drm-tip

Ankit Nautiyal (1):
  Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"

Anusha Srivatsa (1):
  drm/i915/xe2hpd: Configure CHICKEN_MISC_2 before enabling planes

Balasubramani Vivekanandan (6):
  drm/i915/bmg: Define IS_BATTLEMAGE macro
  drm/i915/xe2hpd: Skip CCS modifiers
  drm/i915/xe2hpd: Add new C20 PHY SRAM address
  drm/i915/xe2hpd: Add support for eDP PLL configuration
  drm/i915/xe2hpd: Set maximum DP rate to UHBR13.5
  drm/xe/bmg: Enable the display support

Clint Taylor (2):
  drm/xe/display: Lane reversal requires writes to both context lanes
  drm/i915/xe2hpd: Initial cdclk table

José Roberto de Souza (2):
  drm/i915/xe2hpd: Properly disable power in port A
  drm/i915/xe2hpd: Do not program MBUS_DBOX BW credits

Lucas De Marchi (1):
  drm/i915/xe2hpd: Add display info

Matt Roper (2):
  drm/i915/xe2hpd: Add max memory bandwidth algorithm
  drm/i915/bmg: BMG should re-use MTL's south display logic

Matthew Auld (2):
  drm/xe/gt_print: add xe_gt_err_once()
  drm/i915/display: perform transient flush

Mitul Golani (1):
  drm/i915/display: Enable RM timeout detection

Nirmoy Das (1):
  drm/xe/device: implement transient flush

Radhakrishna Sripada (1):
  drm/i915/bmg: Extend DG2 tc check to future

Ravi Kumar Vodapalli (1):
  drm/i915/xe2hpd: update pll values in sync with Bspec

 drivers/gpu/drm/i915/display/intel_bios.c     |   5 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  65 +++-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  11 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 285 +++++++++++++++---
 .../gpu/drm/i915/display/intel_cx0_phy_regs.h |  59 +++-
 drivers/gpu/drm/i915/display/intel_display.c  |  10 +-
 .../drm/i915/display/intel_display_device.c   |   7 +
 .../gpu/drm/i915/display/intel_display_irq.c  |  10 +
 .../drm/i915/display/intel_display_power.c    |   4 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   3 +
 drivers/gpu/drm/i915/display/intel_fb.c       |  16 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  |   2 +
 drivers/gpu/drm/i915/display/intel_tdf.h      |  25 ++
 drivers/gpu/drm/i915/display/skl_watermark.c  |   2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  11 +-
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/i915/soc/intel_dram.c         |   4 +
 drivers/gpu/drm/i915/soc/intel_pch.c          |   4 +-
 drivers/gpu/drm/xe/Makefile                   |   3 +-
 drivers/gpu/drm/xe/display/xe_tdf.c           |  13 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   3 +
 drivers/gpu/drm/xe/xe_device.c                |  49 +++
 drivers/gpu/drm/xe/xe_device.h                |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   1 +
 drivers/gpu/drm/xe/xe_gt_printk.h             |   3 +
 drivers/gpu/drm/xe/xe_pci.c                   |   1 +
 26 files changed, 542 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_tdf.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_tdf.c

-- 
2.25.1

