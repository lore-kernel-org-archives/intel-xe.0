Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B605C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 22:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B163710E18D;
	Thu, 27 Apr 2023 22:33:07 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAAD10E177
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 22:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682634785; x=1714170785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LtwGTCU6NezOAflDM6jYQZD5p+jskB71gbwtgDYdejM=;
 b=Nvr0RmZSz+k+gdcoH8tyoXY6lcfLaRNOO6vwZHoAGdCOEUf9uaXVFAXw
 yo3FIOJZ7f48uqUhziZUumEj5uHauP8K5hNDNVTKCwMf2CXaA3WrwsoVL
 LVpOYugHT59cpPuxKN3MpoKurTpMQb0CfYMNEHg13YHb1VS4TfQuSkx7B
 KB8nf6qtfbb9oRol2b8ScqOQfNvBeGYLeKtA4a86ZFovG/Q4a1ZryKlrr
 WFy4RgGXynBMnyr3ktB2rY37Vi28BtPk/nqAkR/jUKvljhF/RVbpSOPIC
 63wAAVhsGYF+WeTKmqyBgUStqxHk1h4q/ccgOb6ULxJ3agJTBJ1c+L3qW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412950597"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="412950597"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 15:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727314323"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="727314323"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 15:33:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Apr 2023 15:32:46 -0700
Message-Id: <20230427223256.1432787-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 00/10] Cleanup registers and introduce xe_reg_*
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

Continuation of https://patchwork.freedesktop.org/series/116411/

v1: https://patchwork.freedesktop.org/series/116845/#rev1
v2: https://patchwork.freedesktop.org/series/116845/#rev3

This v3 has some minor changes after verifying the REG_FIELD/REG_BIT
conversions were correct. Also recorded the missing r-b and removed the
patches that were already applied.

Lucas De Marchi (10):
  drm/xe/guc: Convert GuC registers to REG_FIELD/REG_BIT
  drm/xe: Drop gen afixes from registers
  drm/xe: Use REG_FIELD/REG_BIT for all regs/*.h
  drm/xe: Clarify register types on PAT programming
  drm/xe/rtp: Improve magic macros for RTP tables
  drm/xe: Introduce xe_reg/xe_reg_mcr
  drm/xe: Use XE_REG/XE_REG_MCR
  drm/xe: Annotate masked registers used by RTP
  drm/xe: Plumb xe_reg into WAs, rtp, etc
  drm/xe: Move helper macros to separate header

 drivers/gpu/drm/xe/Makefile               |   7 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h  | 102 +++---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      | 358 +++++++++++-----------
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     | 215 ++++++-------
 drivers/gpu/drm/xe/regs/xe_reg_defs.h     |  84 +++++
 drivers/gpu/drm/xe/regs/xe_regs.h         |  65 ++--
 drivers/gpu/drm/xe/tests/xe_rtp_test.c    |  51 ++-
 drivers/gpu/drm/xe/xe_execlist.c          |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c        |  18 +-
 drivers/gpu/drm/xe/xe_ggtt.c              |  16 +-
 drivers/gpu/drm/xe/xe_gt.c                |   4 +-
 drivers/gpu/drm/xe/xe_gt_clock.c          |  29 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c            |  74 +++--
 drivers/gpu/drm/xe/xe_gt_mcr.h            |  11 +-
 drivers/gpu/drm/xe/xe_guc.c               |  22 +-
 drivers/gpu/drm/xe/xe_guc_ads.c           |  14 +-
 drivers/gpu/drm/xe/xe_guc_pc.c            |  26 +-
 drivers/gpu/drm/xe/xe_huc.c               |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c         |  42 +--
 drivers/gpu/drm/xe/xe_irq.c               |   8 +-
 drivers/gpu/drm/xe/xe_mmio.c              |   7 +-
 drivers/gpu/drm/xe/xe_mocs.c              |  11 +-
 drivers/gpu/drm/xe/xe_pat.c               |  35 ++-
 drivers/gpu/drm/xe/xe_pcode_api.h         |   6 +-
 drivers/gpu/drm/xe/xe_reg_sr.c            |  51 +--
 drivers/gpu/drm/xe/xe_reg_sr.h            |   3 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h      |  10 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c     |  12 +-
 drivers/gpu/drm/xe/xe_ring_ops.c          |   8 +-
 drivers/gpu/drm/xe/xe_rtp.c               |   7 +-
 drivers/gpu/drm/xe/xe_rtp.h               | 106 +++----
 drivers/gpu/drm/xe/xe_rtp_helpers.h       |  81 +++++
 drivers/gpu/drm/xe/xe_rtp_types.h         |  22 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c    |   2 +-
 drivers/gpu/drm/xe/xe_tuning.c            |  11 +-
 drivers/gpu/drm/xe/xe_wa.c                | 180 ++++-------
 37 files changed, 887 insertions(+), 825 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h

-- 
2.40.1

