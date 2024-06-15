Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8999C27C6E
	for <intel-xe@archiver.kernel.org>; Sat, 15 Jun 2024 02:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387D010E2C6;
	Sat, 15 Jun 2024 02:56:20 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225C10E2C6;
 Sat, 15 Jun 2024 02:56:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2C01/44=5D_mm/hmm=3A_let_users_to_tag_specific_PFNs_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Jun 2024 02:56:19 -0000
Message-ID: <171842017900.95803.14915307867520886693@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614215817.1097633-1-oak.zeng@intel.com>
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,01/44] mm/hmm: let users to tag specific PFNs (rev2)
URL   : https://patchwork.freedesktop.org/series/134917/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e60c2c927983 drm-tip: 2024y-06m-14d-21h-52m-42s UTC integration manifest
=== git am output follows ===
Applying: mm/hmm: let users to tag specific PFNs
Applying: dma-mapping: provide an interface to allocate IOVA
Applying: dma-mapping: provide callbacks to link/unlink pages to specific IOVA
Applying: iommu/dma: Provide an interface to allow preallocate IOVA
Applying: iommu/dma: Prepare map/unmap page functions to receive IOVA
Applying: iommu/dma: Implement link/unlink page callbacks
Applying: mm: Add an empty implementation of zone_device_page_init
Applying: drm: Move GPUVA_START/LAST to drm_gpuvm.h
Applying: drm/svm: Mark drm_gpuvm to participate SVM
Applying: drm/svm: introduce drm_mem_region concept
Applying: drm/svm: introduce hmmptr and helper functions
Applying: drm/svm: Introduce helper to remap drm memory region
Applying: drm/svm: handle CPU page fault
Applying: drm/svm: Migrate a range of hmmptr to vram
Applying: drm/svm: Add DRM SVM documentation
Applying: drm/svm: Introduce DRM_SVM kernel config
Applying: drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Applying: drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Applying: drm/xe: Convert multiple bind ops into single job
Applying: drm/xe: Update VM trace events
Applying: drm/xe: Update PT layer with better error handling
Applying: drm/xe: Retry BO allocation
Applying: drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag
Applying: drm/xe: Add a helper to calculate userptr end address
Applying: drm/xe: Add dma_addr res cursor
Applying: drm/xe: Use drm_mem_region for xe
Applying: drm/xe: use drm_hmmptr in xe
Applying: drm/xe: Moving to range based vma invalidation
Applying: drm/xe: Support range based page table update
Applying: drm/xe/uapi: Add DRM_XE_VM_CREATE_FLAG_PARTICIPATE_SVM flag
Applying: drm/xe/svm: Create userptr if page fault occurs on system_allocator VMA
Applying: drm/xe/svm: Add faulted userptr VMA garbage collector
Applying: drm/xe: Introduce helper to get tile from memory region
Applying: drm/xe/svm: implement functions to allocate and free device memory
Applying: drm/xe/svm: Get drm device from drm memory region
Applying: drm/xe/svm: Get page map owner of a memory region
Applying: drm/xe/svm: Add migrate layer functions for SVM support
Applying: drm/xe/svm: introduce svm migration function
Applying: drm/xe/svm: Register xe memory region to drm layer
Applying: drm/xe/svm: Introduce DRM_XE_SVM kernel config
Applying: drm/xe/svm: Migration from sram to vram for system allocator
Applying: drm/xe/svm: Determine a vma is backed by device memory
Applying: drm/xe/svm: Introduce hmm_pfn array based resource cursor
Applying: drm/xe: Enable system allocator uAPI


