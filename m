Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84E9C636D7
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391A10E3BB;
	Fri, 17 Feb 2023 00:53:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38D10E138
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595184; x=1708131184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eB7jI8ZbIm0SJpoWZqrcYJZzRmGBBeH+ciLwmRI1sOM=;
 b=WM/5VLgl4aA3qhgHzblNJhf+LF3ZjDZUOX1NY7GItQqWeQL2DnLBMeUD
 O8YKiB+5cvypIIttEMkPEbodJcRwHuIscrHTQcEEmnQboaZHMfB5doLwo
 MiApE/B5mKTu6SBSB4o5oOeNVZMXT5xQryV3TdWeZalarHzY4vx9Ci8jb
 eVAFk8VdKlUKUmQRWAYdR64Tn7kRfVvA9g6wKorCBnLDDtIDI5Hf328TT
 3jHEX/+571a5fPQLKvMFEUlI7DzK9xcUGWfbyYXSCVOT+qZ8BZb7R95cp
 Xx9Qv3tZcgbjJWpybUV6Mtt/XH7n9gv1yUShp8LLwdBnJaCETMuSzD1uJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602192"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602192"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417766"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417766"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:15 -0800
Message-Id: <20230217005226.106499-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/11] Start register cleanup
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
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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
display/ files, xe still depends on:

	- i915_reg_defs.h
	- display/intel_display_core.h
	- display/ext/intel_device_info.h
	- display/ext/intel_pch.h

The first one are the generic defines used for defining the registers.
They probably can be split and part of them copied to include/drm to be
shared across the drivers. The last 3 are expected to be cleaned up
together with the rest of the display.

This series started by doing it manually with a few greps, migrated in
the middle to do by "remove the include, parse the warnings from the
compile and use that to generate the header" and finished with a small
python script with clang. There may be some inconsistencies how the
first patches and the last ones were done. I can clean that up on next
version.


Lucas De Marchi (11):
  drm/xe: Remove outdated build workaround
  drm/xe: Sort includes
  drm/xe/guc: Remove i915_regs.h include
  drm/xe: Remove dependency on intel_engine_regs.h
  drm/xe: Remove dependency on intel_gt_regs.h
  drm/xe: Remove dependency on intel_lrc_reg.h
  drm/xe: Remove dependency on intel_gpu_commands.h
  drm/xe: Remove dependency on i915_reg.h
  drm/xe/guc_pc: Move gt register to the proper place
  drm/xe: Remove dependency on intel_mchbar_regs.h
  drm/xe: Use relative includes for i915_reg_defs.h

 drivers/gpu/drm/i915/i915_reg_defs.h        |   2 +
 drivers/gpu/drm/xe/Makefile                 |  10 +-
 drivers/gpu/drm/xe/display/Makefile         | 120 ++++++++
 drivers/gpu/drm/xe/regs/xe_engine_regs.h    |  98 +++++++
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h   |  96 +++++++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        | 289 ++++++++++++++++++++
 drivers/gpu/drm/xe/regs/xe_lrc_regs.h       |  17 ++
 drivers/gpu/drm/xe/regs/xe_regs.h           | 111 ++++++++
 drivers/gpu/drm/xe/xe_bb.c                  |   7 +-
 drivers/gpu/drm/xe/xe_bo.c                  |   2 -
 drivers/gpu/drm/xe/xe_bo_evict.c            |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |   2 +-
 drivers/gpu/drm/xe/xe_device.c              |   9 +-
 drivers/gpu/drm/xe/xe_device.h              |   3 +-
 drivers/gpu/drm/xe/xe_display.c             |  12 +-
 drivers/gpu/drm/xe/xe_dma_buf.c             |   8 +-
 drivers/gpu/drm/xe/xe_engine.c              |   4 +-
 drivers/gpu/drm/xe/xe_exec.c                |   2 +-
 drivers/gpu/drm/xe/xe_execlist.c            |  16 +-
 drivers/gpu/drm/xe/xe_force_wake.c          |   5 +-
 drivers/gpu/drm/xe/xe_ggtt.c                |  10 +-
 drivers/gpu/drm/xe/xe_gt.c                  |   5 +-
 drivers/gpu/drm/xe/xe_gt_clock.c            |   7 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c              |   5 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h              |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c            |   4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c         |   2 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  13 +-
 drivers/gpu/drm/xe/xe_guc_ads.c             |   8 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |   4 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c         |   2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_log.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  29 +-
 drivers/gpu/drm/xe/xe_guc_reg.h             |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |   9 +-
 drivers/gpu/drm/xe/xe_huc.c                 |   2 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c         |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           |   8 +-
 drivers/gpu/drm/xe/xe_hw_fence.c            |   1 -
 drivers/gpu/drm/xe/xe_irq.c                 |   8 +-
 drivers/gpu/drm/xe/xe_lrc.c                 |  14 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  14 +-
 drivers/gpu/drm/xe/xe_mmio.c                |   8 +-
 drivers/gpu/drm/xe/xe_mocs.c                |   7 +-
 drivers/gpu/drm/xe/xe_module.c              |   1 +
 drivers/gpu/drm/xe/xe_pci.c                 |   8 +-
 drivers/gpu/drm/xe/xe_pcode.c               |  10 +-
 drivers/gpu/drm/xe/xe_pm.c                  |   4 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c       |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                  |   4 +-
 drivers/gpu/drm/xe/xe_query.c               |  11 +-
 drivers/gpu/drm/xe/xe_reg_sr.c              |  10 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h        |   2 -
 drivers/gpu/drm/xe/xe_reg_whitelist.c       |   8 +-
 drivers/gpu/drm/xe/xe_ring_ops.c            |  11 +-
 drivers/gpu/drm/xe/xe_rtp.c                 |   1 -
 drivers/gpu/drm/xe/xe_rtp.h                 |   2 -
 drivers/gpu/drm/xe/xe_rtp_types.h           |   2 -
 drivers/gpu/drm/xe/xe_sa.c                  |   3 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |   1 -
 drivers/gpu/drm/xe/xe_sync.c                |   5 +-
 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c         |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |   5 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_tuning.c              |   5 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                  |   2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   8 +-
 drivers/gpu/drm/xe/xe_wa.c                  |   7 +-
 drivers/gpu/drm/xe/xe_wopcm.c               |   2 +-
 74 files changed, 900 insertions(+), 213 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/display/Makefile
 create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h

-- 
2.39.0

