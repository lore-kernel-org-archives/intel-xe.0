Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F077B606A33E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EF71124D5;
	Fri, 13 Nov 2026 13:22:17 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF0E1124D1;
 Fri, 13 Nov 2026 13:22:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Transpa?=
 =?utf-8?q?rant_fallback_from_stolen_to_sysmem=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 13:22:17 -0000
Message-ID: <179457613717.19925.10569305815025259168@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113124453.144408-7-dev@lankhorst.se>
In-Reply-To: <20261113124453.144408-7-dev@lankhorst.se>
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

Series: drm/xe/display: Transparant fallback from stolen to sysmem. (rev5)
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
commit f697e7af00379209fdde0adbfd0bb5e60f75d018
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Nov 13 13:44:59 2026 +0100

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
+ /mt/dim checkpatch d41695c479e8bb24eb941e5ba916e42784af6f4d drm-intel
e7f6e4ab6e40 drm/xe/display: Avoid using stolen memory for framebuffer when media gt exists.
fa2ba5b3240c drm/xe/migrate: Support copying between sysmem and stolen
ca0e9886aa47 drm/xe: Raise gt frequency slightly earlier.
d426805e91f2 HACK: Always fallback
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f697e7af0037 drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
-:139: CHECK:LINE_SPACING: Please don't use multiple blank lines
#139: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:327:
 
+

-:299: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#299: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:170:
+					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,

total: 0 errors, 1 warnings, 1 checks, 325 lines checked


