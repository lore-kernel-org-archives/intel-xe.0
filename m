Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2194AD30CEE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14BE10E29A;
	Tue, 13 Jan 2026 23:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fC/06QzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186E010E29A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345413; x=1799881413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0qVPlvKd6LfWxiyb0kyTlx/LhVw3z2e7apJKNjZvjwQ=;
 b=fC/06QzKqajcedlXBNTVjB10NvS2B4brPeXMSeWqRoLsIzxJTxrP6Pqb
 WM/t9Yy+8TsHRuIWjbRcJraj06AX06PSnPX1h5hxHFUpzLdUpTCf8aagi
 YUPsvdqJQXHi42AukkLBozu07SbUtECZez7ABvtcr5V3D0BxFF7XP32zz
 byQ3faM6uklfyCLdY9m1YV0FFVb1cG0yGtQ6ON7S7FDw4ci9I9ktk+28j
 gSrlQmmHyAmAp+FDLKChekAVAMHVrkh8XL00Lp3WmrDeX/QCZf6ojfTtZ
 8rRDzzY7Bzw81hWEXhVESuH670hlEHL7MTp+a7QwYi+w6UmJcxKyajwVk w==;
X-CSE-ConnectionGUID: V0+wVSlJRQe9XpuDjnoPsw==
X-CSE-MsgGUID: fcWV+sAgS/Scvp8zEm4IZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311103"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:32 -0800
X-CSE-ConnectionGUID: abUjW5u8RhaH/fDsZjkzRQ==
X-CSE-MsgGUID: bUiKIezARW+C0MdhsB0dbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147229"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 00/79] Cleanup unused headers reported by clangd
Date: Tue, 13 Jan 2026 15:03:05 -0800
Message-ID: <20260113230315.3081153-81-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

clangd[1] helpfully flags #include's of headers that aren't being
directly used by the file including them.  In most cases we can either
drop those #include statements or replace them with a more targeted
include (such as xe_gt.h to xe_gt_types.h).  Let's drop/simplify a bunch
of the unnecessary includes in our driver's .c files; this may help
speed up partial rebuilds for developers since the build system won't
see as many false dependencies.

There's more header-related cleanup that could be done (e.g., some of
our headers incorrectly include other headers they don't need), but that
can wait for a follow-up series; this one is already long enough.


[1] https://clangd.llvm.org/

