Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BFDCCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E322C10E938;
	Fri,  3 Oct 2025 14:46:02 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2B010E934;
 Fri,  3 Oct 2025 14:46:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/i915=3A_Disable_tracepoints_for_PREEMPT=5FRT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Oct 2025 14:46:02 -0000
Message-ID: <175950276258.4125.6027552530074833888@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251003144054.112239-3-dev@lankhorst.se>
In-Reply-To: <20251003144054.112239-3-dev@lankhorst.se>
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

Series: series starting with [CI,1/2] drm/i915: Disable tracepoints for PREEMPT_RT
URL   : https://patchwork.freedesktop.org/series/155393/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7bf6259654d4e4c4eb445b9d87492a493ec28331
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Oct 3 16:40:56 2025 +0200

    drm/i915/display: Make intel_crtc_get_vblank_counter safe on PREEMPT_RT
    
    drm_crtc_accurate_vblank_count takes a spinlock, which we should avoid
    in tracepoints and debug functions.
    
    This also prevents taking the spinlock 2x during the critical
    section of pipe updates for DSI updates.
    
    Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Link: https://lore.kernel.org/r/20250829131701.15607-2-dev@lankhorst.se
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 778dac0b2365849d78271dce89792af4a37777cd drm-intel
89f5a73b8342 drm/i915: Disable tracepoints for PREEMPT_RT
-:35: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#35: 
Reported-by: Luca Abeni <lucabe72@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>

-:37: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#37: 
Co-developed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>

-:57: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 11 lines checked
7bf6259654d4 drm/i915/display: Make intel_crtc_get_vblank_counter safe on PREEMPT_RT
-:31: WARNING:LONG_LINE_COMMENT: line length of 117 exceeds 100 columns
#31: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:88:
+		/* On preempt-rt we cannot take the vblank spinlock since this function is called from tracepoints */

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


