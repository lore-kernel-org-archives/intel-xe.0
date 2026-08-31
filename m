Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2896C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 21:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581CE10EB4E;
	Mon, 31 Aug 2026 21:20:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FD210EB45;
 Mon, 31 Aug 2026 21:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_AS_SDP_Skip_Frames_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 21:20:36 -0000
Message-ID: <178821123635.104493.8969629876131243191@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831213421.1804635-1-uma.shankar@intel.com>
In-Reply-To: <20260831213421.1804635-1-uma.shankar@intel.com>
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

Series: drm/i915/display: Enable AS SDP Skip Frames (rev5)
URL   : https://patchwork.freedesktop.org/series/162015/
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
commit f5ae5574f3a63f4b14095ba5bc0de3c9261e026f
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Tue Sep 1 03:04:21 2026 +0530

    drm/i915/display: Gate periodic AS SDP skip frames behind a module parameter
    
    Periodic AS SDP (skip frames) drives a Panel Replay panel down toward its
    minimum refresh rate. It is a new, panel- and platform-sensitive behaviour,
    so keep it opt-in rather than enabling it unconditionally.
    
    Add a display module parameter, periodic_assdp_enable, shared by both the
    i915 and xe drivers via the intel_display_params infrastructure. It defaults
    to false (feature disabled); set it to true to enable periodic AS SDP.
    
    Gate the feature at its single choke point, intel_pr_as_sdp_skip_frames():
    returning a zero skip count when the parameter is off makes both the
    PR_ALPM_CTL programming (intel_alpm_configure_pr_as_sdp()) and the DC3co
    force-disable predicate (intel_alpm_pr_as_sdp_skip_frames_enabled()) a no-op,
    so AS SDP continues to be sent on every frame as before.
    
    Assisted-by: Claude:claude-opus-4-8
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch d60d982526a80c1e429e0ad7f5d92ec90af0cba6 drm-intel
ec4888607a8c drm/i915/display: Enable periodic AS SDP skip frames
-:121: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#121: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:458:
+					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;

-:138: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#138: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:280:
+#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(frames)			REG_FIELD_PREP(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK, (frames))

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
1bb76d5696e4 drm/i915/display: Force disable DC3co when AS SDP skip frames is enabled
951f90890ea2 drm/i915/display: Reprogram AS SDP skip frames on seamless VRR transitions
f5ae5574f3a6 drm/i915/display: Gate periodic AS SDP skip frames behind a module parameter
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
i915 and xe drivers via the intel_display_params infrastructure. It defaults

-:54: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#54: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:143:
+intel_display_param_named_unsafe(periodic_assdp_enable, bool, 0600,
+	"Enable periodic Adaptive-Sync SDP (AS SDP skip frames) for Panel Replay "

total: 0 errors, 1 warnings, 1 checks, 35 lines checked


