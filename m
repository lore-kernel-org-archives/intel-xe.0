Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F10C28B30
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ED710E05C;
	Mon, 10 Mar 2025 12:35:30 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D05A10E05C;
 Mon, 10 Mar 2025 12:35:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prefetch_Support_for_svm_?=
 =?utf-8?q?ranges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 12:35:29 -0000
Message-ID: <174161012957.13756.5784619919389239907@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges
URL   : https://patchwork.freedesktop.org/series/146079/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cb1bbef40969ee1e6e6bf4d3390a4d0414dda700
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Mar 10 18:13:41 2025 +0530

    drm/xe/vm: Add debug prints for SVM range prefetch
    
    Introduce debug logs for the prefetch operation of SVM ranges.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a drm-intel
ec31ae81f511 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
90a0bcccad08 drm/xe: Make xe_svm_alloc_vram public
4f76f7c72342 drm/xe/svm: Helper to add tile masks to svm ranges
0047e29bb05d drm/xe/svm: Make to_xe_range a public function
44386921cf81 drm/xe/svm: Make xe_svm_range_* end/start/size public
46a2290ac612 drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
b8b72cc2372b drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
0c16475b258a drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
43bb4362cbe6 drm/xe/svm: Allow unaligned addresses and ranges for prefetch
242e6c315d2a drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
10ff8b6ec31a drm/xe/svm: Implement prefetch support for SVM ranges
cb1bbef40969 drm/xe/vm: Add debug prints for SVM range prefetch


