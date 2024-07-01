Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EFCC2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 14:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716AC10E3F4;
	Mon,  1 Jul 2024 14:11:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FEB10E272;
 Mon,  1 Jul 2024 14:11:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_lean_exhaustive?=
 =?utf-8?q?_eviction_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 14:11:11 -0000
Message-ID: <171984307108.2381.8288521382514325159@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701080327.3191-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240701080327.3191-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: lean exhaustive eviction (rev3)
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
commit d1f46c139b9ca9425b1b5257e9f15e2d7eaa57d2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jul 1 10:03:27 2024 +0200

    drm/xe: lean exhaustive eviction
    
    Squashed commit of the following:
    
    commit c4e2b30d79c7755e00c34b050e583b010c06c020
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe/validation: Convert xe_dma_buf.c
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 019217eae23d0b9b203f102042b58f7641eb668f
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/exec/validation: Convert __xe_pin_fb_vma()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit d327e08da277b2ff2e6f850b0aea8dc3e4726364
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Conversion of the fault handler to support drm_exec locking
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 8eb1ff3fd98305dcf54323d42b09f1322cc9ebac
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 10:49:56 2024 +0200
    
        drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 829afeebe4ca21c4a05ce73bd4e43dea4eafd306
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 1baa5f7987a3716349f895c545a684cffb2257fa
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 14:41:01 2024 +0200
    
        drm/xe: Ensure we pass down the drm_exec context to validation
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 318f2adce57a0dfdc58525377291b27ce093787b
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
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
d1f46c139b9c drm/xe: lean exhaustive eviction
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c4e2b30d79c7755e00c34b050e583b010c06c020', maybe rebased or not pulled?
#11: 
commit c4e2b30d79c7755e00c34b050e583b010c06c020

-:17: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#17: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:25: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#25: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:25: WARNING:BAD_SIGN_OFF: Duplicate signature
#25: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:33: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#33: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:33: WARNING:BAD_SIGN_OFF: Duplicate signature
#33: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:41: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#41: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:41: WARNING:BAD_SIGN_OFF: Duplicate signature
#41: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:49: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#49: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:49: WARNING:BAD_SIGN_OFF: Duplicate signature
#49: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:57: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#57: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:57: WARNING:BAD_SIGN_OFF: Duplicate signature
#57: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:71: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#71: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:71: WARNING:BAD_SIGN_OFF: Duplicate signature
#71: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:74: WARNING:BAD_SIGN_OFF: Duplicate signature
#74: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:507: ERROR:TRAILING_WHITESPACE: trailing whitespace
#507: FILE: drivers/gpu/drm/xe/xe_bo.c:1503:
+^I^I^I^I^I^I flags | XE_BO_FLAG_USER, exec);^I$

-:712: ERROR:TRAILING_WHITESPACE: trailing whitespace
#712: FILE: drivers/gpu/drm/xe/xe_device_types.h:482:
+  $

-:712: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#712: FILE: drivers/gpu/drm/xe/xe_device_types.h:482:
+  $

-:794: CHECK:SPACING: No space is necessary after a cast
#794: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:189:
+	(void) ret;

-:823: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#823: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:246:
+		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
 				    0, /* Will require 1way or 2way for vm_bind */

-:1080: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1080: 
new file mode 100644

-:1085: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#1085: FILE: drivers/gpu/drm/xe/xe_validation.c:1:
+#include <drm/drm_exec.h>

