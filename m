Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAAFCCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBB810E0F6;
	Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oda/jMKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C39410EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668036; x=1792204036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iNNi4eJYPB6AvSM5/DZN6inCO5Oo46uvBj62b5FfClo=;
 b=Oda/jMKhu3VfZJCURkZje0AR5Me5cBq1x5VuOfwRrNh7pym4efpToX+6
 RlSxc4cn6DBRnsmS/E1Jh0fyaITmU1tMcB0gqXnTvGGZn4yEJWAVFLfv0
 q2D1VId+itWk+2i5Yri7kOCoLjNmQiTqBVits57YeYm/HZIcOMF6Ifj9H
 kKVjThGKzgHXZ7J2bQ+7c3RKfQU2kqHcotuMd/CdJIla7D+incitSwV+1
 L+/YnS6UcECna0Ny8mXBUXs16hRsP31MTD2MfR+nqGvHOJ4rnAI6Ht4WN
 4yIsdK4vBitPbOTFU7WW6+4Qi8mdybIrCHqDnq2liK4ne7E4zQqo/3dyE A==;
X-CSE-ConnectionGUID: uQUrGOlcQ6qa/P11FgOSyg==
X-CSE-MsgGUID: CgqZ2BumSk6yjavUbyvPjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739203"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739203"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:16 -0700
X-CSE-ConnectionGUID: QcA7wj/KQV+KLinRzGmXWw==
X-CSE-MsgGUID: tTUT/BBqQwy/yxnXLgTXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089156"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Fei Yang <fei.yang@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3 00/24] drm/xe: Add Xe3p support
Date: Thu, 16 Oct 2025 19:26:19 -0700
Message-ID: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251013-xe3p-81bb749e9de0
X-Mailer: b4 0.15-dev-bd47d
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

This begins the support for the Xe3p arch - it contains generic support
for graphics version 35 and the Xe3p_xpc IP, the Xe3p_LPM IP for media
and support for Nova Lake S (NVL-S), that uses a mix of IPs - the
display side for NVL-S will be submitted separately.

Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v3:
- Add more patches for irq refactors as discussed in v2
- Fix vecs irqs from v2
- s/Xe3p_LPM/Xe3p_HPM/ where appropriate
- Some other changes, mentioned in the individual commits
- Link to v2: https://lore.kernel.org/r/20251015-xe3p-v2-0-b9189b3056a2@intel.com

Changes in v2:
- Rebase on latest drm-tip as some interfaces changed like the device
  flags location and RTP helper signature
- Drop patches to handle app transient and additional flushes as they
  are not currently used
- Drop patches to handle main gam control - they are actually correct,
  but having a spec reference to embed in the commit message is
  preferred
- Add 2 patches to refactor irq enabling on hw engines so we don blindly
  set bits intended for one engine class in another.
- Some other changes, mentioned in the individual commits
- Link to v1: https://lore.kernel.org/r/20251013-xe3p-v1-0-bfb74f038215@intel.com
---
Balasubramani Vivekanandan (3):
      drm/xe: Drop CTC_MODE register read
      drm/xe/xe3p_lpm: Skip disabling NOA on unsupported IPs
      drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition

Dnyaneshwar Bhadane (1):
      drm/xe/nvls: Attach MOCS table for NVL-S

Fei Yang (1):
      drm/xe/xe3p_xpc: Add L3 bank mask

Harish Chegondi (1):
      drm/xe/xe3p: Add xe3p EU stall data format

Lucas De Marchi (6):
      drm/xe: Add GT_VER() to check version specific to gt type
      drm/xe/irq: Rename fuse mask variables
      drm/xe/irq: Split irq mask per engine class
      drm/xe/irq: Rename bits used with all engines
      drm/xe/irq: Check fuse mask for media engines
      drm/xe/xe3p_xpc: Add support for compute walker for non-MSIx

Matt Roper (8):
      drm/xe/xe3p_lpm: Handle MCR steering
      drm/xe/xe3p: Stop programming RCU_MODE's fixed slice mode setting
      drm/xe/xe3p: Determine service copy availability from fuse
      drm/xe/nvl: Define NVL-S platform
      drm/xe/nvls: Define GuC firmware for NVL-S
      drm/xe/xe3p_xpc: Add MCR steering
      drm/xe/xe3p_xpc: Skip compression tuning on platforms without flatccs
      drm/xe/xe3p_xpc: Setup PAT table

Shekhar Chauhan (2):
      drm/xe/xe3: Add support for graphics IP versions 30.04 & 30.05
      drm/xe/xe3p: Add support for media IP versions 35.00 & 35.03

Wang Xin (2):
      drm/xe: Dump CURRENT_LRCA register
      drm/xe/xe3p: Dump CSMQDEBUG register

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   7 +-
 drivers/gpu/drm/xe/regs/xe_irq_regs.h    |   8 ++-
 drivers/gpu/drm/xe/xe_eu_stall.c         |  28 +++++++-
 drivers/gpu/drm/xe/xe_gt.h               |   6 ++
 drivers/gpu/drm/xe/xe_gt_clock.c         |  19 -----
 drivers/gpu/drm/xe/xe_gt_mcr.c           |  67 +++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_topology.c      |   6 +-
 drivers/gpu/drm/xe/xe_gt_types.h         |  15 ++++
 drivers/gpu/drm/xe/xe_guc_capture.c      |  29 +++++++-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  52 +++++++++++---
 drivers/gpu/drm/xe/xe_irq.c              | 120 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_memirq.c           |   4 +-
 drivers/gpu/drm/xe/xe_mocs.c             |   1 +
 drivers/gpu/drm/xe/xe_oa.c               |   3 +-
 drivers/gpu/drm/xe/xe_pat.c              |  96 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c              |  24 +++++++
 drivers/gpu/drm/xe/xe_platform_types.h   |   1 +
 drivers/gpu/drm/xe/xe_rtp.c              |   7 ++
 drivers/gpu/drm/xe/xe_rtp.h              |  12 ++++
 drivers/gpu/drm/xe/xe_tuning.c           |   9 ++-
 drivers/gpu/drm/xe/xe_uc_fw.c            |   1 +
 drivers/gpu/drm/xe/xe_wa.c               |   6 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules       |   9 +--
 include/drm/intel/pciids.h               |   9 +++
 25 files changed, 448 insertions(+), 95 deletions(-)

base-commit: e919806d9a23ee1c2611792492289a170be4cf9d
change-id: 20251013-xe3p-81bb749e9de0

Lucas De Marchi

