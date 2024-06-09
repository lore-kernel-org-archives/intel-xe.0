Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CDAC27C53
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 19:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6FE10E22D;
	Sun,  9 Jun 2024 19:34:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB1F10E22D;
 Sun,  9 Jun 2024 19:34:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Xe_+_TTM_bo_shrinker_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 09 Jun 2024 19:34:33 -0000
Message-ID: <171796167324.29880.3010445794913443681@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240609192837.77035-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240609192837.77035-1-thomas.hellstrom@linux.intel.com>
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

Series: Xe + TTM bo shrinker (rev3)
URL   : https://patchwork.freedesktop.org/series/134426/
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
commit df58169c1213ae1e82784c002bd6bb3062247ed0
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 9 21:28:37 2024 +0200

    drm/ttm, drm/xe: Add a shrinker for xe bos
    
    Rather than relying on the TTM watermark accounting add a shrinker
    for xe_bos in TT or system memory.
    
    Leverage the newly added TTM per-page shrinking and shmem backup
    support.
    
    Although xe doesn't fully support WONTNEED (purgeable) bos yet,
    introduce and add shrinker support for purgeable ttm_tts.
    
    v2:
    - Cleanups bugfixes and a KUNIT shrinker test.
    - Add writeback support, and activate if kswapd.
    v3:
    - Move the try_shrink() helper to core TTM.
    - Minor cleanups.
    v4:
    - Add runtime pm for the shrinker. Shrinking may require an active
      device for CCS metadata copying.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2bea08bd31298d60d416b2a6ed346bb53dd28037 drm-intel
c7750148e1f4 drm/ttm: Allow TTM LRU list nodes of different types
1226adfc838e drm/ttm: Slightly clean up LRU list iteration
3e327a55fc26 drm/ttm: Use LRU hitches
3a2507b31813 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
bb28cb47bf9e drm/ttm: Provide a generic LRU walker helper
5e588483a295 drm/ttm: Use the LRU walker helper for swapping
f1398ae1a86f drm/ttm: Use the LRU walker for eviction
a13f4fcc57ea drm/ttm: Add a virtual base class for graphics memory backup
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
435add0ba57b drm/ttm/pool: Provide a helper to shrink pages
08f572cd2bfc drm/ttm: Use fault-injection to test error paths
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
df58169c1213 drm/ttm, drm/xe: Add a shrinker for xe bos
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:629: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#629: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 847 lines checked


