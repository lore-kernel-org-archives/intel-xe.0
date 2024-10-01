Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A1ECEB2CB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 00:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433410E080;
	Tue,  1 Oct 2024 00:05:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A025310E080;
 Tue,  1 Oct 2024 00:05:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_flickering_?=
 =?utf-8?q?when_inheriting_BIOS_fb=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 00:05:48 -0000
Message-ID: <172774114864.1139731.14306870192207179556@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Fix flickering when inheriting BIOS fb. (rev2)
URL   : https://patchwork.freedesktop.org/series/139215/
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
commit c7f64b9d38278fcf423bcb0d9183a0a4458a2f4c
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Sep 30 21:57:49 2024 +0200

    drm/xe: Initialise GGTT later
    
    Now that we know that nobody is using GGTT any more, postpone
    initialisation to prevent any new allocations.
    
    This prevents any new users from popping up.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
5562d7532090 drm/xe/display: Handle stolen bar readout in the same way as lmem
42260a9b319f drm/xe: Remove double pageflip
b9502426c55e drm/xe: Move suballocator init to after display init
d6826d527056 drm/xe: Initialize UC after xe_display_init_noaccel.
4f0e90a40957 drm/xe: Use xe_ggtt_map_bo_unlocked for resume
9c72ae315a4b drm/xe: Add xe_ggtt_might_lock
6ed7ee3c0303 drm/xe: Add xe_ggtt_alloc
-:22: WARNING:LINE_SPACING: Missing a blank line after declarations
#22: FILE: drivers/gpu/drm/xe/xe_ggtt.c:165:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
63a1e934ee80 drm/xe/display: Abstract read/write functions for GGTT PTEs
ba5e05bd4435 drm/xe: Make xe_ggtt_pt_ops private
-:117: CHECK:LINE_SPACING: Please don't use multiple blank lines
#117: FILE: drivers/gpu/drm/xe/xe_ggtt.c:77:
+
+

total: 0 errors, 0 warnings, 1 checks, 137 lines checked
5e391b3ec04c drm/xe/display: Stop dereferencing ggtt in xe_fb_pin
dd7064cfee66 drm/xe/display: Stop dereferencing ggtt in xe_fb_pin
37723ea8c045 drm/xe: Move struct xe_ggtt to xe_ggtt.c
c91673575f27 drm/xe/display: Use async flip for flipping initial fb.
-:44: WARNING:LONG_LINE: line length of 139 exceeds 100 columns
#44: FILE: drivers/gpu/drm/xe/display/xe_plane_initial.c:246:
+	if (intel_wait_for_register_fw(&xe->uncore, PLANE_SURFLIVE(plane->pipe, PLANE_1), XE_PAGE_SIZE - 1, vma->node->base.start, 40) < 0)

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
c1b6854c3611 drm/xe: Move interrupt initialisation until after xe_display_init_noaccel
c7f64b9d3827 drm/xe: Initialise GGTT later


