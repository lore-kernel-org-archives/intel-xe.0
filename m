Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8940BCD11DD
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 15:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3347A112773;
	Fri, 29 Mar 2024 15:04:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C71A112771;
 Fri, 29 Mar 2024 15:04:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_TTM_shrinker_helpers_and_?=
 =?utf-8?q?xe_buffer_object_shrinker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 15:04:36 -0000
Message-ID: <171172467657.1081134.15024445455992943460@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM shrinker helpers and xe buffer object shrinker
URL   : https://patchwork.freedesktop.org/series/131815/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2a21d218d0611aaba35f42f39a19f7bbd8b767a6
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Mar 29 15:57:07 2024 +0100

    drm/xe: Add a shrinker for xe bos
    
    Rather than relying on the TTM watermark accounting add a shrinker
    for xe_bos in TT or system memory.
    
    Leverage the newly added TTM per-page shrinking and shmem backup
    support.
    
    Although xe doesn't fully support WONTNEED (purgeable) bos yet,
    introduce and add shrinker support for purgeable ttm_tts.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 96000ec64d7e08436f2cafc89711c907576710f4 drm-intel
541d6f2bf1fd drm/ttm: Allow TTM LRU list nodes of different types
bfbd018d64bc drm/ttm: Use LRU hitches
bc7668bb8370 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
f93b102fe258 drm/ttm: Allow continued swapout after -ENOSPC falure
324573acd961 drm/ttm: Add a virtual base class for graphics memory backup
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 281 lines checked
3f86b5e625b4 drm/ttm/pool: Provide a helper to shrink pages.
6e9d27c0029a drm/xe, drm/ttm: Provide a generic LRU walker helper
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:66: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#66: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 238 lines checked
2a21d218d061 drm/xe: Add a shrinker for xe bos
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:359: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#359: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 642 lines checked


