Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A61C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 11:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A88610E9E9;
	Fri, 25 Jul 2025 11:32:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0D10E9E0;
 Fri, 25 Jul 2025 11:32:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_remapped_fb_view_test_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 11:32:46 -0000
Message-ID: <175344316695.189847.8298528673977363999@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725070305.87218-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250725070305.87218-1-tvrtko.ursulin@igalia.com>
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

Series: remapped fb view test (rev3)
URL   : https://patchwork.freedesktop.org/series/152114/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 017327c055b62fe6db6f4c09623b579206bf8605
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Jul 25 12:27:57 2025 +0100

    drm/xe/display: Add support for AuxCCS
    
    Add support for mapping the auxiliary CCS buffer into the DPT page tables.
    
    This will allow for more power efficiency by enabling the render
    compression frame buffer modifiers such as
    I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS in a following patch.
    
    We do this by refactoring the code a bit so handling for the linear
    auxiliary frame buffer can be added in a tidy way. Also replace some
    hardcoded constants and tighten the loops a bit.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 9496b813b729fc1c22cbdc7cfb7a922915582107 drm-intel
017327c055b6 drm/xe/display: Add support for AuxCCS
-:113: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#113: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:121:
+	printk("write_dpt_remapped plane_alignment=%x\n",

-:113: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'write_dpt_remapped', this function's name, in a string
#113: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:121:
+	printk("write_dpt_remapped plane_alignment=%x\n",

-:124: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#124: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:132:
+			printk("write_dpt_remapped [%u] linear offset=%x size=%x\n",

-:124: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'write_dpt_remapped', this function's name, in a string
#124: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:132:
+			printk("write_dpt_remapped [%u] linear offset=%x size=%x\n",

-:127: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#127: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:135:
+			printk("write_dpt_remapped [%u] tiled  offset=%x %ux%u src_stride=%u dst_stride=%u\n",

-:127: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'write_dpt_remapped', this function's name, in a string
#127: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:135:
+			printk("write_dpt_remapped [%u] tiled  offset=%x %ux%u src_stride=%u dst_stride=%u\n",

-:128: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#128: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:136:
+			       i, plane->offset, plane->width, plane->height, plane->src_stride, plane->dst_stride);

-:137: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#137: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:145:
+			printk("write_dpt_remapped [%u] padded to dest=%x\n",

-:137: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'write_dpt_remapped', this function's name, in a string
#137: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:145:
+			printk("write_dpt_remapped [%u] padded to dest=%x\n",

-:143: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#143: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:151:
+			printk("write_dpt_remapped [%u] linear to dest=%x\n",

-:143: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'write_dpt_remapped', this function's name, in a string
#143: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:151:
+			printk("write_dpt_remapped [%u] linear to dest=%x\n",

-:147: WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> facility level
#147: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:155:
+			printk("write_dpt_remapped [%u] tiled  to dest=%x\n",

-:147: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'write_dpt_remapped', this function's name, in a string
#147: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:155:
+			printk("write_dpt_remapped [%u] tiled  to dest=%x\n",

total: 0 errors, 13 warnings, 0 checks, 147 lines checked


