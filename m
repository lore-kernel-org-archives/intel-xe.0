Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4BCC7115E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 07:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E5110E07B;
	Thu, 19 Jun 2025 07:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLeu2SHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2B010E07B
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750319319; x=1781855319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=keIiPa+3//2FoHW5UKaINu3lrkyyGQ1KPPbFhGx1Z2Y=;
 b=iLeu2SHgRuAkfWKGYDTWjuZ7i798q5L9actRdI1JMR/a7VDJmRMUmXU1
 +d+G5lQGmr0+MmqsztQOSHus8nj3YYUBJNEaZ2IRlRfA+v3PG3+3Onvel
 2q614sJSou4+ouG9xJ/Y4eeH3A/JHQy34oL+dbMzofDq2zeirPgyUwq3a
 ic45R01vWbdhPaBnuRIzC/hQYDxE70v4FhhH6A9y5NDw/tvVt7WAH0Nyj
 lUyQ6cuy5jols/GckPiy0AKjg57ohvv2ychcGukRGi67tpCNMdijm0zru
 XDdEQO4iWZZPcbgcb7LqLtR8vSiIrnTHVUxDlQmo5ZJvgGwk2G1qhGjva A==;
X-CSE-ConnectionGUID: 6VnO3p2qQ/SvSuba8G5tfw==
X-CSE-MsgGUID: 7xO9RZUsRa63+hTy7IDLbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52442147"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52442147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 00:48:24 -0700
X-CSE-ConnectionGUID: aLavT3eZRm2hXFv4Xvo5BA==
X-CSE-MsgGUID: N/FQB+mPTf6nn4FzpQgnJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="174091239"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 00:48:22 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v8 0/3] CCS save restore for IGPU
Date: Thu, 19 Jun 2025 13:34:56 +0530
Message-ID: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
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

V7 -> V8:
- Fixed review comments (atthew Brost).
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
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |  34 +-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 165 ++++++++-
 drivers/gpu/drm/xe/xe_migrate.h            |  10 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 375 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  53 +++
 drivers/gpu/drm/xe/xe_vm.c                 |   6 +-
 21 files changed, 784 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

