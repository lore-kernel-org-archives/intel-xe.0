Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C4FC30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 14:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BEB10E8C1;
	Wed,  3 Jul 2024 14:12:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E33710E8C1;
 Wed,  3 Jul 2024 14:11:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_lean_exhaustive?=
 =?utf-8?q?_eviction_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 14:11:59 -0000
Message-ID: <172001591905.24496.17798056608880393414@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240702184016.80348-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240702184016.80348-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: lean exhaustive eviction (rev4)
URL   : https://patchwork.freedesktop.org/series/135570/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ca4151c41a1d07fce4141c1892e83bc100e6ed5c
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Jul 2 20:40:16 2024 +0200

    drm/xe: lean exhaustive eviction
    
    Squashed commit of the following:
    
    commit fe70cc587f99025526f75dd29308bec695acb988
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 17:21:44 2024 +0200
    
        drm/xe: Handle xe_bo_create_pin_map()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit b609d97d07b7f771d1fc7e409397cd44aad71fdf
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 17:21:44 2024 +0200
    
        drm/xe: Handle xe_bo_create_pin_map_at()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 61db4f0769195131c73112a3e2b5a3c5f6e12183
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 16:54:21 2024 +0200
    
        drm/xe: Remove xe_bo_create_locked_range()
    
        It has a single same-file user which can open-code the call to
        __xe_bo_create_locked().
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 18d9f0f7f89ca33043db3d18cd6239ecda9d5baf
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 16:48:51 2024 +0200
    
        drm/xe: Handler xe_bo_create_locked()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 3d931f23c0488fc0274e26e5048425fe1100d994
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 16:40:12 2024 +0200
    
        drm/xe: Fix up xe_bo_create_user()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit f1e7a17e66c8a174e0a024c72783dbec10b6fa02
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Mon Jul 1 15:12:28 2024 +0200
    
        drm/xe: Rename ___xe_bo_create_locked()
    
        Don't start extern function names with underscores.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 57c945423b73e132abe3a4259348a0dc0cdc95cb
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe/validation: Convert xe_dma_buf.c
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 863e76836e40cea53a92a81f1bf515ad50d8a3f1
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/exec/validation: Convert __xe_pin_fb_vma()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 0e3674b9891fe415ef5392b56300d85839bdef4f
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Conversion of the fault handler to support drm_exec locking
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit f461aef3e22922352da971338f4d6c1a5baaba47
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 10:49:56 2024 +0200
    
        drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 20b726e2d973307b7be2f98ce1149f9ea4c92665
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 506837cb7fa84c2445fc337d4b795b877c57a8e6
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 14:41:01 2024 +0200
    
        drm/xe: Ensure we pass down the drm_exec context to validation
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 221d7ed7f40cb8281268281c6cf851f427fc28de
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 22:20:06 2024 +0200
    
        drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
    
        This member is set when exporting using prime. However
        the xe_gem_prime_export() alone doesn't set it, since it's done
        later in the prime export flow.
        For the test, set it manually and remove the hack that set it
        temporarily when it was really need it.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    Test-with: 20240630180502.81556-1-thomas.hellstrom@linux.intel.com
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch dd25375963487e160d842a560cea88d5fc0f8721 drm-intel
ca4151c41a1d drm/xe: lean exhaustive eviction
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fe70cc587f99025526f75dd29308bec695acb988', maybe rebased or not pulled?
#11: 
commit fe70cc587f99025526f75dd29308bec695acb988

-:17: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#17: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:25: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#25: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:25: WARNING:BAD_SIGN_OFF: Duplicate signature
#25: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:36: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#36: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:36: WARNING:BAD_SIGN_OFF: Duplicate signature
#36: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:44: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#44: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:44: WARNING:BAD_SIGN_OFF: Duplicate signature
#44: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:52: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#52: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:52: WARNING:BAD_SIGN_OFF: Duplicate signature
#52: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:62: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#62: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:62: WARNING:BAD_SIGN_OFF: Duplicate signature
#62: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:70: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#70: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:70: WARNING:BAD_SIGN_OFF: Duplicate signature
#70: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:78: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#78: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:78: WARNING:BAD_SIGN_OFF: Duplicate signature
#78: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:86: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#86: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:86: WARNING:BAD_SIGN_OFF: Duplicate signature
#86: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:94: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#94: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:94: WARNING:BAD_SIGN_OFF: Duplicate signature
#94: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:102: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#102: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:102: WARNING:BAD_SIGN_OFF: Duplicate signature
#102: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:110: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#110: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:110: WARNING:BAD_SIGN_OFF: Duplicate signature
#110: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:124: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#124: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:124: WARNING:BAD_SIGN_OFF: Duplicate signature
#124: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:127: WARNING:BAD_SIGN_OFF: Duplicate signature
#127: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:1000: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1000: FILE: drivers/gpu/drm/xe/xe_bo.c:1612:
+^Ixe_assert(xe, !!exec);^I^I$

-:1301: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1301: FILE: drivers/gpu/drm/xe/xe_device_types.h:482:
+  $

-:1301: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1301: FILE: drivers/gpu/drm/xe/xe_device_types.h:482:
+  $

-:1383: CHECK:SPACING: No space is necessary after a cast
#1383: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:189:
+	(void) ret;

-:1897: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1897: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:546:
+^I$

-:2067: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2067: FILE: drivers/gpu/drm/xe/xe_migrate.c:381:
 
