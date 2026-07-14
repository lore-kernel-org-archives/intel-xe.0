Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796FBC44508
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 16:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FB110E098;
	Tue, 14 Jul 2026 16:54:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B1810E091;
 Tue, 14 Jul 2026 16:54:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_More_BIOS_FB_ta?=
 =?utf-8?q?keover_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 16:54:45 -0000
Message-ID: <178404808541.189125.12103115729294606644@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714162824.2063637-1-dev@lankhorst.se>
In-Reply-To: <20260714162824.2063637-1-dev@lankhorst.se>
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

Series: drm/xe: More BIOS FB takeover fixes
URL   : https://patchwork.freedesktop.org/series/170430/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c30be572e4e90bfdc96600175296f1d9770a84c
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Jul 14 18:28:24 2026 +0200

    drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
    
    This code was created specifically for the display handover,
    and can be removed now that we temporarily reserve the area
    of GGTT that contains the original framebuffer contents.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 381c2c353cae7ef6725a3cb7db597d0e2067537d drm-intel
3e7ae8a88084 drm/xe/ggtt: Allocate the area of GGTT above GUC_GGTT_TOP.
a513593a7568 drm/xe/ggtt: Add xe_ggtt_insert_node_at
b74c268a476f drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
1f84192ce7ce drm/xe/display: Reserve the original GGTT space before creating a bo
-:32: WARNING:LONG_LINE: line length of 143 exceeds 100 columns
#32: FILE: drivers/gpu/drm/xe/display/xe_initial_plane.c:118:
+		original_ggtt_node = xe_ggtt_insert_node_at(tile0->mem.ggtt, size - xe_ggtt_start(tile0->mem.ggtt), page_size, 0, base + size);

-:34: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#34: FILE: drivers/gpu/drm/xe/display/xe_initial_plane.c:120:
+		original_ggtt_node = xe_ggtt_insert_node_at(tile0->mem.ggtt, size, page_size, base, base + size);

total: 0 errors, 2 warnings, 0 checks, 28 lines checked
fd66574794a1 drm/xe/display: Use the correct calculation for phys_base on integrated
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#15: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
117856f98d6c drm/xe/display: Remove duplicated code
2c30be572e4e drm/xe/ggtt: Remove xe_ggtt_insert_bo_at


