Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C895E8B39F
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B984210E828;
	Thu,  5 Feb 2026 09:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVE9B3xQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A0C10E81C;
 Thu,  5 Feb 2026 09:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770283684; x=1801819684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0OUDTzGrTb8B/WfuebRvUPFkCcd//anXlAiK9XDPk9k=;
 b=UVE9B3xQH2oeZEuqff1eWh/EiHSUpoCPeR9VXvjaXxkvsy4/d8bQ/4uD
 rivWL4a1pQZkSk2eFVd6On6pd87NHq8GD4kOeCkJpf4ip1Jl/JFE0DdhX
 P7aKqdZ8PqDQKmLVufow4+xq2aswRfJtnDR/MNoHEPwYvXHMcMIaQXK5D
 9jhAdwCAMUnG2YLs9mVgR7CDjkcvERr1Z6xkRsmf8WR8ZlnxN2Hrf+ir5
 rOBKu1yeB5h8CsEF20lsKanmdMg5gneFEB3EmYPjq3mX6HVEECVlCoqUG
 oAayoLkLz2G2KumcjnLA0XiY6ipY3GHfOFu6O63bH4dngr/pqlYbuyFX5 Q==;
X-CSE-ConnectionGUID: pbChiriHSaa14uSbQJqGsg==
X-CSE-MsgGUID: 4ARYIBHXQ7ah0PaN0tSzRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89060095"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89060095"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:28:03 -0800
X-CSE-ConnectionGUID: dmcJZEjxRfu4wvhpc+obpg==
X-CSE-MsgGUID: /1CdbpEISFmhPSmcBLonTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209807684"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2026 01:27:53 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 00/20] Make Display free from i915_reg.h
Date: Thu,  5 Feb 2026 15:13:21 +0530
Message-ID: <20260205094341.1882816-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
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

Move the common register definition to per feature header
which makes display files free from including i915_reg.h.
This will help avoid dupicate definitions and includes and can
serve as a common file for xe, i915 and display module.

v4:
- Add granular include instead of putting in common header (Jani)
- Drop redundant includes (Jani)
- Create oprom_regs header (Ville)
- Other minor fixes based on review comments from Jani and Ville

v3:
- Create per feature modular headers instead of 1 common header (Jani)
- Commit message and header fixes (Jani)

v2:
- Moved display definitions needed for gvt and clock gating
  to display header (Jani)
- Fixed redundant includes

Uma Shankar (20):
  drm/i915: Extract display registers from i915_reg.h to display
  drm/i915: Extract South chicken registers from i915_reg.h to display
  drm/i915: Extract display interrupt definitions
  drm/i915: Extract DSPCLK_GATE_D from i915_reg to display
  drm/{i915, xe}: Extract pcode definitions to common header
  drm/i915: Remove i915_reg.h from intel_display_device.c
  drm/i915: Move GMD_ID and mask to intel_gt header
  drm/i915: Remove i915_reg.h from intel_dram.c
  drm/i915: Remove i915_reg.h from intel_display.c
  drm/i915: Remove i915_reg.h from intel_overlay.c
  drm/i915: Remove i915_reg.h from g4x_dp.c
  drm/i915: Remove i915_reg.h from i9xx_wm.c
  drm/{i915, xe}: Remove i915_reg.h from g4x_hdmi.c
  drm/i915: Remove i915_reg.h from intel_rom.c
  drm/i915: Remove i915_reg.h from intel_psr.c
  drm/i915: Remove i915_reg.h from intel_fifo_underrun.c
  drm/i915: Remove i915_reg.h from intel_display_irq.c
  drm/i915: Remove i915_reg.h from intel_display_power_well.c
  drm/i915: Remove i915_reg.h from intel_modeset_setup.c
  drm/{i915, xe}: Remove i915_reg.h from display

 drivers/gpu/drm/i915/display/g4x_dp.c         |   1 -
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |   1 -
 drivers/gpu/drm/i915/display/hsw_ips.c        |   2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 -
 drivers/gpu/drm/i915/display/i9xx_wm.c        |   2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |   1 -
 .../gpu/drm/i915/display/intel_backlight.c    |   1 -
 drivers/gpu/drm/i915/display/intel_bw.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_casf.c     |   1 -
 drivers/gpu/drm/i915/display/intel_cdclk.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   1 -
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 .../drm/i915/display/intel_display_device.c   |   7 +-
 .../gpu/drm/i915/display/intel_display_irq.c  |   2 +-
 .../drm/i915/display/intel_display_power.c    |   2 +-
 .../i915/display/intel_display_power_well.c   |   4 +-
 .../gpu/drm/i915/display/intel_display_regs.h | 263 +++++++++-
 .../gpu/drm/i915/display/intel_display_rps.c  |   2 +-
 .../gpu/drm/i915/display/intel_display_wa.c   |   1 -
 drivers/gpu/drm/i915/display/intel_dmc.c      |   1 -
 drivers/gpu/drm/i915/display/intel_dram.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |   1 -
 .../drm/i915/display/intel_fifo_underrun.c    |   1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   1 -
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   2 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  |   1 -
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |   1 -
 .../drm/i915/display/intel_modeset_setup.c    |   1 -
 .../gpu/drm/i915/display/intel_oprom_regs.h   |  36 ++
 drivers/gpu/drm/i915/display/intel_overlay.c  |   2 +-
 .../gpu/drm/i915/display/intel_pch_display.c  |   1 -
 .../gpu/drm/i915/display/intel_pch_refclk.c   |   1 -
 drivers/gpu/drm/i915/display/intel_pps.c      |   1 -
 drivers/gpu/drm/i915/display/intel_psr.c      |   1 -
 drivers/gpu/drm/i915/display/intel_rom.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |   1 -
 drivers/gpu/drm/i915/display/skl_watermark.c  |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   1 -
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |   2 +
 drivers/gpu/drm/i915/gt/intel_llc.c           |   2 +
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   2 +
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   2 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   2 +
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c           |   2 +
 drivers/gpu/drm/i915/gvt/interrupt.c          |   1 +
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   1 +
 drivers/gpu/drm/i915/i915_debugfs.c           |   1 +
 drivers/gpu/drm/i915/i915_driver.c            |   1 +
 drivers/gpu/drm/i915/i915_hwmon.c             |   2 +
 drivers/gpu/drm/i915/i915_irq.c               |   1 +
 drivers/gpu/drm/i915/i915_reg.h               | 464 ------------------
 drivers/gpu/drm/i915/intel_clock_gating.c     |   4 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |   5 +
 drivers/gpu/drm/i915/intel_pcode.c            |   1 +
 drivers/gpu/drm/i915/vlv_suspend.c            |   1 +
 include/drm/intel/intel_gmd_interrupt_regs.h  |  92 ++++
 include/drm/intel/intel_gmd_misc_regs.h       |  21 +
 include/drm/intel/intel_pcode_regs.h          | 108 ++++
 66 files changed, 577 insertions(+), 508 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_oprom_regs.h
 create mode 100644 include/drm/intel/intel_gmd_interrupt_regs.h
 create mode 100644 include/drm/intel/intel_gmd_misc_regs.h
 create mode 100644 include/drm/intel/intel_pcode_regs.h

-- 
2.50.1

