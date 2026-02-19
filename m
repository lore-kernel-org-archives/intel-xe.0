Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EBDE9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B8A10E1D5;
	Thu, 19 Feb 2026 09:40:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F08F10E1D5;
 Thu, 19 Feb 2026 09:40:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/svm=3A_Add_MMU_not?=
 =?utf-8?q?ifier-based_madvise_autoreset_on_munmap?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 09:40:54 -0000
Message-ID: <177149405423.265813.9564669961484491636@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219091312.796749-1-arvind.yadav@intel.com>
In-Reply-To: <20260219091312.796749-1-arvind.yadav@intel.com>
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

Series: drm/xe/svm: Add MMU notifier-based madvise autoreset on munmap
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
commit 393b6abb9054a363e87a0069a949522b9609db75
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Feb 19 14:43:12 2026 +0530

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
+ /mt/dim checkpatch c81e41f7aca96f583296a2a875f0179484b7a81f drm-intel
9fb1b93d7755 drm/xe/vm: Add CPU_AUTORESET_ACTIVE VMA flag
86281920bd68 drm/xe/vm: Preserve CPU_AUTORESET_ACTIVE across GPUVA operations
3940f3524f81 drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU fault
556333ace830 drm/xe/vm: Add madvise autoreset interval notifier worker infrastructure
-:294: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#294: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:753:
+		mempool_create_kmalloc_pool(64,
+					     sizeof(struct xe_madvise_work_item));

-:348: WARNING:NEEDLESS_IF: mempool_destroy(NULL) is safe and this check is probably not required
#348: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:807:
+	if (pool)
+		mempool_destroy(pool);

total: 0 errors, 1 warnings, 1 checks, 483 lines checked
e5596e3e2f2b drm/xe/vm: Deactivate madvise notifier on GPU touch
ea7b3c47d3a8 drm/xe/vm: Wire MADVISE_AUTORESET notifiers into VM lifecycle
393b6abb9054 drm/xe/svm: Correct memory attribute reset for partial unmap


