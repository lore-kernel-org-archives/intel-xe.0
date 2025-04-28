Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C72CC369D3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 07:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7A10E1EF;
	Mon, 28 Apr 2025 07:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2PL4TVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0FE10E1EF
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745825001; x=1777361001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uushSuGY+a3Q1F3cmC5c2JzA7yICVphjtVHQZv/bagM=;
 b=a2PL4TVkpI2NBb0cKQNhpw3VG2YMq9Ji7E5PqJkoc+Mm8Wdy95fVms48
 BeHTFLHjUEuWmF99v0LnqCZYE+vNzrI/ORE4ogbtDWzqnH4Y074PKVkCt
 SAgSl23CgrvOXCF+zkHCI5T3CsFpEcuDyh6VJunhjcQaH9/933zUpWFyF
 +KA4SNA9PpnHqiHu8BNzREs2slF6L1kz5eJCgLBafMBZU7PG2yQMLjuad
 WFpNIpuVTFf/0/lZlV80GOWR+TqeWV9ZI2StBzPE/w8/kgUTb1/ri16Ad
 slxsYds+aIy2UeSdjYF8phnWKbuo6IOIap/J0Er2QgEgsNQzOyk3CSMlf g==;
X-CSE-ConnectionGUID: 1TrPVsiKQiSmwG0J8FBPUQ==
X-CSE-MsgGUID: cEv+uc0cSU2egcjjR9BXtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50056887"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50056887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:23:20 -0700
X-CSE-ConnectionGUID: thmoHGhERJm7BQvDBYmLpA==
X-CSE-MsgGUID: 3kws57iPRfeERaVNFX3j7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133408675"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2025 00:23:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 00/18] Prefetch Support for svm ranges
Date: Mon, 28 Apr 2025 13:18:11 +0530
Message-Id: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
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
  - Seperate out madvise and Prefetch series
  - Rebase on top of atomic fixes for svm
  - address comments from Matthew Brost

Himal Prasad Ghimiray (14):
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
  drm/xe/svm: Implement prefetch support for SVM ranges
  drm/xe/vm: Add debug prints for SVM range prefetch

Matthew Brost (4):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/gpusvm: Add timeslicing support to GPU SVM
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         |  14 ++
 drivers/gpu/drm/xe/xe_debugfs.c      |  38 ++++
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +--
 drivers/gpu/drm/xe/xe_module.c       |   3 -
 drivers/gpu/drm/xe/xe_module.h       |   1 -
 drivers/gpu/drm/xe/xe_pt.c           |  77 ++++++--
 drivers/gpu/drm/xe/xe_svm.c          | 250 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h          | 128 ++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c           | 271 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 ++
 include/drm/drm_gpusvm.h             |   7 +
 14 files changed, 704 insertions(+), 130 deletions(-)

-- 
2.34.1

