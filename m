Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B8D1125839
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE0A10E927;
	Wed, 11 Mar 2026 14:24:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C4510E926;
 Wed, 11 Mar 2026 14:24:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_mo?=
 =?utf-8?q?ve_bo_stuff_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Mar 2026 14:24:09 -0000
Message-ID: <177323904924.346265.7792713039133957682@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1773238670.git.jani.nikula@intel.com>
In-Reply-To: <cover.1773238670.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: move bo stuff to parent interface
URL   : https://patchwork.freedesktop.org/series/163032/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1c0abc8a0a7ff519d9f5483684d8281b89f83ecc
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 11 16:18:18 2026 +0200

    drm/{i915,xe}: move framebuffer bo to parent interface
    
    Add .framebuffer_init, .framebuffer_fini and .framebuffer_lookup to the
    bo parent interface. While they're about framebuffers, they're
    specifically about framebuffer objects, so the bo interface is a good
    enough fit, and there's no need to add another interface struct.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4a30f5fa0fe382b3915a8208a483d0044c40b9eb drm-intel
41a11f93af59 drm/i915: move i915 specific bo implementation to i915
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
rename from drivers/gpu/drm/i915/display/intel_bo.c

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
cf0b8bbf370a drm/xe: rename intel_bo.c to xe_display_bo.c
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
rename from drivers/gpu/drm/xe/display/intel_bo.c

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
c914c9831140 drm/{i915, xe}/bo: move display bo calls to parent interface
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 292 lines checked
a6ac535e9f07 drm/i915/fb: make intel_fb_bo.c less dependent on display
1c0abc8a0a7f drm/{i915,xe}: move framebuffer bo to parent interface
-:144: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#144: 
deleted file mode 100644

-:540: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#540: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:36:
+	if (XE_IOCTL_DBG(xe, intel_fb_needs_64k_phys(mode_cmd->modifier[0]) &&
+			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))

total: 0 errors, 1 warnings, 1 checks, 344 lines checked


