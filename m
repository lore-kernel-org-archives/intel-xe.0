Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEABC636D7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67410E187;
	Tue, 21 Feb 2023 19:41:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9BD10E187
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008476; x=1708544476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZOFOmeB8q5KGBu7GlXBiMAqfaCbyuUxV1fseyOmaYpE=;
 b=fdmsZn9qHl+Y02xbq49pVM0i9V0Vk4ZJ9KWZwgQnRxY++LXjx2exblWb
 7tafp6BHRQIY8KYhRz4x+DRN/4UK3JyD4esFUCfaC/HPW/NQbiD7EjV6P
 2/nMuGgOcKMybwHlSkM73QSrrch34tzeGEZK2GjYhiiEH1C7byUqLO+/3
 MRgm4yJOIZzX5JpbUY3F0KPryaJGN0MCi6rzxvfSaaItAS+OVAcmDLgkc
 gQLTksoOnkFhINfDWFfy/Mo+2jclbBjW2uhm0JWUh00mrNqSKDmmYfXTC
 X5OJgTFsfZscQ+2DGLDvEXM+yZlhr2CeYuIvNFgDPtVCCfJx13/i53mj5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735683"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735683"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622184"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622184"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:49 -0800
Message-Id: <20230221194002.819026-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 00/13] Start register cleanup
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
 Matthew Auld <matthew.auld@intel.com>,
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
so we don't create dependencies outside of display.

This series started by doing it manually with a few greps, migrated in
the middle to do by "remove the include, parse the warnings from the
compile and use that to generate the header" and finished with a small
python script with clang. For reference, the execute-once-and-throw-away
script is below.


	#!/usr/bin/python3

	import sys
	import clang.cindex

	import helpers

	FILE = sys.argv[1]
	file_data = open(FILE, "r").readlines()
	macros_instantiated = []
	macros = dict()
	macros_prereq = []

	def is_used_by_xe(macro):
	    return helpers.git(["grep", "-q", f"\\b{macro}\\b", "--", "drivers/gpu/drm/xe/", ":(exclude)drivers/gpu/drm/xe/display/ext/"], check=False).returncode == 0


	def print_source(node):
	    sline = node.extent.start.line
	    eline = node.extent.end.line
	    ecolumn = node.extent.end.column

	    line = sline
	    while line < eline:
		print(file_data[line - 1].rstrip())
		line += 1

	    print(file_data[line - 1][:ecolumn].rstrip())


	def recurse(node):
	    if node.kind == clang.cindex.CursorKind.MACRO_DEFINITION and str(node.location.file) == FILE:
		macros[node.spelling] = node
		if is_used_by_xe(node.spelling):
		    print_source(node)
	    elif node.kind == clang.cindex.CursorKind.MACRO_INSTANTIATION and str(node.location.file) == FILE:
		macros_instantiated.append(node)

	    for c in node.get_children():
		recurse(c)

	index = clang.cindex.Index.create()
	root = index.parse(FILE,
			   options=clang.cindex.TranslationUnit.PARSE_DETAILED_PROCESSING_RECORD |
				   clang.cindex.TranslationUnit.PARSE_INCOMPLETE |
				   clang.cindex.TranslationUnit.PARSE_SKIP_FUNCTION_BODIES)
	recurse(root.cursor)

	for node in macros_instantiated:
	    if node.spelling in macros:
		macros_prereq.append(macros[node.spelling])

	macros_prereq.sort(key=lambda x: x.location.line)

	if len(macros_prereq):
	    print("\n\n/* move me up */\n\n")
	    for node in macros_prereq:
		print_source(node)


Lucas De Marchi


