Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8293AC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 10:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6D10E066;
	Tue, 28 May 2024 10:03:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9081010E066;
 Tue, 28 May 2024 10:02:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe_bo_shrinker_and_exhaus?=
 =?utf-8?q?tive_eviction_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 10:02:58 -0000
Message-ID: <171689057859.2215486.3690846548743930450@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
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

Series: xe bo shrinker and exhaustive eviction (rev6)
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
commit 4dc9c7de02d5bc2b0f9e9605333e0e91df03b532
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue May 28 11:55:02 2024 +0200

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
+ /mt/dim checkpatch d5a91a6622c61387b1e0886b1b224ef60f03289c drm-intel
2f454ab22707 drm/ttm: Allow TTM LRU list nodes of different types
fd16bbeceaad drm/ttm: Slightly clean up LRU list iteration
0081342dffdb drm/ttm: Use LRU hitches
c01049e0fa41 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
c97d519977b6 drm/ttm: Provide a generic LRU walker helper
64c9d3b5e426 drm/ttm: Use the LRU walker helper for swapping
15c711210d56 drm/ttm: Use the LRU walker for eviction
9d48e0c315db drm/ttm: Add a virtual base class for graphics memory backup
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
e3838f97c1f6 drm/ttm/pool: Provide a helper to shrink pages
e98374412827 drm/ttm: Use fault-injection to test error paths
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
09fc2521015a drm/ttm, drm/xe: Add a shrinker for xe bos
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
68f9cad8ee36 dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
ed363f832126 drm/exec: Add a snapshot capability
7bc9d2300855 drm/exec: Introduce an evict mode
b459dc430b55 drm/ttm: Support drm_exec locking for eviction and swapping
8e82ce98f827 drm/ttm: Convert ttm vm to using drm_exec
0a39e0e01118 drm/xe: Use drm_exec for fault locking
a2d07f235c7d drm/exec: Introduce drm_exec_sanitize_for_trylock
e843638a4b81 drm/ttm: Use drm_exec_trylock for bo initialization
4dc9c7de02d5 drm/xe: Initial support for drm exec locking during validate


