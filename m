Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91219E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 15:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68410E540;
	Mon,  9 Dec 2024 15:56:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A4210E7C5;
 Mon,  9 Dec 2024 15:56:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Rework_?=
 =?utf-8?q?display_init_for_reducing_flickering=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Dec 2024 15:56:57 -0000
Message-ID: <173375981778.510854.5566922789915036428@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206185956.3290-1-dev@lankhorst.se>
In-Reply-To: <20241206185956.3290-1-dev@lankhorst.se>
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

Series: drm/xe/display: Rework display init for reducing flickering. (rev3)
URL   : https://patchwork.freedesktop.org/series/142241/
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
commit 99733344d0ef5dba42230044f2bc2d7ac495b25a
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Dec 9 16:51:42 2024 +0100

    drm/xe/display: Use a single early init call for display
    
    Instead of 3 different calls, it should be safe to unify to a single
    call now. This makes the init sequence cleaner, and display less
    tangled.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 2864e419e05c29b6780bd41711375d274aa43f06 drm-intel
4d3d440be10c drm/xe/display: Add intel_plane_initial_vblank_wait
-:110: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#110: FILE: drivers/gpu/drm/xe/display/xe_plane_initial.c:37:
+	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), pipe_frmtmstmp, ~0U, timestamp, 40000U, &timestamp, false);

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
c060a078b854 drm/xe: Remove double pageflip
38117bf4c57b drm/xe: Move suballocator init to after display init
3e8fd72d99da drm/xe: Defer irq init until after xe_display_init_noaccel
99733344d0ef drm/xe/display: Use a single early init call for display


