Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF5C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD4C10E435;
	Tue, 29 Apr 2025 10:37:16 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49F910E43C;
 Tue, 29 Apr 2025 10:37:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 10:37:14 -0000
Message-ID: <174592303493.24023.6987366512400435581@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges (rev4)
URL   : https://patchwork.freedesktop.org/series/146079/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e37b9a35997d3961917e60ca36428167d9f2210
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Apr 29 16:12:33 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c0d5f348399e840ebd39d6d5894e9280cfae49ef drm-intel
707869ed480d drm/gpusvm: Introduce devmem_only flag for allocation
5e9e7e1c3720 drm/xe: Strict migration policy for atomic SVM faults
-:66: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#66: FILE: drivers/gpu/drm/xe/xe_svm.c:657:
+	return ((range->tile_present & ~range->tile_invalidated) & BIT(tile->id))
+		&& (!devmem_only || range->base.flags.migrate_devmem);

total: 0 errors, 0 warnings, 1 checks, 166 lines checked
a1c6385a758e drm/gpusvm: Add timeslicing support to GPU SVM
7f15e1514253 drm/xe: Timeslice GPU on atomic SVM fault
87e1ecd54f22 drm/xe: Add atomic_svm_timeslice_ms debugfs entry
311fd64f82f0 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
a04f401397d5 drm/xe: Make xe_svm_alloc_vram public
1d150328f42d drm/xe/svm: Helper to add tile masks to svm ranges
60c885278fbd drm/xe/svm: Make to_xe_range a public function
cbd08733363a drm/xe/svm: Make xe_svm_range_* end/start/size public
f2fb539ec53f drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
fb14f4d1fee6 drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
ebd2390d281d drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
8695928ad5fe drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
32776cc1ec7e drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
ca178da52e0a drm/xe/svm: Add xe_svm_range_validate_and_evict() function
dd993c5e8aa8 drm/gpusvm: Introduce drm_gpusvm_range_find_or_insert_start() function
9414f1d1013d drm/xe/svm: Add xe_svm_range_find_or_insert_start()
169a9b211729 drm/xe/svm: Implement prefetch support for SVM ranges
5e37b9a35997 drm/xe/vm: Add debug prints for SVM range prefetch


