Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B9BC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACEF10E169;
	Tue, 27 May 2025 16:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DL0UL1ch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C1510E154
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362518; x=1779898518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dsYje/Xhywsiwqg3JIye5iR5vnu6QSfgHRQBgBuarmg=;
 b=DL0UL1chy8Use4WwowPQIOZtRIxMUf1n5fjlQwJyLB0iRG2759eZD6KC
 eFPh3GJAHgpdaHvojruVULPT5CsSYhe9ZhopGBgGDWEmJgtjFwmO/YMb/
 V6DV+/XvVBKt911/XF54k+GsEIUlTCY3Mv6IzF392MYRHKbnSOBIA1PjC
 SDhBj762jn9p5/KozoRDSfP1nP/uyshwuq360giGJivHu9/hFujEp2pE/
 HOl2CPNQ/uqCstx9grR3w2yGzouCo5EopbrMsixc3WYXIZfFmlpWm/spz
 CyZjRgDoV0LB1pcFYncD3e+0L9Rg28W6B9jygXwxfLdu30aO38iFEkc/M A==;
X-CSE-ConnectionGUID: YHG1S9J0Rw6BMpL834NWJw==
X-CSE-MsgGUID: hXYqQ3NrQ3msTYVWoLZNWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471842"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:20 -0700
X-CSE-ConnectionGUID: J/47hSE+QxyGUqryV9TcIg==
X-CSE-MsgGUID: Zl5N9wADRuWIV50eYDtRTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147645896"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 00/19] MADVISE FOR XE
Date: Tue, 27 May 2025 22:09:44 +0530
Message-Id: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Provides a user API to assign attributes like pat_index, atomic
operation type, and preferred location for SVM ranges.
The Kernel Mode Driver (KMD) may split existing VMAs to cover input
ranges, assign user-provided attributes, and invalidate existing PTEs so
that the next page fault/prefetch can use the new attributes.

Himal Prasad Ghimiray (19):
  Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
  drm/xe/uapi: Add madvise interface
  drm/xe/vm: Add attributes struct as member of vma
  drm/xe/vma: Move pat_index to vma attributes
  drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
    parameter
  drm/gpusvm: Make drm_gpusvm_for_each_* macros public
  drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()
  drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
  drm/xe/svm: Split system allocator vma incase of madvise call
  drm/xe: Implement madvise ioctl for xe
  drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
    madvise
  drm/xe/svm : Add svm ranges migration policy on atomic access
  drm/xe/madvise: Update migration policy based on preferred location
  drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
  drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
  drm/xe/svm: Consult madvise preferred location in prefetch
  drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
  drm/xe/bo: Add attributes field to xe_bo
  drm/xe/bo: Update atomic_access attribute on madvise

 drivers/gpu/drm/drm_gpusvm.c           | 122 ++------
 drivers/gpu/drm/drm_gpuvm.c            |  93 ++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |   1 +
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  21 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   5 +
 drivers/gpu/drm/xe/xe_device.c         |   3 +
 drivers/gpu/drm/xe/xe_pt.c             |  11 +-
 drivers/gpu/drm/xe/xe_svm.c            | 165 +++++++---
 drivers/gpu/drm/xe/xe_svm.h            |  30 ++
 drivers/gpu/drm/xe/xe_vm.c             | 402 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h             |  12 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 330 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  28 +-
 include/drm/drm_gpusvm.h               |  70 +++++
 include/drm/drm_gpuvm.h                |  25 +-
 include/uapi/drm/xe_drm.h              | 183 +++++++++++
 18 files changed, 1293 insertions(+), 224 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

