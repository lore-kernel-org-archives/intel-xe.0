Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4671ECA0EE1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCB510E7FE;
	Fri, 30 Aug 2024 06:11:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7255B10E7FE;
 Fri, 30 Aug 2024 06:11:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Consolidation_of_DSS_Cont?=
 =?utf-8?q?rol_in_Separate_Files_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 06:11:26 -0000
Message-ID: <172499828646.850462.5975552330770484254@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830050950.2528450-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240830050950.2528450-1-ankit.k.nautiyal@intel.com>
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

Series: Consolidation of DSS Control in Separate Files (rev3)
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
commit b4bc1d620cfc5a18481902dedb870a580d75cff7
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Aug 30 10:39:49 2024 +0530

    drm/i915/joiner: Use struct intel_display in intel_joiner_supported_pipes
    
    Replace struct drm_i915_private with struct intel_display in the helper
    intel_joiner_supported_pipes and its callers.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch d6714e4e0e19fa8eac4d75293eaae7e479b590a3 drm-intel
f339cb474fe9 drm/i915/display: Move all DSS control registers to a new file
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
66a662c4f58b drm/i915/dss_regs: Use REG_* macros for the DSS ctl bits
bfc1003b6778 drm/i915/ddi: Move all mso related helpers to a new file
-:162: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#162: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 243 lines checked
9670bafe6cf2 drm/i915/dss: Move to struct intel_display
600c22aaebb4 drm/i915/icl_dsi: Avoid using intel_dsi in configure_dual_link_mode
d2470b6b5e87 drm/i915/icl_dsi: Use intel_display in configure_dual_link_mode
7903eaf0e5d4 drm/i915/icl_dsi: Move helpers to configure dsi dual link to intel_dss
c30bd1da2b8f drm/i915/vdsc: Rename helper to check if the pipe supports dsc
10d9dc3bf5e3 drm/i915/vdsc: Move all dss stuff in dss files
bfdf825fcd26 drm/i915/dss: Use struct intel_display in dss dsc helpers
0ea60d5bbd1c drm/i915/display: Move dss stuff in intel_dss files
-:78: CHECK:SPACING: No space is necessary after a cast
#78: FILE: drivers/gpu/drm/i915/display/intel_dss.c:231:
+	power_domain = intel_dsc_power_domain(crtc, (enum transcoder) pipe);

total: 0 errors, 0 warnings, 1 checks, 110 lines checked
2d45fb1eae9c drm/i915/display: Rename static functions that use joiner
445bf8a9b30e drm/i915/display: Separate out joiner stuff in a new file
-:368: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#368: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 601 lines checked
a924fc50d033 drm/i915/display: Move intel_crtc_joined_pipe_mask to intel_joiner
-:89: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#89: FILE: drivers/gpu/drm/i915/display/intel_display.c:1681:
+						 intel_joiner_crtc_joined_pipe_mask(new_crtc_state)) {

-:98: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/display/intel_display.c:1692:
+						 intel_joiner_crtc_joined_pipe_mask(new_crtc_state)) {

-:107: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#107: FILE: drivers/gpu/drm/i915/display/intel_display.c:1711:
+						 intel_joiner_crtc_joined_pipe_mask(new_crtc_state)) {

-:116: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#116: FILE: drivers/gpu/drm/i915/display/intel_display.c:1747:
+						 intel_joiner_crtc_joined_pipe_mask(new_crtc_state)) {

-:143: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#143: FILE: drivers/gpu/drm/i915/display/intel_display.c:6628:
+						 intel_joiner_crtc_joined_pipe_mask(new_crtc_state)) {

total: 0 errors, 5 warnings, 0 checks, 216 lines checked
a62742a8d3da drm/i915/display: Move helpers for primary joiner to intel_joiner
1186516aa192 drm/i915/display: Move intel_crtc_is_joiner_secondary to intel_joiner
c1780ffef502 drm/i915/display: Move intel_crtc_joiner_secondary_pipes to intel_joiner
-:35: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_display.c:5801:
+					 intel_joiner_crtc_joiner_secondary_pipes(primary_crtc_state)) {

-:44: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#44: FILE: drivers/gpu/drm/i915/display/intel_display.c:5855:
+					 intel_joiner_crtc_joiner_secondary_pipes(primary_crtc_state)) {

-:114: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#114: FILE: drivers/gpu/drm/i915/display/intel_modeset_setup.c:761:
+								 intel_joiner_crtc_joiner_secondary_pipes(crtc_state)) {

total: 0 errors, 3 warnings, 0 checks, 78 lines checked
25843674ca87 drm/i915/joiner: Use struct intel_display in intel_joiner_enabled_pipes
b4bc1d620cfc drm/i915/joiner: Use struct intel_display in intel_joiner_supported_pipes


