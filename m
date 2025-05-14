Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BFDC3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 12:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9410E612;
	Wed, 14 May 2025 12:07:29 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AA810E612;
 Wed, 14 May 2025 12:07:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 12:07:28 -0000
Message-ID: <174722444840.78050.11154328424595056177@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges (rev9)
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
commit 9ee994f2255a1fa845cf1e6ca0658c62c4f8ad67
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue May 13 09:32:28 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2e72fd09b4fb0823282977f0717159e47328a533 drm-intel
963a18b20cb0 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
cede849c148c drm/xe: Make xe_svm_alloc_vram public
3a225861d1a1 drm/xe/svm: Helper to add tile masks to svm ranges
7a1cf5b73906 drm/xe/svm: Make to_xe_range a public function
738163ded548 drm/xe/svm: Make xe_svm_range_* end/start/size public
1b11bd93230f drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
58c9a564591e drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
085641ac2ce1 drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
d9ab8f4f7d89 drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
fa179ee684f0 drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
3b1bfdebc19f drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_smem()
9e660d61211a drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
5b7aa69849c5 drm/xe/svm: Add xe_svm_find_vma_start() helper
a0b05219bed3 drm/xe/svm: Implement prefetch support for SVM ranges
9ee994f2255a drm/xe/vm: Add debug prints for SVM range prefetch


