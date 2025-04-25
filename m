Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D1EC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 10:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25C910E900;
	Fri, 25 Apr 2025 10:04:07 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3992110E094;
 Fri, 25 Apr 2025 10:04:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Add_drm=5Fpan?=
 =?utf-8?q?ic_support_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 10:04:06 -0000
Message-ID: <174557544623.10194.14827530467875478694@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250425094949.473060-1-jfalempe@redhat.com>
In-Reply-To: <20250425094949.473060-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev7)
URL   : https://patchwork.freedesktop.org/series/141937/
State : success

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
commit 601379e2dcd89062230a06df7306b9964b3029ce
Author: Jocelyn Falempe <jfalempe@redhat.com>
Date:   Fri Apr 25 11:37:54 2025 +0200

    drm/i915/display: Add drm_panic support for 4-tiling with DPT
    
    On Alder Lake and later, it's not possible to disable tiling when DPT
    is enabled.
    So this commit implements 4-Tiling support, to still be able to draw
    the panic screen.
    
    Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
+ /mt/dim checkpatch 5c29806460a155cbfb176d48bd707cdf17bf259b drm-intel
af0b9df3f3be drm/i915/fbdev: Add intel_fbdev_get_map()
16ce77da9283 drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
c033e1ee1b06 drm/i915/display: Add a disable_tiling() for skl planes
b58324768b6c drm/i915/gem: Add i915_gem_object_panic_map()
be0fd43279fb drm/i915/display: Add drm_panic support
72ba10d0672f drm/i915/display: Flush the front buffer in panic handler
95a4dca8c15e drm/i915/display: Add drm_panic support for Y-tiling with DPT
601379e2dcd8 drm/i915/display: Add drm_panic support for 4-tiling with DPT


