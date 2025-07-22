Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA18C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 11:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123BA10E0DA;
	Tue, 22 Jul 2025 11:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWeREZjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECE710E0DA
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753184901; x=1784720901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fBCLIFPH889974yzyO+wxU567e//QpSeDAd1h9i1scY=;
 b=OWeREZjlZc2PkHTricbb0+JmCm5B2cT63bVouTgID4Dfm/RPTtRsvFN5
 hfv+FckhPdtYbX64qvWx1RfmW0bAI3yGUhrC/PBwp2Hb++zzPqGl2gVYZ
 2YZUOMwkWzxosT5kxe3acIrz1BzgbhmsNftX5PDapbNzRD7KwgwH3ncub
 /KqkjHvns6rC920DMWwcrVWq36jDtq3KYzOzayfynsSPUALoCSR0UOAOZ
 +ERyma2CMWXLP9ekKM/Ekr2gHKFNUGyUcFj221qWEyxuyWFNx5/F3ETON
 0dnyxu0GC/cdHa+OF+1Pn38TgFvBo0UhiITOIthJ8OYTSDGJ870CwBVDm w==;
X-CSE-ConnectionGUID: hkDps4lOR/6KtBvaH5dcdg==
X-CSE-MsgGUID: 3HG9sxDcR0q4zKwdoMLxdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55387384"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55387384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 04:48:21 -0700
X-CSE-ConnectionGUID: qXOXcFk2R6G2EWG2Xc7vTw==
X-CSE-MsgGUID: pqA0gAOvSruvplYfPFpmHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163406625"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 04:48:19 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v12 0/3] CCS save restore for IGPU
Date: Tue, 22 Jul 2025 17:35:03 +0530
Message-ID: <20250722120506.6483-1-satyanarayana.k.v.p@intel.com>
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

Prior IGPU design had compression supported in GPU VA domain. For
Virtualization, this makes compression Meta data save/restore for VF as
not necessary (i.e. Compression Meta data space is automatically
save/restore with normal guest/VM memory).

With latest Xe2 architecture, compression is supported by Flat, physical
domain. Meta data/compression control surface (Aka CCS) and association
is in physical domain and data is located in BIOS/firmware-reserved CCS
pool. In virtualization/SRIOV when VF save/restore now have to account for
save/restore VF associated CCS. Without this feature any restore of
compressed resource in IGPU VF domain will have corruption as Meta data
will not be restore correctly as a part of VF save/restore flow. Making it
must have/functional feature if we are supporting compression and
Save/restore of VF on IGPU platform.

This is the first in series which adds support for CCS save/restore for
IGPU.

V11 -> V12:
- Created a helper function for TLB invalidation and flush.
- Moved xe_migrate_lrc() from one commit to another commit in this series.

V10 -> V11:
- Fixed issue with updating read/write lrc to Guc.
- Fixed kernel-doc issues reported by patchworks (Matthew Brost).
- Rebased and fixed conflicts.
- Fixed issue with TLB flush.

V9 -> V10:
- Fixed review comments (Matthew Brost).

V8 -> V9:
- Fixed review comments (atthew Brost).
- Removed MI_INVALIDATE_TLB after emitting PTEs (Matthew Brost).
- Initialized CCS read write contexts for only root tile (Matthew Brost).

V7 -> V8:
- Fixed review comments (Matthew Brost).
- Removed xe_bb_ccs_realloc() and allocated a single BB by calculating BB
size first and then commands are emitted to BB.

V6 -> V7:
- Fixed review comments (Michal Wajdeczko & Matthew Brost).
- Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
a list. (Matthew Brost)
- Replaced xe_tile_migrate_exec_queue() with xe_migrate_exec_queue() as per
review comments (Matthew Brost).

V5 -> V6:
- Removed dead code from xe_migrate_ccs_rw_copy() function (Matthew Brost)
- Added id field in the xe_tile_vf_ccs structure for self identification.

V4 -> V5:
- Modified read/write contexts to enums from #defines (Matthew Brost).
- The CCS BB pool size is calculated based on the system memory size
(Michal Wajdeczko & Matthew Brost).
- Fixed review comments (Matthew Brost & Matthew Auld)
- Create a list of BBs for the given BO and fixed memory leak while
detaching BOs. (Matthew Brost).
- Yet to cleanup xe_migrate_ccs_rw_copy() function.

V3 -> V4:
- Fixed issues reported by patchworks.

V2 -> V3:
- Added new variable which denotes the initialization of contexts.
- Attach and detach functions check for IS_VF_CCS_READY().
- Made xe_migrate structure private as per review comments.
- Created new xe_migrate functions to get lrc and exec_queue.

V1 -> V2:
- Fixed review comments.

Satyanarayana K V P (3):
  drm/xe/vf: Create contexts for CCS read write
  drm/xe/vf: Attach and detach CCS copy commands with BO
  drm/xe/vf: Register CCS read/write contexts with Guc

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_bb.c                 |  35 ++
 drivers/gpu/drm/xe/xe_bb.h                 |   3 +
 drivers/gpu/drm/xe/xe_bo.c                 |  23 ++
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  39 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |  34 +-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 172 +++++++++-
 drivers/gpu/drm/xe/xe_migrate.h            |  10 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 367 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  53 +++
 drivers/gpu/drm/xe/xe_sriov_vf_types.h     |   6 +
 drivers/gpu/drm/xe/xe_vm.c                 |   6 +-
 21 files changed, 787 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