Matt Roper (79):
  drm/xe: Cleanup headers in xe_bb.c
  drm/xe: Drop unused header in xe_bo.c
  drm/xe: Cleanup headers in xe_devcoredump.c
  drm/xe: Drop unused header in xe_device.c
  drm/xe: Drop unused header in xe_exec.c
  drm/xe: Cleanup headers in xe_execlist.c
  drm/xe: Drop unused headers in xe_exec_queue.c
  drm/xe: Simplify headers in xe_ggtt.c
  drm/xe: Cleanup headers in xe_gsc_debugfs.c
  drm/xe: Simplify header in xe_gsc_proxy.c
  drm/xe: Drop unused headers in xe_gsc_submit.c
  drm/xe: Drop unused headers in xe_gt.c
  drm/xe: Cleanup headers in xe_gt_clock.c
  drm/xe: Drop unused header in xe_gt_debugfs.c
  drm/xe: Drop unused header in xe_gt_idle.c
  drm/xe: Drop unused header in xe_gt_mcr.c
  drm/xe: Drop unused headers in xe_gt_sriov_pf_config.c
  drm/xe: Drop unused header in xe_gt_sriov_pf_debugfs.c
  drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
  drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
  drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
  drm/xe: Drop unused header in xe_gt_sriov_vf.c
  drm/xe: Simplify header in xe_gt_stats.c
  drm/xe: Simplify header in xe_gt_sysfs.c
  drm/xe: Simplify header in xe_gt_throttle.c
  drm/xe: Drop unused headers in xe_guc_ads.c
  drm/xe: Drop unused header in xe_guc_buf.c
  drm/xe: Cleanup headers in xe_guc_capture.c
  drm/xe: Cleanup headers in xe_guc_debugfs.c
  drm/xe: Simplify headers in xe_guc_hwconfig.c
  drm/xe: Simplify header in xe_guc_log.c
  drm/xe: Cleanup headers in xe_guc_relay.c
  drm/xe: Drop unused headers in xe_guc_submit.c
  drm/xe: Drop unused header in xe_heci_gsc.c
  drm/xe: Drop unused header in xe_huc.c
  drm/xe: Clean up headers in xe_huc_debugfs.c
  drm/xe: Drop unused header in xe_hw_engine.c
  drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
  drm/xe: Simplify include in xe_hw_engine_group.c
  drm/xe: Cleanup headers in xe_hw_fence.c
  drm/xe: Cleanup headers in xe_i2c.c
  drm/xe: Drop unused header in xe_irq.c
  drm/xe: Drop unused headers in xe_memirq.c
  drm/xe: Drop unused headers in xe_mmio.c
  drm/xe: Drop unused headers in xe_mocs.c
  drm/xe: Simplify include in xe_module.c
  drm/xe: Drop unused header in xe_nvm.c
  drm/xe: Drop unused headers in xe_page_reclaim.c
  drm/xe: Drop unused header in xe_pci.c
  drm/xe: Simplify include in xe_psmi.c
  drm/xe: Drop unused header in xe_pxp.c
  drm/xe: Simplify header in xe_pxp_debugfs.c
  drm/xe: Cleanup headers in xe_reg_sr.c
  drm/xe: Drop unused headers in xe_reg_whitelist.c
  drm/xe: Cleanup headers in xe_ring_ops.c
  drm/xe: Drop unused header in xe_rtp.c
  drm/xe: Simplify header in xe_sa.c
  drm/xe: Simplify header in xe_sched_job.c
  drm/xe: Drop unused header in xe_sriov_packet.c
  drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
  drm/xe: Drop unused header in xe_sriov_vf.c
  drm/xe: Cleanup headers in xe_step.c
  drm/xe: Drop unused header in xe_survivability_mode.c
  drm/xe: Cleanup headers in xe_tile.c
  drm/xe: Cleanup headers in xe_tlb_inval.c
  drm/xe: Drop unused header in xe_ttm_stolen_mgr.c
  drm/xe: Drop unused header in xe_ttm_sys_mgr.c
  drm/xe: Drop unused header in xe_ttm_vram_mgr.c
  drm/xe: Drop unused headers in xe_uc.c
  drm/xe: Cleanup headers in xe_uc_debugfs.c
  drm/xe: Simplify header in xe_uc_fw.c
  drm/xe: Drop unused header in xe_validation.c
  drm/xe: Drop unused header in xe_vm.c
  drm/xe: Drop unused headers in xe_vram.c
  drm/xe: Drop unused header in xe_vram_freq.c
  drm/xe: Drop unused header in xe_vsec.c
  drm/xe: Simplify header in xe_wa.c
  drm/xe: Drop unused header in xe_wait_user_fence.c
  drm/xe: Simplify header in xe_wopcm.c

 drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
 drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
 drivers/gpu/drm/xe/xe_bo.c                    | 1 -
 drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
 drivers/gpu/drm/xe/xe_device.c                | 1 -
 drivers/gpu/drm/xe/xe_exec.c                  | 1 -
 drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
 drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
 drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
 drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
 drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
 drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
 drivers/gpu/drm/xe/xe_gt.c                    | 2 --
 drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
 drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
 drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
 drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
 drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
 drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
 drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
 drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
 drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
 drivers/gpu/drm/xe/xe_huc.c                   | 1 -
 drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
 drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
 drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
 drivers/gpu/drm/xe/xe_irq.c                   | 1 -
 drivers/gpu/drm/xe/xe_memirq.c                | 2 --
 drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
 drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
 drivers/gpu/drm/xe/xe_module.c                | 2 +-
 drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
 drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
 drivers/gpu/drm/xe/xe_pci.c                   | 1 -
 drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
 drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
 drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
 drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
 drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
 drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
 drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
 drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
 drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
 drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
 drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
 drivers/gpu/drm/xe/xe_uc.c                    | 2 --
 drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
 drivers/gpu/drm/xe/xe_validation.c            | 1 -
 drivers/gpu/drm/xe/xe_vm.c                    | 1 -
 drivers/gpu/drm/xe/xe_vram.c                  | 2 --
 drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
 drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
 drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
 drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
 80 files changed, 45 insertions(+), 129 deletions(-)

-- 
2.52.0

