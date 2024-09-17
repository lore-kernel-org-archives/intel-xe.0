Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFAACAC58D
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 16:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EDA10E4BC;
	Tue, 17 Sep 2024 16:22:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EA010E4BB;
 Tue, 17 Sep 2024 16:22:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915_=26_drm/xe=3A_ki?=
 =?utf-8?q?ll_off_-Ddrm=5Fi915=5Fgem=5Fobject=3Dxe=5Fbo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 16:22:54 -0000
Message-ID: <172659017435.1022767.8814882157774849979@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726589119.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726589119.git.jani.nikula@intel.com>
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

Series: drm/i915 & drm/xe: kill off -Ddrm_i915_gem_object=xe_bo
URL   : https://patchwork.freedesktop.org/series/138773/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bc6a472ee8bef2b3005b6474f9a02e427f51df5d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 17 19:14:01 2024 +0300

    drm/xe: eradicate -Ddrm_i915_gem_object=xe_bo
    
    We've now completely stopped using drm_i915_gem_object in display code
    that gets built for xe. Kill off the -Ddrm_i915_gem_object=xe_bo
    hack. Good riddance.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 38e1b615fb395b928e514108e908cd6edf3d34c3 drm-intel
f99b3961ef67 drm/i915/display: start a buffer object abstraction layer
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 92 lines checked
966c508e2767 drm/i915/display: convert intel_atomic_plane.c to struct drm_gem_object
4252d87d5edf drm/i915/fb: convert parts of intel_fb.c to struct drm_gem_object
902bd187f363 drm/i915/fbdev: convert intel_fbdev.c to struct drm_gem_object
3df4d9bda011 drm/i915/display: convert skl_universal_plane.c to struct drm_gem_object
2391de2d0c37 drm/i915/fb: convert intel_framebuffer_init() to struct drm_gem_object
f09899232b2e drm/i915/fb: convert intel_fb_bo_lookup_valid_bo() to struct drm_gem_object
2e0563eab3ef drm/i915/fb: convert intel_fb_bo_framebuffer_init() to struct drm_i915_gem_object
f5167ca6e66b drm/i915/fb: convert intel_fb_bo_framebuffer_fini() to struct drm_i915_gem_object
-:85: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#85: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
57c32f1d8d75 drm/xe/display: use correct bo type in intel_fbdev_fb_alloc()
2148d444b319 drm/i915/fb: convert intel_framebuffer_create() to struct drm_gem_object
7c2cc3c2b195 drm/xe/display: stop using intel_fb_obj() in xe_fb_pin.c
62a8fdb30484 drm/i915/display: add intel_bo_read_from_page() and use it
d7cd9d6cb021 drm/i915/display: add intel_bo_get/set_frontbuffer() and use them
858213b4ecbf drm/i915/frontbuffer: convert intel_frontbuffer_get() to struct drm_gem_object
1b7679256b90 drm/i915/frontbuffer: convert frontbuffer->obj to struct drm_gem_object
1a1939408800 drm/i915/display: add intel_bo_describe() and use it
-:87: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#87: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
a203cbe12848 drm/i915/fb: remove intel_fb_obj()
6adf48405112 drm/i915/display: clean up some gem/ includes
85f5b4bbb0b0 drm/xe/compat: remove a bunch of compat gem headers
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 0 lines checked
e069446eb3db drm/xe: remove a number of superfluous compat macros
bc6a472ee8be drm/xe: eradicate -Ddrm_i915_gem_object=xe_bo


