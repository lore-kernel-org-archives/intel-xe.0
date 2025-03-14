Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BACDC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483F10E978;
	Fri, 14 Mar 2025 07:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daigEBUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C89910E978
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937892; x=1773473892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2VldSExsQqlFfn/VLkgEn/5WZRZcuDLXUHYqcGpFrOA=;
 b=daigEBUM3UcLQqUV0NVEVSY3W+cwsvzVL0U1xEqK2+rmo32WsLHls/y2
 AOJxBsrNHqY8GjVJtLdsqpCc9aaHIkaQIVTf82UF7LG+k7DNjBh+7t3eT
 hjgQHq+CBFudEZTU3nPHdgUna75dU5cmh0sXGJbRrVSGqaSaj89SgdkQK
 IOEv70PoAlNWmgU2XzZGmA1ai9bN077vgbu0eoV9Ui8txu+fvRlWHpgFT
 IzXBq2aj7E4M2hRcOCfFI/4hQb4ktBgpw+p963unimevyvugzYBQSUyGz
 yS8yJrVsbI9gREFXfmk0u037qp19vPN0myp4d0xpVHaNP52y1xhuKk9uR w==;
X-CSE-ConnectionGUID: 0NslO9sFT2Gf3+98YleXgQ==
X-CSE-MsgGUID: nsetM7r0RZWR61pBcoiX3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68445955"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68445955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:11 -0700
X-CSE-ConnectionGUID: XVcjbe0NQOCMe3E2eRwpxA==
X-CSE-MsgGUID: 2xH/qakARPuYFGpQCnkvng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043669"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 00/29] PREFETCH and MADVISE for SVM ranges
Date: Fri, 14 Mar 2025 13:31:57 +0530
Message-Id: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Prefetching: Uses the existing ioctl vm_bind and ensures pages are
populated in the requested region and PTEs are updated, preventing GPU
page faults.

Region 0: Ranges remain in SMEM with only PTE updates.
Region 1: Ranges migrate to VRAM with corresponding PTE updates.
Madvise Ioctl:

Provides a user API to assign attributes like pat_index, atomic
operation type, and preferred location for SVM ranges.
The Kernel Mode Driver (KMD) may split existing VMAs to cover input
ranges, assign user-provided attributes, and invalidate existing PTEs so
that the next page fault/prefetch can use the new attributes.
The RFC for PREFETCH [1-12] was previously sent separately
https://lore.kernel.org/intel-xe/20250310124341.1819568-1-himal.prasad.ghimiray@intel.com/T/#t

This series includes prefetch patches as a baseline for madvise patches,
with future versions to be sent as a single series.

Himal Prasad Ghimiray (29):
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
  drm/xe/svm: Allow unaligned addresses and ranges for prefetch
  drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
  drm/xe/svm: Implement prefetch support for SVM ranges
  drm/xe/vm: Add debug prints for SVM range prefetch
  drm/gpuvm: Introduce MADVISE Operations
  drm/xe/uapi: Add madvise interface
  drm/xe/vm: Add attributes struct as member of vma
  drm/xe/vma: Move pat_index to vma attributes
  drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
    parameter
  drm/gpusvm: Make drm_gpusvm_for_each_* macros public
  drm/xe/svm: Split system allocator vma incase of madvise call
  drm/xe: Implement madvise ioctl for xe
  drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
    madvise
  drm/xe/svm : Add svm ranges migration policy on atomic access
  drm/xe/madvise: Update migration policy based on preferred location
  drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
  drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
  drm/xe/svm: Consult madvise preferred location in prefetch
  drm/xe/uapi: Add uapi for vma count and mem attributes
  drm/xe/bo: Add attributes field to xe_bo
  drm/xe/bo : Update atomic_access attribute on madvise

 drivers/gpu/drm/drm_gpusvm.c         |  89 +----
 drivers/gpu/drm/drm_gpuvm.c          | 175 +++++++++-
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  21 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   5 +
 drivers/gpu/drm/xe/xe_device.c       |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +-
 drivers/gpu/drm/xe/xe_pt.c           |  86 +++--
 drivers/gpu/drm/xe/xe_svm.c          | 215 +++++++++---
 drivers/gpu/drm/xe/xe_svm.h          |  96 ++++++
 drivers/gpu/drm/xe/xe_vm.c           | 497 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 375 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h   |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  43 ++-
 include/drm/drm_gpusvm.h             |  96 +++++-
 include/drm/drm_gpuvm.h              |   6 +
 include/uapi/drm/xe_drm.h            | 213 ++++++++++++
 18 files changed, 1748 insertions(+), 223 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

