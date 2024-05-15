Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD193C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CDE10E198;
	Wed, 15 May 2024 08:21:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE8110E198;
 Wed, 15 May 2024 08:21:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe_bo_shrinker_and_exhaus?=
 =?utf-8?q?tive_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 08:21:18 -0000
Message-ID: <171576127845.2117003.9492155564511915634@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
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

Series: xe bo shrinker and exhaustive eviction
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
commit 68e09f69bcf4a607a7d92b0d28582e443c164b0a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed May 15 10:14:49 2024 +0200

    drm/xe: Initial support for drm exec locking during validate.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 081474425a80ae4c77e1bd839f69d349624acfcb drm-intel
1949070804d4 drm/ttm: Allow TTM LRU list nodes of different types
ec3db6fb6649 drm/ttm: Slightly clean up LRU list iteration
226ddbff0f9f drm/ttm: Use LRU hitches
0751b3d9408e drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
76ec0bdf6db4 drm/exec: Rework contended locking
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
250a5913b056 drm/ttm: Provide a generic LRU walker helper
-:128: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#128: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:867:
+long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
+			       struct ttm_resource_manager *man, long target)

-:141: ERROR:TRAILING_WHITESPACE: trailing whitespace
#141: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:880:
+^I^I$

total: 1 errors, 0 warnings, 1 checks, 203 lines checked
fcb474397125 drm/ttm: Use restartable LRU and sleeping locks for swapping.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:21: CHECK:LINE_SPACING: Please don't use multiple blank lines
#21: FILE: drivers/gpu/drm/ttm/ttm_bo.c:1121:
 
+

-:148: ERROR:TRAILING_WHITESPACE: trailing whitespace
#148: FILE: drivers/gpu/drm/ttm/ttm_bo.c:1232:
+^I$

total: 1 errors, 1 warnings, 1 checks, 187 lines checked
8585d9d5d568 drm/ttm: sleeping evict lock.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:142: ERROR:TRAILING_WHITESPACE: trailing whitespace
#142: FILE: drivers/gpu/drm/ttm/ttm_bo.c:441:
+^I$

-:168: ERROR:TRAILING_WHITESPACE: trailing whitespace
#168: FILE: drivers/gpu/drm/ttm/ttm_bo.c:460:
+^I} else {^I$

-:177: ERROR:TRAILING_WHITESPACE: trailing whitespace
#177: FILE: drivers/gpu/drm/ttm/ttm_bo.c:468:
+^I$

-:183: ERROR:TRAILING_WHITESPACE: trailing whitespace
#183: FILE: drivers/gpu/drm/ttm/ttm_bo.c:474:
+^I^I$

-:225: ERROR:TRAILING_WHITESPACE: trailing whitespace
#225: FILE: drivers/gpu/drm/ttm/ttm_bo.c:496:
+^I} else {^I$

-:244: ERROR:TRAILING_WHITESPACE: trailing whitespace
#244: FILE: drivers/gpu/drm/ttm/ttm_bo.c:507:
+^Iif (lret == 0) $

-:251: ERROR:TRAILING_WHITESPACE: trailing whitespace
#251: FILE: drivers/gpu/drm/ttm/ttm_bo.c:514:
+^I$

-:384: ERROR:TRAILING_WHITESPACE: trailing whitespace
#384: FILE: drivers/gpu/drm/ttm/ttm_bo.c:683:
+^I^I^I^Ireturn ret;^I^I$

-:461: ERROR:TRAILING_WHITESPACE: trailing whitespace
#461: FILE: drivers/gpu/drm/ttm/ttm_resource.c:516:
+^I$

total: 9 errors, 1 warnings, 0 checks, 448 lines checked
e67a160714e8 drm/ttm: Add a virtual base class for graphics memory backup
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
1e5a33ca03e1 drm/ttm/pool: Provide a helper to shrink pages.
148e233cd195 drm/ttm: Use fault-injection to test error paths
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
f8a7b96a43cf drm/ttm, drm/xe: Add a shrinker for xe bos
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
a4c0e1140cf1 dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
-:24: CHECK:LINE_SPACING: Please don't use multiple blank lines
#24: FILE: include/linux/dma-resv.h:408:
 
+

total: 0 errors, 0 warnings, 1 checks, 37 lines checked
3bc22a0e858d drm/exec: drm_exec_trylock()
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
0ae484121d18 drm/exec: Add a snapshot capability.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:52: ERROR:TRAILING_WHITESPACE: trailing whitespace
#52: FILE: drivers/gpu/drm/drm_exec.c:403:
+^I$

-:67: ERROR:TRAILING_WHITESPACE: trailing whitespace
#67: FILE: drivers/gpu/drm/drm_exec.c:418:
+^Iexec->snap = snap;^I$

-:103: CHECK:LINE_SPACING: Please don't use multiple blank lines
#103: FILE: include/drm/drm_exec.h:153:
 
+

total: 2 errors, 1 warnings, 1 checks, 91 lines checked
5b809fce6c70 drm/exec: Introduce an evict mode
-:72: CHECK:SPACING: No space is necessary after a cast
#72: FILE: drivers/gpu/drm/drm_exec.c:150:
+	return (unsigned long) resv / __alignof__(typeof(*resv));

-:107: CHECK:SPACING: No space is necessary after a cast
#107: FILE: drivers/gpu/drm/drm_exec.c:197:
+		(void) xa_store(&exec->resv_set, drm_exec_resv_to_key(obj->resv),

total: 0 errors, 0 warnings, 2 checks, 177 lines checked
9149eb40e039 drm/ttm: Support drm_exec locking for eviction and swapping
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:51: ERROR:TRAILING_WHITESPACE: trailing whitespace
#51: FILE: drivers/gpu/drm/ttm/ttm_bo.c:779:
+  $

-:51: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#51: FILE: drivers/gpu/drm/ttm/ttm_bo.c:779:
+  $

-:186: ERROR:CODE_INDENT: code indent should use tabs where possible
#186: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:926:
+^I^I^I        lret = ttm_lru_walk_execlock(walk, bo);$

-:236: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 3 errors, 2 warnings, 0 checks, 202 lines checked
d0efc8ac555a drm/ttm: Convert ttm vm to using drm_exec.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:266: ERROR:TRAILING_WHITESPACE: trailing whitespace
#266: FILE: drivers/gpu/drm/ttm/ttm_bo_vm.c:354:
+^I$

total: 1 errors, 1 warnings, 0 checks, 302 lines checked
8358cfdb1fc6 drm/xe: Use drm_exec for fault locking
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 60 lines checked
a2761e1cb02c drm/ttm: Use drm_exec_trylock for bo initialization
68e09f69bcf4 drm/xe: Initial support for drm exec locking during validate.
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 142 lines checked


