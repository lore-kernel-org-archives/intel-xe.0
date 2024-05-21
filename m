Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492A7C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 07:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80C910E22B;
	Tue, 21 May 2024 07:24:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313C110E22B;
 Tue, 21 May 2024 07:24:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_TTM_shrinker_helpers_and_?=
 =?utf-8?q?xe_buffer_object_shrinker_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 07:24:35 -0000
Message-ID: <171627627519.2162155.3693446356398399207@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM shrinker helpers and xe buffer object shrinker (rev3)
URL   : https://patchwork.freedesktop.org/series/131815/
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
commit a2a83023383e589ca5cd9014b7774e114c72113c
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue May 21 09:16:39 2024 +0200

    drm/xe: Initial support for drm exec locking during validate
    
    Initial stab at converting xe_bo validation to drm_exec locking
    where it matters most. (Low hanging fruit). For a couple of call
    sites as well as for bo allocation, the passing down the call
    chaing of the drm_exec object may turn out a bit tricky.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 3addfb8584a4fcbff8123461682e5bdfd8785bde drm-intel
d85889a69853 drm/ttm: Allow TTM LRU list nodes of different types
66041a5863ae drm/ttm: Slightly clean up LRU list iteration
82429235b0b1 drm/ttm: Use LRU hitches
05e808ddb479 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
4213221743ab drm/ttm: Provide a generic LRU walker helper
b500130e527c drm/ttm: Use the LRU walker helper for swapping
d5efbff5f8ab drm/ttm: Use the LRU walker for eviction
1c357d0a5a46 drm/ttm: Add a virtual base class for graphics memory backup
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 281 lines checked
80a0fd8242ae drm/ttm/pool: Provide a helper to shrink pages
cae6f8df5cbd drm/ttm: Use fault-injection to test error paths
-:28: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#28: FILE: drivers/gpu/drm/Kconfig:261:
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
38b0b3dbbb42 drm/ttm, drm/xe: Add a shrinker for xe bos
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:615: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#615: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 773 lines checked
e95dfa47c33a dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
5b3e84b60efb drm/exec: Rework contended locking
-:596: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#596: FILE: include/drm/drm_exec.h:125:
+#define drm_exec_retry_on_contention(exec, _ret)			\
+	({								\
+		struct drm_exec *__exec = (exec);			\
+		int __ret = (_ret);					\
+									\
+		if (unlikely(drm_exec_is_contended(__exec))) {		\
+			WARN_ON(__ret != -EDEADLK);			\
+			__ret = drm_exec_handle_contended(__exec);	\
+			if (!__ret)					\
+				goto *__drm_exec_retry_ptr;		\
+		}							\
+		__ret;							\
+	})

total: 0 errors, 1 warnings, 0 checks, 472 lines checked
6a5fa5c482ca drm/exec: Introduce a drm_exec_trylock_obj() function
ea2f6c762e28 drm/exec: Add a snapshot capability
2aa04d5b57e8 drm/exec: Introduce an evict mode
905c698fe3c3 drm/ttm: Support drm_exec locking for eviction and swapping
88faea843270 drm/ttm: Convert ttm vm to using drm_exec
b171e6399324 drm/xe: Use drm_exec for fault locking
d7975d8efd8c drm/ttm: Use drm_exec_trylock for bo initialization
a2a83023383e drm/xe: Initial support for drm exec locking during validate


