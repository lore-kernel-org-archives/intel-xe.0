Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB112CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 10:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9551D10EABE;
	Fri, 22 Aug 2025 10:50:20 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF35E10EABB;
 Fri, 22 Aug 2025 10:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Driver-managed_exhaustive?=
 =?utf-8?q?_eviction_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Aug 2025 10:50:18 -0000
Message-ID: <175585981897.260857.6647503544786431745@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
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

Series: Driver-managed exhaustive eviction (rev2)
URL   : https://patchwork.freedesktop.org/series/152882/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 365a3d09400cf0d55634db3a3ee0490501526dff
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Aug 22 11:40:30 2025 +0200

    drm/xe: Convert pinned suspend eviction for exhaustive eviction
    
    Pinned suspend eviction and preparation for eviction validates
    system memory for eviction buffers. Do that under a
    validation exclusive lock to avoid interfering with other
    processes validating system graphics memory.
    
    v2:
    - Avoid gotos from within xe_validation_guard().
    - Adapt to signature change of xe_validation_guard().
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch cca87ca63e2f5b8a785dc59c23e526987530b27f drm-intel
df7c2f2aaf96 drm/xe/vm: Don't pin the vm_resv during validation
45afdb0d996c drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
b57290812749 drm/xe/vm: Clear the scratch_pt pointer on error
2f7d25b93f24 drm/xe: Pass down drm_exec context to validation
-:1131: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1131: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1236 lines checked
38fbfc5e8c13 drm/xe: Introduce an xe_validation wrapper around drm_exec
-:380: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#380: FILE: drivers/gpu/drm/xe/xe_validation.h:145:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while (0)

-:402: WARNING:TABSTOP: Statements should start on a tabstop
#402: FILE: drivers/gpu/drm/xe/xe_validation.h:167:
+	     if (_T) xe_validation_ctx_fini(_T);,

-:402: ERROR:SPACING: space required after that ';' (ctx:VxO)
#402: FILE: drivers/gpu/drm/xe/xe_validation.h:167:
+	     if (_T) xe_validation_ctx_fini(_T);,
 	                                       ^

-:402: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#402: FILE: drivers/gpu/drm/xe/xe_validation.h:167:
+	     if (_T) xe_validation_ctx_fini(_T);,

-:422: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#422: FILE: drivers/gpu/drm/xe/xe_validation.h:187:
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

-:422: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#422: FILE: drivers/gpu/drm/xe/xe_validation.h:187:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
+	drm_exec_until_all_locked(_exec)

total: 3 errors, 2 warnings, 1 checks, 372 lines checked
90db21b8e407 drm/xe: Convert xe_bo_create_user() for exhaustive eviction
48ef01d339f2 drm/xe: Convert SVM validation for exhaustive eviction
6be77af31ecd drm/xe: Convert existing drm_exec transactions for exhaustive eviction
ecd08d38f3ef drm/xe: Convert the CPU fault handler for exhaustive eviction
26e3c40ddb72 drm/xe/display: Convert __xe_pin_fb_vma()
40c78b67e852 drm/xe: Convert xe_dma_buf.c for exhaustive eviction
-:22: WARNING:TYPO_SPELLING: 'unneded' may be misspelled - perhaps 'unneeded'?
#22: 
- Remove an unneded (void)ret. (Matt Brost)
            ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 82 lines checked
45833160fd92 drm/xe: Rename ___xe_bo_create_locked()
6cf363c2c4ed drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
750c480bf99d drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
-:57: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#57: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:59:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

total: 0 errors, 1 warnings, 0 checks, 649 lines checked
ee1deede2fa7 drm/xe/sriov: Convert pf_provision_vf_lmem for exhaustive eviction
365a3d09400c drm/xe: Convert pinned suspend eviction for exhaustive eviction


