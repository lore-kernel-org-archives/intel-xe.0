Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA70DC79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 09:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8115510F025;
	Wed,  9 Sep 2026 09:16:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B7110F025;
 Wed,  9 Sep 2026 09:16:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_AS_SDP_Skip_Frames_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 09:16:16 -0000
Message-ID: <178894537666.137999.14367557289407205655@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909080810.2202879-1-uma.shankar@intel.com>
In-Reply-To: <20260909080810.2202879-1-uma.shankar@intel.com>
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

Series: drm/i915/display: Enable AS SDP Skip Frames (rev6)
URL   : https://patchwork.freedesktop.org/series/162015/
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
commit 06e47934dce7f7af3459afa0311c7e7297e5e54a
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Wed Sep 9 13:38:10 2026 +0530

    drm/i915/display: Gate periodic AS SDP skip frames behind a debugfs knob
    
    Periodic AS SDP (skip frames) drives a Panel Replay panel down toward its
    minimum refresh rate. It is a new, panel- and platform-sensitive behaviour,
    so keep it opt-in rather than enabling it unconditionally.
    
    Expose it as a per-device debugfs knob, enable_periodic_assdp, rather than a
    module parameter. The behaviour is panel-specific, so the correct granularity
    is per-device, not per-module. The knob is added through the intel_display_params
    infrastructure (shared by i915 and xe) with a debugfs entry only. It defaults to
    false (feature disabled); write 1 to the debugfs file to enable periodic AS SDP
    at runtime.
    
    Gate the feature at its single choke point, intel_pr_as_sdp_skip_frames():
    returning a zero skip count when the knob is off makes both the PR_ALPM_CTL
    programming (intel_alpm_configure_pr_as_sdp()) and the DC3co force-disable
    predicate (intel_alpm_pr_as_sdp_skip_frames_enabled()) a no-op, so AS SDP
    continues to be sent on every frame as before.
    
    v2: Switch to debugfs entry and drop module param
    
    Assisted-by: Claude:claude-opus-4-8
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
    Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
    Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
+ /mt/dim checkpatch dd822035c9dcd89e47cbfa75da6f3119617fbada drm-intel
5e39a65520ed drm/i915/display: Enable periodic AS SDP skip frames
-:123: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#123: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:458:
+					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;

-:140: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#140: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:280:
+#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(frames)			REG_FIELD_PREP(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK, (frames))

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
70aeb9aab89a drm/i915/display: Force disable DC3co when AS SDP skip frames is enabled
2f7d2bdd7189 drm/i915/display: Reprogram AS SDP skip frames on seamless VRR transitions
06e47934dce7 drm/i915/display: Gate periodic AS SDP skip frames behind a debugfs knob
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Expose it as a per-device debugfs knob, enable_periodic_assdp, rather than a

-:63: WARNING:LINE_CONTINUATIONS: Avoid unnecessary line continuations
#63: FILE: drivers/gpu/drm/i915/display/intel_display_params.h:56:
+	 */ \

total: 0 errors, 2 warnings, 0 checks, 27 lines checked


