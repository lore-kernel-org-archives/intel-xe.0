Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3035EC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 14:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B0810E056;
	Tue, 18 Aug 2026 14:23:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7948D10E056;
 Tue, 18 Aug 2026 14:23:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/panic=3A_Split_into_c?=
 =?utf-8?q?ore_and_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Aug 2026 14:23:38 -0000
Message-ID: <178706301849.63668.10781219402812217063@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818125012.468092-1-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
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

Series: drm/panic: Split into core and helpers
URL   : https://patchwork.freedesktop.org/series/172394/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1abd75770638641c3934cecbbe974de5a0342e04
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Aug 18 14:28:10 2026 +0200

    drm/panic: Compile KUnit tests as module
    
    Fix dependency of the panic-helper KUnit tests on CONFIG_DRM_KUNIT_TEST=y
    and make them build as a module. Export the necessary interfaces from the
    panic helpers iff the KUnit framework has been enabled.
    
    Select DRM_PANIC_HELPER from DRM_KUNIT_TEST to meet the dependencies of
    the panic-helper tests.
    
    It is now possible to run the tests by modprobing drm_panic_helper_test.ko
    at runtime.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 275df33dcf4c5d018717867a0b29ed1d3b62c1ef drm-intel
1a5e1e270ee6 drm/panic: Allocate QR-code buffers statically
455a770fad55 drm/panic: Make allocation of zlib workspace more robust
5e90d001a6de drm/panic: Return -EINVAL if font is not available
1fc4cd4247e5 drm/panic: Return errno codes if panic output fails
efe17365dd1c drm/panic: Pass colors to draw_panic_dispatch()
1660f0b4aea5 drm/panic: Pass global module parameters to drm_panic_dispatch()
d404222f3e11 drm/panic: Retry in dispatch function if panic output fails
ddb8a7df8aa2 drm/panic: Split draw_panic_plane()
a4343a106029 drm/panic: Display panic screen via per-plane callback
-:648: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#648: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 571 lines checked
b1c510458752 drm/panic: Internalize panic locking in DRM core and helpers
-:102: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#102: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 199 lines checked
79335fa4360b drm/panic: Move panic display code into helper library
-:1112: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1112: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2070 lines checked
1abd75770638 drm/panic: Compile KUnit tests as module


