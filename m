Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212FAC3064D
	for <intel-xe@archiver.kernel.org>; Sun, 30 Jun 2024 18:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87C810E12A;
	Sun, 30 Jun 2024 18:52:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AECF10E12A;
 Sun, 30 Jun 2024 18:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_lean_exhaustive?=
 =?utf-8?q?_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 30 Jun 2024 18:52:08 -0000
Message-ID: <171977352863.459.11324989805229348284@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240630184727.3417-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240630184727.3417-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: lean exhaustive eviction
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
commit 0480a5fc499ee5897e5c18b0696fda2070416848
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 20:47:27 2024 +0200

    drm/xe: lean exhaustive eviction
    
    commit 5357af50a1b78fadda5e1e20877013acbb24e04a
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:33:28 2024 +0200
    
        drm/xe/validation: Convert xe_dma_buf.c
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 30de29f95db9fe44bbc585dd79d437cea176e93a
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Sun Jun 30 16:05:42 2024 +0200
    
        drm/exec/validation: Convert __xe_pin_fb_vma()
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit ccb41e356f921de76dd7711dafd4cacd53759228
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 17:13:13 2024 +0200
    
        drm/xe: Conversion of the fault handler to support drm_exec locking
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit fd6f65f32c604bae16d985cff7a8a6420ac29bd1
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 10:49:56 2024 +0200
    
        drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit 34a5bf5ed7af30867d593087d330d2f605201fc6
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 09:30:31 2024 +0200
    
        drm/xe: Introduce an xe_validation wrapper around drm_exec
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    commit a49dd561cc65cf183332e8681560772dcee85490
    Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Date:   Wed Jun 12 14:41:01 2024 +0200
    
        drm/xe: Ensure we pass down the drm_exec context to validation
    
        Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    
    Test-with: 20240630180502.81556-1-thomas.hellstrom@linux.intel.com
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
0480a5fc499e drm/xe: lean exhaustive eviction
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5357af50a1b78fadda5e1e20877013acbb24e04a', maybe rebased or not pulled?
#9: 
commit 5357af50a1b78fadda5e1e20877013acbb24e04a

-:15: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#15: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:23: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#23: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:23: WARNING:BAD_SIGN_OFF: Duplicate signature
#23: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:31: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#31: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:31: WARNING:BAD_SIGN_OFF: Duplicate signature
#31: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:39: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#39: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:39: WARNING:BAD_SIGN_OFF: Duplicate signature
#39: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:47: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#47: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:47: WARNING:BAD_SIGN_OFF: Duplicate signature
#47: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:55: WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#55: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:55: WARNING:BAD_SIGN_OFF: Duplicate signature
#55: 
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:58: WARNING:BAD_SIGN_OFF: Duplicate signature
#58: 
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-:465: ERROR:TRAILING_WHITESPACE: trailing whitespace
#465: FILE: drivers/gpu/drm/xe/xe_bo.c:1503:
+^I^I^I^I^I^I flags | XE_BO_FLAG_USER, exec);^I$

-:670: ERROR:TRAILING_WHITESPACE: trailing whitespace
#670: FILE: drivers/gpu/drm/xe/xe_device_types.h:482:
+  $

-:670: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#670: FILE: drivers/gpu/drm/xe/xe_device_types.h:482:
+  $

-:752: CHECK:SPACING: No space is necessary after a cast
#752: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:189:
+	(void) ret;

-:781: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#781: FILE: drivers/gpu/drm/xe/xe_dma_buf.c:246:
+		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
 				    0, /* Will require 1way or 2way for vm_bind */

-:1038: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1038: 
new file mode 100644

-:1043: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#1043: FILE: drivers/gpu/drm/xe/xe_validation.c:1:
+#include <drm/drm_exec.h>

