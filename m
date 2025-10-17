Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27FACCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 16:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CDB10EC88;
	Fri, 17 Oct 2025 16:32:08 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE8C10EC85;
 Fri, 17 Oct 2025 16:32:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Test_PREEMPT=5FRT_with_ir?=
 =?utf-8?q?qs_disabled=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 16:32:07 -0000
Message-ID: <176071872797.28223.3464207795886518564@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251017115752.398805-1-dev@lankhorst.se>
In-Reply-To: <20251017115752.398805-1-dev@lankhorst.se>
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

Series: Test PREEMPT_RT with irqs disabled.
URL   : https://patchwork.freedesktop.org/series/156133/
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
commit 97088f2ad46b0ca01f2e89d12fe95e33e9eca794
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Oct 17 13:57:51 2025 +0200

    PREEMPT_RT injection
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch b5e5976a35cb0e8e45aea836b42ecccf22df803f drm-intel
18a585fb5ae1 drm/xe: Bump xe_device_l2_flush even higher
b30fb2cc3886 drm/i915: Use preempt_disable/enable_rt() where recommended
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")

-:45: WARNING:LINE_SPACING: Missing a blank line after declarations
#45: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:323:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_lock_irqsave(&i915->uncore.lock, *flags);

-:52: WARNING:LINE_SPACING: Missing a blank line after declarations
#52: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:330:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_unlock_irqrestore(&i915->uncore.lock, flags);

total: 0 errors, 3 warnings, 0 checks, 78 lines checked
c70c3113ccf1 drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
started disabling interrupts across atomic updates. This breaks on PREEMPT_RT

total: 0 errors, 1 warnings, 0 checks, 68 lines checked
b2d54cca85bf drm/i915/display: Disable interrupts on xe for realtime preemption
-:38: ERROR:CODE_INDENT: code indent should use tabs where possible
#38: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:690:
+        if (intel_disable_vblank_irqs())$

-:38: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#38: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:690:
+        if (intel_disable_vblank_irqs())$

total: 1 errors, 1 warnings, 0 checks, 63 lines checked
97088f2ad46b PREEMPT_RT injection
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 41 lines checked


