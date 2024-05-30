Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7CEC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472B210E2C9;
	Thu, 30 May 2024 00:50:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6B010E2C9;
 Thu, 30 May 2024 00:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2Cv3=2C01/26=5D_mm/hmm=3A_let_users_to_tag_specific_PFNs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 00:50:28 -0000
Message-ID: <171703022897.2236029.623845529041023990@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530004732.84898-1-oak.zeng@intel.com>
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
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

Series: series starting with [CI,v3,01/26] mm/hmm: let users to tag specific PFNs
URL   : https://patchwork.freedesktop.org/series/134215/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 55d6179b96e0 drm-tip: 2024y-05m-29d-17h-29m-17s UTC integration manifest
=== git am output follows ===
Applying: mm/hmm: let users to tag specific PFNs
Applying: dma-mapping: provide an interface to allocate IOVA
Applying: dma-mapping: provide callbacks to link/unlink pages to specific IOVA
Applying: iommu/dma: Provide an interface to allow preallocate IOVA
Applying: iommu/dma: Prepare map/unmap page functions to receive IOVA
Applying: iommu/dma: Implement link/unlink page callbacks
Applying: drm: move xe_sg_segment_size to drm layer
Applying: drm: Move GPUVA_START/LAST to drm_gpuvm.h
Applying: drm/svm: add a mm field to drm_gpuvm struct
Applying: drm/svm: introduce drm_mem_region concept
Applying: drm/svm: introduce hmmptr and helper functions
Applying: drm/svm: Introduce helper to remap drm memory region
Applying: drm/svm: handle CPU page fault
Applying: drm/svm: Migrate a range of hmmptr to vram
Applying: drm/svm: Add DRM SVM documentation
Applying: drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Applying: drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Applying: drm/xe: Convert multiple bind ops into single job
Applying: drm/xe: Update VM trace events
Applying: drm/xe: Update PT layer with better error handling
Applying: drm/xe: Retry BO allocation
Applying: drm/xe: Rework GPU page fault handling
Applying: drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag
Applying: drm/xe: Add dma_addr res cursor
Applying: drm/xe: Use drm_mem_region for xe
Applying: drm/xe: use drm_hmmptr in xe


