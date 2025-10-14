Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927FBCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40B010E52A;
	Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTbAJZ3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E022010E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412328; x=1791948328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EHeHOOWfI4a6LLlPSyvPvBQtjPRpPeT6NeufTVeZSig=;
 b=CTbAJZ3DBidroVk9fn4daJ9Em/J8VLsyJiQAonX0bi45UXgnyNseMrsL
 DZClpbhMG9tEYDOqSvQXW3UDJolmIgYJfXLFRJr5X3u1vu+Btvfflx9ku
 oY357H0XTLpbyhdHnhFJMVhlNp7KUK+fzhJ5/re78vhBttQkEAMD3NzhB
 aLGbEAhY1LCs46xQ+Gq1B1f8HEITjf8emM+R1tBS98i6j/f0rGHu0mhQz
 mUuKD4rjNZB72jGKphKNc056ExEQ199OhKpw/pIa3mxuaS7oTVoLB88Dp
 gr14DRBUH4d2B+WE/e4oYsqIPkwM8jFkxcuPZg+odzYFby+es0nVLBOcR w==;
X-CSE-ConnectionGUID: HZ/WJD+kSzicsrw0CPYzag==
X-CSE-MsgGUID: aZvE6FE3QoOA67uVrZnpdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414864"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:28 -0700
X-CSE-ConnectionGUID: eLhKPeAZQpmh7Tgc4HB/iA==
X-CSE-MsgGUID: XK4D24jQR0S5g7xls2Tvdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567262"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Brian Welty <brian.welty@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Fei Yang <fei.yang@intel.com>,
 S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 00/23] drm/xe: Add Xe3p support
Date: Mon, 13 Oct 2025 20:24:32 -0700
Message-ID: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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
Balasubramani Vivekanandan (4):
      drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL
      drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
      drm/xe/xe3p_lpm: Skip disabling NOA on unsupported IPs
      drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition

Brian Welty (1):
      drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT

Dnyaneshwar Bhadane (1):
      drm/xe/nvls: Attach MOCS table for NVL-S

Fei Yang (1):
      drm/xe/xe3p_xpc: Add L3 bank mask

Harish Chegondi (1):
      drm/xe/xe3p: Add xe3p EU stall data format

Matt Roper (8):
      drm/xe/xe3p_lpm: Handle MCR steering
      drm/xe/xe3p: Stop programming RCU_MODE's fixed slice mode setting
      drm/xe/xe3p: Determine service copy availability from fuse
      drm/xe/nvl: Define NVL-S platform
      drm/xe/nvls: Define GuC firmware for NVL-S
      drm/xe/xe3p_xpc: Add MCR steering
      drm/xe/xe3p_xpc: Skip compression tuning on platforms without flatccs
      drm/xe/xe3p_xpc: Setup PAT table

S A Muqthyar Ahmed (1):
      drm/xe/xe3p_xpc: Add support for compute walker for non-MSIx

Shekhar Chauhan (2):
      drm/xe/xe3: Add support for graphics IP versions 30.04 & 30.05
      drm/xe/xe3p_lpm: Add support for media IP versions 35.00 & 35.03

Tejas Upadhyay (3):
      drm/xe/xe3p: Skip TD flush
      drm/xe/xe3p: Enable L2 flush optimization feature
      drm/xe/xe3p: Flush userptr/shrinker bo cachelines manually

Wang Xin (1):
      drm/xe: Dump CURRENT_LRCA and CSMQDEBUG registers

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  5 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 12 ++++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h    |  1 +
 drivers/gpu/drm/xe/xe_bo.c               |  3 +-
 drivers/gpu/drm/xe/xe_device.c           | 28 ++++++++++
 drivers/gpu/drm/xe/xe_device.h           |  1 +
 drivers/gpu/drm/xe/xe_eu_stall.c         | 23 ++++++++
 drivers/gpu/drm/xe/xe_gt.h               |  6 ++
 drivers/gpu/drm/xe/xe_gt_clock.c         |  4 ++
 drivers/gpu/drm/xe/xe_gt_mcr.c           | 61 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_topology.c      |  6 +-
 drivers/gpu/drm/xe/xe_gt_types.h         | 15 +++++
 drivers/gpu/drm/xe/xe_guc.c              | 49 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  6 +-
 drivers/gpu/drm/xe/xe_guc_capture.c      | 53 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_fwif.h         |  2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 50 ++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.c              |  4 ++
 drivers/gpu/drm/xe/xe_mocs.c             |  1 +
 drivers/gpu/drm/xe/xe_oa.c               |  3 +-
 drivers/gpu/drm/xe/xe_pat.c              | 96 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c              | 23 ++++++++
 drivers/gpu/drm/xe/xe_platform_types.h   |  1 +
 drivers/gpu/drm/xe/xe_rtp.c              |  6 ++
 drivers/gpu/drm/xe/xe_rtp.h              | 10 ++++
 drivers/gpu/drm/xe/xe_tuning.c           |  9 ++-
 drivers/gpu/drm/xe/xe_uc_fw.c            |  1 +
 drivers/gpu/drm/xe/xe_userptr.c          |  3 +-
 drivers/gpu/drm/xe/xe_wa.c               |  6 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  7 ++-
 include/drm/intel/pciids.h               |  9 +++
 32 files changed, 477 insertions(+), 28 deletions(-)

base-commit: c917f7d11493984be9f381ca0a7667bd3e587ada
change-id: 20251013-xe3p-81bb749e9de0

Lucas De Marchi

