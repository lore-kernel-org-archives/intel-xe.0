Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E903CCA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 03:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84E010EA16;
	Thu, 11 Sep 2025 03:53:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02310E29F;
 Thu, 11 Sep 2025 03:53:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Misc_refine_for?=
 =?utf-8?q?_svm_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 03:53:16 -0000
Message-ID: <175756279634.323999.1490051583054321551@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
In-Reply-To: <20250718212409.86516-2-shuicheng.lin@intel.com>
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

Series: drm/xe: Misc refine for svm (rev4)
URL   : https://patchwork.freedesktop.org/series/151842/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8a1b81f3a0190bc7dc03b81dee044e9e25872e3f
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Sep 11 03:14:06 2025 +0000

    drm/xe: Misc refine for svm
    
    These changes should have no functional impact.
    1. Correct typo of "operation"in macro range_debug().
    2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
    3. Drop redundant preferred_region_is_vram check in
       xe_svm_range_needs_migrate_to_vram().
    4. Combine the devmem_possible check in xe_svm_handle_pagefault().
       need_vram includes the IS_DGFX() check, so there is no change for .devmem_only.
    
    v2: revert !ctx.devmem_only change (Matt)
    v3: rebase code and refine commit message.
    v4: rebase code and refine commit message.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch e925396dbb0b8094e00ca3d47a375538d429b225 drm-intel
8a1b81f3a019 drm/xe: Misc refine for svm
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
   need_vram includes the IS_DGFX() check, so there is no change for .devmem_only.

-:30: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#30: FILE: drivers/gpu/drm/xe/xe_svm.c:53:
+#define range_debug(r__, operation__)					\
 	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
 	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
 	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#30: FILE: drivers/gpu/drm/xe/xe_svm.c:53:
+#define range_debug(r__, operation__)					\
 	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
 	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
 	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\

total: 1 errors, 1 warnings, 1 checks, 65 lines checked


