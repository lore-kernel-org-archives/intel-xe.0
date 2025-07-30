Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5ADC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AC010E207;
	Wed, 30 Jul 2025 12:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHeMNjso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDB210E207
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878837; x=1785414837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kaPkNtekliqI4G79TStXBobosBT/xVI6iu2buGuZGng=;
 b=SHeMNjsoPXeqt5gsQKuRe0GuFeki8LdzW8PyNArTItX873CfrB92KXum
 xMM+XJoyZBR+ShKgkruFeJpHMD7IZ5EK4o2VF7RvHLvDwWlmhQKqR66KW
 CfQmMBzSzEIgSoapUJvE9IXmIPq775CvH0i62F52QAZ0gJlH8/X9Ewyqn
 gL7mCUtIP9BlOCN0jQ7ki/joFPiwJ0jIdji4ZwxXkl8O3HvizVG3gql6q
 7O+0nj4U9jmlhZkPEkij/OuO+3WOe2rbybDqg6hf/6/iKj11zfjU+1L24
 vtVFUWiopIh5lnKvNxvJcmnZPcSemLiZt1G86Ha8PLmQBZhFRr+iFIZmq g==;
X-CSE-ConnectionGUID: VtSoSdxfRqiu/EIOGP6uOQ==
X-CSE-MsgGUID: fbt+ut7gSqSc1yybKqtHMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450099"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:33:57 -0700
X-CSE-ConnectionGUID: 9zRnW8lNSp2WZ6NbuKDP9g==
X-CSE-MsgGUID: yFrxIQ6KS8WgCVC9CNdPsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649414"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:33:55 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 00/25] MADVISE FOR XE
Date: Wed, 30 Jul 2025 18:30:25 +0530
Message-Id: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

-v6
Rebase on gpuvm patches
Address review comments

-v5
Restore attributes to default after free from userspace
Add defragment worker to merge cpu mirror vma with default attributes
Avoid using VMA in uapi
address review comments

-v4:
fix atomic policies
fix attribute copy
address review comments

Provides a user API to assign attributes like pat_index, atomic
operation type, and preferred location for SVM ranges.
The Kernel Mode Driver (KMD) may split existing VMAs to cover input
ranges, assign user-provided attributes, and invalidate existing PTEs so
that the next page fault/prefetch can use the new attributes.

Boris Brezillon (2):
  drm/gpuvm: Pass map arguments through a struct
  drm/gpuvm: Kill drm_gpuva_init()

Himal Prasad Ghimiray (23):
  drm/gpuvm: Support flags in drm_gpuva_op_map
  drm/gpuvm: Introduce DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
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
  drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
  drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
  drm/xe/svm: Consult madvise preferred location in prefetch
  drm/xe/bo: Add attributes field to xe_bo
  drm/xe/bo: Update atomic_access attribute on madvise
  drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
  drm/xe/vm: Add helper to check for default VMA memory attributes
  drm/xe: Reset VMA attributes to default in SVM garbage collector
  drm/xe: Enable madvise ioctl for xe
  drm/xe/uapi: Add UAPI for querying VMA count and memory attributes

 drivers/gpu/drm/drm_gpusvm.c           | 122 ++-----
 drivers/gpu/drm/drm_gpuvm.c            | 191 ++++++-----
 drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  33 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  13 +-
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  29 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
 drivers/gpu/drm/xe/xe_device.c         |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |  35 +-
 drivers/gpu/drm/xe/xe_pt.c             |  39 ++-
 drivers/gpu/drm/xe/xe_svm.c            | 238 ++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h            |  23 ++
 drivers/gpu/drm/xe/xe_vm.c             | 419 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h             |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 449 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  50 ++-
 include/drm/drm_gpusvm.h               |  70 ++++
 include/drm/drm_gpuvm.h                |  47 ++-
 include/uapi/drm/xe_drm.h              | 274 +++++++++++++++
 22 files changed, 1812 insertions(+), 284 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

