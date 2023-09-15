Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBCCEE6455
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 11:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3462410E61C;
	Fri, 15 Sep 2023 11:00:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2396310E61F;
 Fri, 15 Sep 2023 11:00:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 04440A3ECB;
 Fri, 15 Sep 2023 11:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 15 Sep 2023 11:00:34 -0000
Message-ID: <169477563401.32041.5545985970669371793@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
In-Reply-To: <20230915105724.1025509-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ba?=
 =?utf-8?q?ckport_patches_reorganizing_intel=5Ffrontbuffer=2Eh/i915=5Fgem?=
 =?utf-8?b?X29iamVjdC5o?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Backport patches reorganizing intel_frontbuffer.h/i915_gem_object.h
URL   : https://patchwork.freedesktop.org/series/123757/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 143c97dcdc34363e44d2f3de948b22656fdef525
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Sep 15 13:57:24 2023 +0300

    fixup! drm/xe: Add frontbuffer setter/getter for xe_bo
    
    i915 frontbuffer setter and getter are moved into separate header file. We
    need to do same for Xe frontbuffer setter and getter.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 4a9681392cecd56a372d06b648f7b3a37fdd5c63 drm-intel
697182408 Revert "FIXME: drm/i915: include intel_frontbuffer.h from skl_universal_plane.c"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c3e942a06433e8c538108f24b4fe78a0927e2aea', maybe rebased or not pulled?
#10: 
This reverts commit c3e942a06433e8c538108f24b4fe78a0927e2aea.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
da15aeefa Revert "FIXME: drm/i915/psr: include intel_frontbuffer.h from intel_psr.c"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0300da12681bd8efa31f44127627957fe4722274', maybe rebased or not pulled?
#10: 
This reverts commit 0300da12681bd8efa31f44127627957fe4722274.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
cfcd1affb Revert "FIXME: drm/i915/drrs: include intel_frontbuffer.h from intel_drrs.c"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '57f941a90c2c20e3884571b06c4c3e0a10794af7', maybe rebased or not pulled?
#10: 
This reverts commit 57f941a90c2c20e3884571b06c4c3e0a10794af7.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
41773f359 drm/i915: add minimal i915_gem_object_frontbuffer.h
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:286: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#286: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 325 lines checked
9790a1a5c fixup! drm/i915/display: Move releasing gem object away from fb tracking
143c97dcd fixup! drm/xe: Add frontbuffer setter/getter for xe_bo
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


