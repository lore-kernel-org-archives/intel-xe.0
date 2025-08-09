Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D8C87FCF
	for <intel-xe@archiver.kernel.org>; Sat,  9 Aug 2025 09:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EB310E2A1;
	Sat,  9 Aug 2025 09:15:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF0710E2A1;
 Sat,  9 Aug 2025 09:15:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Driver-managed_?=
 =?utf-8?q?exhaustive_eviction_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Aug 2025 09:15:13 -0000
Message-ID: <175473091331.224384.8210659504289598200@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250809090909.79481-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250809090909.79481-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Driver-managed exhaustive eviction (rev4)
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
commit 777b75b81593d3f1147949a25d3bc65041222b14
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sat Aug 9 11:09:09 2025 +0200

    drm/xe: Driver-Managed exhaustive eviction
    
    For CI only. Please don't review at this point.
    
    Squashed commit of the following:
    
    commit b3f837ddd96732188644a0298cfa08651fd92564
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 18:15:57 2025 +0200
    
        drm/xe: Handle xe_bo_create_pin_map()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit a4ca5ccf4e7b24edd4be25b8d53da9cadcbaa721
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:55:36 2025 +0200
    
        drm/xe: Handle xe_bo_create_pin_map_at()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit a1d321d0986349aacca8a001f279c7c61cc256df
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Fri Aug 8 11:51:53 2025 +0200
    
        drm/xe: Rename ___xe_bo_create_locked()
    
        Don't start extern function names with underscores.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 2184711165fd47cc56a9689ace7603a1220c5bbe
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe/validation: Convert xe_dma_buf.c
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit decb22e3ddffc10b7a5b2714ff1255096e9f08d5
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/exec/validation: Convert __xe_pin_fb_vma()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 492afdf2e7d53524fccde25a8656c2d5e06d1ca5
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Conversion of the fault handler to support drm_exec locking
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 11e43d9440bde5ef4fab3936593f542c1d05ed88
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:52:35 2025 +0200
    
        drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit da8e404cf5babe6b0a8e932b625d1a1db9922ce0
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 25 10:48:44 2025 +0200
    
        drm/xe: Fix up svm validation.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 346dcd60eb62cbb040a0bda08688df9a1c380779
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Aug 4 17:50:53 2025 +0200
    
        drm/xe: Fix up xe_bo_create_user()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 31d169fce171be886846f7950af55972ba5ebbc7
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit f13f48d936615e666c3f2d25795e9b186c8faa27
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
    
    commit e36db8d24304f2402da337653c123c3f7a18b816
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
    
    commit 424ee45f239cf5ae9d0a8c65764739dfe95e38ab
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 22:20:06 2024 +0200
    
        drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
    
        This member is set when exporting using prime. However
        the xe_gem_prime_export() alone doesn't set it, since it's done
        later in the prime export flow.
        For the test, set it manually and remove the hack that set it
        temporarily when it was really needed.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7 drm-intel
777b75b81593 drm/xe: Driver-Managed exhaustive eviction
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b3f837ddd96732188644a0298cfa08651fd92564', maybe rebased or not pulled?
#13: 
commit b3f837ddd96732188644a0298cfa08651fd92564

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


