Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C532D41D69
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 16:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5610E077;
	Thu, 11 Dec 2025 16:44:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341C010E048;
 Thu, 11 Dec 2025 16:44:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_All_f?=
 =?utf-8?q?ixes_for_PREEMPT-RT_that_I_have_collected_so_far=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 16:44:47 -0000
Message-ID: <176547148720.77804.17561826676278056809@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211161923.843758-11-dev@lankhorst.se>
In-Reply-To: <20251211161923.843758-11-dev@lankhorst.se>
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

Series: drm/i915/display: All fixes for PREEMPT-RT that I have collected so far.
URL   : https://patchwork.freedesktop.org/series/158813/
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
commit 16620b099818fe1581920bb25cdf358a2b3d7f0e
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Dec 11 17:19:32 2025 +0100

    drm/i915/display: Enable interrupts earlier on PREEMPT_RT
    
    The last part of the vblank evasion is about updating bookkeeping,
    not programming hardware registers.
    
    The interrupts cannot stay disabled here on PREEMPT_RT since the
    spinlocks get converted to mutexes.
    
    There's still a small race in VRR that needs to be addressed, and
    in the other worst case there is a delay of a vblank completion if
    the vblank is fired and we schedule on the next vblank, this needs
    to be addressed separately.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch d8f645c04dad21f981669f0b65191cac664735f9 drm-intel
c4ee7c4ec9eb drm/i915/display: Fix intel_lpe_audio_irq_handler for PREEMPT-RT
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Because intel_lpe_audio_irq_handler() may be called in threaded IRQ context,

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f67d21485f2b drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
a2fc35839a91 drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:201: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 110 lines checked
4f8f50ae3b94 drm/i915/display: Make set_pipeconf use the fw variants
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#46: 
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

-:76: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 22 lines checked
bed6a20f0670 drm/i915/display: Move vblank put until after critical section
036f4957db62 drm/i915/display: Remove locking from intel_vblank_evade critical section
-:66: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:740:
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline), timeout);

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
076b1e7a7d6a drm/i915/display: Handle vlv dsi workaround in scanline_in_safe_range too
247bb22ccb08 drm/i915/display: Make icl_dsi_frame_update use _fw too
16620b099818 drm/i915/display: Enable interrupts earlier on PREEMPT_RT


