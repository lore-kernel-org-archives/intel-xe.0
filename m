Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C49D4979A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 09:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A314710E9BB;
	Tue,  3 Dec 2024 09:42:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F1B10E9B9;
 Tue,  3 Dec 2024 09:42:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Add_drm=5Fpan?=
 =?utf-8?q?ic_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 09:42:20 -0000
Message-ID: <173321894081.1949807.15386725375509956694@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203092836.426422-1-jfalempe@redhat.com>
In-Reply-To: <20241203092836.426422-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev2)
URL   : https://patchwork.freedesktop.org/series/141937/
State : success

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
commit f04c7323884f94dd1f3b8599bdcab65aea513fe4
Author: Jocelyn Falempe <jfalempe@redhat.com>
Date:   Tue Dec 3 09:50:22 2024 +0100

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
+ /mt/dim checkpatch 4de82d50b8de6a278c1483a7f76ae830c89d1824 drm-intel
44661aaa9e53 drm/i915/fbdev: Add intel_fbdev_get_vaddr()
e636ada72275 drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
0bf32eeed93b drm/i915/display: Add a disable_tiling() for skl planes
dad623f21ffe drm/i915/gem: Add i915_gem_object_panic_map()
f04c7323884f drm/i915: Add drm_panic support


