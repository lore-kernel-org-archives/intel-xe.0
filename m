Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73069C3ABA9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60F10E41D;
	Tue, 29 Apr 2025 10:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAsiep12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88E110E41D
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921844; x=1777457844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aFjZInj2oxyAHNwdbfIbaRC5Jrp1rpkej8DEswbtojo=;
 b=eAsiep12CDjaIf4w2g5phMPURTtuLTrlVijLiT1sV1TpEDZvKduQCZBg
 UqA8/AEXpHHwHuBeTNKndUwWK/EhCCyUjuMnkxjiUWXpunO6LPtm+f7+L
 X2K5quT6zYceIqxjnaSt4jICm9o23y6bBmYbHSYr4vFLDQYlU5tfzNhxp
 sKRm2LFGcD7gyRwtTTyku/RiUq1KEKrZdIiI3Ngv+PILQyirapcj3IZjn
 0b7MSvRJXtpl1gLWqp+rJulk504A9QVvZLJ9PFM1Dg/4BU0Q2sHGIoTfa
 EZRuiO5pduO6FTOKt7SqwRG8oTNAVl83Twi/K5rSLzygDz7IGSVJ75BQo Q==;
X-CSE-ConnectionGUID: hM/Ly0wkSDW5blxYkNzmdw==
X-CSE-MsgGUID: kHBx1sWOT2aAtPu6oRsH/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243171"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243171"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:17:24 -0700
X-CSE-ConnectionGUID: FyQ755o6QUmMlM3RXF73XA==
X-CSE-MsgGUID: Q+vgUELGRVmbqXZs2IIW8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287520"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:17:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 00/20] Prefetch Support for svm ranges
Date: Tue, 29 Apr 2025 16:12:13 +0530
Message-Id: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

This series builds upon the SVM work by Matt Brost and introduces the
ability to prefetch SVM ranges. The prefetch functionality utilizes the
existing ioctl vm_bind for the user interface.

Prefetching ensures that pages are populated in the requested region and
that PTEs are updated, thereby preventing GPU page faults.

Region 0: Ranges will remain in SMEM, and only PTE updates will occur.
Region 1: Ranges will migrate to VRAM, and PTEs will be updated
accordingly

Patches[1 - 5] are part of https://patchwork.freedesktop.org/series/147846/
and are already under review.

v3:
  - Separate out madvise and Prefetch series
  - Rebase on top of atomic fixes for svm
  - address comments from Matthew Brost

v4:
  - CI fixes

v5
  - Move finding start addr of  cpu vma to drm gpusvm layer

Himal Prasad Ghimiray (16):
  drm/gpusvm: Introduce devmem_only flag for allocation
  drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of
    ranges
  drm/xe: Make xe_svm_alloc_vram public
  drm/xe/svm: Helper to add tile masks to svm ranges
  drm/xe/svm: Make to_xe_range a public function
  drm/xe/svm: Make xe_svm_range_* end/start/size public
  drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment
    value
  drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
  drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
  drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
  drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
  drm/xe/svm: Add xe_svm_range_validate_and_evict() function
  drm/gpusvm: Introduce drm_gpusvm_range_find_or_insert_start() function
  drm/xe/svm: Add xe_svm_range_find_or_insert_start()
  drm/xe/svm: Implement prefetch support for SVM ranges
  drm/xe/vm: Add debug prints for SVM range prefetch

Matthew Brost (4):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/gpusvm: Add timeslicing support to GPU SVM
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         |  43 +++++
 drivers/gpu/drm/xe/xe_debugfs.c      |  38 ++++
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +--
 drivers/gpu/drm/xe/xe_module.c       |   3 -
 drivers/gpu/drm/xe/xe_module.h       |   1 -
 drivers/gpu/drm/xe/xe_pt.c           |  77 ++++++--
 drivers/gpu/drm/xe/xe_svm.c          | 275 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h          | 136 ++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c           | 255 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 ++
 include/drm/drm_gpusvm.h             |  12 ++
 14 files changed, 755 insertions(+), 130 deletions(-)

-- 
2.34.1

