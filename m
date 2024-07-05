Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFBBC30658
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 14:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C577610EC00;
	Fri,  5 Jul 2024 14:58:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073510EC05;
 Fri,  5 Jul 2024 14:58:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D=3A_F?=
 =?utf-8?q?BC_cleanups_+_tweak_fbdev_stolen_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jul 2024 14:58:56 -0000
Message-ID: <172019153632.30984.8198730338269857585@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705145254.3355-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240705145254.3355-1-ville.syrjala@linux.intel.com>
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

Series: drm/{i915, xe}: FBC cleanups + tweak fbdev stolen usage
URL   : https://patchwork.freedesktop.org/series/135799/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b48e830a8191add5115e983b560af0d728dde2e5
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Jul 5 17:52:54 2024 +0300

    drm/xe/fbdev: Adjust fbdev stolen mem usage heuristic
    
    Replace the "1/2 of stolen size" fbdev fb size heuristic with
    something a bit more clever, that is ask the FBC code how much
    stolen mem it would like to have avaialable for its CFB use.
    
    TODO:
    - This doesn't account for the fact that FBC's idea
      usable stolen size might differ from other users of stolen
    - Would be nice to share the code with i915, but need to
      figure out how to abstract the stolen size and
      dgpu/lmem stuff
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch cdd1a80a2d16d5213af20a29eb7570a7651db7dc drm-intel
8e86b63e8866 drm/i915/fbc: Extract intel_fbc_has_fences()
06a70f64468e drm/i915/fbc: Convert to intel_display, mostly
-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__fbc_id' - possible side-effects?
#72: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:64:
+#define for_each_fbc_id(__display, __fbc_id) \
 	for ((__fbc_id) = INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)++) \
+		for_each_if(DISPLAY_RUNTIME_INFO(__display)->fbc_mask & BIT(__fbc_id))

-:80: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#80: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:68:
+#define for_each_intel_fbc(__display, __fbc, __fbc_id) \
+	for_each_fbc_id((__display), (__fbc_id)) \
+		for_each_if((__fbc) = (__display)->fbc[(__fbc_id)])

-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#80: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:68:
+#define for_each_intel_fbc(__display, __fbc, __fbc_id) \
+	for_each_fbc_id((__display), (__fbc_id)) \
+		for_each_if((__fbc) = (__display)->fbc[(__fbc_id)])

-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__fbc_id' - possible side-effects?
#80: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:68:
+#define for_each_intel_fbc(__display, __fbc, __fbc_id) \
+	for_each_fbc_id((__display), (__fbc_id)) \
+		for_each_if((__fbc) = (__display)->fbc[(__fbc_id)])

-:679: WARNING:LONG_LINE: line length of 200 exceeds 100 columns
#679: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:842:
+			      "not enough stolen space for compressed buffer (need %d more bytes), disabling. Hint: you may be able to increase stolen memory size in the BIOS to avoid this.\n", size);

total: 1 errors, 1 warnings, 3 checks, 1268 lines checked
834153d041c4 drm/i915/fbc: s/_intel_fbc_cfb_stride()/intel_fbc_plane_cfb_stride()/
1b9e88958c5a drm/i915/fbc: Extract intel_fbc_max_plane_size()
91ee933a99e1 drm/i915/fbc: Extract intel_fbc_max_surface_size()
019a0dd19bf0 drm/i915/fbc: s/intel_fbc_hw_tracking_covers_screen()/intel_fbc_surface_size_ok()/
d8cefaf127a9 drm/i915/fbc: Adjust g4x+ platform checks
7ede9eea13fa drm/i915/fbc: Extract _intel_fbc_cfb_stride()
2909fe71a6b7 drm/i915/fbc: s/lines/height/
2f06af7f6927 drm/i915/fbc: Reoder CFB max height platform checks
5ed304aa74cd drm/i915/fbc: Extract intel_fbc_max_cfb_height()
c4d03c4c9046 drm/i915/fbc: Extract _intel_fbc_cfb_size()
7072a55328c2 drm/i915/fbc: Extract intel_fbc_cfb_cpp()
0cb9d6de64a5 drm/i915/fbc: Introduce intel_fbc_preferred_cfb_size()
282d3173424d drm/xe/fbdev: Fix BIOS FB vs.s stolen size checke
198dd2a6b128 drm/i915/fbdev: Extract intel_fbdev_fb_prefer_stolen()
39a14b99b167 drm/xe/fbdev: Extract intel_fbdev_fb_prefer_stolen()
a03bed0e4009 drm/xe/fbdev: Use the same logic for fbdev stolen takever and fresh allocation
34e236f3ac02 drm/i915/fbdev: Adjust fbdev stolen mem usage heuristic
b48e830a8191 drm/xe/fbdev: Adjust fbdev stolen mem usage heuristic


