Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0A4C6FA8E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C98910E127;
	Sat, 25 Feb 2023 00:16:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2BE10E56E
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284188; x=1708820188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=07a7pdObXk7tyDWkWpyCWvIip3JGoSu6gZXYML2Or2U=;
 b=IcrlT9nQttkQWr/mSU75o6jtApm8t0EezhsQY6OJnrO48CGMD3Bnw92+
 zrsmXcxvvYWsmwfXgdNDfYAYLNmUMyAxOHO8VZewGHbTzMiNa61mrzp37
 WVuSksKLqt5thQDN1zS9G6qYT0H9vYGE3tZB96/kolLlajiazwmPmSXtc
 //Hyc85qf3YoTZ6Sx4Rh4R05y9K2+SKxAM/f8poL6n+tvua7YV++3o5bL
 s2NhFnDiVeeODqt2EDIuNC/Izvnm9sJ26xMzhMe0jxbgtkzYxda8EVDDX
 Ipc2Rid9X/jgAttykc8asm8HxtdhQOP3gR1wav7g96rRk/tjETCsB78DL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332297342"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="332297342"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761956561"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="761956561"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:15:36 -0800
Message-Id: <20230225001548.1743820-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 00/12] Start register cleanup
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Start cleaning up the register definitions used in xe.
This removes dependency on the following registers:

        - intel_engine_regs.h
        - intel_gt_regs.h
        - intel_lrc_reg.h
        - intel_gpu_commands.h
        - i915_reg.h
        - intel_mchbar_regs.h

The includes on the display/ part are left as is since there is still
some more work to do to detangle dependencies. Other than from the
display/ and xe_display.c files, xe still depends on:

        - i915_reg_defs.h
        - display/intel_display_core.h
        - display/ext/intel_device_info.h
        - display/ext/intel_pch.h

In v3 (this version) I create xe_reg_defs.h to encapsulate i915_reg_defs.h
include that was spread everywhere. The other includes are very unfortunate:
they are included from xe_device_types.h which means they are are included
everywhere.  For testing of this series, I add a new commit on top (not to
be merged), removing the display integration. This is only to make sure
the i915 types and functions are needed by display only.  We probably need
a plan how this is going to be cleaned up and maybe a short term alternative
so we don't create dependencies outside of display. Hack commit to test
on top: 20230221194002.819026-14-lucas.demarchi@intel.com

This series started by doing it manually with a few greps, migrated in
the middle to do by "remove the include, parse the warnings from the
compile and use that to generate the header" and finished with a small
python script with clang. For reference, the execute-once-and-throw-away
script is in the previous version:
20230221194002.819026-1-lucas.demarchi@intel.com

v4:
  - Apply some patches from v3 that had been reviewed
  - Collect r-b with minor tweaks to first patches
  - Move change to i915 to a separate patch, that is also submitted to
    i915 mailing list.
  - Add one patch to rename header guards

Lucas De Marchi (12):
  drm/i915: Move MCR_REG define to i915_reg_defs.h
  drm/xe: Sort includes
  drm/xe: Remove dependency on intel_engine_regs.h
  drm/xe: Remove dependency on intel_gt_regs.h
  drm/xe: Remove dependency on intel_lrc_reg.h
  drm/xe: Remove dependency on intel_gpu_commands.h
  drm/xe: Remove dependency on i915_reg.h
  drm/xe/guc_pc: Move gt register to the proper place
  drm/xe: Remove dependency on intel_mchbar_regs.h
  drm/xe: Add missing includes for i915_reg_defs.h and others
  drm/xe: Add xe_reg_defs.h
  drm/xe: Prefer single underscore for header guards

 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   1 -
 drivers/gpu/drm/i915/i915_reg_defs.h          |   2 +
 .../drm/xe/display/ext/intel_device_info.h    |   2 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |  98 ++++++
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h     |  79 +++++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          | 290 ++++++++++++++++++
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |  17 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h         |  11 +
 drivers/gpu/drm/xe/regs/xe_regs.h             | 111 +++++++
 drivers/gpu/drm/xe/tests/xe_bo_test.h         |   4 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h    |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate_test.h    |   4 +-
 drivers/gpu/drm/xe/tests/xe_test.h            |   4 +-
 drivers/gpu/drm/xe/xe_bb.c                    |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 -
 drivers/gpu/drm/xe/xe_bo_evict.c              |   3 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +-
 drivers/gpu/drm/xe/xe_device.c                |  13 +-
 drivers/gpu/drm/xe/xe_device.h                |   5 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_display.c               |  12 +-
 drivers/gpu/drm/xe/xe_display.h               |   5 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |   9 +-
 drivers/gpu/drm/xe/xe_engine.c                |   3 +-
 drivers/gpu/drm/xe/xe_exec.c                  |   3 +-
 drivers/gpu/drm/xe/xe_execlist.c              |  17 +-
 drivers/gpu/drm/xe/xe_force_wake.c            |   8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   9 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   6 +-
 drivers/gpu/drm/xe/xe_gt_clock.c              |   6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |   3 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                |   6 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   4 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |   5 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |   3 +-
 drivers/gpu/drm/xe/xe_gt_topology.c           |   4 +-
 drivers/gpu/drm/xe/xe_gt_topology.h           |   4 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  14 +-
 drivers/gpu/drm/xe/xe_guc.h                   |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |   7 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   5 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c           |   3 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   4 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   3 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |   3 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  30 +-
 drivers/gpu/drm/xe/xe_guc_pc_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_guc_reg.h               |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  10 +-
 drivers/gpu/drm/xe/xe_huc.c                   |   3 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c           |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   7 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h        |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                   |   9 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  13 +-
 drivers/gpu/drm/xe/xe_map.h                   |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  16 +-
 drivers/gpu/drm/xe/xe_migrate.h               |   4 +-
 drivers/gpu/drm/xe/xe_mmio.c                  |   7 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |   8 +-
 drivers/gpu/drm/xe/xe_module.c                |   2 +
 drivers/gpu/drm/xe/xe_pci.c                   |   7 +-
 drivers/gpu/drm/xe/xe_pcode.c                 |   9 +-
 drivers/gpu/drm/xe/xe_pcode_api.h             |   2 +
 drivers/gpu/drm/xe/xe_pm.c                    |   5 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c         |   3 +-
 drivers/gpu/drm/xe/xe_pt.c                    |   5 +-
 drivers/gpu/drm/xe/xe_query.c                 |  12 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                |   9 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   7 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |   4 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |  56 ++--
 drivers/gpu/drm/xe/xe_rtp.h                   |   4 +-
 drivers/gpu/drm/xe/xe_rtp_types.h             |   2 -
 drivers/gpu/drm/xe/xe_sa.c                    |   4 +-
 drivers/gpu/drm/xe/xe_step.c                  |   1 +
 drivers/gpu/drm/xe/xe_sync.c                  |   5 +-
 drivers/gpu/drm/xe/xe_trace.h                 |   4 +-
 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c           |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   5 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   2 +-
 drivers/gpu/drm/xe/xe_tuning.c                |   5 +-
 drivers/gpu/drm/xe/xe_uc.c                    |   5 +-
 drivers/gpu/drm/xe/xe_uc_fw.h                 |   4 +-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h             |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c            |   8 +-
 drivers/gpu/drm/xe/xe_wa.c                    |   7 +-
 drivers/gpu/drm/xe/xe_wopcm.c                 |   3 +-
 92 files changed, 872 insertions(+), 250 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_layout.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h

-- 
2.39.0

