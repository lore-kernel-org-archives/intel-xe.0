Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB28C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 09:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D827510E8A3;
	Thu, 28 Aug 2025 09:14:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7157710E89E;
 Thu, 28 Aug 2025 09:14:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915=3A_Disable_tracepoints_for_PREEMPT=5FRT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 09:14:52 -0000
Message-ID: <175637249246.278132.17250178890565910548@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250828090944.101069-1-dev@lankhorst.se>
In-Reply-To: <20250828090944.101069-1-dev@lankhorst.se>
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

Series: series starting with [1/2] drm/i915: Disable tracepoints for PREEMPT_RT
URL   : https://patchwork.freedesktop.org/series/153609/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 204f9ba71c6e45da44c12eb7145d465c60278928
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Aug 28 11:09:44 2025 +0200

    drm/i915/display: Make tracepoints work correctly on xe with PREEMPT_RT
    
    The display tracepoints will work, but drm_crtc_accurate_vblank_count()
    takes an irq lock. Use the less accurate drm_crtc_vblank_count() on
    affected platforms, which is simply an atomic_read64();
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch fbc5d00ef7824ebc9441a6a1efb619f149337308 drm-intel
9f6a64095572 drm/i915: Disable tracepoints for PREEMPT_RT
-:35: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#35: 
Reported-by: Luca Abeni <lucabe72@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>

-:37: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#37: 
Co-developed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

-:55: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 11 lines checked
204f9ba71c6e drm/i915/display: Make tracepoints work correctly on xe with PREEMPT_RT
-:83: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (27, 35)
#83: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:89:
 			   for_each_intel_crtc(display->drm, it__) {
+				   __entry->frame[it__->pipe] = intel_crtc_get_vblank_counter(it__, UPDATE_VBLANK);

-:85: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#85: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:90:
+				   __entry->frame[it__->pipe] = intel_crtc_get_vblank_counter(it__, UPDATE_VBLANK);

-:92: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (27, 35)
#92: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:119:
 			   for_each_intel_crtc(display->drm, it__) {
+				   __entry->frame[it__->pipe] = intel_crtc_get_vblank_counter(it__, UPDATE_VBLANK);

-:94: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:120:
+				   __entry->frame[it__->pipe] = intel_crtc_get_vblank_counter(it__, UPDATE_VBLANK);

-:137: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (27, 35)
#137: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:249:
 			   for_each_intel_crtc(display->drm, crtc) {
+				   __entry->frame[crtc->pipe] = intel_crtc_get_vblank_counter(crtc, UPDATE_VBLANK);

-:139: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:250:
+				   __entry->frame[crtc->pipe] = intel_crtc_get_vblank_counter(crtc, UPDATE_VBLANK);

total: 0 errors, 6 warnings, 0 checks, 233 lines checked


