Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35657C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 17:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07E210E047;
	Tue, 29 Jul 2025 17:37:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4610E047;
 Tue, 29 Jul 2025 17:37:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Driver_Managed_?=
 =?utf-8?q?exhaustive_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Jul 2025 17:37:36 -0000
Message-ID: <175381065671.196634.5008726989384556997@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729153138.2627-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250729153138.2627-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Driver Managed exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/152243/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 330a1b25edc34f1771d0c0c2a03db092876ad2ce
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Jul 29 17:31:38 2025 +0200

    drm/xe: Driver Managed exhaustive eviction
    
    Please don't review at this time. For CI testing only.
    
    Squashed commit of the following:
    
    commit 0f8e9a4320b09f84dd9c69b798d5149a1487c73f
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Tue Jul 29 16:53:35 2025 +0200
    
        drm/xe: Handle xe_bo_create_pin_map()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 96d067d6c5e0e6e1017a725461e3a5b3711b1740
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 17:21:44 2024 +0200
    
        drm/xe: Handle xe_bo_create_pin_map_at()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit de0c95429be70c66f94e7916c5346cd9ba915078
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 15:12:28 2024 +0200
    
        drm/xe: Rename ___xe_bo_create_locked()
    
        Don't start extern function names with underscores.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 13c4b738021e187ec04930d8f18814dd5ab56e5f
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe/validation: Convert xe_dma_buf.c
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit b1003544784aed06d2945e1a44649b7a6986df0b
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/exec/validation: Convert __xe_pin_fb_vma()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 49ecfeb9fe2889831b58275d34a6801972e999bc
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Conversion of the fault handler to support drm_exec locking
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit f80d8653a9f1bdcd1aa86ce04d618ef00b623430
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 10:49:56 2024 +0200
    
        drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 35a7180e7b6303e9e03d971dbc516b36bf621a4f
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 25 10:48:44 2025 +0200
    
        drm/xe: Fix up svm validation.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit b7a70a12d926c889a1f6614268ea5708eaa582ab
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 16:40:12 2024 +0200
    
        drm/xe: Fix up xe_bo_create_user()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 79b740c09448dc354800828d4e8d56908d0c70b1
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 3306ec6bbd71eb024b9e6f523b32d6cf9d8f4aaf
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 14:41:01 2024 +0200
    
        drm/xe: Ensure we pass down the drm_exec context to validation
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 3e88313fdd545a52b1b6ab6ae46cce3377ef38c4
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jul 3 11:50:32 2024 +0200
    
        drm/xe/vm: Clear the scratch_pt pointer on error
    
        Avoid triggering a dereference of an error pointer on cleanup in
        xe_vm_free_scratch() by clearing any scratch_pt error pointer.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
        Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")
        Cc: Brian Welty <brian.welty@intel.com>
        Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
        Cc: Lucas De Marchi <lucas.demarchi@intel.com>
        Cc: <stable@vger.kernel.org> # v6.8+
    
    commit 91c7729654382e78fa17c937b29ba15218b71757
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 22:20:06 2024 +0200
    
        drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
    
        This member is set when exporting using prime. However
        the xe_gem_prime_export() alone doesn't set it, since it's done
        later in the prime export flow.
        For the test, set it manually and remove the hack that set it
        temporarily when it was really need it.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch b6a72d53a8082ee6ef701042e7cb8a93d6a2b678 drm-intel
330a1b25edc3 drm/xe: Driver Managed exhaustive eviction
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0f8e9a4320b09f84dd9c69b798d5149a1487c73f', maybe rebased or not pulled?
#13: 
commit 0f8e9a4320b09f84dd9c69b798d5149a1487c73f