-:1098: ERROR:SPACING: space required before the open parenthesis '('
#1098: FILE: drivers/gpu/drm/xe/xe_validation.c:14:
+		switch(PTR_ERR(exec)) {

-:1137: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1137: FILE: drivers/gpu/drm/xe/xe_validation.c:53:
+^I$

-:1146: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#1146: FILE: drivers/gpu/drm/xe/xe_validation.c:62:
+	if (ctx->lock_held_exclusive) {
[...]
+	} else {
[...]

-:1158: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1158: FILE: drivers/gpu/drm/xe/xe_validation.c:74:
+{^I$

-:1185: WARNING:MACRO_ARG_UNUSED: Argument '_a' is not used in function-like macro
#1185: FILE: drivers/gpu/drm/xe/xe_validation.c:101:
+#define xe_validation_contention_injected(_a) (false)

-:1199: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 10)
#1199: FILE: drivers/gpu/drm/xe/xe_validation.c:115:
+	if (ret == -ENOMEM)
+	  pr_info("Shuld retry is false.\n");

-:1201: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1201: FILE: drivers/gpu/drm/xe/xe_validation.c:117:
+^I$

-:1229: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1229: FILE: drivers/gpu/drm/xe/xe_validation.c:145:
+^I$

-:1257: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#1257: FILE: drivers/gpu/drm/xe/xe_validation.h:1:
+#ifndef _XE_VALIDATION_H_

-:1284: CHECK:SPACING: No space is necessary after a cast
#1284: FILE: drivers/gpu/drm/xe/xe_validation.h:28:
+				     (struct drm_exec *) ERR_PTR(-EINVAL))

-:1285: CHECK:SPACING: No space is necessary after a cast
#1285: FILE: drivers/gpu/drm/xe/xe_validation.h:29:
+#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *) ERR_PTR(-EOPNOTSUPP))

-:1287: CHECK:SPACING: No space is necessary after a cast
#1287: FILE: drivers/gpu/drm/xe/xe_validation.h:31:
+			       (struct drm_exec *) ERR_PTR(-ENOMEM))

-:1292: WARNING:MACRO_ARG_UNUSED: Argument '_xe' is not used in function-like macro
#1292: FILE: drivers/gpu/drm/xe/xe_validation.h:36:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:1292: WARNING:MACRO_ARG_UNUSED: Argument '_exec' is not used in function-like macro
#1292: FILE: drivers/gpu/drm/xe/xe_validation.h:36:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:1292: WARNING:MACRO_ARG_UNUSED: Argument '_obj' is not used in function-like macro
#1292: FILE: drivers/gpu/drm/xe/xe_validation.h:36:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:1320: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#1320: FILE: drivers/gpu/drm/xe/xe_validation.h:64:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)

-:1324: ERROR:SPACING: space required before the open parenthesis '('
#1324: FILE: drivers/gpu/drm/xe/xe_validation.h:68:
+	} while(0)

-:1332: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#1332: FILE: drivers/gpu/drm/xe/xe_validation.h:76:
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\

-:1333: WARNING:TABSTOP: Statements should start on a tabstop
#1333: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:1333: ERROR:SPACING: space required after that ';' (ctx:VxV)
#1333: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
 	                                                 ^

-:1333: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#1333: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:1333: WARNING:BRACES: braces {} are not necessary for single statement blocks
#1333: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:1335: ERROR:SPACING: space required after that ';' (ctx:VxV)
#1335: FILE: drivers/gpu/drm/xe/xe_validation.h:79:
+	       _ret ? NULL : _ctx;}),					\
 	                         ^

-:1338: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#1338: FILE: drivers/gpu/drm/xe/xe_validation.h:82:
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \

-:1339: ERROR:SPACING: space required after that ';' (ctx:VxV)
#1339: FILE: drivers/gpu/drm/xe/xe_validation.h:83:
+{return *_T;}
            ^

-:1341: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1341: FILE: drivers/gpu/drm/xe/xe_validation.h:85:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:1341: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#1341: FILE: drivers/gpu/drm/xe/xe_validation.h:85:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:1488: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1488: FILE: drivers/gpu/drm/xe/xe_vm.c:1013:
+^I$

-:1550: ERROR:SPACING: space required before the open parenthesis '('
#1550: FILE: drivers/gpu/drm/xe/xe_vm.c:2135:
+			if(IS_ERR(vma))

-:1664: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1664: FILE: drivers/gpu/drm/xe/xe_vm.c:3294:
+^I$

-:1685: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1685: FILE: drivers/gpu/drm/xe/xe_vm.c:3315:
+^Idma_resv_unlock(xe_vm_resv(vm));^I$

total: 17 errors, 30 warnings, 6 checks, 1455 lines checked


