Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC35C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 09:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6E10E442;
	Tue, 17 Sep 2024 09:12:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044C710E442;
 Tue, 17 Sep 2024 09:12:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Modify_iterators_to_prepa?=
 =?utf-8?q?re_for_ultrajoiner?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 09:12:32 -0000
Message-ID: <172656435201.1021035.15610524741802518306@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917082359.2383204-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240917082359.2383204-1-ankit.k.nautiyal@intel.com>
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

Series: Modify iterators to prepare for ultrajoiner
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
commit 6ecc7f536ec23d328c2b72f954e66d2319a8fe46
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Sep 17 13:53:58 2024 +0530

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
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch a2269b8bdf726c56f52e41ebfdd1cf38aea494de drm-intel
3f178de1539c drm/i915: Add some essential functionality for joiners
6ecc7f536ec2 drm/i915/display: Enhance iterators for modeset en/disable
-:192: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__dev_priv' may be better as '(__dev_priv)' to avoid precedence issues
#192: FILE: drivers/gpu/drm/i915/display/intel_display.h:405:
+#define for_each_crtc_in_masks(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 0, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) < 8 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)++) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:192: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#192: FILE: drivers/gpu/drm/i915/display/intel_display.h:405:
+#define for_each_crtc_in_masks(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 0, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) < 8 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)++) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:192: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipes' - possible side-effects?
#192: FILE: drivers/gpu/drm/i915/display/intel_display.h:405:
+#define for_each_crtc_in_masks(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 0, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) < 8 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)++) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:192: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#192: FILE: drivers/gpu/drm/i915/display/intel_display.h:405:
+#define for_each_crtc_in_masks(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 0, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) < 8 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)++) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:194: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_display.h:407:
+             (i) < 8 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \

-:194: ERROR:CODE_INDENT: code indent should use tabs where possible
#194: FILE: drivers/gpu/drm/i915/display/intel_display.h:407:
+             (i) < 8 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \$

-:194: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#194: FILE: drivers/gpu/drm/i915/display/intel_display.h:407:
+             (i) < 8 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \$

-:195: ERROR:CODE_INDENT: code indent should use tabs where possible
#195: FILE: drivers/gpu/drm/i915/display/intel_display.h:408:
+             (i)++) \$

-:195: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#195: FILE: drivers/gpu/drm/i915/display/intel_display.h:408:
+             (i)++) \$

-:196: ERROR:CODE_INDENT: code indent should use tabs where possible
#196: FILE: drivers/gpu/drm/i915/display/intel_display.h:409:
+                for_each_if((crtc) && (pipes) & BIT(i))$

-:196: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#196: FILE: drivers/gpu/drm/i915/display/intel_display.h:409:
+                for_each_if((crtc) && (pipes) & BIT(i))$

-:198: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__dev_priv' may be better as '(__dev_priv)' to avoid precedence issues
#198: FILE: drivers/gpu/drm/i915/display/intel_display.h:411:
+#define for_each_crtc_in_masks_reverse(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 7, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) >= 0 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)--) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:198: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc' - possible side-effects?
#198: FILE: drivers/gpu/drm/i915/display/intel_display.h:411:
+#define for_each_crtc_in_masks_reverse(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 7, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) >= 0 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)--) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:198: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipes' - possible side-effects?
#198: FILE: drivers/gpu/drm/i915/display/intel_display.h:411:
+#define for_each_crtc_in_masks_reverse(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 7, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) >= 0 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)--) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:198: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#198: FILE: drivers/gpu/drm/i915/display/intel_display.h:411:
+#define for_each_crtc_in_masks_reverse(__dev_priv, crtc, first_pipes, second_pipes, pipes, i) \
+	for ((i) = 7, (pipes) = ((first_pipes) | ((second_pipes) << I915_MAX_PIPES)); \
+             (i) >= 0 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \
+             (i)--) \
+                for_each_if((crtc) && (pipes) & BIT(i))

-:200: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#200: FILE: drivers/gpu/drm/i915/display/intel_display.h:413:
+             (i) >= 0 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \

-:200: ERROR:CODE_INDENT: code indent should use tabs where possible
#200: FILE: drivers/gpu/drm/i915/display/intel_display.h:413:
+             (i) >= 0 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \$

-:200: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#200: FILE: drivers/gpu/drm/i915/display/intel_display.h:413:
+             (i) >= 0 && ((crtc) = intel_crtc_for_pipe(to_intel_display(&__dev_priv->drm), (i) % I915_MAX_PIPES), 1); \$

-:201: ERROR:CODE_INDENT: code indent should use tabs where possible
#201: FILE: drivers/gpu/drm/i915/display/intel_display.h:414:
+             (i)--) \$

-:201: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#201: FILE: drivers/gpu/drm/i915/display/intel_display.h:414:
+             (i)--) \$

-:202: ERROR:CODE_INDENT: code indent should use tabs where possible
#202: FILE: drivers/gpu/drm/i915/display/intel_display.h:415:
+                for_each_if((crtc) && (pipes) & BIT(i))$

-:202: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#202: FILE: drivers/gpu/drm/i915/display/intel_display.h:415:
+                for_each_if((crtc) && (pipes) & BIT(i))$

-:204: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#204: FILE: drivers/gpu/drm/i915/display/intel_display.h:417:
+#define for_each_pipe_crtc_modeset_disable(__dev_priv, crtc, crtc_state, pipes, i) \
+	for_each_crtc_in_masks(__dev_priv, crtc, \
+			       _modeset_primary_pipes(crtc_state), \
+			       _modeset_secondary_pipes(crtc_state), \
+			       pipes, i)

-:210: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#210: FILE: drivers/gpu/drm/i915/display/intel_display.h:423:
+#define for_each_pipe_crtc_modeset_enable(__dev_priv, crtc, crtc_state, pipes, i) \
+	for_each_crtc_in_masks_reverse(__dev_priv, crtc, \
+				       _modeset_primary_pipes(crtc_state), \
+				       _modeset_secondary_pipes(crtc_state), \
+				       pipes, i)

total: 6 errors, 8 warnings, 10 checks, 216 lines checked


