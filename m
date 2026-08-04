Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692DEC55838
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 12:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C5C10E142;
	Tue,  4 Aug 2026 12:03:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9AD10E142;
 Tue,  4 Aug 2026 12:03:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_AS_SDP_Skip_Frames_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 12:03:43 -0000
Message-ID: <178584502371.17168.4998195546625294926@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803185305.562609-1-uma.shankar@intel.com>
In-Reply-To: <20260803185305.562609-1-uma.shankar@intel.com>
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

Series: drm/i915/display: Enable AS SDP Skip Frames (rev2)
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
commit 2cd2b523be724cc092cb2ee575164da497a5d54b
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Tue Aug 4 00:23:05 2026 +0530

    drm/i915/display: Keep AS SDP flowing when skip frames is enabled
    
    The AS SDP skip-frame mechanism relies on the AS SDP still being
    transmitted (just less often) while Panel Replay is active, so the source
    must not stop sending it in the PR active state, nor enter the DC3CO idle
    protocol which would suppress it entirely.
    
    When a non-zero skip-frame count is programmed, leave both
    PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE and
    PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL cleared. The previous behaviour
    (honouring disable_as_sdp_when_pr_active and the DC3CO idle protocol) is
    retained for the non skip-frame case.
    
    Assisted-by: Claude:claude-opus-4-8
    Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e drm-intel
686d87e5b8c8 drm/i915/display: Enable AS SDP Skip Frames
-:90: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#90: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:455:
+				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(

-:105: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#105: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:280:
+#define  PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(frames)			REG_FIELD_PREP(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK, (frames))

total: 0 errors, 1 warnings, 1 checks, 65 lines checked
2cd2b523be72 drm/i915/display: Keep AS SDP flowing when skip frames is enabled
-:55: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:462:
+					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


