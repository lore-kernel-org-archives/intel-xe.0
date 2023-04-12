Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6325BC7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 23:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F1010E9DB;
	Wed, 12 Apr 2023 23:29:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EEB10E9DB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 23:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681342145; x=1712878145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CA9TV517hZgDWrvVRzx4qzu7Ji0x1IDGdnqVb9KRfqs=;
 b=JIvSf7bIkN1Kd5gIuhWe4NNYzctUXGAbcxshK3DvqtRtk7Ob7ehTdODk
 MwDheB8Xw+cpBl5s9MF0fz2PcNEh+rTlgPXi2Okh98kIlAmcyAQXw73uL
 Y6wUlztwCI5Bi7qHKe+iB/wCxKNqKvGr3opDivcTCoZtDkQiZunmc4pb1
 QYJqiwsv1Lug0DJ2ggiNR6yEofnRQpA3IaKR3/5VYdSFmMdWtt845XDpe
 yI7OWVbqjGNR3aOw8YnYc0zmgNscsvZAnrK3AB7+cgfeLLxXQqXo7O0nQ
 CQPIk3qqVdbZPEMmbKRXQb0bHowOg78+clvF0YCA+B3+aJqLhnoaPdL13 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332747993"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332747993"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691711981"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691711981"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 16:28:40 -0700
Message-Id: <20230412232846.3411883-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Cleanup gen suffixes/prefixes from registers
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
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Mass rename the registers so we don't keep carrying the
prefixes/suffixes.

The changes related to display are carried with fixups to the commits
that introduced them, in the expectation the display commits will be
pulled up in the branch. They are probably not the best fixes for those
commits though.

Lucas De Marchi (6):
  drm/xe: Cleanup page-related defines
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Allow fbdev to allocate stolen memory
  drm/xe: Rename RC0/RC6 macros
  drm/xe: Rename instruction field to avoid confusion
  drm/xe: Drop gen prefixes and suffixes from registers

 drivers/gpu/drm/i915/display/intel_fbdev.c    |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  23 ++-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   8 +-
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h     |   6 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          | 194 +++++++++---------
 drivers/gpu/drm/xe/regs/xe_regs.h             |  41 ++--
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  15 +-
 drivers/gpu/drm/xe/xe_bo.h                    |  52 ++---
 drivers/gpu/drm/xe/xe_execlist.c              |   8 +-
 drivers/gpu/drm/xe/xe_force_wake.c            |  18 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  26 +--
 drivers/gpu/drm/xe/xe_gt.c                    |   4 +-
 drivers/gpu/drm/xe/xe_gt_clock.c              |  26 +--
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  30 +--
 drivers/gpu/drm/xe/xe_guc.c                   |   6 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |   7 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  16 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  42 ++--
 drivers/gpu/drm/xe/xe_migrate.c               |  73 +++----
 drivers/gpu/drm/xe/xe_mmio.c                  |   3 +-
 drivers/gpu/drm/xe/xe_mocs.c                  |   7 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  40 ++--
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |   2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |   8 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_tuning.c                |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  20 +-
 drivers/gpu/drm/xe/xe_wa.c                    |  84 ++++----
 29 files changed, 388 insertions(+), 383 deletions(-)

-- 
2.39.0

