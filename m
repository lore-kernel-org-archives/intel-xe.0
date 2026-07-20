Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E6EC44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5CF10E9B9;
	Mon, 20 Jul 2026 16:48:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FE310E920;
 Mon, 20 Jul 2026 16:48:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Transpa?=
 =?utf-8?q?rant_fallback_from_stolen_to_sysmem=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 16:48:38 -0000
Message-ID: <178456611867.207655.9101438526521071706@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720161451.384968-13-dev@lankhorst.se>
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
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

Series: drm/xe/display: Transparant fallback from stolen to sysmem.
URL   : https://patchwork.freedesktop.org/series/170759/
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
commit 85d6c9ce009931dce5af2a1fbc619f760a07b6dc
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Jul 20 18:15:03 2026 +0200

    drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
    
    Pull the "do we want to use stolen for the BIOS FB?" checks into
    a new intel_bo_fbdev_bios_fb_takeover() helper, and defer that
    decision until we're ready to reallocate the fbdev FB. This way
    even if we don't want to ultimately use the BIOS FB we'll keep
    the plane enabled until the replacement FB is ready. Should
    hopefully result in fewer display blinks during boot.
    
    Additionally, on some platforms this allows us to re-create the
    framebuffer when stolen memory is not suitable, using the blitter
    engine to copy the contents to system memory without causing
    any flickering by not preserving the stolen memory allocation.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 93386cf5c4870594860636dafd4307fd5cf388e4 drm-intel
21a81548a191 drm/xe/ggtt: Add xe_ggtt_reserve_area
18dcb3abaad3 drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
fea04c39599f drm/xe/display: Reserve the original GGTT space before creating a bo
ac7e9c5b1829 drm/xe/display: Use the correct calculation for phys_base on integrated
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#15: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f9c7426f8114 drm/xe/display: Remove duplicated code
f383d936a1aa drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
4a168c962723 drm/xe/display: Avoid using stolen memory for framebuffer when media gt exists.
ed427fd66da2 drm/xe/migrate: Support copying between sysmem and stolen
a98c0316d796 drm/xe: Raise gt frequency slightly earlier.
dec8234963bb HACK: Always fallback
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
85d6c9ce0099 drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
-:141: CHECK:LINE_SPACING: Please don't use multiple blank lines
#141: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:326:
 
+

-:304: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#304: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:170:
+					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,

total: 0 errors, 1 warnings, 1 checks, 325 lines checked


