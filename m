Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB2BC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 10:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D404F10ED77;
	Tue, 16 Apr 2024 10:33:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A84C10ED77;
 Tue, 16 Apr 2024 10:33:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_TTM_shrinker_helpers_and_?=
 =?utf-8?q?xe_buffer_object_shrinker_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 10:33:52 -0000
Message-ID: <171326363237.1443512.1922211931006779911@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM shrinker helpers and xe buffer object shrinker (rev2)
URL   : https://patchwork.freedesktop.org/series/131815/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0f3ae255942da2f5d113b7986b57d4ba60f7f01a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Apr 16 12:07:30 2024 +0200

    drm/xe: Add a shrinker for xe bos
    
    Rather than relying on the TTM watermark accounting add a shrinker
    for xe_bos in TT or system memory.
    
    Leverage the newly added TTM per-page shrinking and shmem backup
    support.
    
    Although xe doesn't fully support WONTNEED (purgeable) bos yet,
    introduce and add shrinker support for purgeable ttm_tts.
    
    v2:
    - Cleanups bugfixes and a KUNIT shrinker test.
    - Add writeback support, and activate if kswapd.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 5f7597e990bea547bd1261170497e7476fb781bb drm-intel
bd8fdab5536f drm/ttm: Allow TTM LRU list nodes of different types
ba6c6d94e88a drm/ttm: Use LRU hitches
6bd1b001a93b drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
c18400c0bb96 drm/ttm: Allow continued swapout after -ENOSPC falure
b480fa32c1b9 drm/ttm: Add a virtual base class for graphics memory backup
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
93c6b0ef4286 drm/ttm/pool: Provide a helper to shrink pages.
c568da6d391a drm/ttm: Use fault-injection to test error paths
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
7c6f3c93174f drm/xe, drm/ttm: Provide a generic LRU walker helper
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 224 lines checked
0f3ae255942d drm/xe: Add a shrinker for xe bos
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:553: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#553: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 806 lines checked


