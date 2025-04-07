Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A985DC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 14:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A9E10E480;
	Mon,  7 Apr 2025 14:07:23 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A8B10E480;
 Mon,  7 Apr 2025 14:07:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PREFETCH_and_MADVISE?=
 =?utf-8?q?_for_SVM_ranges_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 14:07:22 -0000
Message-ID: <174403484220.43714.18037971002616163088@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Series: PREFETCH and MADVISE for SVM ranges (rev3)
URL   : https://patchwork.freedesktop.org/series/146290/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 100ba24787e8 drm-tip: 2025y-04m-07d-13h-47m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
Applying: drm/xe: Make xe_svm_alloc_vram public
Applying: drm/xe/svm: Helper to add tile masks to svm ranges
Applying: drm/xe/svm: Make to_xe_range a public function
Applying: drm/xe/svm: Make xe_svm_range_* end/start/size public
Applying: drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
Applying: drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
Applying: drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
Applying: drm/xe/svm: Allow unaligned addresses and ranges for prefetch
Applying: drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
Applying: drm/xe/svm: Add function to determine if range needs VRAM migration
Applying: drm/gpusvm: Introduce vram_only flag for VRAM allocation
Applying: drm/xe/svm: Incase of atomic access ensure get_pages happens from vram
Applying: drm/xe/svm: Implement prefetch support for SVM ranges
Applying: drm/xe/vm: Add debug prints for SVM range prefetch
Applying: Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
Applying: drm/xe/uapi: Add madvise interface
Applying: drm/xe/vm: Add attributes struct as member of vma
Applying: drm/xe/vma: Move pat_index to vma attributes
Applying: drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
Applying: drm/gpusvm: Make drm_gpusvm_for_each_* macros public
Applying: drm/xe/svm: Split system allocator vma incase of madvise call
Applying: drm/xe: Implement madvise ioctl for xe
Applying: drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
Applying: drm/xe/svm : Add svm ranges migration policy on atomic access
Applying: drm/xe/madvise: Update migration policy based on preferred location
Applying: drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
Applying: drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
Applying: drm/xe/svm: Consult madvise preferred location in prefetch
Applying: drm/xe/uapi: Add uapi for vma count and mem attributes
Applying: drm/xe/bo: Add attributes field to xe_bo
Applying: drm/xe/bo: Update atomic_access attribute on madvise


