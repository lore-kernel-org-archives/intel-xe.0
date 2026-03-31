Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31C2FF60F9
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 09:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EDA10EA03;
	Tue, 31 Mar 2026 09:49:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986D210EA03;
 Tue, 31 Mar 2026 09:49:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/exec=3A_drm=5Fexec_po?=
 =?utf-8?q?lishing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 31 Mar 2026 09:49:56 -0000
Message-ID: <177495059659.414888.1701863890998175700@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/exec: drm_exec polishing
URL   : https://patchwork.freedesktop.org/series/164149/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4978388be3a8ccb6c16f6764f741cd9e4d95fa21
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Mar 31 11:20:23 2026 +0200

    drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct drm_exec::ticket
    
    Drivers were accessing this drm_exec member directly.
    Provide an accessor, drm_exec_ticket() to avoid that.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d drm-intel
d8a655eae98f drm/exec: Remove the index parameter from drm_exec_for_each_locked_obj[_reverse]
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#14: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#14: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:194: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'exec' - possible side-effects?
#194: FILE: include/drm/drm_exec.h:88:
+#define drm_exec_for_each_locked_object_reverse(exec, obj)	\
+	for (unsigned long _index = (exec)->num_objects - 1;				\
+	     ((obj) = drm_exec_obj(exec, _index)); --_index)

total: 1 errors, 1 warnings, 1 checks, 144 lines checked
4b95193a06e8 drm/msm: Remove abuse of drm_exec internals
-:18: WARNING:BAD_SIGN_OFF: Duplicate signature
#18: 
Acked-by: Christian König <christian.koenig@amd.com>

total: 0 errors, 1 warnings, 0 checks, 29 lines checked
1ecb9d0cbf63 drm/exec: Make the drm_exec_until_all_locked() macro more readable
-:32: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#32: FILE: include/drm/drm_exec.h:98:
+#define __drm_exec_until_all_locked(exec, _label)			\
+_label:									\
+	for (void * __maybe_unused __drm_exec_retry_ptr; ({		\
+		__drm_exec_retry_ptr = &&_label;			\
+		drm_exec_cleanup(exec);					\
+	});)

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

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_label' - possible side-effects?
#32: FILE: include/drm/drm_exec.h:98:
+#define __drm_exec_until_all_locked(exec, _label)			\
+_label:									\
+	for (void * __maybe_unused __drm_exec_retry_ptr; ({		\
+		__drm_exec_retry_ptr = &&_label;			\
+		drm_exec_cleanup(exec);					\
+	});)

-:33: ERROR:SPACING: spaces required around that ':' (ctx:VxE)
#33: FILE: include/drm/drm_exec.h:99:
+_label:									\
       ^

total: 2 errors, 0 warnings, 1 checks, 37 lines checked
ed0cf2d32bd7 drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
-:51: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#51: FILE: include/drm/drm_exec.h:148:
+#define drm_exec_retry(_exec)				\
+	do {						\
+		WARN_ON(!drm_exec_is_contended(_exec)); \
+		goto *__drm_exec_retry_ptr;		\
+	} while (0)

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
4978388be3a8 drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct drm_exec::ticket


