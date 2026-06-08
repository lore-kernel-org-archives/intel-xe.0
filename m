Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47049CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094E710F46C;
	Mon,  8 Jun 2026 14:17:06 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9464310F469;
 Mon,  8 Jun 2026 14:17:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Fix_P?=
 =?utf-8?q?PC-granularity_and_limit_2nd_scaler_to_1=3A1?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vidya Srinivas" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 14:17:04 -0000
Message-ID: <178092822460.54361.8229731106725809310@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608140510.629170-1-vidya.srinivas@intel.com>
In-Reply-To: <20260608140510.629170-1-vidya.srinivas@intel.com>
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

Series: drm/i915/display: Fix PPC-granularity and limit 2nd scaler to 1:1
URL   : https://patchwork.freedesktop.org/series/168090/
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
commit 6d8d841ee8659e1db8dee522cea2f9346e25ee95
Author: Vidya Srinivas <vidya.srinivas@intel.corp-partner.google.com>
Date:   Mon Jun 8 19:35:09 2026 +0530

    drm/i915/display: Fix PPC-granularity and limit 2nd scaler to 1:1
    
    The existing icl_plane_min_cdclk() uses a simple pixel_rate/PPC
    calculation that does not account for the pipeline granularity
    adjustment when horizontal downscaling is active. The effective
    pixels-per-clock throughput is reduced due to integer pipeline
    granularity, requiring a higher CDCLK than the current one computes.
    This causes FIFO underruns on multi-pipe configurations near max CDCLK.
    
    Additionally, limit second scaler to 1:1
    (no horizontal or vertical downscaling) on DISPLAY_VER > 14
    
    Also apply CDCLK PLL disable/enable WA for DISPLAY_VER 30
    
    Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
    Signed-off-by: Charlton Lin <charlton.lin@intel.com>
+ /mt/dim checkpatch 044152a1643f7150f482c8d326caa5023ae4c397 drm-intel
6d8d841ee865 drm/i915/display: Fix PPC-granularity and limit 2nd scaler to 1:1
-:45: CHECK:BRACES: Unbalanced braces around else statement
#45: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:385:
+		else {

-:66: ERROR:CODE_INDENT: code indent should use tabs where possible
#66: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:267:
+                   const struct intel_plane_state *plane_state)$

-:66: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#66: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:267:
+                   const struct intel_plane_state *plane_state)$

-:68: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#68: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:269:
+    struct intel_display *display = to_intel_display(crtc_state);$

-:69: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#69: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:270:
+    unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);$

