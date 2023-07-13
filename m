Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A937CC001E0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 14:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548A410E6EA;
	Thu, 13 Jul 2023 14:19:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77CAE10E6EA;
 Thu, 13 Jul 2023 14:19:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 73E13AADED;
 Thu, 13 Jul 2023 14:19:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 13 Jul 2023 14:19:00 -0000
Message-ID: <168925794047.14985.4024260177048770790@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230713131711.7-1-francois.dugast@intel.com>
In-Reply-To: <20230713131711.7-1-francois.dugast@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/120675/
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
commit e1397169e05dcfd3a11de1fcde23c0930f27030a
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Jul 13 13:17:11 2023 +0000

    drm/xe: switch to using drm_exec
    
    Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
    
    v2:
    - Call dma-resv locking functions directly in xe_bo_lock and
      xe_vm_lock functions (Matthew Brost)
    - Switch to execution context for GEM buffers v7 (Christian König)
    - Use DRM_EXEC_INTERRUPTIBLE_WAIT
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch ccde558371c92a1f8b3707fe7cf274e388c434dd drm-intel
0f1a124b2 drm: execution context for GEM buffers v7
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:87: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#87: 
new file mode 100644

-:359: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#359: FILE: drivers/gpu/drm/drm_exec.c:268:
+
+	}

-:450: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#450: FILE: include/drm/drm_exec.h:20:
+	uint32_t		flags;

-:491: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'exec' - possible side-effects?
#491: FILE: include/drm/drm_exec.h:61:
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])

-:491: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'index' - possible side-effects?
#491: FILE: include/drm/drm_exec.h:61:
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])

-:491: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'obj' - possible side-effects?
#491: FILE: include/drm/drm_exec.h:61:
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])

-:523: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#523: FILE: include/drm/drm_exec.h:93:
+#define drm_exec_retry_on_contention(exec)			\
+	do {							\
+		if (unlikely(drm_exec_is_contended(exec)))	\
+			goto *__drm_exec_retry_ptr;		\
+	} while (0)

total: 0 errors, 2 warnings, 5 checks, 494 lines checked
e1397169e drm/xe: switch to using drm_exec


