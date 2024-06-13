Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4006EC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C2C10E048;
	Thu, 13 Jun 2024 04:20:35 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A65210E048;
 Thu, 13 Jun 2024 04:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2C01/42=5D_mm/hmm=3A_let_users_to_tag_specific_PFNs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 04:20:34 -0000
Message-ID: <171825243443.72831.4866995480429620228@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613042429.637281-1-oak.zeng@intel.com>
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
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

Series: series starting with [CI,01/42] mm/hmm: let users to tag specific PFNs
URL   : https://patchwork.freedesktop.org/series/134798/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 19bd824e89ec drm-tip: 2024y-06m-13d-04h-13m-41s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_trace.h:426
error: drivers/gpu/drm/xe/xe_trace.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: mm/hmm: let users to tag specific PFNs
Applying: dma-mapping: provide an interface to allocate IOVA
Applying: dma-mapping: provide callbacks to link/unlink pages to specific IOVA
Applying: iommu/dma: Provide an interface to allow preallocate IOVA
Applying: iommu/dma: Prepare map/unmap page functions to receive IOVA
Applying: iommu/dma: Implement link/unlink page callbacks
Applying: drm: Move GPUVA_START/LAST to drm_gpuvm.h
Applying: drm/svm: Mark drm_gpuvm to participate SVM
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
Patch failed at 0018 drm/xe: Update VM trace events
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


