Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAAEC4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 20:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B20910EB32;
	Tue, 21 Jul 2026 20:02:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEBF10E3E6;
 Tue, 21 Jul 2026 20:02:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Transpa?=
 =?utf-8?q?rant_fallback_from_stolen_to_sysmem=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jul 2026 20:02:12 -0000
Message-ID: <178466413250.212455.13771807477960475223@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721142610.93804-7-dev@lankhorst.se>
In-Reply-To: <20260721142610.93804-7-dev@lankhorst.se>
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

Series: drm/xe/display: Transparant fallback from stolen to sysmem. (rev3)
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
commit f93edf58183f5fe4026711152de75e6b3d0d935b
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Jul 21 16:26:16 2026 +0200

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
    
    Based on a similar patch by Ville, that introduced
    intel_bo_fbdev_bios_fb_ok().
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 80b509f6e34a01edfccc01a05e3e7062a934bcf9 drm-intel
9a0146ec344e drm/xe/display: Avoid using stolen memory for framebuffer when media gt exists.
5965f829fb7e drm/xe/migrate: Support copying between sysmem and stolen
7b5d008e445e drm/xe: Raise gt frequency slightly earlier.
ee57633ec1b4 HACK: Always fallback
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f93edf58183f drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
-:145: CHECK:LINE_SPACING: Please don't use multiple blank lines
#145: FILE: drivers/gpu/drm/i915/display/intel_fbdev.c:326:
 
+

-:308: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#308: FILE: drivers/gpu/drm/xe/display/xe_display_bo.c:170:
+					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,

total: 0 errors, 1 warnings, 1 checks, 325 lines checked


