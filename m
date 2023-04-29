Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C26FC7EE23
	for <intel-xe@archiver.kernel.org>; Sat, 29 Apr 2023 06:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573A010E233;
	Sat, 29 Apr 2023 06:24:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693A610E07E
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Apr 2023 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682749458; x=1714285458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5teFtDABH6/icmfGB7xKxboKuuS28AW1Zr+HSfvDyb0=;
 b=aowIDZGuuK9KUJ0sC8EExjhwtU2JtE1IR8MuniGJN1mCKEewV4ScsONT
 W3flvJx9p1lvQ2fwToP2TC8TmqBmkiaW1xoKSJgWBpZI/W4v6kWLkGN7r
 2A+fbHUd5ATyoU0k/FBkeYr7HombeHSgm9tAPO0ouQmofE2Nlvysyn6s6
 3JInGm78N8NxHdgFD+4Ul7SJQR6JTaSuXXi2dM7sygCWYzhAMWo1at3B5
 MSgZO+51KRYeZtAPtUmFLZVTLIq3CUA9jGiUf0Scjn5WATlmREbqyo7a+
 X1caF9QnDt/6MMhYxv6DBaIeC970V4fphu5wLSNxuZ8uxlEP6mkp/25uW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375928423"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="375928423"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="697829069"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="697829069"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 23:23:25 -0700
Message-Id: <20230429062332.354139-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] Convert xe_mmio to struct xe_reg
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that struct xe_reg is in place, convert xe_mmio to use it so we
avoid mistakes of passing the wrong argument.

Lucas De Marchi (7):
  fixup! drm/xe: Drop gen afixes from registers
  drm/xe/guc: Handle RCU_MODE as masked from definition
  drm/xe: Use media base for GMD_ID access
  drm/xe/mmio: Use struct xe_reg
  fixup! drm/xe/display: Implement display support
  drm/xe: Rename reg field to addr
  drm/xe: Fix indent in xe_hw_engine_print_state()

 drivers/gpu/drm/xe/display/xe_de.h       |  89 ++++++++------
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   6 +-
 drivers/gpu/drm/xe/regs/xe_reg_defs.h    |   6 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c   |   2 +-
 drivers/gpu/drm/xe/xe_device.c           |   2 +-
 drivers/gpu/drm/xe/xe_execlist.c         |  18 +--
 drivers/gpu/drm/xe/xe_force_wake.c       |  25 ++--
 drivers/gpu/drm/xe/xe_force_wake_types.h |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c             |   6 +-
 drivers/gpu/drm/xe/xe_gt.c               |   4 +-
 drivers/gpu/drm/xe/xe_gt_clock.c         |   6 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c           |  39 ++++---
 drivers/gpu/drm/xe/xe_gt_topology.c      |  18 +--
 drivers/gpu/drm/xe/xe_guc.c              |  61 +++++-----
 drivers/gpu/drm/xe/xe_guc_ads.c          |  34 +++---
 drivers/gpu/drm/xe/xe_guc_pc.c           |  32 +++---
 drivers/gpu/drm/xe/xe_guc_types.h        |   3 +-
 drivers/gpu/drm/xe/xe_huc.c              |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        | 105 +++++++++--------
 drivers/gpu/drm/xe/xe_irq.c              | 140 +++++++++++------------
 drivers/gpu/drm/xe/xe_mmio.c             |  33 +++---
 drivers/gpu/drm/xe/xe_mmio.h             |  47 ++++----
 drivers/gpu/drm/xe/xe_mocs.c             |  11 +-
 drivers/gpu/drm/xe/xe_pat.c              |  14 ++-
 drivers/gpu/drm/xe/xe_pci.c              |   9 +-
 drivers/gpu/drm/xe/xe_pcode.c            |  16 +--
 drivers/gpu/drm/xe/xe_reg_sr.c           |  18 +--
 drivers/gpu/drm/xe/xe_ring_ops.c         |  11 +-
 drivers/gpu/drm/xe/xe_rtp.c              |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c   |   4 +-
 drivers/gpu/drm/xe/xe_uc_fw.c            |  16 +--
 drivers/gpu/drm/xe/xe_wopcm.c            |  16 +--
 32 files changed, 427 insertions(+), 376 deletions(-)

-- 
2.40.1

