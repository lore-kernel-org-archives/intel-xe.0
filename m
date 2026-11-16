Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220FB606A338
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9A910F290;
	Mon, 16 Nov 2026 15:53:41 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6697210F28D;
 Mon, 16 Nov 2026 15:53:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Transpa?=
 =?utf-8?q?rant_fallback_from_stolen_to_sysmem=2E_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 15:53:41 -0000
Message-ID: <179484442141.33262.7465682381633232109@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116131349.333818-7-dev@lankhorst.se>
In-Reply-To: <20261116131349.333818-7-dev@lankhorst.se>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe/display: Transparant fallback from stolen to sysmem. (rev6)
URL   : https://patchwork.freedesktop.org/series/170759/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 30b96fc3c61ce41538e432b0ce40cff2b061ca43
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Nov 16 14:13:55 2026 +0100

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
    
    This patch is a modification the original patch by Ville.
    Originally only the decision to drop stolen fb was deferred.
    
    The modifications allow it to flip to a different fb that still
    contains the contents of the previous framebuffer to preserve
    the flicker free property of boot, even when the original stolen
    framebuffer is dropped. Additionally, bios_fb_ok() was renamed
    to bios_fb_takeover() with a different function signature.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 301355bfc109114743d4ce1d0512779923bbec0c drm-intel
d9b57fc75d9f drm/xe/display: Avoid using stolen memory for framebuffer when media gt exists.
eb818d7c4c6d drm/xe/migrate: Support copying between sysmem and stolen
a35bdeabd000 drm/xe: Raise gt frequency slightly earlier.
bfcb26c7662b HACK: Always fallback
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
30b96fc3c61c drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
-:148: CHECK:LINE_SPACING: Please don't use multiple blank lines
#148: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:327:
 
+

-:308: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#308: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:170:
+					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,

total: 0 errors, 1 warnings, 1 checks, 328 lines checked


