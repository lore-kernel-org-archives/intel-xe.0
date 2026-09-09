Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F88BC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 09:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3499410F076;
	Wed,  9 Sep 2026 09:57:34 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C6C10E15C;
 Wed,  9 Sep 2026 09:57:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/panic=3A_Split_into_c?=
 =?utf-8?q?ore_and_helpers_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 09:57:32 -0000
Message-ID: <178894785240.139265.16712433645205358656@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909085826.64529-1-tzimmermann@suse.de>
In-Reply-To: <20260909085826.64529-1-tzimmermann@suse.de>
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

Series: drm/panic: Split into core and helpers (rev4)
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
commit d2e30fbcaa1a1509fad25e1d041f1293b78eca2b
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Sep 9 10:55:29 2026 +0200

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
    Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
+ /mt/dim checkpatch aa6e24fdb9173c1d5842165d1faf9cbc16324a86 drm-intel
a54e470e2e76 drm/panic: Do not use un-escaped URL as format string
21ffc4e3494d drm/panic: Test address from kmap op for NULL
0313c8857cfc drm/panic: Return -EINVAL if font is not available
2f50ed97ff8e drm/panic: Return errno codes if panic output fails
ccbc79864f42 drm/panic: Pass colors to draw_panic_dispatch()
9a0aa0305717 drm/panic: Pass global module parameters to drm_panic_dispatch()
7239323aa61e drm/panic: Return from screen_user if display is too small
3712b7ff2736 drm/panic: Retry in dispatch function if panic output fails
04e625944338 drm/panic: Split draw_panic_plane()
12d712d245b6 drm/panic: Restrict to primary planes
15e1fb9b7cbd drm/panic: Display panic screen via per-plane callback
-:698: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#698: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 607 lines checked
b8efc9fd4e65 drm/panic: Internalize panic locking in DRM core and helpers
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 199 lines checked
e3377d511f70 drm/panic: Move panic display code into helper library
-:1131: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1131: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2096 lines checked
d2e30fbcaa1a drm/panic: Compile KUnit tests as module


