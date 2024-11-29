Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA869D729E9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 16:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2B910E533;
	Fri, 29 Nov 2024 16:31:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F6510E52C;
 Fri, 29 Nov 2024 16:31:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Add_drm=5Fpan?=
 =?utf-8?q?ic_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 16:31:39 -0000
Message-ID: <173289789953.334878.12285113828116646648@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129162232.7594-1-jfalempe@redhat.com>
In-Reply-To: <20241129162232.7594-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support
URL   : https://patchwork.freedesktop.org/series/141937/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a9e84e0716ae876112ac9743a66c446e37cc574e
Author: Jocelyn Falempe <jfalempe@redhat.com>
Date:   Fri Nov 29 17:20:30 2024 +0100

    drm/i915: Add drm_panic support
    
    This adds drm_panic support for a wide range of Intel GPU. I've
    tested it only on 3 laptops, haswell (with 128MB of eDRAM),
    cometlake and alderlake.
    
     * DPT: if I disable tiling on a framebuffer using DPT, then it
       displays some other memory location. As DPT is enabled only for
       tiled framebuffer, there might be some hardware limitations.
     * fbdev: On my haswell laptop, the fbdev framebuffer is configured
       with tiling enabled, but really it's linear, because fbcon don't
       know about tiling, and the panic screen is perfect when it's drawn
       as linear.
    
    Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
+ /mt/dim checkpatch 108f610005f88de624c1a8c4f85d5cab9f530ddb drm-intel
2beeb67a4d83 drm/i915/fbdev: Add intel_fbdev_getvaddr()
-:40: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#40: FILE: drivers/gpu/drm/i915/display/intel_fbdev.h:34:
 }
+static inline void *intel_fbdev_getvaddr(struct intel_fbdev *fbdev)

total: 0 errors, 0 warnings, 1 checks, 25 lines checked
800aa5ff256f drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
-:37: CHECK:BRACES: Unbalanced braces around else statement
#37: FILE: drivers/gpu/drm/i915/display/i9xx_plane.c:868:
+	} else

total: 0 errors, 0 warnings, 1 checks, 44 lines checked
5936babdbf5f drm/i915/display: Add a disable_tiling() for skl planes
1d42b6e628a4 drm/i915/gem: export i915_gem_object_map_page/pfn
-:21: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#21: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.h:696:
+void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
+				      enum i915_map_type type);

-:23: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#23: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.h:698:
+void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
+				     enum i915_map_type type);

-:38: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#38: FILE: drivers/gpu/drm/i915/gem/i915_gem_pages.c:272:
+void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 				      enum i915_map_type type)

-:47: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#47: FILE: drivers/gpu/drm/i915/gem/i915_gem_pages.c:329:
+void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 				     enum i915_map_type type)

total: 0 errors, 0 warnings, 4 checks, 27 lines checked
a9e84e0716ae drm/i915: Add drm_panic support
-:139: CHECK:LINE_SPACING: Please don't use multiple blank lines
#139: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:1297:
 
+

total: 0 errors, 0 warnings, 1 checks, 130 lines checked


