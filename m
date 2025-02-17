Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE97C021A0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 09:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4606810E2D8;
	Mon, 17 Feb 2025 09:22:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E4110E2D8;
 Mon, 17 Feb 2025 09:22:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Provide_more_?=
 =?utf-8?q?information_on_display_faults_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 09:22:21 -0000
Message-ID: <173978414115.3212115.5026057174442927220@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217070047.953-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250217070047.953-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Provide more information on display faults (rev3)
URL   : https://patchwork.freedesktop.org/series/143626/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4730b4b32793bdfa62beb543ed46a39899fd1ca3
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Feb 17 09:00:47 2025 +0200

    drm/i915: Hook up display fault interrupts for VLV/CHV
    
    Hook up the display fault irq handlers for VLV/CHV.
    
    Unfortunately the actual hardware doesn't agree with the
    spec on how DPINVGTT should behave. The docs claim that
    the status bits can be cleared by writing '1' to them,
    but in reality there doesn't seem to be any way to clear
    them. So we must disable and ignore any fault we've already
    seen in the past. The entire register does reset when
    the display power well goes down, so we can just always
    re-enable all the bits in irq postinstall without having
    to track the state beyond that.
    
    v2: Use intel_display instead of dev_priv
        Move xe gen2_error_{init,reset}() out
    
    Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 297dc497ff4e957b8a82d4d9f67631e322bdd2a5 drm-intel
e9e6fdab669c drm/i915: Add missing else to the if ladder in missing else
142955d6f243 drm/i915: Introduce a minimal plane error state
7359b2df1967 drm/i915: Pimp display fault reporting
-:154: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#154: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1039:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:167: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#167: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1052:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:179: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#179: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1064:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:188: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#188: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1073:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:193: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#193: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1078:
+	{ .fault = GEN8_PIPE_SPRITE_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:194: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1079:
+	{ .fault = GEN8_PIPE_PRIMARY_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:195: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#195: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1080:
+	{ .fault = GEN8_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

total: 0 errors, 7 warnings, 0 checks, 196 lines checked
d928cea52024 drm/i915: Hook in display GTT faults for IVB/HSW
-:45: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#45: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:744:
+	{ .fault = ERR_INT_SPRITE_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:46: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#46: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:745:
+	{ .fault = ERR_INT_PRIMARY_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:47: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:746:
+	{ .fault = ERR_INT_CURSOR_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:48: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:747:
+	{ .fault = ERR_INT_SPRITE_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:49: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#49: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:748:
+	{ .fault = ERR_INT_PRIMARY_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:50: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:749:
+	{ .fault = ERR_INT_CURSOR_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:51: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#51: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:750:
+	{ .fault = ERR_INT_SPRITE_C_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:52: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:751:
+	{ .fault = ERR_INT_PRIMARY_C_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:53: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:752:
+	{ .fault = ERR_INT_CURSOR_C_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

total: 0 errors, 9 warnings, 0 checks, 82 lines checked
e2d2b4644ac1 drm/i915: Hook in display GTT faults for ILK/SNB
-:40: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:864:
+	{ .fault = GTT_FAULT_SPRITE_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:41: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:865:
+	{ .fault = GTT_FAULT_SPRITE_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:42: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:866:
+	{ .fault = GTT_FAULT_PRIMARY_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:43: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:867:
+	{ .fault = GTT_FAULT_PRIMARY_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:44: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:868:
+	{ .fault = GTT_FAULT_CURSOR_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:45: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#45: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:869:
+	{ .fault = GTT_FAULT_CURSOR_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

total: 0 errors, 6 warnings, 0 checks, 90 lines checked
3ab66b7a2562 drm/i915: Introduce i915_error_regs
9cde225f1e89 drm/i915: Un-invert {i9xx,i965}_error_mask()
4730b4b32793 drm/i915: Hook up display fault interrupts for VLV/CHV
-:59: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1811:
+	{ .fault = SPRITEB_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE1, },

-:60: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#60: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1812:
+	{ .fault = SPRITEA_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:61: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1813:
+	{ .fault = PLANEA_INVALID_GTT_STATUS,  .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:62: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1814:
+	{ .fault = CURSORA_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR,  },

-:63: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#63: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1815:
+	{ .fault = SPRITED_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE1, },

-:64: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1816:
+	{ .fault = SPRITEC_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:65: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1817:
+	{ .fault = PLANEB_INVALID_GTT_STATUS,  .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:66: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1818:
+	{ .fault = CURSORB_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR,  },

-:67: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1819:
+	{ .fault = SPRITEF_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE1, },

-:68: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#68: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1820:
+	{ .fault = SPRITEE_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:69: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#69: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1821:
+	{ .fault = PLANEC_INVALID_GTT_STATUS,  .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:70: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1822:
+	{ .fault = CURSORC_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR,  },

total: 0 errors, 12 warnings, 0 checks, 237 lines checked


