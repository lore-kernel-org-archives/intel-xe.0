Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14F7D43352
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 12:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8631610E826;
	Thu,  7 Nov 2024 12:57:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9B10E826;
 Thu,  7 Nov 2024 12:57:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/9=5D_drm/xe=3A_Remove_double_pageflip_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 12:57:54 -0000
Message-ID: <173098427487.1422120.2975316489287947305@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107100140.292928-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241107100140.292928-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/9] drm/xe: Remove double pageflip (rev2)
URL   : https://patchwork.freedesktop.org/series/141047/
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
commit 1ee2074adc07f047db8de5fe5113842484eb5700
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Nov 7 11:01:40 2024 +0100

    drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
    
    Now that we added the separate step of initialising GUC in
    xe_gt_init_early, it should be ok to initialise the minimum during early
    init, and the rest after allocations are allowed.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20241105121857.17389-9-maarten.lankhorst@linux.intel.com
    Signed-off-by: Maarten Lankhorst,,, <dev@lankhorst.se>
+ /mt/dim checkpatch 6f358787ded211657532e2ee4df2e446b03d860f drm-intel
1b9469d485ea drm/xe: Remove double pageflip
d8c716aa4b41 drm/xe/display: Add intel_plane_initial_vblank_wait
-:54: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_plane_initial.c:19:
+	struct intel_crtc *crtc = intel_crtc_for_pipe(to_intel_display(plane->base.dev), plane->pipe);

-:113: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#113: FILE: drivers/gpu/drm/xe/display/xe_plane_initial.c:37:
+	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), pipe_frmtmstmp, ~0U, timestamp, 40000U, &timestamp, false);

total: 0 errors, 2 warnings, 0 checks, 92 lines checked
6598a352aff3 drm/xe: Move suballocator init to after display init
cf3ead35722b drm/xe: Defer irq init until after xe_display_init_noaccel
ff4e41135728 drm/xe/display: Use a single early init call for display
261f035dff2b drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
c4a2c70447df drm/xe: Simplify GuC early initialisation
-:331: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#331: FILE: drivers/gpu/drm/xe/xe_uc.c:47:
+	/* HuC and GSC have no early dependencies and can be completely initialised during full xe_uc_init(). */

total: 0 errors, 1 warnings, 0 checks, 274 lines checked
db221f5a7de4 drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
instance 0, which fortunately means no dependencies on further initialisation

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
1ee2074adc07 drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early


