Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC46CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E9D10E2A4;
	Thu, 21 Aug 2025 17:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReuWc6z5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4702810E2A4
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795833; x=1787331833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lrZNFCAR5HIFprIv9tAPIyRJmkzox93JOcKIUlKxHg0=;
 b=ReuWc6z5f9Chhb80NOo8zk0zSwb2G51yT8OOYdfEPkwqfjEf5mwgUftV
 fbi+EPagKYHTFz4SADPvAFiFJAtmh8rjygiRC/2CL4AoF4O7eUAmNvzzP
 krkQ3pcj6xN+qfaykqZyFhoMYOHsfehE8WMs/sOE5GtmFXlTYF/fgQrqm
 6Lb0ypxkBI4SfdvhemVvK50zlElYe33cWgjY+kfKAzEiFG6z2mSjtl9So
 NVnMCibLTFqroAP4sc4wutJL3izQE2t1tPtCmQNRATEsJ0E9hVz833GZC
 JXljyuskq52UoSa2eTMTGKilop7y4A45mosGDrtQNrYOlCRJChdTPA7AX w==;
X-CSE-ConnectionGUID: UECUsjm7RQKzj2a3qYbqmA==
X-CSE-MsgGUID: K2E4ORApT/KQ1N1uGZ84oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57805820"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57805820"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:03:46 -0700
X-CSE-ConnectionGUID: eHUSfGQSTweNQKY8zT5k+Q==
X-CSE-MsgGUID: DlKKw4tTRWu2kWVVCFLMzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192143633"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 10:03:45 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v9 00/20] MADVISE FOR XE
Date: Thu, 21 Aug 2025 23:00:44 +0530
Message-Id: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
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

Tested-with: https://github.com/intel/compute-runtime/pull/845

-v10
Xe specific patches only

-v9
Nits

-v8
Define new function in gpuvm for madvise
Fix tile check in ops_create

-v7
Change gpuvm layering on gpuvm_map_req struct
Fix EAGAIN return on garbage collector splitting vma

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

Himal Prasad Ghimiray (20):
  drm/xe/uapi: Add madvise interface
  drm/xe/vm: Add attributes struct as member of vma
  drm/xe/vma: Move pat_index to vma attributes
  drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
    parameter
  drm/xe/svm: Split system allocator vma incase of madvise call
  drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
    madvise
  drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
  drm/xe: Implement madvise ioctl for xe
  drm/xe/svm: Add svm ranges migration policy on atomic access
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

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  29 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   8 +
 drivers/gpu/drm/xe/xe_device.c       |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  35 +--
 drivers/gpu/drm/xe/xe_pt.c           |  39 ++-
 drivers/gpu/drm/xe/xe_svm.c          | 254 +++++++++++++--
 drivers/gpu/drm/xe/xe_svm.h          |  23 ++
 drivers/gpu/drm/xe/xe_vm.c           | 425 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 445 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h   |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  57 +++-
 include/uapi/drm/xe_drm.h            | 275 +++++++++++++++++
 14 files changed, 1530 insertions(+), 90 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

