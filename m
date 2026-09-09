Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE04C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C275C10F234;
	Wed,  9 Sep 2026 16:25:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1ED10F23B;
 Wed,  9 Sep 2026 16:25:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_Some_DSB/flip?=
 =?utf-8?q?q_stuff_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 16:25:24 -0000
Message-ID: <178897112464.144085.15961941602514520545@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Some DSB/flipq stuff (rev2)
URL   : https://patchwork.freedesktop.org/series/158869/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1b6b91c7a2a53e9a97049e56b3d503309f151297
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Sep 9 19:17:30 2026 +0300

    drm/i915/dsb: Add tracepoints for flip queue
    
    Currently flip queue based commits don't leave any breadcrumbs
    via tracepoints. Add new intel_flipq_add and intel_flipq_done
    tracepoints that at least indicates when we something happens
    via the flip queeu.
    
    We might want to improve this later somehow to have a slightly
    better idea what the flip queue might end up doing. But at least
    this now shows that *something* is going on.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 0d30bc4f35590b6353a77f23e397ab2168b69673 drm-intel
468db9722dbe drm/i915: Give up on DSB/flip queue if we fail to allocate the color DSB buffer
09d95439fc75 drm/i915: Check use_flipq in intel_crtc_needs_vblank_work()
eda2b038fb78 drm/i915: Don't initialize flip queue on pre-LNL
5de61f7e2e0a drm/i915: Warn about use_flip==true in MMIO commit codepaths
6bb679c492fb drm/i915: Refine vblank evasion DSB check
3ee9b3d6f5a2 drm/i915: Make intel_crtc_needs_vblank_work() easier on the eye
b483a928a24f drm/i915: Extract intel_dsb_supported()
556ef498c9e7 drm/i915: Use intel_dsb_supported() to determine 'use_dsb'
118b083acd49 drm/i915: Extract commit_dsb_max_cmds()
05e83cb042e1 drm/i915: Introduce enum intel_commit_type
8c07a5b0c215 drm/i915: Carve intel_atomic_commit_type() up a bit
c485a7446af4 drm/i915/dsb: Add tracepoints for DSB commit
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
1b6b91c7a2a5 drm/i915/dsb: Add tracepoints for flip queue
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


