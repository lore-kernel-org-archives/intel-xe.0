Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E15CD98D2
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 18:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD6610F657;
	Fri, 12 Jun 2026 18:43:49 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951510F657;
 Fri, 12 Jun 2026 18:43:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cdclk=3A_CDCLK_s?=
 =?utf-8?q?anitization_stuff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 18:43:48 -0000
Message-ID: <178128982848.75226.17918778148363523456@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/cdclk: CDCLK sanitization stuff
URL   : https://patchwork.freedesktop.org/series/168456/
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
commit 6750e28a45e214dc716f20f195df9d8f47e44aad
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Jun 12 20:36:53 2026 +0300

    drm/i915/cdclk: Use the TGL+ CD2x pipe select bits also on ICL
    
    Turns out both CDCLK_CTL pipe select 0b110 (what Bspec lists for
    pipe C on ICL) and 0b100 (what BSpec lists for pipe C on TGL+)
    actually select pipe C on ICL. So we can get rid of the weird
    ICL special case and just use the simpler TGL+ definition of
    the pipe select bits.
    
    This was reverse engineered with a hacked up intel_display_poller.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 536f4e1338749a805ec4a7b82b1444dae2c6fe4d drm-intel
1f72a9df57a5 drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable
0d42fba03ad4 drm/i915/cdclk: Print the reason for the CDCLK sanitization
8347603a44eb drm/i915/cdclk Clean up CDCLK_CTL defines
-:44: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2787:
+#define  ICL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, _PICK((pipe), 0, 1, 3) << 1)

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
2bbd2ad760ba drm/i915/cdclk: Document CDCLK_CTL bits
99b887e4afbf drm/i915/cdclk: Introduce bxt_cdclk_cd2x_pipe_mask() and use it
6750e28a45e2 drm/i915/cdclk: Use the TGL+ CD2x pipe select bits also on ICL


