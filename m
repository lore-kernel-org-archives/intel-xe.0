Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239A2C36014
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 13:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12AF10E59D;
	Tue,  1 Apr 2025 13:06:04 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4960710E57E;
 Tue,  1 Apr 2025 13:06:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Add_drm=5Fpan?=
 =?utf-8?q?ic_support_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 13:06:03 -0000
Message-ID: <174351276329.23276.2336366996058012768@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401125818.333033-1-jfalempe@redhat.com>
In-Reply-To: <20250401125818.333033-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev6)
URL   : https://patchwork.freedesktop.org/series/141937/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c0fd23cdd77331d808824a604cee5580420d9c97
Author: Jocelyn Falempe <jfalempe@redhat.com>
Date:   Tue Apr 1 14:51:14 2025 +0200

    drm/i915/display: Add drm_panic support for 4-tiling with DPT
    
    On Alder Lake and later, it's not possible to disable tiling when DPT
    is enabled.
    So this commit implements 4-Tiling support, to still be able to draw
    the panic screen.
    
    Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
+ /mt/dim checkpatch 9368766ece6c78cc0001f9b53037563fe521f887 drm-intel
979b142038b3 drm/i915/fbdev: Add intel_fbdev_get_map()
223435309562 drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
fc258b14f414 drm/i915/display: Add a disable_tiling() for skl planes
297dd77e73de drm/i915/gem: Add i915_gem_object_panic_map()
-:67: CHECK:LINE_SPACING: Please don't use multiple blank lines
#67: FILE: drivers/gpu/drm/i915/gem/i915_gem_pages.c:367:
+
+

-:81: CHECK:SPACING: No space is necessary after a cast
#81: FILE: drivers/gpu/drm/i915/gem/i915_gem_pages.c:381:
+		iosys_map_set_vaddr_iomem(map, (void __iomem *) ptr);

total: 0 errors, 0 warnings, 2 checks, 70 lines checked
e05cd3c5553c drm/i915/display: Add drm_panic support
b2993528ab2c drm/i915/display: Flush the front buffer in panic handler
347668525891 drm/i915/display: Add drm_panic support for Y-tiling with DPT
c0fd23cdd773 drm/i915/display: Add drm_panic support for 4-tiling with DPT
-:35: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:1306:
+	swizzle = (x & 3) | ((y & 3) << 2) | ((x & 0xc) << 2) | (y & 4) << 4 | ((x & 0x10) << 3) | ((y & 0x18) << 5);

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


