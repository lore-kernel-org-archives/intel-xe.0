Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C1FF60EF
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 10:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483F510EA3A;
	Tue, 31 Mar 2026 10:03:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C421110EA3A;
 Tue, 31 Mar 2026 10:03:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D=3A_m?=
 =?utf-8?q?ove_fbdev_fb_calls_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 31 Mar 2026 10:03:01 -0000
Message-ID: <177495138177.416872.6330915026560203187@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1774950508.git.jani.nikula@intel.com>
In-Reply-To: <cover.1774950508.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}: move fbdev fb calls to parent interface
URL   : https://patchwork.freedesktop.org/series/164151/
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
commit 091f33be0fd914a29819ec6b99f3a97d10bfdbb2
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Mar 31 12:49:18 2026 +0300

    drm/xe: pass struct xe_device to xe_display_bo_fbdev_prefer_stolen()
    
    This is xe core code, use struct xe_device for simplicity.
    
    Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d drm-intel
e795bccd3561 drm/xe/fbdev: put intel_fbdev_fb_prefer_stolen() behind IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
ac93b7413970 drm/{i915, xe}/fbdev: drop drm device parameter from intel_fbdev_fb_fill_info()
931367420ceb drm/{i915, xe}: move fbdev fb calls to parent interface
-:121: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#121: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:218:
+	mode_cmd->pitches[0] = intel_bo_fbdev_pitch_align(display, mode_cmd->width * DIV_ROUND_UP(sizes->surface_bpp, 8));

-:159: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#159: 
deleted file mode 100644

-:717: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#717: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:163:
+			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));

-:726: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#726: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:172:
+						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |

-:745: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#745: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:191:
+static int xe_display_bo_fbdev_fill_info(struct drm_gem_object *_obj, struct fb_info *info,
+			     struct i915_vma *vma)

-:846: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#846: FILE: include/drm/intel/display_parent_interface.h:50:
+	int (*fbdev_fill_info)(struct drm_gem_object *obj, struct fb_info *info, struct i915_vma *vma);

total: 0 errors, 5 warnings, 1 checks, 477 lines checked
8dd01cbb6d66 drm/i915: pass struct drm_i915_private to i915_bo_fbdev_prefer_stolen()
091f33be0fd9 drm/xe: pass struct xe_device to xe_display_bo_fbdev_prefer_stolen()


