Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59BFC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6763B10E1F7;
	Fri, 13 Jun 2025 12:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcubL3gR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727FB10E1F7
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817798; x=1781353798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t/Sgrt2TOrK8D3vUPc9yT6bjwLMZisezM4QpyhSEqng=;
 b=KcubL3gR6I7y40KSf3TdHk7amwSWy7uqC4RinghbOQT8opEqufKvNTgX
 VBiz89eYU0g141mqSrHX6gSid9PYxa7wGoEEq0UN4y6VN8RLnvGMHieDZ
 AFiOWIL7LQzqC+4/I0xnDY5dDu048AFV0yXFNX/2Al9lUyhLKbQPftl7d
 gEWKi8y1dMea9bnYVquNFT7FajwpLK5oXDhhn2p32NoLwpMFLd4tRt7iF
 3vhkMCz6NxSAGfTeuEiTQQOPBAltFgCqz26KZ7/VjIT0FUjWbUwBRZmsS
 lBgO7ijuRd0+IacMcb3epzwoZQ7rTOPoGE1eRpjf7kSbxSxqcy2aqbRU3 Q==;
X-CSE-ConnectionGUID: XcIwol3+Sfqy2G8qv+bLNw==
X-CSE-MsgGUID: TMHvy7cYRlG2IXgq5U9FLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610129"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:29:58 -0700
X-CSE-ConnectionGUID: 1ZaT8reISLC5CjQxI6i/EA==
X-CSE-MsgGUID: RaUIM4dEQdiIFJ1/Wxnt7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290254"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:29:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 00/20] MADVISE FOR XE
Date: Fri, 13 Jun 2025 18:25:38 +0530
Message-Id: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

-v4:
fix atomic policies
fix attribute copy
address review comments

Himal Prasad Ghimiray (20):
  Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
  drm/xe/uapi: Add madvise interface
  drm/xe/vm: Add attributes struct as member of vma
  drm/xe/vma: Move pat_index to vma attributes
  drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
    parameter
  drm/gpusvm: Make drm_gpusvm_for_each_* macros public
  drm/xe/svm: Split system allocator vma incase of madvise call
  drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
  drm/xe: Implement madvise ioctl for xe
  drm/xe/vm: Add an identifier for madvise in xe_vma_ops
  drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
    madvise
  drm/xe/svm : Add svm ranges migration policy on atomic access
  drm/xe/madvise: Update migration policy based on preferred location
  drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
  drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
  drm/xe/svm: Consult madvise preferred location in prefetch
  drm/xe/bo: Add attributes field to xe_bo
  drm/xe/bo: Update atomic_access attribute on madvise
  drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
  drm/xe/madvise: Skip vma invalidation if mem attr are unchanged

 drivers/gpu/drm/drm_gpusvm.c           | 122 ++------
 drivers/gpu/drm/drm_gpuvm.c            |  93 ++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |   1 +
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  21 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
 drivers/gpu/drm/xe/xe_device.c         |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |   2 +-
 drivers/gpu/drm/xe/xe_pt.c             |  25 +-
 drivers/gpu/drm/xe/xe_svm.c            | 110 ++++++-
 drivers/gpu/drm/xe/xe_svm.h            |  22 ++
 drivers/gpu/drm/xe/xe_tile.h           |  18 ++
 drivers/gpu/drm/xe/xe_vm.c             | 295 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h             |   6 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 389 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  38 ++-
 include/drm/drm_gpusvm.h               |  70 +++++
 include/drm/drm_gpuvm.h                |  25 +-
 include/uapi/drm/xe_drm.h              | 253 ++++++++++++++++
 20 files changed, 1368 insertions(+), 149 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

