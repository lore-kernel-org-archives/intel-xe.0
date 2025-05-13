Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34742C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82F388284;
	Tue, 13 May 2025 03:43:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C97B88284;
 Tue, 13 May 2025 03:43:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 03:43:12 -0000
Message-ID: <174710779211.72004.3304523368428792726@c664b1dc75d1>
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
commit 35830a3d53fb13c455cc6274fbc48814bf8da2c6
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue May 13 09:32:28 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ccbe266e6269fe62cb8f5d80cd9226134ea38e97 drm-intel
25486d96003d drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
4a67a30d6d31 drm/xe: Make xe_svm_alloc_vram public
a9bd750c6601 drm/xe/svm: Helper to add tile masks to svm ranges
c0b38c6edc24 drm/xe/svm: Make to_xe_range a public function
8dc25847c447 drm/xe/svm: Make xe_svm_range_* end/start/size public
e368769689dd drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
14839d9a7b62 drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
ed5b325477f5 drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
81f782fb1ca1 drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
60f44f69e45b drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
2f3a2d32ef65 drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_smem()
33abec90bed9 drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
1baa1a7d1339 drm/xe/svm: Add xe_svm_find_vma_start() helper
8d645f6818e8 drm/xe/svm: Implement prefetch support for SVM ranges
35830a3d53fb drm/xe/vm: Add debug prints for SVM range prefetch


