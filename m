Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAA1C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269BE10E43B;
	Mon, 12 May 2025 16:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0nPz130";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058D410E452
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066936; x=1778602936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8UVcoJaiVE4AfyEj5Ztdf/SbHDVSJPx05IiO6KZsVOo=;
 b=e0nPz130pQArOyj5BO5AWpG3CvCRfQPJrKDjYIR7Kd0HuWmX+Xzeh/83
 ytdA6BKN8cONiofcmi34uxJZMU6LLOh9wGXbHpDZ8Kwde/w8VBzgNZuCT
 4cJjl5MVT9ZUinNEDAXKntYeQ0yJNlbJOKphy5BvtXBsYuNhs0m9m0LMM
 m/sbxMf3L5jcwt/jrk59IND4FnzPuwOuYHEIJnDsZf4zgbkEOvmo3wUsd
 LUszsndjmUmDG31hZ9Zfm/sRWZge25TX3Z3ZRkFdeBPKt37ArBI7ZrRnZ
 J/EdggrhC2XXf/iFqp+rZYRgjX+QOBE2tqUDfTC4FluiSBMTNXY+p5syT Q==;
X-CSE-ConnectionGUID: SczvD+BvSKqXpaNY/DjjmQ==
X-CSE-MsgGUID: tIDElfRESR6u1E9A5cjkeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508069"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:16 -0700
X-CSE-ConnectionGUID: j+sDv49vTl2k/ccV7pA7eg==
X-CSE-MsgGUID: mbHKzrfQTlO3F+R7JnV+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532563"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 00/20] Prefetch Support for svm ranges
Date: Mon, 12 May 2025 22:17:20 +0530
Message-Id: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

Patches[1 - 5] are part of https://patchwork.freedesktop.org/series/147846/
and are already under review.

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

Matthew Brost (4):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/gpusvm: Add timeslicing support to GPU SVM
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         |  71 ++++++-
 drivers/gpu/drm/xe/xe_debugfs.c      |  38 ++++
 drivers/gpu/drm/xe/xe_device.c       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +--
 drivers/gpu/drm/xe/xe_module.c       |   3 -
 drivers/gpu/drm/xe/xe_module.h       |   1 -
 drivers/gpu/drm/xe/xe_pt.c           |  84 ++++++--
 drivers/gpu/drm/xe/xe_svm.c          | 301 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h          | 143 ++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c           | 261 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 ++
 include/drm/drm_gpusvm.h             |  52 +++--
 14 files changed, 847 insertions(+), 152 deletions(-)

-- 
2.34.1

