Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790D6CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 15:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4081D10EA8A;
	Thu,  4 Sep 2025 15:29:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE4310E25C;
 Thu,  4 Sep 2025 15:29:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Driver-managed_exhaustive?=
 =?utf-8?q?_eviction_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 15:29:52 -0000
Message-ID: <175699979205.303731.3079300303769995455@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
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

Series: Driver-managed exhaustive eviction (rev5)
URL   : https://patchwork.freedesktop.org/series/152882/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b5de614a4d7587c9067be0313f8cfa3629cd08b8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2a5f768a0b70faba5340b197814cb7b5754cd361
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Sep 4 16:49:08 2025 +0200

    drm/xe: Convert pinned suspend eviction for exhaustive eviction
    
    Pinned suspend eviction and preparation for eviction validates
    system memory for eviction buffers. Do that under a
    validation exclusive lock to avoid interfering with other
    processes validating system graphics memory.
    
    v2:
    - Avoid gotos from within xe_validation_guard().
    - Adapt to signature change of xe_validation_guard().
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c749c5063f5375da533ca48862b2c088052df60b drm-intel
528e1597704f drm/xe: Pass down drm_exec context to validation
-:1164: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1164: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1260 lines checked
eb74144c4589 drm/xe: Introduce an xe_validation wrapper around drm_exec
-:384: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#384: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while (0)

-:406: WARNING:TABSTOP: Statements should start on a tabstop
#406: FILE: drivers/gpu/drm/xe/xe_validation.h:168:
+	     if (_T) xe_validation_ctx_fini(_T);,

-:406: ERROR:SPACING: space required after that ';' (ctx:VxO)
#406: FILE: drivers/gpu/drm/xe/xe_validation.h:168:
+	     if (_T) xe_validation_ctx_fini(_T);,
 	                                       ^

-:406: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#406: FILE: drivers/gpu/drm/xe/xe_validation.h:168:
+	     if (_T) xe_validation_ctx_fini(_T);,

-:426: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#426: FILE: drivers/gpu/drm/xe/xe_validation.h:188:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
+	drm_exec_until_all_locked(_exec)

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

-:426: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#426: FILE: drivers/gpu/drm/xe/xe_validation.h:188:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
+	drm_exec_until_all_locked(_exec)

total: 3 errors, 2 warnings, 1 checks, 373 lines checked
f496c852844d drm/xe: Convert xe_bo_create_user() for exhaustive eviction
46c902e20ba4 drm/xe: Convert SVM validation for exhaustive eviction
bbab9a7aa718 drm/xe: Convert existing drm_exec transactions for exhaustive eviction
64b30c3f52ee drm/xe: Convert the CPU fault handler for exhaustive eviction
8fbcd5999551 drm/xe/display: Convert __xe_pin_fb_vma()
1612a4d3d045 drm/xe: Convert xe_dma_buf.c for exhaustive eviction
e71a951936f3 drm/xe: Rename ___xe_bo_create_locked()
714d1ac55cdd drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
cdeb342efba6 drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
-:58: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#58: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:59:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

total: 0 errors, 1 warnings, 0 checks, 649 lines checked
f12f5e305072 drm/xe: Rework instances of variants of xe_bo_create_locked()
2a5f768a0b70 drm/xe: Convert pinned suspend eviction for exhaustive eviction


