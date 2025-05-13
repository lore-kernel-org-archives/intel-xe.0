Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7882EC3ABCB
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1704210E2C2;
	Tue, 13 May 2025 03:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDHM4V2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03FF10E2C2
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 03:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747107423; x=1778643423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iuylmnPPfw0Xvs/SbQPV46q0YoEG/Iqw8Oem11NQFE0=;
 b=ZDHM4V2nyazcYKwqdLeeyajzeuZLlhy28UCXJuYhOJ2WJeI1A/UU6iu2
 LKOB4cAKB9oqXRSCEcXohxL2eWTHAyJtA8hOP58JpEHvPFX9qpx3zKsds
 DvSHsraVhFCGGDSMDx54/MG7mvQNkMD1EfiLIFqRxhtoRlhSiZOLAVg4p
 Q01uSh/lvSk+VSpKYPBXM9pfjPVdfxKE7hQrYw68bxa2Pk60Q4z9t4PV6
 qk/Z+L6nWwsfTJY4yYetvk/ip2epb9lDRJDODf4iiBO5PlwwQlxB+APG9
 clFRDuC9WvOiewQvquzwGzLb9iF5N/sz8fHEmvZlE37GNsyei7U06v2gb A==;
X-CSE-ConnectionGUID: kIHWFtEYRl6fZawIfVm7XA==
X-CSE-MsgGUID: 7qAEC9v8QcuLT2H1+NJyUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48858791"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48858791"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:37:03 -0700
X-CSE-ConnectionGUID: FA3t/KbIQwyEbLl9Sg3NUw==
X-CSE-MsgGUID: pb0cD3+PS26W5FgGhNqd1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142690105"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 20:37:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v8 00/15] Prefetch Support for svm ranges
Date: Tue, 13 May 2025 09:32:13 +0530
Message-Id: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series builds upon the SVM work by Matt Brost and introduces the
ability to prefetch SVM ranges. The prefetch functionality utilizes the
existing ioctl vm_bind for the user interface.

Prefetching ensures that pages are populated in the requested region and
that PTEs are updated, thereby preventing GPU page faults.

Region 0: Ranges will remain in SMEM, and only PTE updates will occur.
Region 1: Ranges will migrate to VRAM, and PTEs will be updated
accordingly

v3:
  - Separate out madvise and Prefetch series
  - Rebase on top of atomic fixes for svm
  - address comments from Matthew Brost

v4:
  - CI fixes

v5
  - Move finding start addr of cpu vma to drm gpusvm layer

v6
  - Rebase on top of latest SVM ATOMIC Fixes
  - move eviction logic to prefetch_ranges
  - Rename functions properly

v7
 - Rebase on top of v8 of SVM ATOMIC Fixes
 - devmem_only assigned 0 for prefetch
 - s/mmget/mmget_not_zero/

v8
 - Rebase
 - s/struct drm_gpusvm_ctx ctx;/struct drm_gpusvm_ctx ctx = {};

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
  drm/xe/svm: Add xe_svm_range_validate() and
    xe_svm_range_migrate_to_smem()
  drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
  drm/xe/svm: Add xe_svm_find_vma_start() helper
  drm/xe/svm: Implement prefetch support for SVM ranges
  drm/xe/vm: Add debug prints for SVM range prefetch

 drivers/gpu/drm/drm_gpusvm.c         |  34 ++++
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +--
 drivers/gpu/drm/xe/xe_pt.c           |  84 ++++++---
 drivers/gpu/drm/xe/xe_svm.c          | 204 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_svm.h          | 138 ++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 259 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 ++
 include/drm/drm_gpusvm.h             |   5 +
 9 files changed, 653 insertions(+), 112 deletions(-)

-- 
2.34.1

