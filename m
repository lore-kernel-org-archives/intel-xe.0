Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05FDC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 03:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B91610E221;
	Tue, 30 Apr 2024 03:04:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B407210E838;
 Tue, 30 Apr 2024 03:04:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Unmap_userptr_i?=
 =?utf-8?q?n_MMU_invalidation_notifier_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 03:04:48 -0000
Message-ID: <171444628873.1756580.9495875184225478071@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430030020.2306682-1-matthew.brost@intel.com>
In-Reply-To: <20240430030020.2306682-1-matthew.brost@intel.com>
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

Series: drm/xe: Unmap userptr in MMU invalidation notifier (rev2)
URL   : https://patchwork.freedesktop.org/series/132978/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd303e5703bc9adad503ffcc3f1e1ade7fb084b4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Apr 29 20:00:20 2024 -0700

    drm/xe: Unmap userptr in MMU invalidation notifier
    
    To be secure, when a userptr is invalidated the pages should be dma
    unmapped ensuring the device can no longer touch the invalidated pages.
    
    v2:
     - Don't free sg table in MMU notifer, just dma unmap pages
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Fixes: 12f4b58a37f4 ("drm/xe: Use hmm_range_fault to populate user pages")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: stable@vger.kernel.org # 6.8
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4f88a4cc3d4cba837cf1f8040f0140583f204225 drm-intel
fd303e5703bc drm/xe: Unmap userptr in MMU invalidation notifier
-:32: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#32: FILE: drivers/gpu/drm/xe/xe_hmm.c:116:
+#define clear_need_unmap(__sg)	(__sg) = (struct sg_table *)((u64)(__sg) & ~0x1ull)

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__sg' - possible side-effects?
#32: FILE: drivers/gpu/drm/xe/xe_hmm.c:116:
+#define clear_need_unmap(__sg)	(__sg) = (struct sg_table *)((u64)(__sg) & ~0x1ull)

-:33: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#33: FILE: drivers/gpu/drm/xe/xe_hmm.c:117:
+#define set_need_unmap(__sg)	(__sg) = (struct sg_table *)((u64)(__sg) | 0x1ull)

-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__sg' - possible side-effects?
#33: FILE: drivers/gpu/drm/xe/xe_hmm.c:117:
+#define set_need_unmap(__sg)	(__sg) = (struct sg_table *)((u64)(__sg) | 0x1ull)

-:149: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#149: FILE: drivers/gpu/drm/xe/xe_vm_types.h:37:
+#define vma_to_userptr_sg(__vma) \
+	(struct sg_table *)((u64)to_userptr_vma((__vma))->userptr.sg & ~0x1ull)

total: 3 errors, 0 warnings, 2 checks, 114 lines checked


