Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9D0E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 09:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C28810E873;
	Tue, 10 Dec 2024 09:42:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24CE10E86D;
 Tue, 10 Dec 2024 09:42:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Add_drm=5Fpan?=
 =?utf-8?q?ic_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 09:42:55 -0000
Message-ID: <173382377566.788109.14905444943250889092@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210093505.589893-1-jfalempe@redhat.com>
In-Reply-To: <20241210093505.589893-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev3)
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
commit dd021d94c155d3a50d1c3538371994b17e3aa4fa
Author: Jocelyn Falempe <jfalempe@redhat.com>
Date:   Tue Dec 10 10:28:46 2024 +0100

    drm/i915: Add drm_panic support for Y-tiling with DPT
    
    On Alderlake and later, it's not possible to disable tiling when DPT
    is enabled.
    So this commit implements Y-Tiling support, to still be able to draw
    the panic screen. The Tile-4 support found in the latest Intel GPU
    will come later.
    
    Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
+ /mt/dim checkpatch 4265400fd785f56099b00f9c745b7131b06bb511 drm-intel
1c25090af2fc drm/i915/fbdev: Add intel_fbdev_get_vaddr()
0dd949e498db drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
3e25782dbf08 drm/i915/display: Add a disable_tiling() for skl planes
c07504732448 drm/i915/gem: Add i915_gem_object_panic_map()
6a938855481c drm/i915: Add drm_panic support
dd021d94c155 drm/i915: Add drm_panic support for Y-tiling with DPT


