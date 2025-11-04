Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40DCCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 08:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D2210E231;
	Tue,  4 Nov 2025 08:45:45 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DF810E231;
 Tue,  4 Nov 2025 08:45:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Handl?=
 =?utf-8?q?e_vblank_evasion_with_CONFIG=5FPREEMPT=5FRT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Nov 2025 08:45:43 -0000
Message-ID: <176224594399.14745.6899507300840389799@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104083634.670753-1-dev@lankhorst.se>
In-Reply-To: <20251104083634.670753-1-dev@lankhorst.se>
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

Series: drm/i915/display: Handle vblank evasion with CONFIG_PREEMPT_RT
URL   : https://patchwork.freedesktop.org/series/156975/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f9d6aa00857d054e893d24146fb7f946b9aad7d1
Author: Mike Galbraith <umgwanakikbuti@gmail.com>
Date:   Tue Nov 4 09:36:31 2025 +0100

    drm/i915: Use preempt_disable/enable_rt() where recommended
    
    Mario Kleiner suggest in commit
      ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")
    
    a spots where preemption should be disabled on PREEMPT_RT. The
    difference is that on PREEMPT_RT the intel_uncore::lock disables neither
    preemption nor interrupts and so region remains preemptible.
    
    The area covers only register reads and writes. The part that worries me
    is:
    - __intel_get_crtc_scanline() the worst case is 100us if no match is
      found.
    
    - intel_crtc_scanlines_since_frame_timestamp() not sure how long this
      may take in the worst case.
    
    It was in the RT queue for a while and nobody complained.
    Disable preemption on PREEPMPT_RT during timestamping.
    
    [bigeasy: patch description.]
    
    Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
    Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 3d82a6cdc5241dbae65a59cf1197ff3bfd90ec2c drm-intel
fe116f45748f drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
eec1ad6a1803 drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:201: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 110 lines checked
5980f1cf2499 drm/i915/display: Move vblank put until after critical section
14a705a950c6 drm/i915/display: Remove locking from intel_vblank_evade critical section
-:59: WARNING:LINE_SPACING: Missing a blank line after declarations
#59: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:734:
+		DEFINE_WAIT(wait);
+		while (!vblank_evadable(evade, &scanline) && timeout > 0) {

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
bcc0e922bdd3 drm/i915/display: Make icl_dsi_frame_update use _fw too
4d7b1714f86b drm/i915/display: Enable interrupts earlier on PREEMPT_RT
f9d6aa00857d drm/i915: Use preempt_disable/enable_rt() where recommended
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")

-:45: WARNING:LINE_SPACING: Missing a blank line after declarations
#45: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:325:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_lock_irqsave(&i915->uncore.lock, *flags);

-:52: WARNING:LINE_SPACING: Missing a blank line after declarations
#52: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:332:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_unlock_irqrestore(&i915->uncore.lock, flags);

total: 0 errors, 3 warnings, 0 checks, 78 lines checked


