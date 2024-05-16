Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3480BC25B7A
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 06:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E864A10E37F;
	Thu, 16 May 2024 06:50:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0474B10E37F;
 Thu, 16 May 2024 06:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe_bo_shrinker_and_exhaus?=
 =?utf-8?q?tive_eviction_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 06:50:22 -0000
Message-ID: <171584222201.2120341.14821536882666249536@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516064410.22151-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240516064410.22151-1-thomas.hellstrom@linux.intel.com>
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

Series: xe bo shrinker and exhaustive eviction (rev3)
URL   : https://patchwork.freedesktop.org/series/133643/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1e1640bbe371a93de3073dda07ecb665dea1c51f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu May 16 08:44:09 2024 +0200

    drm/xe: Initial support for drm exec locking during validate.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3 drm-intel
27acc2083fb8 drm/ttm: Allow TTM LRU list nodes of different types
70d8a80369b4 drm/ttm: Slightly clean up LRU list iteration
186ae11b6763 drm/ttm: Use LRU hitches
ed6090e548fe drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
ce01a671e3ae drm/exec: Rework contended locking
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:436: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'exec' - possible side-effects?
#436: FILE: include/drm/drm_exec.h:122:
+#define drm_exec_retry_on_contention(exec, _ret)		\
+	({							\
+		int __ret = (_ret);				\
+								\
+		if (unlikely(drm_exec_is_contended(exec))) {		\
+			WARN_ON(__ret != -EDEADLK);			\
+			__ret = drm_exec_handle_contended(exec);	\
+			if (!__ret)					\
+				goto *__drm_exec_retry_ptr;		\
+		}							\
+		__ret;						\
+	})

-:436: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#436: FILE: include/drm/drm_exec.h:122:
+#define drm_exec_retry_on_contention(exec, _ret)		\
+	({							\
+		int __ret = (_ret);				\
+								\
+		if (unlikely(drm_exec_is_contended(exec))) {		\
+			WARN_ON(__ret != -EDEADLK);			\
+			__ret = drm_exec_handle_contended(exec);	\
+			if (!__ret)					\
+				goto *__drm_exec_retry_ptr;		\
+		}							\
+		__ret;						\
+	})

total: 0 errors, 2 warnings, 1 checks, 356 lines checked
35802f8f7e9b drm/ttm: Provide a generic LRU walker helper
5c9c507aa2d8 drm/ttm: Use restartable LRU and sleeping locks for swapping.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 184 lines checked
155e1484f104 drm/ttm: sleeping evict lock.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 443 lines checked
720f4f49d967 drm/ttm: Add a virtual base class for graphics memory backup
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 281 lines checked
40fdaccdad4b drm/ttm/pool: Provide a helper to shrink pages.
4d4e39087c79 drm/ttm: Use fault-injection to test error paths
-:27: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#27: FILE: drivers/gpu/drm/Kconfig:261:
+config DRM_TTM_BACKUP_FAULT_INJECT
+	bool "Enable fault injection during TTM backup"
+	depends on DRM_TTM
+	default n
+	help
+	  Inject recoverable failures during TTM backup and recovery of
+	  backed-up objects. For DRM driver developers only.
+
+	  If in doubt, choose N.
+

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
479722a36387 drm/ttm, drm/xe: Add a shrinker for xe bos
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:616: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#616: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 781 lines checked
b5961624445a dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
b95dc6018fe5 drm/exec: drm_exec_trylock()
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
63daf836316f drm/exec: Add a snapshot capability.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 83 lines checked
7871891b04f3 drm/exec: Introduce an evict mode
213ef833c1bd drm/ttm: Support drm_exec locking for eviction and swapping
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 202 lines checked
edec8c35c136 drm/ttm: Convert ttm vm to using drm_exec.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 302 lines checked
27e80221cf4e drm/xe: Use drm_exec for fault locking
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 60 lines checked
d7f4b43b1d8b drm/ttm: Use drm_exec_trylock for bo initialization
1e1640bbe371 drm/xe: Initial support for drm exec locking during validate.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 142 lines checked


