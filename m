Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74711C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 13:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6F10F5C9;
	Fri, 11 Sep 2026 13:19:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7538510E3A3;
 Fri, 11 Sep 2026 13:19:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/panic=3A_Split_into_c?=
 =?utf-8?q?ore_and_helpers_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Sep 2026 13:19:29 -0000
Message-ID: <178913276947.151128.4571882219434478818@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260911124540.279841-1-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-1-tzimmermann@suse.de>
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

Series: drm/panic: Split into core and helpers (rev5)
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
commit e774d00a56614475b6dcce2361a490d600d90f02
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Fri Sep 11 14:44:07 2026 +0200

    drm/panic: Compile KUnit tests as module
    
    Fix dependency of the panic-helper KUnit tests on CONFIG_DRM_KUNIT_TEST=y
    and make them build as a module. Export the necessary interfaces from the
    panic helpers iff the KUnit framework has been enabled.
    
    Select DRM_PANIC_HELPER from DRM_KUNIT_TEST to meet the dependencies of
    the panic-helper tests.
    
    It is now possible to run the tests by modprobe-ing drm_panic_helper_test
    at runtime.
    
    v5:
    - clear test description with drm_panic_helper_clear_description() (Sashiko)
    v3:
    - clean up after each test case (Sashiko)
    v2:
    - fix parameter order in decl of drm_panic_helper_draw_screen_qr()
      (Sashiko)
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
+ /mt/dim checkpatch 05e24d647cc62a7bff4a3594a89bf8dfce852daa drm-intel
2a9eb08a3d22 drm/panic: Do not use un-escaped URL as format string
00a42593020a drm/panic: Test address from kmap op for NULL
ff8100af82c5 drm/panic: Return -EINVAL if font is not available
dc8e7c907717 drm/panic: Return errno codes if panic output fails
9e5949cbc82f drm/panic: Pass colors to draw_panic_dispatch()
0ccbaac91285 drm/panic: Pass global module parameters to drm_panic_dispatch()
15ae028cf06c drm/panic: Return from screen_user if display is too small
3e1e5f5bcb26 drm/panic: Retry in dispatch function if panic output fails
e20c9ef07013 drm/panic: Split draw_panic_plane()
a707f1a26aa0 drm/panic: Restrict to primary planes
ef185745412c drm/panic: Display panic screen via per-plane callback
-:698: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#698: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 607 lines checked
d547b2845239 drm/panic: Internalize panic locking in DRM core and helpers
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 199 lines checked
81fbfe180f56 drm/panic: Move panic display code into helper library
-:1131: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1131: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2096 lines checked
e774d00a5661 drm/panic: Compile KUnit tests as module
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
- clear test description with drm_panic_helper_clear_description() (Sashiko)

total: 0 errors, 1 warnings, 0 checks, 167 lines checked


