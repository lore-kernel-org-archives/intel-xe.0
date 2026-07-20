Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48543C44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA62C10E9D4;
	Mon, 20 Jul 2026 16:13:11 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682210E9D3;
 Mon, 20 Jul 2026 16:13:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_More_BIOS_FB_ta?=
 =?utf-8?q?keover_fixes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 16:13:11 -0000
Message-ID: <178456399108.207232.5569240962268885567@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720160805.380356-8-dev@lankhorst.se>
In-Reply-To: <20260720160805.380356-8-dev@lankhorst.se>
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

Series: drm/xe: More BIOS FB takeover fixes (rev3)
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
commit 1f6ce6ab515db6913c5591ca25adae4849bcd971
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Jul 20 18:08:12 2026 +0200

    drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
    
    This code was created specifically for the display handover,
    and can be removed now that we temporarily reserve the area
    of GGTT that contains the original framebuffer contents.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch a51267f4154e42c8bb10b2c6503eed320cfa861e drm-intel
4eaa872635a3 drm/xe/ggtt: Add xe_ggtt_reserve_area
292fd143de34 drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
5ab4f244cedb drm/xe/display: Reserve the original GGTT space before creating a bo
0db3cd64de40 drm/xe/display: Use the correct calculation for phys_base on integrated
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#15: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
632f91d0f905 drm/xe/display: Remove duplicated code
1f6ce6ab515d drm/xe/ggtt: Remove xe_ggtt_insert_bo_at


