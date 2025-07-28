Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F50C87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 09:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C76B10E0EF;
	Mon, 28 Jul 2025 09:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0Ho5+Cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1762A10E004
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753694283; x=1785230283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Na5LT6PZvycMBwOYu45P7C4sClyEN+/xsswwpT/iAik=;
 b=U0Ho5+Cltt2FSi6CSFaPDL2dvGIbev0coxFqMTXbcfvfr8zyv83oRi19
 xSymhI5ma26vgYOwg4wmV5mlDZ8ryT5FMyCALJIg/o+rRqRau0fos2Qdw
 2HyL0UnhbAWRJxTRSPGf6uahpRWLoh75sFsRl9Jp1Bcy+aiVuPqOchUog
 ORO7VPGVsc84Up/6jsTBS71epUghFHqDiPOJhn8Wta+/sUDJ5eKa1Tv6o
 rEBdk3SLnBxFmlsG6EDMb53AO9ScLMCZ0k7gd9nP/uwK3UuzSW2KRAISo
 b/cl8xJTn3R2Ma4GC+XHcEsMQF32zBR0+RQX2s8qXHp2hsslUSxS9vEOm w==;
X-CSE-ConnectionGUID: I1YC5nrpQgS3L58ajnTMZA==
X-CSE-MsgGUID: LZlPNYM3Sd6/p1IlY2T2bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59756193"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59756193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 02:18:03 -0700
X-CSE-ConnectionGUID: +wCapd0uTGqridIG2SIX4Q==
X-CSE-MsgGUID: RClD2gEwQoeJ9p60CgvUMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162241351"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 02:18:01 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/3] Revert "CCS save restore for IGPU"
Date: Mon, 28 Jul 2025 15:04:44 +0530
Message-ID: <20250728093447.27961-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The VF CCS save/restore series (patchwork #149108) has a dependency
on the migration framework. A recent migration update in commit
d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
caused a VM crash during XE driver release for iGPU devices.

So, reverting CCS save restore for IGPU series.

Satyanarayana K V P (3):
  Revert "drm/xe/vf: Register CCS read/write contexts with Guc"
  Revert "drm/xe/vf: Attach and detach CCS copy commands with BO"
  Revert "drm/xe/vf: Create contexts for CCS read write"

 drivers/gpu/drm/xe/Makefile                |   1 -
 drivers/gpu/drm/xe/xe_bb.c                 |  35 --
 drivers/gpu/drm/xe/xe_bb.h                 |   3 -
 drivers/gpu/drm/xe/xe_bo.c                 |  23 --
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 -
 drivers/gpu/drm/xe/xe_device.c             |   4 -
 drivers/gpu/drm/xe/xe_device_types.h       |   4 -
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  39 ---
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 -
 drivers/gpu/drm/xe/xe_guc_submit.c         |  34 +-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 -
 drivers/gpu/drm/xe/xe_migrate.c            | 172 +---------
 drivers/gpu/drm/xe/xe_migrate.h            |   9 -
 drivers/gpu/drm/xe/xe_pm.c                 |   4 -
 drivers/gpu/drm/xe/xe_sriov.c              |  19 --
 drivers/gpu/drm/xe/xe_sriov.h              |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 367 ---------------------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  53 ---
 drivers/gpu/drm/xe/xe_sriov_vf_types.h     |   6 -
 drivers/gpu/drm/xe/xe_vm.c                 |   6 +-
 21 files changed, 18 insertions(+), 788 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

