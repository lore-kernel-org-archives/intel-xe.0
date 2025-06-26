Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4902DC7115B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 08:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF57110E042;
	Thu, 26 Jun 2025 08:20:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD5510E042;
 Thu, 26 Jun 2025 08:20:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Driver-managed_?=
 =?utf-8?q?exhaustive_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Jun 2025 08:20:41 -0000
Message-ID: <175092604150.111552.17676539946610088895@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250626073532.11707-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250626073532.11707-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Driver-managed exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/150796/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 659d7e86234f2c0186f1866eda4837c2c55f4d26
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Jun 26 09:35:32 2025 +0200

    drm/xe: Driver-managed exhaustive eviction
    
    Please don't review at this point.
    
    Squashed commit of the following:
    
    commit d49f80eb0f246a86e3f1d107bc5f5f813601b0ca
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 25 17:47:26 2025 +0200
    
        drm/xe: Handle xe_bo_create_pin_map()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit ddd3386385cd48d6b2c01e9c44bc7d98a8cc1866
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 17:21:44 2024 +0200
    
        drm/xe: Handle xe_bo_create_pin_map_at()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 29e02dee09913d759f7086834ea1969f38c732ff
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 15:12:28 2024 +0200
    
        drm/xe: Rename ___xe_bo_create_locked()
    
        Don't start extern function names with underscores.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit bc440e8674c3030fb8d6893a90f71419ad794657
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe/validation: Convert xe_dma_buf.c
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 978426407ab859b1287ec3d1da6b69c227ab22ef
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/exec/validation: Convert __xe_pin_fb_vma()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 5eab42def6f2a06db28c79f36762edd06d92356e
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Conversion of the fault handler to support drm_exec locking
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 20e647b5891015a48e6444ef02b063e39b469f44
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 10:49:56 2024 +0200
    
        drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 554b4820c32f71d2109a5c0301b04fc36dc458f3
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 25 10:48:44 2025 +0200
    
        drm/xe: Fix up svm validation.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit cf6376478ff2412f6ae69083ae6cbfd56bd519fd
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 16:40:12 2024 +0200
    
        drm/xe: Fix up xe_bo_create_user()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 630c681fc5599d76cf8c47f76a810a530a6848b1
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 1382dab2d6a842d12dd26a0cc2de6c0e481791f0
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 14:41:01 2024 +0200
    
        drm/xe: Ensure we pass down the drm_exec context to validation
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit d6a6f73322c371c8ea54df3712c29c736f4afcc7
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
    
    commit 5a5e63473659e1f75c945f352e58607bf7a37572
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 22:20:06 2024 +0200
    
        drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
    
        This member is set when exporting using prime. However
        the xe_gem_prime_export() alone doesn't set it, since it's done
        later in the prime export flow.
        For the test, set it manually and remove the hack that set it
        temporarily when it was really need it.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 4c2f0ec5eea0d0a2a3fca28b12f7b90df913dccd
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Thu Jun 26 09:17:22 2025 +0200
    
        drm/xe/pxp: Use an external bo
    
        External bos makes conversion to exhaustive eviction simper.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch c5671d430c3c4b56873048acc717753de6d41e98 drm-intel
659d7e86234f drm/xe: Driver-managed exhaustive eviction
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd49f80eb0f246a86e3f1d107bc5f5f813601b0ca', maybe rebased or not pulled?
#13: 
commit d49f80eb0f246a86e3f1d107bc5f5f813601b0ca

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

-:141: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#141: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:141: WARNING:BAD_SIGN_OFF: Duplicate signature
#141: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:250: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#250: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:59:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

-:1569: CHECK:SPACING: No space is necessary after a cast
#1569: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:186:
+	(void) ret;

-:2308: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#2308: 
new file mode 100644

-:2385: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2385: FILE: drivers/gpu/drm/xe/xe_validation.c:73:
+^I$

-:2394: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#2394: FILE: drivers/gpu/drm/xe/xe_validation.c:82:
+	if (ctx->lock_held_exclusive) {
[...]
+	} else {
[...]

-:2406: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2406: FILE: drivers/gpu/drm/xe/xe_validation.c:94:
+{^I$

-:2433: WARNING:MACRO_ARG_UNUSED: Argument '_a' is not used in function-like macro
#2433: FILE: drivers/gpu/drm/xe/xe_validation.c:121:
+#define xe_validation_contention_injected(_a) (false)

-:2447: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 10)
#2447: FILE: drivers/gpu/drm/xe/xe_validation.c:135:
+	if (ret == -ENOMEM)
+	  pr_info("Shuld retry is false.\n");

-:2449: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2449: FILE: drivers/gpu/drm/xe/xe_validation.c:137:
+^I$

-:2477: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2477: FILE: drivers/gpu/drm/xe/xe_validation.c:165:
+^I$

-:2628: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#2628: FILE: drivers/gpu/drm/xe/xe_validation.h:124:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)

-:2632: ERROR:SPACING: space required before the open parenthesis '('
#2632: FILE: drivers/gpu/drm/xe/xe_validation.h:128:
+	} while(0)

-:2649: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#2649: FILE: drivers/gpu/drm/xe/xe_validation.h:145:
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\

-:2650: WARNING:TABSTOP: Statements should start on a tabstop
#2650: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2650: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2650: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
 	                                                 ^

-:2650: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#2650: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2650: WARNING:BRACES: braces {} are not necessary for single statement blocks
#2650: FILE: drivers/gpu/drm/xe/xe_validation.h:146:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2652: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2652: FILE: drivers/gpu/drm/xe/xe_validation.h:148:
+	       _ret ? NULL : _ctx;}),					\
 	                         ^

-:2655: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#2655: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \

-:2656: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2656: FILE: drivers/gpu/drm/xe/xe_validation.h:152:
+{return *_T;}
            ^

-:2671: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2671: FILE: drivers/gpu/drm/xe/xe_validation.h:167:
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

-:2671: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#2671: FILE: drivers/gpu/drm/xe/xe_validation.h:167:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:3071: ERROR:SPACING: space required before the open parenthesis '('
#3071: FILE: drivers/gpu/drm/xe/xe_vm.c:2480:
+			if(IS_ERR(vma))

-:3203: ERROR:TRAILING_WHITESPACE: trailing whitespace
#3203: FILE: drivers/gpu/drm/xe/xe_vm.c:3860:
+^Idma_resv_unlock(xe_vm_resv(vm));^I$

total: 12 errors, 43 warnings, 2 checks, 2777 lines checked