-:71: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#71: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:272:
+    if (DISPLAY_VER(display) >= 30) {$

-:72: ERROR:CODE_INDENT: code indent should use tabs where possible
#72: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:273:
+        unsigned int src_w = drm_rect_width(&plane_state->uapi.src) >> 16;$

-:72: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#72: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:273:
+        unsigned int src_w = drm_rect_width(&plane_state->uapi.src) >> 16;$

-:73: ERROR:CODE_INDENT: code indent should use tabs where possible
#73: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:274:
+        unsigned int dst_w = drm_rect_width(&plane_state->uapi.dst);$

-:73: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#73: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:274:
+        unsigned int dst_w = drm_rect_width(&plane_state->uapi.dst);$

-:74: ERROR:CODE_INDENT: code indent should use tabs where possible
#74: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:275:
+        unsigned int src_h = drm_rect_height(&plane_state->uapi.src) >> 16;$

-:74: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#74: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:275:
+        unsigned int src_h = drm_rect_height(&plane_state->uapi.src) >> 16;$

-:75: ERROR:CODE_INDENT: code indent should use tabs where possible
#75: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:276:
+        unsigned int dst_h = drm_rect_height(&plane_state->uapi.dst);$

-:75: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#75: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:276:
+        unsigned int dst_h = drm_rect_height(&plane_state->uapi.dst);$

-:76: ERROR:CODE_INDENT: code indent should use tabs where possible
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:277:
+        const unsigned int ppc = 2;$

-:76: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:277:
+        const unsigned int ppc = 2;$

-:78: ERROR:CODE_INDENT: code indent should use tabs where possible
#78: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:279:
+        /*$

-:79: ERROR:CODE_INDENT: code indent should use tabs where possible
#79: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:280:
+         * "Resolution Support" PPC-granularity:$

-:80: ERROR:CODE_INDENT: code indent should use tabs where possible
#80: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:281:
+         *   Hscale_PPC = (src_w / dst_w) * PPC$

-:81: ERROR:CODE_INDENT: code indent should use tabs where possible
#81: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:282:
+         *   int_part = floor(Hscale_PPC)$

-:82: ERROR:CODE_INDENT: code indent should use tabs where possible
#82: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:283:
+         *   frac = Hscale_PPC - int_part$

-:83: ERROR:CODE_INDENT: code indent should use tabs where possible
#83: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:284:
+         *   adjusted_frac = frac > 0 ? 1/ROUNDUP(1/frac) : 0$

-:84: ERROR:CODE_INDENT: code indent should use tabs where possible
#84: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:285:
+         *   H_down = int_part/PPC + adjusted_frac$

-:85: ERROR:CODE_INDENT: code indent should use tabs where possible
#85: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:286:
+         *   min_cdclk = crtc_clock * H_down * V_down / PPC$

-:86: ERROR:CODE_INDENT: code indent should use tabs where possible
#86: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:287:
+         */$

-:87: ERROR:CODE_INDENT: code indent should use tabs where possible
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:288:
+        if (dst_w && dst_h && src_w > dst_w) {$

-:87: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:288:
+        if (dst_w && dst_h && src_w > dst_w) {$

-:87: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:288:
+        if (dst_w && dst_h && src_w > dst_w) {
+            unsigned int hscale_ppc = src_w * ppc;

-:88: ERROR:CODE_INDENT: code indent should use tabs where possible
#88: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:289:
+            unsigned int hscale_ppc = src_w * ppc;$

-:88: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#88: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:289:
+            unsigned int hscale_ppc = src_w * ppc;$

-:89: ERROR:CODE_INDENT: code indent should use tabs where possible
#89: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:290:
+            unsigned int int_part = hscale_ppc / dst_w;$

-:89: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#89: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:290:
+            unsigned int int_part = hscale_ppc / dst_w;$

-:90: ERROR:CODE_INDENT: code indent should use tabs where possible
#90: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:291:
+            unsigned int frac_num = hscale_ppc % dst_w;$

-:90: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#90: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:291:
+            unsigned int frac_num = hscale_ppc % dst_w;$

-:91: ERROR:CODE_INDENT: code indent should use tabs where possible
#91: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:292:
+            unsigned int v_num = max(src_h, dst_h);$

-:91: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#91: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:292:
+            unsigned int v_num = max(src_h, dst_h);$

-:92: ERROR:CODE_INDENT: code indent should use tabs where possible
#92: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:293:
+            u64 num;$

-:92: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#92: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:293:
+            u64 num;$

-:94: ERROR:CODE_INDENT: code indent should use tabs where possible
#94: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:295:
+            if (frac_num) {$

-:94: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#94: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:295:
+            if (frac_num) {$

-:95: ERROR:CODE_INDENT: code indent should use tabs where possible
#95: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:296:
+                unsigned int recip_ceil = DIV_ROUND_UP(dst_w, frac_num);$

-:95: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#95: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:296:
+                unsigned int recip_ceil = DIV_ROUND_UP(dst_w, frac_num);$

-:96: ERROR:CODE_INDENT: code indent should use tabs where possible
#96: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:297:
+                /* H_down = (int_part * recip_ceil + ppc) / (ppc * recip_ceil) */$

-:97: ERROR:CODE_INDENT: code indent should use tabs where possible
#97: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:298:
+                unsigned int h_num = int_part * recip_ceil + ppc;$

-:97: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#97: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:298:
+                unsigned int h_num = int_part * recip_ceil + ppc;$

-:98: ERROR:CODE_INDENT: code indent should use tabs where possible
#98: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:299:
+                unsigned int h_den = ppc * recip_ceil;$

-:98: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#98: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:299:
+                unsigned int h_den = ppc * recip_ceil;$

-:100: ERROR:CODE_INDENT: code indent should use tabs where possible
#100: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:301:
+                num = mul_u32_u32(crtc_state->pixel_rate, h_num);$

-:100: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#100: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:301:
+                num = mul_u32_u32(crtc_state->pixel_rate, h_num);$

-:101: ERROR:CODE_INDENT: code indent should use tabs where possible
#101: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:302:
+                num *= v_num;$

-:101: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#101: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:302:
+                num *= v_num;$

-:102: ERROR:CODE_INDENT: code indent should use tabs where possible
#102: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:303:
+                return DIV_ROUND_UP_ULL(num,$

-:102: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#102: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:303:
+                return DIV_ROUND_UP_ULL(num,$

-:103: ERROR:CODE_INDENT: code indent should use tabs where possible
#103: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:304:
+                            (u64)h_den * ppc * dst_h);$

-:103: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#103: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:304:
+                            (u64)h_den * ppc * dst_h);$

-:104: ERROR:CODE_INDENT: code indent should use tabs where possible
#104: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:305:
+            }$

-:104: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#104: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:305:
+            }$

-:106: ERROR:CODE_INDENT: code indent should use tabs where possible
#106: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:307:
+            /* frac == 0: H_down = int_part / ppc exactly */$

-:107: ERROR:CODE_INDENT: code indent should use tabs where possible
#107: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:308:
+            num = mul_u32_u32(crtc_state->pixel_rate, int_part);$

-:107: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#107: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:308:
+            num = mul_u32_u32(crtc_state->pixel_rate, int_part);$

-:108: ERROR:CODE_INDENT: code indent should use tabs where possible
#108: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:309:
+            num *= v_num;$

-:108: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#108: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:309:
+            num *= v_num;$

-:109: ERROR:CODE_INDENT: code indent should use tabs where possible
#109: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:310:
+            return DIV_ROUND_UP_ULL(num, (u64)ppc * ppc * dst_h);$

-:109: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#109: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:310:
+            return DIV_ROUND_UP_ULL(num, (u64)ppc * ppc * dst_h);$

-:110: ERROR:CODE_INDENT: code indent should use tabs where possible
#110: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:311:
+        }$

-:110: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#110: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:311:
+        }$

-:112: ERROR:CODE_INDENT: code indent should use tabs where possible
#112: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:313:
+        /* No horizontal downscale */$

-:113: ERROR:CODE_INDENT: code indent should use tabs where possible
#113: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:314:
+        return DIV_ROUND_UP(pixel_rate, ppc);$

-:113: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#113: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:314:
+        return DIV_ROUND_UP(pixel_rate, ppc);$

-:114: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#114: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:315:
+    }$

-:117: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#117: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:318:
+    return DIV_ROUND_UP(pixel_rate, 2);$

-:120: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Vidya Srinivas <vidya.srinivas@intel.corp-partner.google.com>' != 'Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>'

total: 38 errors, 33 warnings, 1 checks, 84 lines checked