Lucas De Marchi (13):
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
  drm/xe: Add missing includes for i915_reg_defs.h and others
  drm/xe: Add xe_reg_defs.h
  HACK: drm/xe: Undo display

 drivers/gpu/drm/i915/i915_reg_defs.h          |    2 +
 drivers/gpu/drm/xe/Kconfig                    |    8 -
 drivers/gpu/drm/xe/Makefile                   |  134 +-
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 1789 -----------------
 drivers/gpu/drm/xe/display/ext/i915_irq.h     |   97 -
 .../drm/xe/display/ext/intel_device_info.c    |  135 --
 .../drm/xe/display/ext/intel_device_info.h    |   36 -
 drivers/gpu/drm/xe/display/ext/intel_dram.c   |  495 -----
 drivers/gpu/drm/xe/display/ext/intel_dram.h   |   14 -
 drivers/gpu/drm/xe/display/ext/intel_pch.c    |  157 --
 drivers/gpu/drm/xe/display/ext/intel_pch.h    |   91 -
 drivers/gpu/drm/xe/display/ext/intel_pm.c     |  209 --
 drivers/gpu/drm/xe/display/ext/intel_pm.h     |   30 -
 .../gpu/drm/xe/display/i915_active_types.h    |    0
 drivers/gpu/drm/xe/display/i915_drv.h         |  248 ---
 drivers/gpu/drm/xe/display/i915_vma.h         |   13 -
 drivers/gpu/drm/xe/display/i915_vma_types.h   |   69 -
 drivers/gpu/drm/xe/display/intel_de.h         |  151 --
 drivers/gpu/drm/xe/display/intel_pm_types.h   |   36 -
 drivers/gpu/drm/xe/display/intel_runtime_pm.h |    8 -
 drivers/gpu/drm/xe/display/intel_wakeref.h    |    3 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  287 ---
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  289 ---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   98 +
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h     |   96 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  289 +++
 drivers/gpu/drm/xe/regs/xe_lrc_regs.h         |   17 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h         |   11 +
 drivers/gpu/drm/xe/regs/xe_regs.h             |  111 +
 drivers/gpu/drm/xe/xe_bb.c                    |    6 +-
 drivers/gpu/drm/xe/xe_bo.c                    |    1 -
 drivers/gpu/drm/xe/xe_bo_evict.c              |    3 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |    3 +-
 drivers/gpu/drm/xe/xe_device.c                |   39 +-
 drivers/gpu/drm/xe/xe_device.h                |    3 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  124 --
 drivers/gpu/drm/xe/xe_display.c               |  323 ---
 drivers/gpu/drm/xe/xe_display.h               |   76 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |    9 +-
 drivers/gpu/drm/xe/xe_engine.c                |    3 +-
 drivers/gpu/drm/xe/xe_exec.c                  |    3 +-
 drivers/gpu/drm/xe/xe_execlist.c              |   17 +-
 drivers/gpu/drm/xe/xe_force_wake.c            |    6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |    9 +-
 drivers/gpu/drm/xe/xe_gt.c                    |    6 +-
 drivers/gpu/drm/xe/xe_gt_clock.c              |    6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |    3 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                |    6 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                |    2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |    4 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |    5 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |    3 +-
 drivers/gpu/drm/xe/xe_gt_topology.c           |    4 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   14 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |    9 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |    5 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c           |    3 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          |    3 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |    3 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |   30 +-
 drivers/gpu/drm/xe/xe_guc_reg.h               |    2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   10 +-
 drivers/gpu/drm/xe/xe_huc.c                   |    3 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c           |    3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |    7 +-
 drivers/gpu/drm/xe/xe_irq.c                   |    9 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |   13 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   16 +-
 drivers/gpu/drm/xe/xe_mmio.c                  |    7 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |    8 +-
 drivers/gpu/drm/xe/xe_module.c                |    2 +
 drivers/gpu/drm/xe/xe_pci.c                   |   90 +-
 drivers/gpu/drm/xe/xe_pcode.c                 |    9 +-
 drivers/gpu/drm/xe/xe_pcode_api.h             |    2 +
 drivers/gpu/drm/xe/xe_pm.c                    |    5 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c         |    3 +-
 drivers/gpu/drm/xe/xe_pt.c                    |    5 +-
 drivers/gpu/drm/xe/xe_query.c                 |   12 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                |    9 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h          |    2 -
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |    7 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |   12 +-
 drivers/gpu/drm/xe/xe_rtp.h                   |    2 -
 drivers/gpu/drm/xe/xe_rtp_types.h             |    2 -
 drivers/gpu/drm/xe/xe_sa.c                    |    4 +-
 drivers/gpu/drm/xe/xe_step.c                  |    1 +
 drivers/gpu/drm/xe/xe_sync.c                  |    5 +-
 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c           |    2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |    5 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |    2 +-
 drivers/gpu/drm/xe/xe_tuning.c                |    5 +-
 drivers/gpu/drm/xe/xe_uc.c                    |    5 +-
 drivers/gpu/drm/xe/xe_vm.c                    |    2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c            |    8 +-
 drivers/gpu/drm/xe/xe_wa.c                    |    7 +-
 drivers/gpu/drm/xe/xe_wopcm.c                 |    3 +-
 96 files changed, 849 insertions(+), 5094 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_device_info.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_device_info.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pm.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pm.h
 delete mode 100644 drivers/gpu/drm/xe/display/i915_active_types.h
 delete mode 100644 drivers/gpu/drm/xe/display/i915_drv.h
 delete mode 100644 drivers/gpu/drm/xe/display/i915_vma.h
 delete mode 100644 drivers/gpu/drm/xe/display/i915_vma_types.h
 delete mode 100644 drivers/gpu/drm/xe/display/intel_de.h
 delete mode 100644 drivers/gpu/drm/xe/display/intel_pm_types.h
 delete mode 100644 drivers/gpu/drm/xe/display/intel_runtime_pm.h
 delete mode 100644 drivers/gpu/drm/xe/display/intel_wakeref.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_fb_pin.c
 delete mode 100644 drivers/gpu/drm/xe/display/xe_plane_initial.c
 create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h
 delete mode 100644 drivers/gpu/drm/xe/xe_display.c

-- 
2.39.0

