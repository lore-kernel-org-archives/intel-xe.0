Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD7C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 22:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344D610E318;
	Mon,  8 May 2023 22:54:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B586F10E314
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 22:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683586446; x=1715122446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jyTBNSb1HZ9Oe/akASvnyiYxTzpQ9rAxfXodVrUPDBo=;
 b=Le7zRQspEkLiGV6VWg0XkZOAXm6U0NNjVjAPKkLQcb3LYEaI8Wbw4zUz
 ILvHAGxLElxtJw6O1W8XMad2leZV5K1lOj/TqB18o/h0J+v5rm5vr5RDD
 KLVG4laHzdwxNbVg/Cwhh2h4lJJlssd5HV5gMOV9DQQq5xaoo9WXIwolz
 llRS6vQe7+mig+K1R5EzawM70iBA/hg7jpwaioZ/orE26pVhibEY3CfHp
 ThYr9AmcpP7CyAlRcpabIh4GcX0/TBl1hT70/RayUg9tCeePE4ZML2lun
 PRTG59K1aL0B5n+Qy9bQ6vvQHdoiTzNF1gteiKjMcyv+s+UVcKZos6UE1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330130313"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="330130313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 15:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768232358"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768232358"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 15:54:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 15:53:18 -0700
Message-Id: <20230508225322.2692066-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Convert xe_mmio to struct xe_reg
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that struct xe_reg is in place, convert xe_mmio to use it so we
avoid mistakes of passing the wrong argument.

v2:
  - First 2 patches from v1 already applied
  - Drop controversial patch, "drm/xe: Use media base for GMD_ID access"
  - Rebase on latest force pushes with display refactors

Lucas De Marchi (4):
  drm/xe/mmio: Use struct xe_reg
  fixup! drm/xe/display: Implement display support
  drm/xe: Rename reg field to addr
  drm/xe: Fix indent in xe_hw_engine_print_state()

 .../drm/xe/compat-i915-headers/intel_uncore.h | 103 +++++++++----
 drivers/gpu/drm/xe/regs/xe_reg_defs.h         |   6 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |   2 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_execlist.c              |  18 +--
 drivers/gpu/drm/xe/xe_force_wake.c            |  25 ++--
 drivers/gpu/drm/xe/xe_force_wake_types.h      |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   6 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   4 +-
 drivers/gpu/drm/xe/xe_gt_clock.c              |   6 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  39 ++---
 drivers/gpu/drm/xe/xe_gt_topology.c           |  18 +--
 drivers/gpu/drm/xe/xe_guc.c                   |  61 ++++----
 drivers/gpu/drm/xe/xe_guc_ads.c               |   5 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  32 ++--
 drivers/gpu/drm/xe/xe_guc_types.h             |   3 +-
 drivers/gpu/drm/xe/xe_huc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 103 +++++++------
 drivers/gpu/drm/xe/xe_irq.c                   | 140 +++++++++---------
 drivers/gpu/drm/xe/xe_mmio.c                  |  33 +++--
 drivers/gpu/drm/xe/xe_mmio.h                  |  55 +++----
 drivers/gpu/drm/xe/xe_mocs.c                  |  11 +-
 drivers/gpu/drm/xe/xe_pat.c                   |  14 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   4 +-
 drivers/gpu/drm/xe/xe_pcode.c                 |  16 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                |  18 ++-
 drivers/gpu/drm/xe/xe_ring_ops.c              |  11 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   4 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  16 +-
 drivers/gpu/drm/xe/xe_wopcm.c                 |  16 +-
 31 files changed, 429 insertions(+), 354 deletions(-)

-- 
2.40.1