-:19: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#19: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:27: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#27: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:27: WARNING:BAD_SIGN_OFF: Duplicate signature
#27: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:37: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#37: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:37: WARNING:BAD_SIGN_OFF: Duplicate signature
#37: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:45: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#45: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:45: WARNING:BAD_SIGN_OFF: Duplicate signature
#45: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:53: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#53: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:53: WARNING:BAD_SIGN_OFF: Duplicate signature
#53: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:61: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#61: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:61: WARNING:BAD_SIGN_OFF: Duplicate signature
#61: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:69: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#69: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:69: WARNING:BAD_SIGN_OFF: Duplicate signature
#69: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:77: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#77: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:77: WARNING:BAD_SIGN_OFF: Duplicate signature
#77: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:85: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#85: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:85: WARNING:BAD_SIGN_OFF: Duplicate signature
#85: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:93: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#93: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:93: WARNING:BAD_SIGN_OFF: Duplicate signature
#93: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:101: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#101: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:101: WARNING:BAD_SIGN_OFF: Duplicate signature
#101: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:112: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#112: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:112: WARNING:BAD_SIGN_OFF: Duplicate signature
#112: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:113: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")'
#113: 
    Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")

-:114: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#114: 
    Cc: Brian Welty <brian.welty@intel.com>

-:115: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#115: 
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

-:116: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#116: 
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>

-:117: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#117: 
    Cc: <stable@vger.kernel.org> # v6.8+

-:131: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#131: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:131: WARNING:BAD_SIGN_OFF: Duplicate signature
#131: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:240: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#240: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:59:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

-:1548: CHECK:SPACING: No space is necessary after a cast
#1548: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:186:
+	(void) ret;

-:2310: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#2310: 
new file mode 100644

-:2387: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2387: FILE: drivers/gpu/drm/xe/xe_validation.c:73:
+^I$

-:2396: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#2396: FILE: drivers/gpu/drm/xe/xe_validation.c:82:
+	if (ctx->lock_held_exclusive) {
[...]
+	} else {
[...]

-:2408: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2408: FILE: drivers/gpu/drm/xe/xe_validation.c:94:
+{^I$

-:2435: WARNING:MACRO_ARG_UNUSED: Argument '_a' is not used in function-like macro
#2435: FILE: drivers/gpu/drm/xe/xe_validation.c:121:
+#define xe_validation_contention_injected(_a) (false)

-:2449: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 10)
#2449: FILE: drivers/gpu/drm/xe/xe_validation.c:135:
+	if (ret == -ENOMEM)
+	  pr_info("Shuld retry is false.\n");

-:2451: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2451: FILE: drivers/gpu/drm/xe/xe_validation.c:137:
+^I$

-:2479: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2479: FILE: drivers/gpu/drm/xe/xe_validation.c:165:
+^I$

-:2630: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#2630: FILE: drivers/gpu/drm/xe/xe_validation.h:124:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)

-:2634: ERROR:SPACING: space required before the open parenthesis '('
#2634: FILE: drivers/gpu/drm/xe/xe_validation.h:128:
+	} while(0)

-:2651: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#2651: FILE: drivers/gpu/drm/xe/xe_validation.h:145:
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\

-:2652: WARNING:TABSTOP: Statements should start on a tabstop
#2652: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2652: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2652: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
 	                                                 ^

-:2652: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#2652: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2652: WARNING:BRACES: braces {} are not necessary for single statement blocks
#2652: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2654: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2654: FILE: drivers/gpu/drm/xe/xe_validation.h:148:
+	       _ret ? NULL : _ctx;}),					\
 	                         ^

-:2657: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#2657: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \

-:2658: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2658: FILE: drivers/gpu/drm/xe/xe_validation.h:152:
+{return *_T;}
            ^

-:2673: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2673: FILE: drivers/gpu/drm/xe/xe_validation.h:167:
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

-:2673: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#2673: FILE: drivers/gpu/drm/xe/xe_validation.h:167:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:3073: ERROR:SPACING: space required before the open parenthesis '('
#3073: FILE: drivers/gpu/drm/xe/xe_vm.c:2480:
+			if(IS_ERR(vma))

-:3205: ERROR:TRAILING_WHITESPACE: trailing whitespace
#3205: FILE: drivers/gpu/drm/xe/xe_vm.c:3860:
+^Idma_resv_unlock(xe_vm_resv(vm));^I$

total: 12 errors, 41 warnings, 2 checks, 2788 lines checked


