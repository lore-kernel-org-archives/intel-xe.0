Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC14C77B76
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B3A10E2FB;
	Fri, 21 Apr 2023 22:33:15 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E924610E118
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116393; x=1713652393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JR9/BBYgHixtwJNlLLMP0CPQsR+1C3FbGCkqJxVRyG4=;
 b=QAKaRykRFcqnY+ZwZ1iZAzjC19aipHPCVgZAG9+ENtOC5i92CBdbZUgy
 jRAAAnGsBt5sS/6Q3XKf0te5LCMam1LzRGj2TPZnf4x9+t9kBE3ZR4LND
 iOs9ung4fSd/aWVNw73YELibh6Kkv57kz5g4zxQbZMgGYMXySyP9lLA/P
 Dy6qR2VPPWNJXvvBMa1j6qK4pQsG5s9ez2SRcQ8zVHjSLwa8XIml1/bU/
 rfCUE8EW2EhZw5tCAIbRpoTE/AUut+cmsB/klQUnQ4sH7dkiKJJh5d11U
 NPn3vHp8pakFewX76waXxyEyJa/S+x5Ia2yCKLWBgiwCBI434XCREvR5n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693730"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693730"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913725"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913725"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:41 -0700
Message-Id: <20230421223258.128781-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/17] Cleanup registers and introduce xe_reg_*
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Continuation of https://patchwork.freedesktop.org/series/116411/. Now
not only the trivial cleanup/renames are done, but also the harder
migration to xe's own type for registers. This is meant to replace our
uses of i915_reg_t and i915_mcr_reg_t.

Due to popular demand in this v2 the type safety between mcr/non-mcr
registers remain. Actually it's a bit more useful now since calling
xe_mmio_*() on a register defined in the header will fail since there's
no such `.reg` field in it.

Also reordered the patches a little bit to make the more mechanical
changes first so to allow easier review and let them be merged
regardless of the more controversial part.

When building with display, build breaks between these 2 patches:
  drm/xe: Introduce xe_reg/xe_reg_mcr
  drm/xe: Use XE_REG/XE_REG_MCR

I believe it's easier to review with those separates since the second is
a mechanical change. And also, we are bringing display to the top on
rebases, so in theory once the branch is rebased there won't be a build
break. I can squash them if preferred when applying though. I found a
way to remove the additional display CFLAGS  in the Makefile, but
unfortunately there is more work needed on header deps to allow us to do
that.

Tested on a DG2 with/without display and didn't notice any regressions.

Lucas De Marchi (17):
  drm/xe: Cleanup page-related defines
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Allow fbdev to allocate stolen memory
  drm/xe: Rename RC0/RC6 macros
  drm/xe: Rename instruction field to avoid confusion
  drm/xe/guc: Rename GEN11_SOFT_SCRATCH for clarity
  drm/xe/guc: Move GuC registers to regs/
  drm/xe/guc: Convert GuC registers to REG_FIELD/REG_BIT
  drm/xe: Drop gen prefixes and suffixes from registers
  drm/xe: Use REG_FIELD/REG_BIT for all regs/*.h
  drm/xe: Clarify register types on PAT programming
  drm/xe/rtp: Improve magic macros for RTP tables
  drm/xe: Introduce xe_reg/xe_reg_mcr
  drm/xe: Use XE_REG/XE_REG_MCR
  drm/xe: Annotate masked registers used by RTP
  drm/xe: Plumb xe_reg_t into WAs, rtp, etc
  drm/xe: Move helper macros to separate header

 drivers/gpu/drm/i915/display/intel_fbdev.c    |   4 +-
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  23 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      | 100 ++---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h     |   6 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          | 358 +++++++++---------
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         | 146 +++++++
 drivers/gpu/drm/xe/regs/xe_reg_defs.h         |  84 ++++
 drivers/gpu/drm/xe/regs/xe_regs.h             |  65 ++--
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  15 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |  51 ++-
 drivers/gpu/drm/xe/xe_bo.h                    |  52 +--
 drivers/gpu/drm/xe/xe_execlist.c              |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c            |  18 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  42 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   4 +-
 drivers/gpu/drm/xe/xe_gt_clock.c              |  27 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  66 ++--
 drivers/gpu/drm/xe/xe_gt_mcr.h                |  11 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  52 ++-
 drivers/gpu/drm/xe/xe_guc_ads.c               |  16 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  30 +-
 drivers/gpu/drm/xe/xe_guc_reg.h               | 151 --------
 drivers/gpu/drm/xe/xe_huc.c                   |   6 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  42 +-
 drivers/gpu/drm/xe/xe_irq.c                   |   8 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  73 ++--
 drivers/gpu/drm/xe/xe_mmio.c                  |   7 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |  11 +-
 drivers/gpu/drm/xe/xe_pat.c                   |  35 +-
 drivers/gpu/drm/xe/xe_pcode_api.h             |   6 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  40 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                |  51 ++-
 drivers/gpu/drm/xe/xe_reg_sr.h                |   3 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h          |  10 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |  12 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |   8 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |   7 +-
 drivers/gpu/drm/xe/xe_rtp.h                   | 106 ++----
 drivers/gpu/drm/xe/xe_rtp_helpers.h           |  49 +++
 drivers/gpu/drm/xe/xe_rtp_types.h             |  22 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_tuning.c                |  11 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  20 +-
 drivers/gpu/drm/xe/xe_wa.c                    | 178 ++++-----
 drivers/gpu/drm/xe/xe_wopcm.c                 |   2 +-
 48 files changed, 1044 insertions(+), 1002 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_guc_regs.h
 delete mode 100644 drivers/gpu/drm/xe/xe_guc_reg.h
 create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h

-- 
2.39.0

