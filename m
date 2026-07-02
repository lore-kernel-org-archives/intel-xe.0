Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55214C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 07:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51C910F1E8;
	Thu,  2 Jul 2026 07:56:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ADC10F1E8;
 Thu,  2 Jul 2026 07:56:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/intel/display=3A_Chan?=
 =?utf-8?q?ges_required_to_make_vblank_evasion_PREEMPT=5FRT_safe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 07:56:49 -0000
Message-ID: <178297900960.141897.2484072518374427882@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260702072154.171324-1-dev@lankhorst.se>
In-Reply-To: <20260702072154.171324-1-dev@lankhorst.se>
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

Series: drm/intel/display: Changes required to make vblank evasion PREEMPT_RT safe.
URL   : https://patchwork.freedesktop.org/series/169662/
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
commit b12b9e691fd6389de7294386dc81ad7f9fc984e8
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Jul 2 09:21:53 2026 +0200

    drm/i915/display: Do not take uncore lock in i915_get_vblank_counter
    
    This fixes a lockdep splat that occurs in the code that should be run
    with interrupts disabled. The uncore and DMC locks should not be taken
    and released repeatedly in a timing sensitive path.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 4a1a395fa156b92a83b501f8e331f21cd035c2e1 drm-intel
be6839585cba drm/vblank_work: Add methods to schedule vblank_work in 2 stages
-:116: CHECK:LINE_SPACING: Please don't use multiple blank lines
#116: FILE: drivers/gpu/drm/drm_vblank_work.c:180:
 
+

total: 0 errors, 0 warnings, 1 checks, 166 lines checked
ebe6ac844562 drm/vblank: Add a 2-stage version of drm_crtc_arm_vblank_event
b519ee567646 drm/intel/display: Make intel_crtc_arm_vblank_event static
d951635dcc39 drm/intel/display: Convert vblank event handling to 2-stage arming
-:139: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:798:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

-:142: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#142: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:801:
+				/* Remove plane from atomic state, cleanup/free is done from vblank worker. */

total: 0 errors, 2 warnings, 0 checks, 120 lines checked
8e240177d4a9 drm/i915/display: Move vblank put until after critical section
aa9571de616d drm/i915/display: Remove locking from intel_vblank_evade critical section
-:47: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:735:
+static bool scanline_in_safe_range(struct intel_vblank_evade_ctx *evade, int *scanline, bool unlocked)

-:91: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#91: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:767:
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline, true), timeout);

total: 0 errors, 2 warnings, 0 checks, 78 lines checked
ed97d9d2a1b7 drm/i915/display: Handle vlv dsi workaround in scanline_in_safe_range too
eb0ec1084c24 drm/i915: Use preempt_disable/enable_rt() where recommended
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")

-:46: WARNING:LINE_SPACING: Missing a blank line after declarations
#46: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:324:
+	struct intel_uncore *uncore = to_intel_uncore(display->drm);
+	spin_lock_irqsave(&uncore->lock, *flags);

-:53: WARNING:LINE_SPACING: Missing a blank line after declarations
#53: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:331:
+	struct intel_uncore *uncore = to_intel_uncore(display->drm);
+	spin_unlock_irqrestore(&uncore->lock, flags);

total: 0 errors, 3 warnings, 0 checks, 78 lines checked
81c996b8b7f0 drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
b12b9e691fd6 drm/i915/display: Do not take uncore lock in i915_get_vblank_counter
-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:113:
+^I^I^I^I        PIPEFRAME(display, pipe));$

-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:113:
+	frame = intel_de_read64_2x32_fw(display, PIPEFRAMEPIXEL(display, pipe),
+				        PIPEFRAME(display, pipe));

-:60: WARNING:LINE_SPACING: Missing a blank line after declarations
#60: FILE: drivers/gpu/drm/i915/intel_uncore.h:457:
+	u32 upper, lower, old_upper, loop = 0;
+	upper = intel_uncore_read_fw(uncore, upper_reg);

total: 1 errors, 1 warnings, 1 checks, 85 lines checked


