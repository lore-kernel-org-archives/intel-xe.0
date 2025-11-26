Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AC8D11184
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4973E10E71A;
	Wed, 26 Nov 2025 23:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2azB0EH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9F10E71A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198127; x=1795734127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=13UsADrXK/N8d0M2c5kb7J/luW/xOW94mpALO2lgDbE=;
 b=O2azB0EH1w8rvvADbn9nsjlB5fRU6SeW0lVoIZlBqVsdfhQaqt38vWq9
 k7bgQRpcbS3UUJBtqgrgBc1eURsWS2CxGTLcqb7zjiDAM5491dAEDv9Z8
 I/t0qBvUysm55J0GJCWWSv8Fd/heT99b4TbsLZuV4Drj/EBwlnKAnN1B2
 0qbogwZZ9YsngzBdNGQsPOJo9PNbOG/ZF1AYhjqYHpiH5olCnCvmeNqZL
 8UYM+h4/MiDu2poGUQmFDOuE3zcs6+jr9a+AG1rwvky+o4hQz4q58f6NB
 +Z56WxGCw54EnOVJV0egloqSPXPd+W4ueeXtnJDeXHucVNVWiGZVGD42R A==;
X-CSE-ConnectionGUID: shixscenRxm8c12An8wwBw==
X-CSE-MsgGUID: 8Fv8mOuNSBu7Cy4JQnZFRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66284499"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66284499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:02:06 -0800
X-CSE-ConnectionGUID: hWE0aVIlR9qa1pous3xDeg==
X-CSE-MsgGUID: 5r0E/wfSTtC/YMXcSov2fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224028469"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:02:04 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v2 00/11] Page Reclamation Support for Xe3p Platforms
Date: Thu, 27 Nov 2025 07:02:01 +0800
Message-ID: <20251126230201.3782788-13-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
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
used that correspond to an unmap/unbind operation and let hardware perform selective
cache line eviction. If reclamation succeeds, we skip the full PPC flush entirely
otherwise we fall back to our current process of full PPC flush with the TLB
invalidation.

This series is partially dependent on the "Context based TLB invalidations"
Patch series by Matthew Brost, in particular the "drm/xe: Do not forward
invalid TLB invalidation seqnos to upper layers" patch.

Context based TLB invalidations Patch Series:
https://patchwork.freedesktop.org/series/156874/

Thanks,
Brian

v2:
 Note: with revision in debugfs patch, remove reviewed-by.
 Please re-review, thanks~.
 There is also still some open discussion around Patch 10
 (Optimize flushing of L2$).
 - General refactor to remove additional variables from
   tlb fences (flush_cache and PRL ptr). (Matthew B)
 - Removed lock from xe_tlb_inval_reset_timeout and moved 
   into xe_tlb_inval_done_handler. (Matthew B)
 - Removed page reclaim variables out of tlb fences (Matthew B)
 - Add FW check for page reclaim support. (Shuicheng, Matthew B)
 - Moved PRL max entries overflow handling out from
   generate_reclaim_entry to caller. (Shuicheng)
 - Fix one off error with NULL terminated PRL.
 - Add xe_page_reclaim_list_init for clarity. (Matthew B)
 - Invalidate PRL on early abort page walks.
 - Allocate PRL bo size to num_entries. (Matthew B)
 - Move PRL bo allocation to tlb_inval run_job. (Matthew B)
 - Modify debugfs to expose file only if page reclaim supported by
   default instead of previous behavior to return an ENODEV
   and thus no need to move xe_match_desc from configfs (Michal)
 - Compacted warning checking, update commit message,
   spelling, moved variables, etc. (Shuicheng, Matthew B, Michal)
 - Remove unused function. (Shuicheng)
 - Fix various missing kernel doc input.

Suggested-by: Matthew Brost <matthew.brost@intel.com>

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
 drivers/gpu/drm/xe/xe_debugfs.c          |  41 +++++++
 drivers/gpu/drm/xe/xe_device_types.h     |   9 ++
 drivers/gpu/drm/xe/xe_guc.c              |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |  17 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   1 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    |  36 ++++--
 drivers/gpu/drm/xe/xe_page_reclaim.c     | 148 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h     |  82 +++++++++++++
 drivers/gpu/drm/xe/xe_pat.c              |   9 +-
 drivers/gpu/drm/xe/xe_pci.c              |   1 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
 drivers/gpu/drm/xe/xe_pt.c               | 119 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pt_types.h         |   5 +
 drivers/gpu/drm/xe/xe_tile.c             |   5 +
 drivers/gpu/drm/xe/xe_tlb_inval.c        |  27 ++++-
 drivers/gpu/drm/xe/xe_tlb_inval.h        |   2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  37 +++++-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   4 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h  |   5 +-
 drivers/gpu/drm/xe/xe_vm.c               |   4 +-
 24 files changed, 548 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h

-- 
2.52.0

