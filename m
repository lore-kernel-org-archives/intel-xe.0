Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A54C30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 17:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F7E10E00B;
	Wed,  3 Jul 2024 17:35:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044B410E00B;
 Wed,  3 Jul 2024 17:35:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_TTM_shrinker_helpers_and_?=
 =?utf-8?q?xe_buffer_object_shrinker_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 17:35:41 -0000
Message-ID: <172002814101.24496.508290866188517007@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM shrinker helpers and xe buffer object shrinker (rev6)
URL   : https://patchwork.freedesktop.org/series/131815/
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
commit 81a86c968e0e541d7e4fdf5c04b58ad8e35ecb8f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jul 3 17:38:13 2024 +0200

    drm/xe: Increase the XE_PL_TT watermark
    
    The XE_PL_TT watermark was set to 50% of system memory.
    The idea behind that was unclear since the net effect is that
    TT memory will be evicted to TTM_PL_SYSTEM memory if that
    watermark is exceeded, requiring PPGTT rebinds and dma
    remapping. But there is no similar watermark for TTM_PL_SYSTEM
    memory.
    
    The TTM functionality that tries to swap out system memory to
    shmem objects if a 50% limit of total system memory is reached
    is orthogonal to this, and with the shrinker added, it's no
    longer in effect.
    
    Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
    allowing all graphics memory to be bound to the device unless it
    has been swapped out by the shrinker.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch f9bae9be5922368e36324928b898ff4de5280e30 drm-intel
b606d4e5c496 drm/ttm: Allow TTM LRU list nodes of different types
52d1cc0f4ed2 drm/ttm: Slightly clean up LRU list iteration
2b9cc3b8ef0c drm/ttm: Use LRU hitches
05f6c9f0cb17 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
4bd764e605c9 drm/ttm: Provide a generic LRU walker helper
b2d00bad54e5 drm/ttm: Use the LRU walker helper for swapping
fcbe98e2c9db drm/ttm: Use the LRU walker for eviction
5f3d74c7637c drm/ttm: Add a virtual base class for graphics memory backup
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 284 lines checked
e909931efcdc drm/ttm/pool: Provide a helper to shrink pages
3c62b059423f drm/ttm: Use fault-injection to test error paths
-:28: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#28: FILE: drivers/gpu/drm/Kconfig:275:
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
6a5aceb5f7a8 drm/ttm, drm/xe: Add a shrinker for xe bos
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:168: CHECK:SPACING: No space is necessary after a cast
#168: FILE: drivers/gpu/drm/xe/tests/xe_bo.c:382:
+		   (unsigned long) total);

-:677: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#677: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 891 lines checked
81a86c968e0e drm/xe: Increase the XE_PL_TT watermark


