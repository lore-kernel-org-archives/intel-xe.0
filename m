Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E12CCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93FE10E458;
	Tue, 18 Nov 2025 09:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVgad4F2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4900E10E458
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456755; x=1794992755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bPVthnseX4mriLuoWgcQ7IUdZ5L51n0iGmcPA2k/Lrw=;
 b=GVgad4F2ttkFAYkaJ24m0FN24yT6bd7rmitMN3KNbIdVITuuMg6cDhCM
 z/iB3A8PVMzP3mvT+iHxnB5ggMeo1rnwAMHNHV5pXVemyrFAvl3/q5MW9
 8lJgGdvUZHGsEZFVtORoES6M82Iuch69II2cXIU6Lt4j+Mbuz78v6NqR6
 M1cSAwb3BXp2cCFruwBMwc7Nb1hl10dxOu9bk/BitykS6rEn9bwCqLUhE
 fpwNk+iX3/P4KWNDowgWvt65Kcp0oqwy0jUTMRR1B2Ldbp/6oIk4nS6mc
 o9Hu4wlg7X2eIwnRA2hBFs/D1mUmkmmtygePvm+DGc8zFc/gVqsdZV/rL A==;
X-CSE-ConnectionGUID: PJnekPemQLKRgJV7Pkxl2Q==
X-CSE-MsgGUID: /6o4h8vVS8OrnM3s3JjFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097747"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:05:55 -0800
X-CSE-ConnectionGUID: kPtGYUw5QcWvCtwUSr9sfw==
X-CSE-MsgGUID: w/XiWTqUT0KNIZYVo/pnww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500818"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:05:53 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 00/11] Page Reclamation Support for Xe3p Platforms
Date: Tue, 18 Nov 2025 17:05:41 +0800
Message-ID: <20251118090552.246243-1-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

  This series introduces a hardware-assisted page reclamation support on Xe3p
platforms, integrating with the KMD's existing TLB invalidation workflow and
adding the ability to perform selective Private Physical Cache (PPC) flushing
rather than always forcing the default full PPC flush. 

Currently as of Xe2, Xe TLB invalidations trigger a full Private Physical Cache
flush to guarantee non-coherent memory correctness. New HW (Xe3p and beyond)
exposes a page reclamation feature, which we selectively enable on platforms
with a flag in device info.

The driver can provide a “Page Reclaim List” (PRL), tracking the physical pages
used that correspond to an unmap/unbind operation and let hardware perform selective cache line eviction.
If reclamation succeeds, we skip the full PPC flush entirely otherwise we fall
back to our current process of full PPC flush with the TLB invalidation.

This series is partially dependent on the "Context based TLB invalidations"
Patch series by Matthew Brost, in particular the "drm/xe: Do not forward
invalid TLB invalidation seqnos to upper layers" patch.

Context based TLB invalidations Patch Series:
https://patchwork.freedesktop.org/series/156874/

Thanks,
Brian

Brian Nguyen (9):
  drm/xe: Reset tlb fence timeout on invalid seqno received
  drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
  drm/xe/guc: Add page reclamation interface to GuC
  drm/xe: Create page reclaim list on unbind
  drm/xe: Suballocate BO for page reclaim
  drm/xe: Prep page reclaim in tlb inval job
  drm/xe: Append page reclamation action to tlb inval
  drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
  drm/xe: Add debugfs support for page reclamation

Matthew Brost (1):
  [DO,NOT,REVIEW] drm/xe: Do not forward invalid TLB invalidation seqnos
    to upper layers

Oak Zeng (1):
  drm/xe: Add page reclamation info to device info

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  11 ++
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h    |   1 +
 drivers/gpu/drm/xe/xe_configfs.c         |  11 +-
 drivers/gpu/drm/xe/xe_debugfs.c          |  47 +++++++++
 drivers/gpu/drm/xe/xe_device.c           |  10 ++
 drivers/gpu/drm/xe/xe_device.h           |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   9 ++
 drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   1 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    |  41 ++++++--
 drivers/gpu/drm/xe/xe_page_reclaim.c     | 128 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h     |  56 ++++++++++
 drivers/gpu/drm/xe/xe_pat.c              |   9 +-
 drivers/gpu/drm/xe/xe_pci.c              |   1 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
 drivers/gpu/drm/xe/xe_pt.c               | 116 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt_types.h         |   5 +
 drivers/gpu/drm/xe/xe_tile.c             |   5 +
 drivers/gpu/drm/xe/xe_tlb_inval.c        |  68 +++++++++++-
 drivers/gpu/drm/xe/xe_tlb_inval.h        |   9 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  31 +++++-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   4 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h  |  12 ++-
 drivers/gpu/drm/xe/xe_vm.c               |   4 +-
 26 files changed, 553 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h

-- 
2.51.2

