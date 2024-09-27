Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80672CDD1B8
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E45210ECAE;
	Fri, 27 Sep 2024 14:43:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978B10ECAE;
 Fri, 27 Sep 2024 14:43:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_flickering_?=
 =?utf-8?q?when_inheriting_BIOS_fb=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 14:43:13 -0000
Message-ID: <172744819336.1111107.6436495249350883551@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Fix flickering when inheriting BIOS fb.
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
commit 42ff2d5c16217589a27e29433b62d7de75f75338
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Sep 27 16:14:04 2024 +0200

    drm/xe: Initialise GGTT later
    
    Now that we know that nobody is using GGTT any more, postpone
    initialisation to prevent any new allocations.
    
    This prevents any new users from popping up.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 4d4fdd11d1cc941f2f7c1653fc07519851d9052b drm-intel
96a4fb680561 drm/xe/display: Handle stolen bar readout in the same way as lmem
6b9017a27ff3 drm/xe: Remove double pageflip
7ccf27c7f0af drm/xe: Move suballocator init to after display init
69e10507ddc9 drm/xe: Initialize UC after xe_display_init_noaccel.
337f4045938d drm/xe: Use xe_ggtt_map_bo_unlocked for resume
0e4aa482c94b drm/xe: Add xe_ggtt_might_lock
e24765c8a227 drm/xe: Add xe_ggtt_alloc
-:22: WARNING:LINE_SPACING: Missing a blank line after declarations
#22: FILE: drivers/gpu/drm/xe/xe_ggtt.c:165:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
598c8b149cfd drm/xe/display: Abstract read/write functions for GGTT PTEs
0f05b23ada9e drm/xe: Make xe_ggtt_pt_ops private
-:117: CHECK:LINE_SPACING: Please don't use multiple blank lines
#117: FILE: drivers/gpu/drm/xe/xe_ggtt.c:77:
+
+

total: 0 errors, 0 warnings, 1 checks, 137 lines checked
786610d32615 drm/xe/display: Stop dereferencing ggtt in xe_fb_pin
8c249f1fce38 drm/xe: Move struct xe_ggtt to xe_ggtt.c
b977b76d003a drm/xe/display: Use async flip for flipping initial fb.
d6c57f917dcb drm/xe: Move interrupt initialisation until after xe_display_init_noaccel
42ff2d5c1621 drm/xe: Initialise GGTT later