+

-:2178: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#2178: 
new file mode 100644

-:2183: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#2183: FILE: drivers/gpu/drm/xe/xe_validation.c:1:
+#include <drm/drm_exec.h>

-:2196: ERROR:SPACING: space required before the open parenthesis '('
#2196: FILE: drivers/gpu/drm/xe/xe_validation.c:14:
+		switch(PTR_ERR(exec)) {

-:2235: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2235: FILE: drivers/gpu/drm/xe/xe_validation.c:53:
+^I$

-:2244: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#2244: FILE: drivers/gpu/drm/xe/xe_validation.c:62:
+	if (ctx->lock_held_exclusive) {
[...]
+	} else {
[...]

-:2256: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2256: FILE: drivers/gpu/drm/xe/xe_validation.c:74:
+{^I$

-:2283: WARNING:MACRO_ARG_UNUSED: Argument '_a' is not used in function-like macro
#2283: FILE: drivers/gpu/drm/xe/xe_validation.c:101:
+#define xe_validation_contention_injected(_a) (false)

-:2297: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 10)
#2297: FILE: drivers/gpu/drm/xe/xe_validation.c:115:
+	if (ret == -ENOMEM)
+	  pr_info("Shuld retry is false.\n");

-:2299: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2299: FILE: drivers/gpu/drm/xe/xe_validation.c:117:
+^I$

-:2327: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2327: FILE: drivers/gpu/drm/xe/xe_validation.c:145:
+^I$

-:2355: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#2355: FILE: drivers/gpu/drm/xe/xe_validation.h:1:
+#ifndef _XE_VALIDATION_H_

-:2382: CHECK:SPACING: No space is necessary after a cast
#2382: FILE: drivers/gpu/drm/xe/xe_validation.h:28:
+				     (struct drm_exec *) ERR_PTR(-EINVAL))

-:2383: CHECK:SPACING: No space is necessary after a cast
#2383: FILE: drivers/gpu/drm/xe/xe_validation.h:29:
+#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *) ERR_PTR(-EOPNOTSUPP))

-:2385: CHECK:SPACING: No space is necessary after a cast
#2385: FILE: drivers/gpu/drm/xe/xe_validation.h:31:
+			       (struct drm_exec *) ERR_PTR(-ENOMEM))

-:2390: WARNING:MACRO_ARG_UNUSED: Argument '_xe' is not used in function-like macro
#2390: FILE: drivers/gpu/drm/xe/xe_validation.h:36:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:2390: WARNING:MACRO_ARG_UNUSED: Argument '_exec' is not used in function-like macro
#2390: FILE: drivers/gpu/drm/xe/xe_validation.h:36:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:2390: WARNING:MACRO_ARG_UNUSED: Argument '_obj' is not used in function-like macro
#2390: FILE: drivers/gpu/drm/xe/xe_validation.h:36:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:2418: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#2418: FILE: drivers/gpu/drm/xe/xe_validation.h:64:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)

-:2422: ERROR:SPACING: space required before the open parenthesis '('
#2422: FILE: drivers/gpu/drm/xe/xe_validation.h:68:
+	} while(0)

-:2430: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#2430: FILE: drivers/gpu/drm/xe/xe_validation.h:76:
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\

-:2431: WARNING:TABSTOP: Statements should start on a tabstop
#2431: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2431: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2431: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
 	                                                 ^

-:2431: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#2431: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2431: WARNING:BRACES: braces {} are not necessary for single statement blocks
#2431: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:2433: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2433: FILE: drivers/gpu/drm/xe/xe_validation.h:79:
+	       _ret ? NULL : _ctx;}),					\
 	                         ^

-:2436: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#2436: FILE: drivers/gpu/drm/xe/xe_validation.h:82:
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \

-:2437: ERROR:SPACING: space required after that ';' (ctx:VxV)
#2437: FILE: drivers/gpu/drm/xe/xe_validation.h:83:
+{return *_T;}
            ^

-:2439: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2439: FILE: drivers/gpu/drm/xe/xe_validation.h:85:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:2439: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#2439: FILE: drivers/gpu/drm/xe/xe_validation.h:85:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:2598: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2598: FILE: drivers/gpu/drm/xe/xe_vm.c:1018:
+^I$

-:2653: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2653: FILE: drivers/gpu/drm/xe/xe_vm.c:1261:
+^I^I^Ivm->scratch_pt[id][i] = NULL;^I^I^I$

-:2677: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2677: FILE: drivers/gpu/drm/xe/xe_vm.c:1305:
+^I$

-:2698: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2698: FILE: drivers/gpu/drm/xe/xe_vm.c:1371:
+^I^I$

-:2714: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2714: FILE: drivers/gpu/drm/xe/xe_vm.c:1381:
+			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
+				&exec);

-:2843: ERROR:SPACING: space required before the open parenthesis '('
#2843: FILE: drivers/gpu/drm/xe/xe_vm.c:2167:
+			if(IS_ERR(vma))

-:2956: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2956: FILE: drivers/gpu/drm/xe/xe_vm.c:3325:
+^I$

-:2973: ERROR:TRAILING_WHITESPACE: trailing whitespace
#2973: FILE: drivers/gpu/drm/xe/xe_vm.c:3342:
+^Idma_resv_unlock(xe_vm_resv(vm));^I$

total: 21 errors, 42 warnings, 7 checks, 2562 lines checked


