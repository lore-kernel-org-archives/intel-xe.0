Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E13C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 17:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207A410E215;
	Tue, 21 Jan 2025 17:58:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5935A10E1D1;
 Tue, 21 Jan 2025 17:58:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/display=3A_Add_intel=5Fplane=5Finitial=5Fvblank=5Fwa?=
 =?utf-8?q?it?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jan 2025 17:58:26 -0000
Message-ID: <173748230636.2687243.5306918214387603853@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121142850.4960-1-dev@lankhorst.se>
In-Reply-To: <20250121142850.4960-1-dev@lankhorst.se>
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

Series: series starting with [1/3] drm/xe/display: Add intel_plane_initial_vblank_wait
URL   : https://patchwork.freedesktop.org/series/143800/
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
commit 68c121537430a286710e0730039842ac8cbccbd4
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Jan 21 15:28:50 2025 +0100

    drm/xe/display: Use a single early init call for display
    
    Now that interrupts are disabled for xe_display_init_noaccel,
    both xe_display_init_noirq and xe_display_init_noaccel run in the same
    context.
    
    This means that we can get rid of the 3 different init calls. Without
    interrupts, nothing is touching display up to this point.
    Unify those 3 early display calls into a single xe_display_init_early(),
    this makes the init sequence cleaner, and display less tangled during
    init.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 44010d7f04695da899c2860de32625a71011fbab drm-intel
677959cca5b6 drm/xe/display: Add intel_plane_initial_vblank_wait
-:118: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#118: FILE: drivers/gpu/drm/xe/display/xe_plane_initial.c:37:
+	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), pipe_frmtmstmp, ~0U, timestamp, 40000U, &timestamp, false);

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
a0ae429b7498 drm/xe: Defer irq init until after xe_display_init_noaccel
68c121537430 drm/xe/display: Use a single early init call for display


