Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C73C3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 15:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5928910E4C7;
	Tue, 13 May 2025 15:02:00 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDE410E4C7;
 Tue, 13 May 2025 15:01:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 15:01:58 -0000
Message-ID: <174714851897.75033.14745390009172255786@c664b1dc75d1>
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

Series: Prefetch Support for svm ranges (rev8)
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
commit 4103aa9cd430124283501e218eb3d0ccd5de7201
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue May 13 09:32:28 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d0d3c136f60cbee6ede33f207b4e6d6b2f04779d drm-intel
eac3ce2ea476 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
2a13bf7f8c45 drm/xe: Make xe_svm_alloc_vram public
ff3087f3d409 drm/xe/svm: Helper to add tile masks to svm ranges
7d11cde9577b drm/xe/svm: Make to_xe_range a public function
2b0b32a39dd9 drm/xe/svm: Make xe_svm_range_* end/start/size public
5ae70671c028 drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
d9057bc48208 drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
a7b321d27da7 drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
3ecef1d51a63 drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
79dc78f2541d drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
633a6a0b5056 drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_smem()
3cd03377e769 drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
56fd0bd17ea3 drm/xe/svm: Add xe_svm_find_vma_start() helper
946a3833ad46 drm/xe/svm: Implement prefetch support for SVM ranges
4103aa9cd430 drm/xe/vm: Add debug prints for SVM range prefetch


