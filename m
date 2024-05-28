Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38EEC25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C896112269;
	Tue, 28 May 2024 12:41:16 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321C112269;
 Tue, 28 May 2024 12:41:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe_bo_shrinker_and_exhaus?=
 =?utf-8?q?tive_eviction_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 12:41:13 -0000
Message-ID: <171690007379.2216238.17628627092794596764@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

Series: xe bo shrinker and exhaustive eviction (rev7)
URL   : https://patchwork.freedesktop.org/series/133643/
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
commit 71132e2183a0214d9ccf60a325d221fb43b021df
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue May 28 14:33:43 2024 +0200

    HAX: drm/tests: Add a missing Kconfig select
    
    Fix the following warning:
    
    WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
      Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
      Selected by [y]:
      - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 5ba74aaea55bf295898f2a4f69c59fe12e84e842 drm-intel
e6e0b5f844dd drm/ttm: Allow TTM LRU list nodes of different types
bed3d57bf2a7 drm/ttm: Slightly clean up LRU list iteration
184af427bb7e drm/ttm: Use LRU hitches
97ff8cdda318 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
48a89a6f2cf5 drm/ttm: Provide a generic LRU walker helper
7f65fdc60a3f drm/ttm: Use the LRU walker helper for swapping
fa4adcf0f5fa drm/ttm: Use the LRU walker for eviction
8d3faa234db0 drm/ttm: Add a virtual base class for graphics memory backup
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
324b663e059e drm/ttm/pool: Provide a helper to shrink pages
db6412bcbfcc drm/ttm: Use fault-injection to test error paths
-:28: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#28: FILE: drivers/gpu/drm/Kconfig:262:
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
732c4416a4ae drm/ttm, drm/xe: Add a shrinker for xe bos
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
3592bbd5af91 dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
fe34478346ca drm/exec: Add a snapshot capability
59aff7b15d09 drm/exec: Introduce an evict mode
8a4a9565bd8b drm/ttm: Support drm_exec locking for eviction and swapping
8c58f4ac7915 drm/ttm: Convert ttm vm to using drm_exec
63b01d25220b drm/xe: Use drm_exec for fault locking
f5587d333983 drm/exec: Introduce drm_exec_sanitize_for_trylock
d8f86a9396b4 drm/ttm: Use drm_exec_trylock for bo initialization
a7ca3f8bed13 drm/xe: Initial support for drm exec locking during validate
7423e211eaf2 HAX: Add a missing include
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
71132e2183a0 HAX: drm/tests: Add a missing Kconfig select


