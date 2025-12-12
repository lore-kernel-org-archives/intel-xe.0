Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9751DD59D78
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 16:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EC410E08F;
	Fri, 12 Dec 2025 16:34:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDB910E08F;
 Fri, 12 Dec 2025 16:34:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Some_DSB/flip?=
 =?utf-8?q?q_stuff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 16:34:18 -0000
Message-ID: <176555725861.81112.16642551020912612319@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212152847.13679-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251212152847.13679-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Some DSB/flipq stuff
URL   : https://patchwork.freedesktop.org/series/158869/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 84c002548c892c27656be97c036bf921c42c05cb
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Dec 12 17:28:47 2025 +0200

    drm/i915/dsb: Add tracepoints for flip queue
    
    Currently flip queue based commits don't leave any breadcrumbs
    via tracepoints. Add new intel_flipq_add and intel_flipq_done
    tracepoints that at least indicates when we something happens
    via the flip queeu.
    
    We might want to improve this later somehow to have a slightly
    better idea what the flip queue might end up doing. But at least
    this now shows that *something* is going on.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 39f65c105d5b1af093f9df6f3dc688a642f96456 drm-intel
e3bfb6896d5a drm/i915/flipq: Don't initialize flip queue on pre-LNL
a8ab3bc7331c drm/i915: Give up on DSB/flip queue if we fail to allocate the color DSB buffer
eaf35805e56f drm/i915: Clear crtc_state->use_flipq initially
2913fd792e5b drm/i915: Warn about use_flip==true in MMIO commit codepaths
a54681e81a7b drm/i915: Refine vblank evasion DSB check
1e752caf26ff drm/i915: Make intel_crtc_needs_vblank_work() easier on the eye
81505e23f951 drm/i915: Extract intel_dsb_supported()
d2d8c0ca5705 drm/i915: Use intel_dsb_supported() to determine 'use_dsb'
7864509480d5 drm/i915: Extract commit_dsb_max_cmds()
96283d7e4660 drm/i915: Introduce enum intel_commit_type
f96cdfb4fc6a drm/i915: Carve intel_atomic_commit_type() up a bit
454562694bf7 drm/i915/dsb: Add tracepoints for DSB commit
-:39: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#39: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:689:
+	    TP_STRUCT__entry(

-:47: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#47: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:697:
+	    TP_fast_assign(

-:64: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#64: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:714:
+	    TP_STRUCT__entry(

-:72: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#72: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:722:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 4 checks, 86 lines checked
84c002548c89 drm/i915/dsb: Add tracepoints for flip queue
-:43: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#43: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:743:
+	    TP_STRUCT__entry(

-:54: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#54: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:754:
+	    TP_fast_assign(

-:76: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#76: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:776:
+	    TP_STRUCT__entry(

-:83: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#83: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:783:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 4 checks, 116 lines checked


