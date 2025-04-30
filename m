Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E0C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 12:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E64E10E298;
	Wed, 30 Apr 2025 12:45:42 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8B510E298;
 Wed, 30 Apr 2025 12:45:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Apr 2025 12:45:41 -0000
Message-ID: <174601714130.29625.11478941419350832639@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges (rev5)
URL   : https://patchwork.freedesktop.org/series/146079/
State : success

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
commit ad4263b95434473e51e8a915ab881accb326b05d
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Apr 30 17:49:12 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch fc3ad08303990b2481cc45a6103ed79935dd3797 drm-intel
f99c0c7397c4 drm/gpusvm: Introduce devmem_only flag for allocation
26ab9204de1b drm/xe: Strict migration policy for atomic SVM faults
3b2f5a7523fc drm/gpusvm: Add timeslicing support to GPU SVM
5613134d3e80 drm/xe: Timeslice GPU on atomic SVM fault
5d1d88ed2eba drm/xe: Add atomic_svm_timeslice_ms debugfs entry
3e898445edd4 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
727bd3546f1f drm/xe: Make xe_svm_alloc_vram public
4a5d61f89957 drm/xe/svm: Helper to add tile masks to svm ranges
5cacebc64875 drm/xe/svm: Make to_xe_range a public function
4404f14b1e92 drm/xe/svm: Make xe_svm_range_* end/start/size public
fe4826930ba1 drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
092f9241b204 drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
d458f95ab493 drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
a51fc110257f drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
6353c2903565 drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
b90712b21a82 drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_smem()
2da12c0a7937 drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
71ece3db9f5b drm/xe/svm: Add xe_svm_find_vma_start() helper
bd9d1baba3dd drm/xe/svm: Implement prefetch support for SVM ranges
ad4263b95434 drm/xe/vm: Add debug prints for SVM range prefetch


