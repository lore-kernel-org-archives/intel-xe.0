Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83B5C5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF8E10E1EA;
	Wed, 28 May 2025 07:45:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373CF10E1EA;
 Wed, 28 May 2025 07:45:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_MADVISE_FOR_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 07:45:02 -0000
Message-ID: <174841830220.26954.3006211504280109901@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Series: MADVISE FOR XE
URL   : https://patchwork.freedesktop.org/series/149550/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 07b6736f75df drm-tip: 2025y-05m-27d-20h-13m-12s UTC integration manifest
=== git am output follows ===
Applying: Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
Applying: drm/xe/uapi: Add madvise interface
Applying: drm/xe/vm: Add attributes struct as member of vma
Applying: drm/xe/vma: Move pat_index to vma attributes
Applying: drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
Applying: drm/gpusvm: Make drm_gpusvm_for_each_* macros public
Applying: drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()
Applying: drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
Applying: drm/xe/svm: Split system allocator vma incase of madvise call
Applying: drm/xe: Implement madvise ioctl for xe
Applying: drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
Applying: drm/xe/svm : Add svm ranges migration policy on atomic access
Applying: drm/xe/madvise: Update migration policy based on preferred location
Applying: drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
Applying: drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
Applying: drm/xe/svm: Consult madvise preferred location in prefetch
Applying: drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
Applying: drm/xe/bo: Add attributes field to xe_bo
Applying: drm/xe/bo: Update atomic_access attribute on madvise


