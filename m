Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C11C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 11:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23E810E075;
	Wed, 13 Aug 2025 11:54:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045B610E075;
 Wed, 13 Aug 2025 11:54:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Driver-managed_exhaustive?=
 =?utf-8?q?_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Aug 2025 11:54:17 -0000
Message-ID: <175508605799.232154.3894844424885160268@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

Series: Driver-managed exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/152882/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6f9293a391ff3c575bc021f454be5d0a0c076f57
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4425bbc1f8949d4655e6680ecd3e4dda32c7e69d
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Aug 13 12:51:21 2025 +0200

    drm/xe: Convert pinned suspend eviction for exhaustive eviction
    
    Pinned suspend eviction and preparation for eviction validates
    system memory for eviction buffers. Do that under a
    validation exclusive lock to avoid interfering with other
    processes validating system graphics memory.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 546fc742f08b8dbd3fa1486933c9b15085e11d13 drm-intel
cf30641243aa drm/xe/vm: Don't use a pin the vm_resv during validation
5aa304916620 drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
2888a1ff8929 drm/xe/vm: Clear the scratch_pt pointer on error
26a7db17e2ec drm/xe: Pass down drm_exec context to validation
-:1117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1117: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1244 lines checked
fab6c1544ca5 drm/xe: Introduce an xe_validation wrapper around drm_exec
-:327: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#327: FILE: drivers/gpu/drm/xe/xe_validation.h:129:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while (0)

-:349: WARNING:TABSTOP: Statements should start on a tabstop
#349: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,

-:349: ERROR:SPACING: space required after that ';' (ctx:VxO)
#349: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,
 	                                                ^

-:349: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#349: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,

-:370: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#370: FILE: drivers/gpu/drm/xe/xe_validation.h:172:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
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

-:370: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#370: FILE: drivers/gpu/drm/xe/xe_validation.h:172:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

total: 3 errors, 2 warnings, 1 checks, 328 lines checked
b47d58d9d4a1 drm/xe: Convert xe_bo_create_user() for exhaustive eviction
16e2235dff4f drm/xe: Convert SVM validation for exhaustive eviction
0687b1d5f43c drm/xe: Convert existing drm_exec transactions for exhaustive eviction
1fe2c75f4aa2 drm/xe: Convert the CPU fault handler for exhaustive eviction
70dc7173e90e drm/xe/display: Convert __xe_pin_fb_vma()
500867c30229 drm/xe: Convert xe_dma_buf.c for exhaustive eviction
11a5fd486fb7 drm/xe: Rename ___xe_bo_create_locked()
e553928c86d4 drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
12b3df6adabb drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
-:51: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#51: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:59:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

total: 0 errors, 1 warnings, 0 checks, 733 lines checked
4425bbc1f894 drm/xe: Convert pinned suspend eviction for exhaustive eviction


