Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F84FCCD191
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 08:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420D710E565;
	Wed, 18 Sep 2024 08:59:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786A910E565;
 Wed, 18 Sep 2024 08:59:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915_=26_drm/xe=3A_ki?=
 =?utf-8?q?ll_off_-Ddrm=5Fi915=5Fgem=5Fobject=3Dxe=5Fbo_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 08:59:25 -0000
Message-ID: <172664996548.1025052.3349524379565015961@2413ebb6fbb6>
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

Series: drm/i915 & drm/xe: kill off -Ddrm_i915_gem_object=xe_bo (rev2)
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
commit 4b42ce65182905bdc070e28a0db05c071cb71cff
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 17 19:14:01 2024 +0300

    drm/xe: eradicate -Ddrm_i915_gem_object=xe_bo
    
    We've now completely stopped using drm_i915_gem_object in display code
    that gets built for xe. Kill off the -Ddrm_i915_gem_object=xe_bo
    hack. Good riddance.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch a7c4f56f92ff668c90423c9601e213f1944ff09a drm-intel
786fff81e0ae drm/i915/display: start a buffer object abstraction layer
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 92 lines checked
874b33c8fd75 drm/i915/display: convert intel_atomic_plane.c to struct drm_gem_object
f6b9f9c4990f drm/i915/fb: convert parts of intel_fb.c to struct drm_gem_object
38974412e133 drm/i915/fbdev: convert intel_fbdev.c to struct drm_gem_object
26d409faa0e0 drm/i915/display: convert skl_universal_plane.c to struct drm_gem_object
e8008ada4034 drm/i915/fb: convert intel_framebuffer_init() to struct drm_gem_object
b60a81dd7b3f drm/i915/fb: convert intel_fb_bo_lookup_valid_bo() to struct drm_gem_object
91b3d452ec2f drm/i915/fb: convert intel_fb_bo_framebuffer_init() to struct drm_i915_gem_object
f78ae426546e drm/i915/fb: convert intel_fb_bo_framebuffer_fini() to struct drm_i915_gem_object
-:85: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#85: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
b19e55546fea drm/xe/display: use correct bo type in intel_fbdev_fb_alloc()
2ea1a53b8798 drm/i915/fb: convert intel_framebuffer_create() to struct drm_gem_object
d479c78346a2 drm/xe/display: stop using intel_fb_obj() in xe_fb_pin.c
9f9550c7f1fc drm/i915/display: add intel_bo_read_from_page() and use it
21ebfd6d5e79 drm/i915/display: add intel_bo_get/set_frontbuffer() and use them
389b216b14da drm/i915/frontbuffer: convert intel_frontbuffer_get() to struct drm_gem_object
b49ea51464a3 drm/i915/frontbuffer: convert frontbuffer->obj to struct drm_gem_object
69aa9e2ac9a7 drm/i915/display: add intel_bo_describe() and use it
-:87: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#87: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
8348624ca97a drm/i915/fb: remove intel_fb_obj()
e0fe74d3da48 drm/i915/display: clean up some gem/ includes
096c78062797 drm/xe/compat: remove a bunch of compat gem headers
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 0 lines checked
1e4693b4c7dc drm/xe: remove a number of superfluous compat macros
4b42ce651829 drm/xe: eradicate -Ddrm_i915_gem_object=xe_bo


