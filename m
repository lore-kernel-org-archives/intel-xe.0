Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F673C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 07:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D929510E8CC;
	Wed, 19 Apr 2023 07:44:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BEB10E8D3
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681890297; x=1713426297;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eWx6nqBNLgEYP5YIhTPlRntRXo/rgzecMI5c7hfgBTA=;
 b=jCapwqKnDqtAybq9OPraagj9i3sM2VeiBdoD9wtGXk7H3GOBI6qKhSXD
 W44h4dT5AvXzpmev8z8nSRHrJbJ49ZO5tsXbnip2dj1dJvVcJlMeN6Q43
 y+Vf8r52y0NqcbtjpjhCRj48PEj9/+vFnpgN1GbHuVT3/fnFgS0K6h41z
 fAdjjzIYvEElYrO1E0NqjCae6RIvlpUKvdEFFekZtYp9Pm0PxG4GbOjdI
 zvjVac0FT6RKEmlNHeO/r8l5+6JjZ4dOsOswbeLOWT4vdlbL9eHXsMoXs
 Za+tPJ8n5tBMqFGnDKZajxer6do+xwaWWpEenlbT9SLbDhz1wZ/RKO38T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334186108"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334186108"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693951860"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="693951860"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 00:44:23 -0700
Message-Id: <20230419074440.4006398-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/17] Cleanup registers and introduce xe_reg_t
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
not only the trivial cleanup/renames is done, but also the harder
migration to xe_reg_t. This is meant to replace our uses of i915_reg_t
and i915_mcr_reg_t.

There is still more to do: probably migrate xe_mmio_* to use the new
type, remove the several REGISTER.reg spread throughout the code.

Lightly tested on a DG2. Probably needs more soaking time to ensure it
doesn't regress.

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
  drm/xe: Introduce xe_reg_t
  drm/xe: Clarify register types on PAT programming
  drm/xe/rtp: Improve magic macros for RTP tables
  drm/xe: Add XE_REG/XE_REG_MCR
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
 drivers/gpu/drm/xe/regs/xe_reg_defs.h         |  64 ++++
 drivers/gpu/drm/xe/regs/xe_regs.h             |  65 ++--
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  15 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |  50 +--
 drivers/gpu/drm/xe/xe_bo.h                    |  52 +--
 drivers/gpu/drm/xe/xe_execlist.c              |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c            |  18 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  42 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   4 +-
 drivers/gpu/drm/xe/xe_gt_clock.c              |  27 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  52 ++-
 drivers/gpu/drm/xe/xe_gt_mcr.h                |   8 +-
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
 drivers/gpu/drm/xe/xe_reg_sr.c                |  29 +-
 drivers/gpu/drm/xe/xe_reg_sr.h                |   3 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h          |  10 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |  11 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |   8 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |   7 +-
 drivers/gpu/drm/xe/xe_rtp.h                   | 106 ++----
 drivers/gpu/drm/xe/xe_rtp_helpers.h           |  48 +++
 drivers/gpu/drm/xe/xe_rtp_types.h             |  14 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_tuning.c                |  10 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  20 +-
 drivers/gpu/drm/xe/xe_wa.c                    | 177 +++------
 drivers/gpu/drm/xe/xe_wopcm.c                 |   2 +-
 48 files changed, 987 insertions(+), 987 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_guc_regs.h
 delete mode 100644 drivers/gpu/drm/xe/xe_guc_reg.h
 create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h

-- 
2.39.0

