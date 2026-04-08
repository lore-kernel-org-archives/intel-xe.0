Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6960E1073CBC
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 14:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD7310E675;
	Wed,  8 Apr 2026 14:09:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7912D10E673;
 Wed,  8 Apr 2026 14:09:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PSR/Panel_Replay/ALPM_log?=
 =?utf-8?q?ging_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 14:09:06 -0000
Message-ID: <177565734648.442737.10316335107332164322@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408140059.252067-1-jouni.hogander@intel.com>
In-Reply-To: <20260408140059.252067-1-jouni.hogander@intel.com>
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

Series: PSR/Panel Replay/ALPM logging improvements
URL   : https://patchwork.freedesktop.org/series/164546/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 50d45c9c4ab549ca359cbf235341bc0c93a9f8cd
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Apr 8 17:00:59 2026 +0300

    drm/i915/alpm: Dump out ALPM capability DPCD register
    
    Add dumping out ALPM capability DPCD registers. This helps parsing dmesg
    logs and tracing possible ALPM issues.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 05dcf2051adc715e5c76bb3d4fefea2696a69876 drm-intel
044ee658c009 drm/i915/psr: Improve PSR state information in crtc state dump
6ff3e1889a4d drm/i915/alpm: Dump out computed ALPM parameters in crtc state dump
9a713666f3f4 drm/dp: Include PSR2 granularity registers into PSR capability size define
c711c89d00a2 drm/i915/psr: Add new macro for accessing cached PSR DPCD registers
f5926d17e38a drm/i915/psr: Read all PSR capability registers at once
-:43: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/intel_psr.c:508:
+	if (!(connector->dp.psr_caps.dpcd[INTEL_PSR_DPCD_INDEX(DP_PSR_CAPS)] & DP_PSR2_SU_GRANULARITY_REQUIRED)) {

-:70: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/display/intel_psr.c:519:
+	w = le16_to_cpu(*(__le16 *)&connector->dp.psr_caps.dpcd[INTEL_PSR_DPCD_INDEX(DP_PSR2_SU_X_GRANULARITY)]) ? : 4;

-:99: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#99: FILE: drivers/gpu/drm/i915/display/intel_psr.c:683:
+	    connector->dp.psr_caps.dpcd[INTEL_PSR_DPCD_INDEX(DP_PSR_SUPPORT)] >= DP_PSR2_WITH_Y_COORD_IS_SUPPORTED) {

-:118: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#118: FILE: drivers/gpu/drm/i915/display/intel_psr.c:764:
+		connector->dp.psr_caps.dpcd[INTEL_PSR_DPCD_INDEX(DP_PSR_SUPPORT)] == DP_PSR2_WITH_Y_COORD_ET_SUPPORTED;

-:137: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#137: FILE: drivers/gpu/drm/i915/display/intel_psr.c:4209:
+		seq_printf(m, " [0x%02x]", connector->dp.psr_caps.dpcd[INTEL_PSR_DPCD_INDEX(DP_PSR_SUPPORT)]);

-:138: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#138: FILE: drivers/gpu/drm/i915/display/intel_psr.c:4210:
+	if (connector->dp.psr_caps.dpcd[INTEL_PSR_DPCD_INDEX(DP_PSR_SUPPORT)] == DP_PSR2_WITH_Y_COORD_ET_SUPPORTED)

total: 0 errors, 6 warnings, 0 checks, 111 lines checked
39ad26caf191 drm/i915/psr: Dump out PSR and Panel Replay DPCD registers
50d45c9c4ab5 drm/i915/alpm: Dump out ALPM capability DPCD register


