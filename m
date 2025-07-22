Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CF5C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F5810E30C;
	Tue, 22 Jul 2025 13:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ik3huMIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51DB10E678
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189722; x=1784725722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A5k+HEYpOUMmVTKFrpUzFdbCGdMrgdhKnrk1p5L9g5c=;
 b=ik3huMIEhZOY0m783o+eA5wV42h0YGaokuMdMjrJsYiSM1RgCckGHL+q
 FzvXW/PubdT+q8sZ04B4ugHO49PHeOdJdX0CroQ67872xEAKdFfjLHoZL
 Z+yAESyo1NqP8QsaGTX+pKqVKnvKPuKQllFISMuUQ/bC5IDSg2WwB0dgn
 5ipRelfUMLrgkS2lr87XywIEKFufH+N/EqzyQ/XMQHsTr1Dkp4SOPnXdQ
 KLMDTL50iQckzv/iICQRKR6B9KXTx6N1ca1qywAxRE/skyakcH7hXdRHc
 CITgzpc4paqSkPUmBPcyDP2gbIPO9KnrmkUMTwGkLPGgRt5ep1+ZeeHym w==;
X-CSE-ConnectionGUID: 1bwzkGkKSLaDflgMTcJ9nQ==
X-CSE-MsgGUID: hHYBS8i5RNu2gfiAyMQxvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530335"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:08:41 -0700
X-CSE-ConnectionGUID: r6oUCpSGSOq635zmSkaJ5Q==
X-CSE-MsgGUID: OXWf56j7T8KErLIHzTrkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420447"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:08:40 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 00/23] MADVISE FOR XE
Date: Tue, 22 Jul 2025 19:05:03 +0530
Message-Id: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

Provides a user API to assign attributes like pat_index, atomic
operation type, and preferred location for SVM ranges.
The Kernel Mode Driver (KMD) may split existing VMAs to cover input
ranges, assign user-provided attributes, and invalidate existing PTEs so
that the next page fault/prefetch can use the new attributes.

-v5
Restore attributes to default after free from userspace
Add defragment worker to merge cpu mirror vma with default attributes
Avoid using VMA in uapi
address review comments

-v4:
fix atomic policies
fix attribute copy
address review comments

Himal Prasad Ghimiray (23):
  Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
  drm/xe/uapi: Add madvise interface
  drm/xe/vm: Add attributes struct as member of vma
  drm/xe/vma: Move pat_index to vma attributes
  drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
    parameter
  drm/gpusvm: Make drm_gpusvm_for_each_* macros public
  drm/xe/svm: Split system allocator vma incase of madvise call
  drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
    madvise
  drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
  drm/xe: Implement madvise ioctl for xe
  drm/xe/svm : Add svm ranges migration policy on atomic access
  drm/xe/madvise: Update migration policy based on preferred location
  drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
  drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
  drm/xe/svm: Consult madvise preferred location in prefetch
  drm/xe/bo: Add attributes field to xe_bo
  drm/xe/bo: Update atomic_access attribute on madvise
  drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
  drm/xe/vm: Add helper to check for default VMA memory attributes
  drm/xe: Reset VMA attributes to default in SVM garbage collector
  drm/xe/vm: Add a delayed worker to merge fragmented vmas
  drm/xe: Enable madvise ioctl for xe
  drm/xe/uapi: Add UAPI for querying VMA count and memory attributes

 drivers/gpu/drm/drm_gpusvm.c           | 122 ++----
 drivers/gpu/drm/drm_gpuvm.c            |  93 ++++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |   1 +
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  29 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
 drivers/gpu/drm/xe/xe_device.c         |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |   2 +-
 drivers/gpu/drm/xe/xe_pt.c             |  39 +-
 drivers/gpu/drm/xe/xe_svm.c            | 154 +++++++-
 drivers/gpu/drm/xe/xe_svm.h            |  22 ++
 drivers/gpu/drm/xe/xe_tile.h           |  18 +
 drivers/gpu/drm/xe/xe_vm.c             | 518 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h             |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 431 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  65 +++-
 include/drm/drm_gpusvm.h               |  70 ++++
 include/drm/drm_gpuvm.h                |  25 +-
 include/uapi/drm/xe_drm.h              | 273 +++++++++++++
 20 files changed, 1743 insertions(+), 157 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

