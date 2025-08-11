Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EFAC87FDB
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 12:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCDD10E13F;
	Mon, 11 Aug 2025 12:43:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC2D10E13F;
 Mon, 11 Aug 2025 12:43:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Driver-managed_?=
 =?utf-8?q?exhaustive_eviction_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Aug 2025 12:43:01 -0000
Message-ID: <175491618124.226654.409466572628738788@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250811123742.3546-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250811123742.3546-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Driver-managed exhaustive eviction (rev5)
URL   : https://patchwork.freedesktop.org/series/150796/
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
commit a8cdf8ac0da396c675b992992658da33fd43acc1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Aug 11 14:37:42 2025 +0200

    drm/xe: Driver-Managed exhaustive eviction
    
    For CI only. Please don't review at this point.
    
    Squashed commit of the following:
    
    commit 85d94e56c09f9075e55ded1fa8ba81de8ab3701e
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 18:15:57 2025 +0200
    
        drm/xe: Handle xe_bo_create_pin_map()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 10bd01a525ad3806a24f59ae8559269b17ecc77a
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:55:36 2025 +0200
    
        drm/xe: Handle xe_bo_create_pin_map_at()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 015eddcb9fbeb1f5665a1dfa0a76409fa24f167d
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Fri Aug 8 11:51:53 2025 +0200
    
        drm/xe: Rename ___xe_bo_create_locked()
    
        Don't start extern function names with underscores.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 521a8ae0b5cf6a3338c39d9f0393f6301fe1690d
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe/validation: Convert xe_dma_buf.c
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 498eccad496c12388e47e00a91a36cc9ca54b5be
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/exec/validation: Convert __xe_pin_fb_vma()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit a2c116a410548b51c34aae8a7a9b3ee4e4a41fb8
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Conversion of the fault handler to support drm_exec locking
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 0198a6d86cb94bf3b55048cb0c9f09c4522dea06
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:52:35 2025 +0200
    
        drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit f2b76a1a4ed22eb927e95cda5727f8b59162af81
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 25 10:48:44 2025 +0200
    
        drm/xe: Fix up svm validation.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 913ae052f8b63d77e463dccf50de045a3bc060c1
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:50:53 2025 +0200
    
        drm/xe: Fix up xe_bo_create_user()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 0c8d3782c4ea6315d499d5b332204bbdc23f1af2
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit b95d7286c8b52007301b4a13b0e997ba3580def5
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 14:41:01 2024 +0200
    
        drm/xe: Pass down drm_exec context to validation
    
        We want all validation (potential backing store allocation) to be part
        of a drm_exec transaction. Therefore add a drm_exec pointer argument
        to xe_bo_validate() and ___xe_bo_create_locked(). Upcoming patches
        will deal with making all (or nearly all) calls to these functions
        part of a drm_exec transaction. In the meantime, define special values
        of the drm_exec pointer:
    
        XE_VALIDATION_UNIMPLEMENTED: Implementation of the drm_exec transaction
        has not been done yet.
        XE_VALIDATION_UNSUPPORTED: Some Middle-layers (dma-buf) doesn't allow
        the drm_exec context to be passed down to map_attachment where
        validation takes place.
        XE_VALIDATION_OPT_OUT: May be used only for kunit tests where exhaustive
        eviction isn't crucial and the ROI of converting those is very
        small.
    
        For XE_VALIDATION_UNIMPLEMENTED and XE_VALIDATION_OPT_OUT there is also
        a lockdep check that a drm_exec transaction can indeed start at the
        location where the macro is expanded. This is to encourage
        developers to take this into consideration early in the code
        development process.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit a175d17890e8a0dff37b2e13b1986b62583e0c73
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
    
    commit bb2859d29e0decbb06f5fd2a37243d11f1c05c38
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 22:20:06 2024 +0200
    
        drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
    
        This member is set when exporting using prime. However
        the xe_gem_prime_export() alone doesn't set it, since it's done
        later in the prime export flow.
        For the test, set it manually and remove the hack that set it
        temporarily when it was really needed.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 27315c7bb830e06a1e63fe1fd656fda48365805c drm-intel
a8cdf8ac0da3 drm/xe: Driver-Managed exhaustive eviction
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '85d94e56c09f9075e55ded1fa8ba81de8ab3701e', maybe rebased or not pulled?
#13: 
commit 85d94e56c09f9075e55ded1fa8ba81de8ab3701e

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

-:123: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#123: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:123: WARNING:BAD_SIGN_OFF: Duplicate signature
#123: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:134: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#134: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:134: WARNING:BAD_SIGN_OFF: Duplicate signature
#134: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:135: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")'
#135: 
    Fixes: 06951c2ee72d ("drm/xe: Use NULL PTEs as scratch PTEs")

-:136: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#136: 
    Cc: Brian Welty <brian.welty@intel.com>

-:137: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#137: 
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

-:138: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#138: 
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>

-:139: WARNING:BAD_SIGN_OFF: Do not use whitespace before Cc:
#139: 
    Cc: <stable@vger.kernel.org> # v6.8+

-:153: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#153: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:153: WARNING:BAD_SIGN_OFF: Duplicate signature
#153: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:250: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#250: FILE: drivers/gpu/drm/xe/display/intel_fbdev_fb.c:59:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

-:1755: CHECK:SPACING: No space is necessary after a cast
#1755: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:186:
+	(void) ret;

-:2550: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#2550: 
new file mode 100644

-:2937: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#2937: FILE: drivers/gpu/drm/xe/xe_validation.h:129:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while (0)

-:2959: WARNING:TABSTOP: Statements should start on a tabstop
#2959: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,

-:2959: ERROR:SPACING: space required after that ';' (ctx:VxO)
#2959: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,
 	                                                ^

-:2959: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#2959: FILE: drivers/gpu/drm/xe/xe_validation.h:151:
+	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,

-:2980: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2980: FILE: drivers/gpu/drm/xe/xe_validation.h:172:
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

-:2980: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#2980: FILE: drivers/gpu/drm/xe/xe_validation.h:172:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:3389: ERROR:SPACING: space required before the open parenthesis '('
#3389: FILE: drivers/gpu/drm/xe/xe_vm.c:2489:
+			if(IS_ERR(vma))

total: 4 errors, 35 warnings, 2 checks, 3171 lines checked


