Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E67C71155
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 14:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F4B10E34C;
	Mon, 16 Jun 2025 14:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xgsm3zS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FE610E34C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750085503; x=1781621503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HU2u6Lqo7H4kdyS2Mitp1Ve1/2YlLdTncd73ekbmuqU=;
 b=Xgsm3zS2MYF8CcpvaknjQTAD2/ladQCgRC58DbLeBwLtpGakWM361crv
 c8DLDNFMix73HPGDISvGO9Hfo8oWKLlXR+6zwHmit0pVeoXYlalI1oBkl
 qDSFgY9cbfawNyU84awjRHftmbWrpeq375SiMHRa1MypAuFptEuvtvlY4
 qPEc4T+u4W6ab6ftzVVwU8aXsCa9iqHO9+lAj/lRQ8kXFbQUUS9wDWC1G
 kKd94oOjC0EG7vALNKU+hdQDziu4uqqfATyFgcZx+pCaO3NKroKUnMNHL
 wXzD7aAkn+BI3pFszckyNZljk9gHC0SG1+BXoqj/p2g8p62+/NvkvmiZO Q==;
X-CSE-ConnectionGUID: 6CPVtae7S7aNOxEHWvoFLg==
X-CSE-MsgGUID: Zono6iWURc+Ea14SVc2wjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77628115"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="77628115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:51:41 -0700
X-CSE-ConnectionGUID: bOhZ0AEkRLiWzr5Xboms+A==
X-CSE-MsgGUID: TmQbsFQiTrenCB8SD60yXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153248260"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 16 Jun 2025 07:51:40 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 0/3] CCS save restore for IGPU
Date: Mon, 16 Jun 2025 20:38:02 +0530
Message-ID: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
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
 drivers/gpu/drm/xe/xe_bb.c                 |  54 +++
 drivers/gpu/drm/xe/xe_bb.h                 |   6 +
 drivers/gpu/drm/xe/xe_bo.c                 |  23 ++
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h           |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |  34 +-
 drivers/gpu/drm/xe/xe_guc_submit.h         |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            | 130 ++++++-
 drivers/gpu/drm/xe/xe_migrate.h            |  10 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   4 +
 drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 375 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  17 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  53 +++
 drivers/gpu/drm/xe/xe_vm.c                 |   6 +-
 21 files changed, 771 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

-- 
2.43.0

