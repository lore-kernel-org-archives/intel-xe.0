Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC934C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 10:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34D310EAC6;
	Fri, 17 Jan 2025 10:35:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A455710EAC6;
 Fri, 17 Jan 2025 10:35:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Provide_more_?=
 =?utf-8?q?information_on_display_faults_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 10:35:57 -0000
Message-ID: <173711015766.677711.10456198128233168376@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116174758.18298-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250116174758.18298-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Provide more information on display faults (rev2)
URL   : https://patchwork.freedesktop.org/series/143626/
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
commit a4d39c2742555069899caacea3836d420e6ec9c2
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Jan 16 19:47:58 2025 +0200

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
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 48e8781781323a28fabb378bcc79b3f48c1bcae0 drm-intel
3b1f05c68f12 drm/i915: Add missing else to the if ladder in missing else
9d3ac838a3ec drm/i915: Introduce a minimal plane error state
33f990f76ebe drm/i915: Pimp display fault reporting
-:153: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#153: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:987:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:166: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#166: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1000:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:178: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#178: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1012:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:187: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#187: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1021:
+	{ .fault = GEN9_PIPE_CURSOR_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:192: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#192: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1026:
+	{ .fault = GEN8_PIPE_SPRITE_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:193: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#193: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1027:
+	{ .fault = GEN8_PIPE_PRIMARY_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:194: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1028:
+	{ .fault = GEN8_PIPE_CURSOR_FAULT,  .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

total: 0 errors, 7 warnings, 0 checks, 196 lines checked
56192833afe7 drm/i915: Hook in display GTT faults for IVB/HSW
-:43: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:693:
+	{ .fault = ERR_INT_SPRITE_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:44: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:694:
+	{ .fault = ERR_INT_PRIMARY_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:45: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#45: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:695:
+	{ .fault = ERR_INT_CURSOR_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:46: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#46: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:696:
+	{ .fault = ERR_INT_SPRITE_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:47: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:697:
+	{ .fault = ERR_INT_PRIMARY_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:48: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:698:
+	{ .fault = ERR_INT_CURSOR_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:49: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#49: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:699:
+	{ .fault = ERR_INT_SPRITE_C_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:50: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:700:
+	{ .fault = ERR_INT_PRIMARY_C_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:51: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#51: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:701:
+	{ .fault = ERR_INT_CURSOR_C_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

total: 0 errors, 9 warnings, 0 checks, 85 lines checked
2eaddddb96af drm/i915: Hook in display GTT faults for ILK/SNB
-:38: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#38: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:812:
+	{ .fault = GTT_FAULT_SPRITE_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:39: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:813:
+	{ .fault = GTT_FAULT_SPRITE_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:40: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:814:
+	{ .fault = GTT_FAULT_PRIMARY_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:41: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:815:
+	{ .fault = GTT_FAULT_PRIMARY_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:42: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:816:
+	{ .fault = GTT_FAULT_CURSOR_A_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

-:43: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:817:
+	{ .fault = GTT_FAULT_CURSOR_B_FAULT, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR, },

total: 0 errors, 6 warnings, 0 checks, 90 lines checked
cdff1c0723e9 drm/i915: Introduce i915_error_regs
9881facbec96 drm/i915: Un-invert {i9xx,i965}_error_mask()
a4d39c274255 drm/i915: Hook up display fault interrupts for VLV/CHV
-:55: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1756:
+	{ .fault = SPRITEB_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE1, },

-:56: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#56: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1757:
+	{ .fault = SPRITEA_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:57: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1758:
+	{ .fault = PLANEA_INVALID_GTT_STATUS,  .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:58: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1759:
+	{ .fault = CURSORA_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR,  },

-:59: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1760:
+	{ .fault = SPRITED_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE1, },

-:60: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#60: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1761:
+	{ .fault = SPRITEC_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:61: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1762:
+	{ .fault = PLANEB_INVALID_GTT_STATUS,  .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:62: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1763:
+	{ .fault = CURSORB_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR,  },

-:63: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#63: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1764:
+	{ .fault = SPRITEF_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE1, },

-:64: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1765:
+	{ .fault = SPRITEE_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_SPRITE0, },

-:65: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1766:
+	{ .fault = PLANEC_INVALID_GTT_STATUS,  .handle = handle_plane_fault, .plane_id = PLANE_PRIMARY, },

-:66: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1767:
+	{ .fault = CURSORC_INVALID_GTT_STATUS, .handle = handle_plane_fault, .plane_id = PLANE_CURSOR,  },

total: 0 errors, 12 warnings, 0 checks, 265 lines checked


