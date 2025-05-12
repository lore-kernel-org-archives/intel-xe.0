Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09A3C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 17:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857A610E461;
	Mon, 12 May 2025 17:00:55 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2793310E461;
 Mon, 12 May 2025 17:00:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 17:00:54 -0000
Message-ID: <174706925415.70813.13054733971058269952@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges (rev6)
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
commit 2b93fd781baed1fed4ebf3682f75ee473d722ae5
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon May 12 22:17:40 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f3767db51c5d8bc3ba3f2b342332ab329044fe5b drm-intel
2391a07784e3 drm/gpusvm: Introduce devmem_only flag for allocation
9b7c64a36ad7 drm/xe: Strict migration policy for atomic SVM faults
-:42: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>`', should be: 'Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>'
#42: 
Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>`

total: 0 errors, 1 warnings, 0 checks, 334 lines checked
290971336365 drm/gpusvm: Add timeslicing support to GPU SVM
d9fdec32edd5 drm/xe: Timeslice GPU on atomic SVM fault
be1cec17e83d drm/xe: Add atomic_svm_timeslice_ms debugfs entry
292cc672ec56 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
df5042c1d763 drm/xe: Make xe_svm_alloc_vram public
78038f1ff57f drm/xe/svm: Helper to add tile masks to svm ranges
a6fd124816a6 drm/xe/svm: Make to_xe_range a public function
5159918e1215 drm/xe/svm: Make xe_svm_range_* end/start/size public
00a614c27ce9 drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
e8a567923cc4 drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
907ab1da2723 drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
e7b544c0d5cd drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
a939c2ee8b05 drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
6ff28dadfbba drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_smem()
70ae187685c7 drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
13775669d1a2 drm/xe/svm: Add xe_svm_find_vma_start() helper
888f641167bb drm/xe/svm: Implement prefetch support for SVM ranges
2b93fd781bae drm/xe/vm: Add debug prints for SVM range prefetch


