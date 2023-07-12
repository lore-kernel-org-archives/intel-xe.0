Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD0EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 16:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C51C10E595;
	Wed, 12 Jul 2023 16:40:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFCAE10E595;
 Wed, 12 Jul 2023 16:40:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A9BEDAADE1;
 Wed, 12 Jul 2023 16:40:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 12 Jul 2023 16:40:45 -0000
Message-ID: <168918004569.17977.11546479783524596270@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230712163740.7-1-francois.dugast@intel.com>
In-Reply-To: <20230712163740.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_switch_to_using_drm=5Fexec?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: switch to using drm_exec
URL   : https://patchwork.freedesktop.org/series/120632/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6e13c4a43eefe33042e7d093d1d5744e267c9707
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Jul 12 16:37:40 2023 +0000

    drm/xe: switch to using drm_exec
    
    Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch d39e49e2ad386bf59f585a05ab659563e0472314 drm-intel
89485e480 drm: execution context for GEM buffers v5
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:TYPO_SPELLING: 'unecessary' may be misspelled - perhaps 'unnecessary'?
#17: 
    overhead is unecessary and measurable.
                ^^^^^^^^^^

-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
new file mode 100644

-:85: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/drm_exec.c', please use '//' instead
#85: FILE: drivers/gpu/drm/drm_exec.c:1:
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */

-:85: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#85: FILE: drivers/gpu/drm/drm_exec.c:1:
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */

-:135: ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#135: FILE: drivers/gpu/drm/drm_exec.c:51:
+#define DRM_EXEC_DUMMY (void*)~0

-:135: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#135: FILE: drivers/gpu/drm/drm_exec.c:51:
+#define DRM_EXEC_DUMMY (void*)~0

-:349: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#349: FILE: drivers/gpu/drm/drm_exec.c:265:
+
+	}

-:440: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#440: FILE: include/drm/drm_exec.h:20:
+	uint32_t		flags;

-:481: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'exec' - possible side-effects?
#481: FILE: include/drm/drm_exec.h:61:
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])

-:481: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'index' - possible side-effects?
#481: FILE: include/drm/drm_exec.h:61:
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])

-:481: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'obj' - possible side-effects?
#481: FILE: include/drm/drm_exec.h:61:
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])

-:512: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects
#512: FILE: include/drm/drm_exec.h:92:
+#define drm_exec_retry_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		goto *__drm_exec_retry_ptr

-:512: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#512: FILE: include/drm/drm_exec.h:92:
+#define drm_exec_retry_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		goto *__drm_exec_retry_ptr

-:540: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 3 errors, 6 warnings, 5 checks, 488 lines checked
6e13c4a43 drm/xe: switch to using drm_exec


