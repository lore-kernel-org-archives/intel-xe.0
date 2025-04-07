Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5612C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2BE10E3DE;
	Mon,  7 Apr 2025 09:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlDioula";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648AC10E3DE
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019564; x=1775555564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uZH3xeIxAeUuG96RmLRUlpB1rci/0U4PF9+oP7OT9aI=;
 b=XlDioulaZehwSDDduM9rP74F4VBqgo0fb7eyCwnCvbZocIRkcbd8dgXW
 YPOI1FnHZAsLny7LNRVHYFxGpsH+EnlC+H8hgd7xYFTeEeExGWv4rEyNc
 KDwC8kCmOSH7QZFBoA31OtGVXmjY/+YeFb7pXkMreqQv/sHTfQW4xVQN4
 YFGiCFAP3vWquvZ8ytgX9gI/jrYqxabBE4qDwghneuVJcGJaLgvIMePtD
 XxDlY2cQPHl0WWhfB6kgJCngpnnf7kFYpOg+lWeOP3okp3egbDIpea33m
 Nc2gVDCuaySTCGRZ9STU9Ye9rtHreHg/aL5Lrc0/WVS1+hz12nx96gsEH Q==;
X-CSE-ConnectionGUID: gnnOFuuWR2aLKRSM35i16A==
X-CSE-MsgGUID: Nl/bJNo7SUincaawqSwaJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029354"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:52:44 -0700
X-CSE-ConnectionGUID: ki6VzZk4SIe4ahgvCOgQOQ==
X-CSE-MsgGUID: 45HksUl3SB69hPvUwT76NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778519"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:52:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 00/32] PREFETCH and MADVISE for SVM ranges
Date: Mon,  7 Apr 2025 15:46:47 +0530
Message-Id: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Region 0: Ranges remain in SMEM with only PTE updates.
Region 1: Ranges migrate to VRAM with corresponding PTE updates.
Madvise Ioctl:

Provides a user API to assign attributes like pat_index, atomic
operation type, and preferred location for SVM ranges.
The Kernel Mode Driver (KMD) may split existing VMAs to cover input
ranges, assign user-provided attributes, and invalidate existing PTEs so
that the next page fault/prefetch can use the new attributes.

v2
- Address comments from Matt B
- Add atomic handling
- Rebase 


Himal Prasad Ghimiray (32):
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
  drm/xe/svm: Add function to determine if range needs VRAM migration
  drm/gpusvm: Introduce vram_only flag for VRAM allocation
  drm/xe/svm: Incase of atomic access ensure get_pages happens from vram
  drm/xe/svm: Implement prefetch support for SVM ranges
  drm/xe/vm: Add debug prints for SVM range prefetch
  Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
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
  drm/xe/bo: Update atomic_access attribute on madvise

 drivers/gpu/drm/drm_gpusvm.c           |  94 +----
 drivers/gpu/drm/drm_gpuvm.c            |  93 ++++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |   1 +
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  21 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   5 +
 drivers/gpu/drm/xe/xe_device.c         |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |  24 +-
 drivers/gpu/drm/xe/xe_pt.c             |  91 +++--
 drivers/gpu/drm/xe/xe_svm.c            | 240 +++++++++---
 drivers/gpu/drm/xe/xe_svm.h            | 128 ++++++
 drivers/gpu/drm/xe/xe_vm.c             | 518 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h             |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 375 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  43 +-
 include/drm/drm_gpusvm.h               |  98 ++++-
 include/drm/drm_gpuvm.h                |  25 +-
 include/uapi/drm/xe_drm.h              | 213 ++++++++++
 19 files changed, 1745 insertions(+), 254 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

