Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FF8606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 18:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4702C10E2BA;
	Thu,  5 Nov 2026 18:12:11 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E7910E0EB;
 Thu,  5 Nov 2026 18:12:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Transpa?=
 =?utf-8?q?rant_fallback_from_stolen_to_sysmem=2E_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 18:12:10 -0000
Message-ID: <179390233066.128088.6012206853707271647@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105161444.593259-7-dev@lankhorst.se>
In-Reply-To: <20261105161444.593259-7-dev@lankhorst.se>
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

Series: drm/xe/display: Transparant fallback from stolen to sysmem. (rev4)
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
commit 9237140ef2535d537085a98529db7cc5874c8366
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Nov 5 17:14:50 2026 +0100

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
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 628d6592dbf1f5f5fb3903bcd4c019015fef3d0d drm-intel
d310c288f69d drm/xe/display: Avoid using stolen memory for framebuffer when media gt exists.
bb5346aeb9cf drm/xe/migrate: Support copying between sysmem and stolen
25e7e66b50bc drm/xe: Raise gt frequency slightly earlier.
bf9453849b0c HACK: Always fallback
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
9237140ef253 drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
-:143: CHECK:LINE_SPACING: Please don't use multiple blank lines
#143: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:326:
 
+

-:306: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#306: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:170:
+					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,

total: 0 errors, 1 warnings, 1 checks, 325 lines checked


