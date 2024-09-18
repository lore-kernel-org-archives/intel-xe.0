Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E499FCCD197
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 10:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE86410E1D0;
	Wed, 18 Sep 2024 10:38:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DC710E1D0;
 Wed, 18 Sep 2024 10:38:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Modify_iterators_to_prepa?=
 =?utf-8?q?re_for_ultrajoiner_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 10:38:58 -0000
Message-ID: <172665593816.1025324.8916833714613637779@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918063016.2667721-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240918063016.2667721-1-ankit.k.nautiyal@intel.com>
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

Series: Modify iterators to prepare for ultrajoiner (rev2)
URL   : https://patchwork.freedesktop.org/series/138750/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0758841bed3f055adea481f8e642c7cbd22d5ae5
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Sep 18 12:00:16 2024 +0530

    drm/i915/display: Enhance iterators for modeset en/disable
    
    Joiners have specific enabling and disabling order dependent on primary
    and secondary pipes. This becomes more complex with ultrajoiner where we
    have ultrajoiner primary/secondary pipes in addition to bigjoiner
    primary/secondary pipes. To unify the approach that works for present
    and future joiner cases, use primary and secondary pipe masks to
    iterate over pipes.
    
    If joiner is used, derive bigoiner primary and secondary pipe masks
    and use following sequences:
    Disabling : disable primary pipes followed by secondary pipes,
    Enabling: enable secondary pipes followed by primary pipes.
    
    This works well with ultrajoiner too, as ultrajoiner has 2 bigjoiner
    primary/secondary pairs (AC, BD).
    
    For non joiner case, enable/disable based on usual pipe order A-D, D-A
    respectively.
    
    v2:
    -Simplify the iterator macro. (Ville)
    -Use struct intel_display. (Ville)
    -Add prefix _intel to the helper name. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch a7c4f56f92ff668c90423c9601e213f1944ff09a drm-intel
7bd9cd281f90 drm/i915: Add some essential functionality for joiners
0758841bed3f drm/i915/display: Enhance iterators for modeset en/disable
-:203: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#203: FILE: drivers/gpu/drm/i915/display/intel_display.h:395:
+#define for_each_crtc_in_masks(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = 0; \
+	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)++) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:203: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#203: FILE: drivers/gpu/drm/i915/display/intel_display.h:395:
+#define for_each_crtc_in_masks(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = 0; \
+	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)++) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:205: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#205: FILE: drivers/gpu/drm/i915/display/intel_display.h:397:
+	     (i) < (I915_MAX_PIPES * 2) && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \

-:209: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#209: FILE: drivers/gpu/drm/i915/display/intel_display.h:401:
+#define for_each_crtc_in_masks_reverse(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = (I915_MAX_PIPES * 2 - 1); \
+	     (i) >= 0 && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)--) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:209: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#209: FILE: drivers/gpu/drm/i915/display/intel_display.h:401:
+#define for_each_crtc_in_masks_reverse(display, crtc, first_pipes, second_pipes, i) \
+	for ((i) = (I915_MAX_PIPES * 2 - 1); \
+	     (i) >= 0 && ((crtc) = intel_crtc_for_pipe(display, (i) % I915_MAX_PIPES), 1); \
+	     (i)--) \
+		for_each_if((crtc) && ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)) & BIT(i))

-:215: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#215: FILE: drivers/gpu/drm/i915/display/intel_display.h:407:
+#define for_each_pipe_crtc_modeset_disable(display, crtc, crtc_state, i) \
+	for_each_crtc_in_masks(display, crtc, \
+			       _intel_modeset_primary_pipes(crtc_state), \
+			       _intel_modeset_secondary_pipes(crtc_state), \
+			       i)

-:221: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#221: FILE: drivers/gpu/drm/i915/display/intel_display.h:413:
+#define for_each_pipe_crtc_modeset_enable(display, crtc, crtc_state, i) \
+	for_each_crtc_in_masks_reverse(display, crtc, \
+				       _intel_modeset_primary_pipes(crtc_state), \
+				       _intel_modeset_secondary_pipes(crtc_state), \
+				       i)

total: 0 errors, 1 warnings, 6 checks, 234 lines checked


