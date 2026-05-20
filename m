Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5F4CD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 10:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D71C10EFEB;
	Wed, 20 May 2026 10:23:03 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14110EFEB;
 Wed, 20 May 2026 10:23:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/exec=3A_drm=5Fexec_po?=
 =?utf-8?q?lishing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 May 2026 10:23:02 -0000
Message-ID: <177927258262.89640.840885257539173557@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/exec: drm_exec polishing (rev2)
URL   : https://patchwork.freedesktop.org/series/164149/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b1fe12b99eb11c5a5dc2f065129b1289eddd5432
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed May 20 12:16:16 2026 +0200

    drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct drm_exec::ticket
    
    Drivers were accessing this drm_exec member directly.
    While that may seem harmless, it will require action if
    the drm_exec utility is made a subclass of a dma-resv transaction
    utility as outlined in the cover-letter.
    
    Provide an accessor, drm_exec_ticket() to avoid that.
    
    v2:
    - Fix amdgpu compile error (Intel CI)
    - Update the commit message.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 7d39df83e93eba14a23b1fb6ffff076eb191f27b drm-intel
b208eb1dab03 drm/exec: Remove the index parameter from drm_exec_for_each_locked_obj[_reverse]
-:17: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#17: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:173: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__index' - possible side-effects?
#173: FILE: include/drm/drm_exec.h:69:
+#define __drm_exec_for_each_locked_object(exec, obj, __index)		\
+	for (unsigned long __index = 0; ((obj) = drm_exec_obj(exec, __index)); ++__index)

-:189: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'exec' - possible side-effects?
#189: FILE: include/drm/drm_exec.h:82:
+#define __drm_exec_for_each_locked_object_reverse(exec, obj, __index)	\
+	for (unsigned long __index = (exec)->num_objects - 1;		\
+	     ((obj) = drm_exec_obj(exec, __index)); --__index)

-:189: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__index' - possible side-effects?
#189: FILE: include/drm/drm_exec.h:82:
+#define __drm_exec_for_each_locked_object_reverse(exec, obj, __index)	\
+	for (unsigned long __index = (exec)->num_objects - 1;		\
+	     ((obj) = drm_exec_obj(exec, __index)); --__index)

total: 0 errors, 1 warnings, 3 checks, 153 lines checked
4cf0062dd99c drm/exec: Make the drm_exec_until_all_locked() macro more readable
-:36: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#36: FILE: include/drm/drm_exec.h:104:
+#define __drm_exec_until_all_locked(exec, _label)			 \
+_label:									 \
+	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
+	     drm_exec_cleanup(exec);)

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

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_label' - possible side-effects?
#36: FILE: include/drm/drm_exec.h:104:
+#define __drm_exec_until_all_locked(exec, _label)			 \
+_label:									 \
+	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
+	     drm_exec_cleanup(exec);)

-:37: ERROR:SPACING: spaces required around that ':' (ctx:VxE)
#37: FILE: include/drm/drm_exec.h:105:
+_label:									 \
       ^

total: 2 errors, 0 warnings, 1 checks, 35 lines checked
995c8176cc20 drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
-:80: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#80: FILE: include/drm/drm_exec.h:158:
+#define drm_exec_retry(_exec)					\
+	do {							\
+		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
+		goto *__drm_exec_retry_ptr;			\
+	} while (0)

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
b1fe12b99eb1 drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct drm_exec::ticket