-:1056: ERROR:SPACING: space required before the open parenthesis '('
#1056: FILE: drivers/gpu/drm/xe/xe_validation.c:14:
+		switch(PTR_ERR(exec)) {

-:1099: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1099: FILE: drivers/gpu/drm/xe/xe_validation.c:57:
+^I$

-:1108: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#1108: FILE: drivers/gpu/drm/xe/xe_validation.c:66:
+	if (ctx->lock_held_exclusive) {
[...]
+	} else {
[...]

-:1120: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1120: FILE: drivers/gpu/drm/xe/xe_validation.c:78:
+{^I$

-:1147: WARNING:MACRO_ARG_UNUSED: Argument '_a' is not used in function-like macro
#1147: FILE: drivers/gpu/drm/xe/xe_validation.c:105:
+#define xe_validation_contention_injected(_a) (false)

-:1161: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 10)
#1161: FILE: drivers/gpu/drm/xe/xe_validation.c:119:
+	if (ret == -ENOMEM)
+	  pr_info("Shuld retry is false.\n");

-:1163: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1163: FILE: drivers/gpu/drm/xe/xe_validation.c:121:
+^I$

-:1191: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1191: FILE: drivers/gpu/drm/xe/xe_validation.c:149:
+^I$

-:1219: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#1219: FILE: drivers/gpu/drm/xe/xe_validation.h:1:
+#ifndef _XE_VALIDATION_H_

-:1240: ERROR:SPACING: space required before the open brace '{'
#1240: FILE: drivers/gpu/drm/xe/xe_validation.h:22:
+#define xe_validation_lockdep() do{} while(0)

-:1240: ERROR:SPACING: space required before the open parenthesis '('
#1240: FILE: drivers/gpu/drm/xe/xe_validation.h:22:
+#define xe_validation_lockdep() do{} while(0)

-:1244: CHECK:SPACING: No space is necessary after a cast
#1244: FILE: drivers/gpu/drm/xe/xe_validation.h:26:
+				     (struct drm_exec *) ERR_PTR(-EINVAL))

-:1245: CHECK:SPACING: No space is necessary after a cast
#1245: FILE: drivers/gpu/drm/xe/xe_validation.h:27:
+#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *) ERR_PTR(-EOPNOTSUPP))

-:1247: CHECK:SPACING: No space is necessary after a cast
#1247: FILE: drivers/gpu/drm/xe/xe_validation.h:29:
+			       (struct drm_exec *) ERR_PTR(-ENOMEM))

-:1252: WARNING:MACRO_ARG_UNUSED: Argument '_xe' is not used in function-like macro
#1252: FILE: drivers/gpu/drm/xe/xe_validation.h:34:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:1252: WARNING:MACRO_ARG_UNUSED: Argument '_exec' is not used in function-like macro
#1252: FILE: drivers/gpu/drm/xe/xe_validation.h:34:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:1252: WARNING:MACRO_ARG_UNUSED: Argument '_obj' is not used in function-like macro
#1252: FILE: drivers/gpu/drm/xe/xe_validation.h:34:
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)

-:1280: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#1280: FILE: drivers/gpu/drm/xe/xe_validation.h:62:
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)

-:1284: ERROR:SPACING: space required before the open parenthesis '('
#1284: FILE: drivers/gpu/drm/xe/xe_validation.h:66:
+	} while(0)

-:1292: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#1292: FILE: drivers/gpu/drm/xe/xe_validation.h:74:
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\

-:1293: WARNING:TABSTOP: Statements should start on a tabstop
#1293: FILE: drivers/gpu/drm/xe/xe_validation.h:75:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:1293: ERROR:SPACING: space required after that ';' (ctx:VxV)
#1293: FILE: drivers/gpu/drm/xe/xe_validation.h:75:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
 	                                                 ^

-:1293: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#1293: FILE: drivers/gpu/drm/xe/xe_validation.h:75:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:1293: WARNING:BRACES: braces {} are not necessary for single statement blocks
#1293: FILE: drivers/gpu/drm/xe/xe_validation.h:75:
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\

-:1295: ERROR:SPACING: space required after that ';' (ctx:VxV)
#1295: FILE: drivers/gpu/drm/xe/xe_validation.h:77:
+	       _ret ? NULL : _ctx;}),					\
 	                         ^

-:1298: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#1298: FILE: drivers/gpu/drm/xe/xe_validation.h:80:
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \

-:1299: ERROR:SPACING: space required after that ';' (ctx:VxV)
#1299: FILE: drivers/gpu/drm/xe/xe_validation.h:81:
+{return *_T;}
            ^

-:1301: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1301: FILE: drivers/gpu/drm/xe/xe_validation.h:83:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:1301: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_exec' - possible side-effects?
#1301: FILE: drivers/gpu/drm/xe/xe_validation.h:83:
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)

-:1448: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1448: FILE: drivers/gpu/drm/xe/xe_vm.c:1013:
+^I$

-:1510: ERROR:SPACING: space required before the open parenthesis '('
#1510: FILE: drivers/gpu/drm/xe/xe_vm.c:2135:
+			if(IS_ERR(vma))

-:1624: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1624: FILE: drivers/gpu/drm/xe/xe_vm.c:3294:
+^I$

-:1645: ERROR:TRAILING_WHITESPACE: trailing whitespace
#1645: FILE: drivers/gpu/drm/xe/xe_vm.c:3315:
+^Idma_resv_unlock(xe_vm_resv(vm));^I$

total: 19 errors, 28 warnings, 6 checks, 1433 lines checked


