Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E018C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 09:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89D81123AF;
	Thu, 28 Mar 2024 09:51:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2271123AF;
 Thu, 28 Mar 2024 09:51:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=2C_drm/xe=3A_Shri?=
 =?utf-8?q?nker_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 09:51:52 -0000
Message-ID: <171161951271.1061727.17957718274379428930@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328094454.272050-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240328094454.272050-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm, drm/xe: Shrinker support (rev3)
URL   : https://patchwork.freedesktop.org/series/131695/
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
commit d08eb9a3a268d143882c18a352a5cea5b24eae27
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Mar 28 10:44:54 2024 +0100

    drm/xe: Add a shrinker for xe bos
    
    Rather than relying on the TTM watermark accounting add a shrinker
    for xe_bos in TT or system memory.
    
    Leverage the newly added TTM per-page shrinking and shmem backup
    support.
    
    Although xe doesn't fully support WONTNEED (purgeable) bos yet,
    introduce and add shrinker support for purgeable ttm_tts.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 8d398ffc40ac37d1589214c28b69c651c1a20792 drm-intel
293dcb5ff8ae drm/ttm: Allow TTM LRU list nodes of different types
a8aec09a73f1 drm/ttm: Use LRU hitches
322d784c8eb2 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
f7d66ba66bfe drm/ttm: Allow continued swapout after -ENOSPC falure
92b85179ccd7 drm/ttm: Add a virtual base class for graphics memory backup
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

total: 0 errors, 1 warnings, 0 checks, 178 lines checked
fb7fb56045e7 drm/ttm/pool: Provide a helper to shrink pages.
da2c5b39f030 drm/xe, drm/ttm: Provide a generic LRU walker helper
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

total: 0 errors, 1 warnings, 0 checks, 167 lines checked
d08eb9a3a268 drm/xe: Add a shrinker for xe bos
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:340: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#340: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 576 lines checked


