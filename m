Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E26C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F109D10F1C5;
	Wed,  2 Sep 2026 12:52:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6920010F1C4;
 Wed,  2 Sep 2026 12:52:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/panic=3A_Split_into_c?=
 =?utf-8?q?ore_and_helpers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 12:52:46 -0000
Message-ID: <178835356642.112572.11301067289411318802@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902121930.597222-1-tzimmermann@suse.de>
In-Reply-To: <20260902121930.597222-1-tzimmermann@suse.de>
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

Series: drm/panic: Split into core and helpers (rev3)
URL   : https://patchwork.freedesktop.org/series/172394/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b8aec30966b2cf44aeeefdfeae6ac1e991274382
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Sep 2 14:13:22 2026 +0200

    drm/panic: Compile KUnit tests as module
    
    Fix dependency of the panic-helper KUnit tests on CONFIG_DRM_KUNIT_TEST=y
    and make them build as a module. Export the necessary interfaces from the
    panic helpers iff the KUnit framework has been enabled.
    
    Select DRM_PANIC_HELPER from DRM_KUNIT_TEST to meet the dependencies of
    the panic-helper tests.
    
    It is now possible to run the tests by modprobe-ing drm_panic_helper_test
    at runtime.
    
    v3:
    - clean up after each test case (Sashiko)
    v2:
    - fix parameter order in decl of drm_panic_helper_draw_screen_qr()
      (Sashiko)
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 69771454478b3dc773dee91f76cef9220ea1ce93 drm-intel
b315ab118ce1 drm/panic: Do not use un-escaped URL as format string
caea2823c14d drm/panic: Test address from kmap op for NULL
918fb3da2bfe drm/panic: Return -EINVAL if font is not available
73c3f3a8ce3b drm/panic: Return errno codes if panic output fails
96b43c6b6f65 drm/panic: Pass colors to draw_panic_dispatch()
aa6c5bccef68 drm/panic: Pass global module parameters to drm_panic_dispatch()
34d6f446335d drm/panic: Return from screen_user if display is too small
33a177c6f823 drm/panic: Retry in dispatch function if panic output fails
1a2e1c9bc1c6 drm/panic: Split draw_panic_plane()
1afc5cd7f2b0 drm/panic: Restrict to primary planes
f6d1b1ec60b8 drm/panic: Display panic screen via per-plane callback
-:696: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#696: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 608 lines checked
37b91766f1f3 drm/panic: Internalize panic locking in DRM core and helpers
-:102: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#102: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 199 lines checked
9cb3f8f968ae drm/panic: Move panic display code into helper library
-:1130: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1130: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2096 lines checked
b8aec30966b2 drm/panic: Compile KUnit tests as module


