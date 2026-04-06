Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2256EF4EC8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 09:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF1010E21B;
	Mon,  6 Apr 2026 09:04:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E3610E218;
 Mon,  6 Apr 2026 09:04:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/svm=3A_Add_MMU_not?=
 =?utf-8?q?ifier-based_madvise_autoreset_on_munmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Apr 2026 09:04:10 -0000
Message-ID: <177546625091.433781.7079221935220788006@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
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

Series: drm/xe/svm: Add MMU notifier-based madvise autoreset on munmap (rev2)
URL   : https://patchwork.freedesktop.org/series/161815/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 30a917b2848a008b15b633df7972f0d102ef3b7f
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Apr 6 14:28:30 2026 +0530

    drm/xe/svm: Correct memory attribute reset for partial unmap
    
    When performing a partial unmap of an SVM range, the memory attributes
    were being reset for the entire range instead of just the portion
    being unmapped. This could lead to unintended side effects and behaviour.
    
    Fix this by restricting the attribute reset to only the affected subrange
    that is being unmapped.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch d873f0156bd08a3031097d459e2d3604bfe1b1bf drm-intel
e7c4c655a87f drm/xe/vm: Track CPU_AUTORESET state in xe_vma
7553903d21cb drm/xe/vm: Preserve cpu_autoreset_active across GPUVA operations
43d48b4dbc79 drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU fault
06d48e6a6d2a drm/xe/vm: Add madvise autoreset interval notifier worker infrastructure
c542fcf2f0ad drm/xe/vm: Deactivate madvise notifier on GPU touch
-:121: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#121: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:1268:
+	xe_vm_deactivate_madvise_notifier_for_range(vm,
+						xe_vma_start(vma),

total: 0 errors, 0 warnings, 1 checks, 106 lines checked
e2c77b8c3bf2 drm/xe/vm: Wire MADVISE_AUTORESET notifiers into VM lifecycle
30a917b2848a drm/xe/svm: Correct memory attribute reset for partial unmap


