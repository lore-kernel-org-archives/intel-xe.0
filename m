Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309BFC36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 07:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF1C10E3C3;
	Mon, 28 Apr 2025 07:42:43 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B01A10E3C3;
 Mon, 28 Apr 2025 07:42:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 07:42:43 -0000
Message-ID: <174582616337.18524.9961316364212372668@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges (rev2)
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
commit 11a4d549fd2887a5833c96b50443f09c36fea76f
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Apr 28 13:18:29 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3169be72c46a44190c6bb7dcf3a0b80986809319 drm-intel
9588a13f1d7e drm/gpusvm: Introduce devmem_only flag for allocation
d2836e19a08c drm/xe: Strict migration policy for atomic SVM faults
-:66: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#66: FILE: drivers/gpu/drm/xe/xe_svm.c:657:
+	return ((range->tile_present & ~range->tile_invalidated) & BIT(tile->id))
+		&& (!devmem_only || range->base.flags.migrate_devmem);

total: 0 errors, 0 warnings, 1 checks, 166 lines checked
4968ac817713 drm/gpusvm: Add timeslicing support to GPU SVM
363dc6ff6026 drm/xe: Timeslice GPU on atomic SVM fault
a24573db9836 drm/xe: Add atomic_svm_timeslice_ms debugfs entry
b4cbcbdb0691 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
2dd2c4dc60a4 drm/xe: Make xe_svm_alloc_vram public
0c4012b6981b drm/xe/svm: Helper to add tile masks to svm ranges
e975ec317644 drm/xe/svm: Make to_xe_range a public function
348516e02245 drm/xe/svm: Make xe_svm_range_* end/start/size public
074e616cab70 drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
8d7dfe0bcc29 drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
eea5078675b7 drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
ca25d490653b drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
c9a5b64a49d3 drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
ee52d409c185 drm/xe/svm: Add xe_svm_range_validate_and_evict() function
4b5fd1c44590 drm/xe/svm: Implement prefetch support for SVM ranges
11a4d549fd28 drm/xe/vm: Add debug prints for SVM range prefetch


