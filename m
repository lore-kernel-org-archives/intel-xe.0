Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4B4C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E44910EFFE;
	Wed, 15 Jul 2026 11:50:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145DB10EFF4;
 Wed, 15 Jul 2026 11:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_More_BIOS_FB_ta?=
 =?utf-8?q?keover_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jul 2026 11:50:25 -0000
Message-ID: <178411622507.190770.7204379882869646266@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715110557.2172095-1-dev@lankhorst.se>
In-Reply-To: <20260715110557.2172095-1-dev@lankhorst.se>
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

Series: drm/xe: More BIOS FB takeover fixes (rev2)
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
commit 789f7ded7c8177bae40ec3e41db47f28c3434b81
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Jul 15 13:05:57 2026 +0200

    drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
    
    This code was created specifically for the display handover,
    and can be removed now that we temporarily reserve the area
    of GGTT that contains the original framebuffer contents.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch da96f9b0a90a3d45db3f3d7002783dbcb1eaa92b drm-intel
1dc928e4acb3 drm/xe/ggtt: Add xe_ggtt_insert_node_at
60040b37eeb9 drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
dbb8260efc88 drm/xe/display: Reserve the original GGTT space before creating a bo
-:21: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/display/xe_initial_plane.c:40:
+static struct xe_ggtt_node *reserve_original_node(struct xe_ggtt *ggtt, u32 base, u32 size, u64 page_size)

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
4d44c04b38f1 drm/xe/display: Use the correct calculation for phys_base on integrated
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#15: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
e96b82a1640e drm/xe/display: Remove duplicated code
789f7ded7c81 drm/xe/ggtt: Remove xe_ggtt_insert_bo_at


