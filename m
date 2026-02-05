Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA237EA7959
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 03:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C0910E0CA;
	Thu,  5 Feb 2026 03:28:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E3410E0CA;
 Thu,  5 Feb 2026 03:28:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915=3A_drop_display_version_2-4_overlay_uAPI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 03:28:51 -0000
Message-ID: <177026213133.226816.5183843068662499500@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204164827.807502-1-jani.nikula@intel.com>
In-Reply-To: <20260204164827.807502-1-jani.nikula@intel.com>
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

Series: series starting with [1/2] drm/i915: drop display version 2-4 overlay uAPI
URL   : https://patchwork.freedesktop.org/series/161155/
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
commit 2b76076e2a8b83643e82db4884bba768f547e3a5
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Feb 4 18:48:27 2026 +0200

    drm/i915/display: drop display version 2-4 overlay implementation
    
    With the overlay IOCTLs now returning no overlay support and -ENODEV,
    let's drop all the code for the display version 2-4 overlay support.
    
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8883ec84c85819dacca94997b60371c3ed57ee29 drm-intel
4982fa1e8900 drm/i915: drop display version 2-4 overlay uAPI
-:72: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#72: FILE: drivers/gpu/drm/i915/i915_driver.c:1800:
+	DRM_IOCTL_DEF_DRV(I915_GEM_PIN, i915_enodev_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
 	                                                           ^

-:73: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#73: FILE: drivers/gpu/drm/i915/i915_driver.c:1801:
+	DRM_IOCTL_DEF_DRV(I915_GEM_UNPIN, i915_enodev_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
 	                                                             ^

total: 0 errors, 0 warnings, 2 checks, 59 lines checked
2b76076e2a8b drm/i915/display: drop display version 2-4 overlay implementation
-:285: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#285: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 229 lines checked


