Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41718C5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 11:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128E810E1E1;
	Mon, 26 Aug 2024 11:21:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A49210E1E1;
 Mon, 26 Aug 2024 11:21:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Consolidation_of_DSS_Cont?=
 =?utf-8?q?rol_in_Separate_Files?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 11:21:27 -0000
Message-ID: <172467128736.783864.739911480629221649@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826111527.1113622-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240826111527.1113622-1-ankit.k.nautiyal@intel.com>
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

Series: Consolidation of DSS Control in Separate Files
URL   : https://patchwork.freedesktop.org/series/137788/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 522c3940108097e3b108a6cb537140f6fca0853d
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Aug 26 16:45:26 2024 +0530

    drm/i915/display: Move intel_joiner_num_pipes to intel dss
    
    In line with other joiner helpers, move the function to get the number
    of joined pipes to intel_dss.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 3180bea570dadc713d6f1cc50662818d684cfb4a drm-intel
25ec8f96b185 drm/i915/display: Move all DSS control registers to a new file
-:68: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#68: 
new file mode 100644

-:92: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#92: FILE: drivers/gpu/drm/i915/display/intel_dss_regs.h:20:
+#define  LEFT_DL_BUF_TARGET_DEPTH(pixels)	REG_FIELD_PREP(LEFT_DL_BUF_TARGET_DEPTH_MASK, pixels)

-:99: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#99: FILE: drivers/gpu/drm/i915/display/intel_dss_regs.h:27:
+#define  RIGHT_DL_BUF_TARGET_DEPTH(pixels)	REG_FIELD_PREP(RIGHT_DL_BUF_TARGET_DEPTH_MASK, pixels)

total: 0 errors, 3 warnings, 0 checks, 138 lines checked
f52bb809bac3 drm/i915/ddi: Move all mso related helpers to a new file
-:157: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#157: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 244 lines checked
ac22c6c33173 drm/i915/dss: Move to struct intel_display
7629d998f7ad drm/i915/icl_dsi: Move helpers to configure dsi dual link to intel_dss
3224c6be056a drm/i915/vdsc: Rename helper to check if the pipe supports dsc
00bd36a87f71 drm/i915/vdsc: Move all dss stuff in dss files
-:88: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#88: FILE: drivers/gpu/drm/i915/display/intel_dss.c:175:
+		intel_de_write(dev_priv, dss_ctl1_reg(crtc, crtc_state->cpu_transcoder), dss_ctl1_val);

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
c7030799df59 drm/i915/display: Move dss stuff in intel_dss files
-:77: CHECK:SPACING: No space is necessary after a cast
#77: FILE: drivers/gpu/drm/i915/display/intel_dss.c:228:
+	power_domain = intel_dsc_power_domain(crtc, (enum transcoder) pipe);

total: 0 errors, 0 warnings, 1 checks, 114 lines checked
1185c709d983 drm/i915/display: Move helper to get joined pipe mask to intel_dss
c48f74a5286e drm/i915/display: Move helpers for primary joiner to intel_dss
-:50: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/intel_display.c:255:
+		return crtc_state->joiner_pipes & ~BIT(intel_dss_get_primary_joiner_pipe(crtc_state));

-:94: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_display.c:3545:
+static enum pipe get_intel_dss_get_primary_joiner_pipe(enum pipe pipe, u8 primary_pipes, u8 secondary_pipes)

-:112: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#112: FILE: drivers/gpu/drm/i915/display/intel_display.c:3648:
+			get_intel_dss_get_primary_joiner_pipe(crtc->pipe, primary_pipes, secondary_pipes);

-:130: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#130: FILE: drivers/gpu/drm/i915/display/intel_display.c:5972:
+			primary_crtc->pipe != intel_dss_get_primary_joiner_pipe(primary_crtc_state)))

total: 0 errors, 4 warnings, 0 checks, 150 lines checked
a08856c6ce3f drm/i915/display: Move helper to check for secondary joiner pipe
544a848d15d1 drm/i915/display: Move helper to get all secondary pipes
-:71: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#71: FILE: drivers/gpu/drm/i915/display/intel_dss.c:297:
+		return crtc_state->joiner_pipes & ~BIT(intel_dss_get_primary_joiner_pipe(crtc_state));

-:114: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#114: FILE: drivers/gpu/drm/i915/display/intel_modeset_setup.c:740:
+								 intel_dss_get_secondary_joiner_pipes(crtc_state)) {

total: 0 errors, 2 warnings, 0 checks, 79 lines checked
522c39401080 drm/i915/display: Move intel_joiner_num_pipes to intel dss


