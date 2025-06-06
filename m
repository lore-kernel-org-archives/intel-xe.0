Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8FEC61CE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 13:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF1010EA9C;
	Fri,  6 Jun 2025 13:08:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CFD10EAD1;
 Fri,  6 Jun 2025 13:08:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Add_drm=5Fpan?=
 =?utf-8?q?ic_support_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 13:08:39 -0000
Message-ID: <174921531934.56092.2648336368851101326@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606120519.753928-1-jfalempe@redhat.com>
In-Reply-To: <20250606120519.753928-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev8)
URL   : https://patchwork.freedesktop.org/series/141937/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f3014a66dce0bc2e9cb00eb73a1152e85b49d944
Author: Jocelyn Falempe <jfalempe@redhat.com>
Date:   Fri Jun 6 13:48:13 2025 +0200

    drm/i915/psr: Add intel_psr2_panic_force_full_update
    
    When the panic handler is called, configure the psr to send the full
    framebuffer to the monitor, otherwise the panic screen is only
    partially visible.
    
    Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
+ /mt/dim checkpatch 8c96c8b7753fa6146836b12a379a53cac71894c5 drm-intel
5fd829debbd4 drm/i915/fbdev: Add intel_fbdev_get_map()
4eb5c822f0cb drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
06a4d4f3f665 drm/i915/display: Add a disable_tiling() for skl planes
206c922f881d drm/ttm: Add ttm_bo_kmap_try_from_panic()
da8209149ec1 drm/i915: Add intel_bo_panic_setup and intel_bo_panic_finish
-:145: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#145: FILE: drivers/gpu/drm/i915/gem/i915_gem_pages.c:406:
+		i915_panic_vaddr = kmap_local_page_try_from_panic(

-:220: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#220: FILE: drivers/gpu/drm/xe/display/intel_bo.c:76:
+}
+/*

total: 0 errors, 0 warnings, 2 checks, 218 lines checked
1bc505a859e1 drm/i915/display: Add drm_panic support
-:55: CHECK:LINE_SPACING: Please don't use multiple blank lines
#55: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:1274:
 
+

total: 0 errors, 0 warnings, 1 checks, 120 lines checked
61829caff0a1 drm/i915/display: Add drm_panic support for Y-tiling with DPT
352c3fa8f41e drm/i915/display: Add drm_panic support for 4-tiling with DPT
f3014a66dce0 drm/i915/psr: Add intel_psr2_panic_force_full_update


