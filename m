Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F40FDEE2B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 17:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7A10F1D5;
	Thu, 23 Apr 2026 17:01:07 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC510F1D5;
 Thu, 23 Apr 2026 17:01:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Introduce_=27?=
 =?utf-8?q?fb=5Fpin=27_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 17:01:06 -0000
Message-ID: <177696366621.2765.9791336499756315232@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Introduce 'fb_pin' parent interface
URL   : https://patchwork.freedesktop.org/series/165375/
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
commit 5b6d72673d7f106cfb3c6d560569d252ad5e900a
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Apr 23 19:53:45 2026 +0300

    drm/i915: Consolidate the intel_plane_(un)pin_fb() implementations
    
    Currently i915 and each implement their own versions of
    intel_plane_(un)pin(). Now that we have the fb_pin parent
    interface we can consolidate this to a single implementation.
    
    The result is a mixture of the i915 and xe implementations.
    The reuse_vma() hack comes from xe (and i915 doesn't implement
    that part of the parent interface, and the pin_params are
    taken from i915 since the platforms supported by i915 need
    more things.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch ecb61ba4a1f619b6944f4d0741b4d8a0910f460c drm-intel
262062016afd drm/i915: Introduce intel_parent_fb_pin_get_map()
-:194: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#194: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 210 lines checked
81029742724d drm/i915: Move intel_fb_pin_params to the parent interface
d58fbaf7ff89 drm/i915: Move the i915_dpt_offset()==0 assert
40e53510efb1 drm/i915: Reorganize intel_plane_pin_fb() a bit
-:43: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/i915_fb_pin.c:285:
+						intel_plane_uses_fence(plane_state) ? &fence_id : NULL);

total: 0 errors, 1 warnings, 0 checks, 94 lines checked
a1109ab4e774 drm/i915: Introduce i915_fb_pin_dpt_(un)pin()
8a1e9a424645 drm/i915: Introduce i915_fb_pin_ggtt_(un)pin()
fec2d7ea2214 drm/xe: Move the FORCE_WC assert into __xe_pin_fb_vma()
4b02e76fc115 drm/xe: Kill the fbdev vma reuse hack
d23d915a8094 drm/xe: Reorganize intel_plane_pin_fb() a bit
cf3c3010a9b7 drm/xe: Introduce xe_fb_pin_dpt_(un)pin()
f56f277f9ddb drm/xe: Introduce xe_fb_pin_ggtt_(un)pin()
798d5b2d7063 drm/xe: Restructure reuse_vma()
1bf934097f28 drm/i915: Introduce the main fb_pin parent interface
-:151: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#151: FILE: drivers/gpu/drm/i915/i915_fb_pin.c:366:
+						   intel_plane_uses_fence(plane_state) ? &fence_id : NULL);

total: 0 errors, 1 warnings, 0 checks, 280 lines checked
867a9c240ce4 drm/i915/fbdev: Use intel_parent_fb_pin_ggtt_(un)pin()
dcee7ec11d8e drm/xe: Use xe_fb_pin_ggtt_pin() for the initial FB pin
5b6d72673d7f drm/i915: Consolidate the intel_plane_(un)pin_fb() implementations
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
deleted file mode 100644

-:159: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#159: FILE: drivers/gpu/drm/i915/display/intel_plane.c:1262:
+						   intel_plane_uses_fence(plane_state) ? &fence_id : NULL);

total: 0 errors, 2 warnings, 0 checks, 389 lines checked


