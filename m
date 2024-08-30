Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A52BCA0EFB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 10:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A908610EA65;
	Fri, 30 Aug 2024 10:25:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CED10EA65;
 Fri, 30 Aug 2024 10:25:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_hdmi_?=
 =?utf-8?q?and_dp_related_struct_intel=5Fdisplay_conversions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 10:25:09 -0000
Message-ID: <172501350921.854207.15208688337396314954@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725012870.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725012870.git.jani.nikula@intel.com>
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

Series: drm/i915/display: hdmi and dp related struct intel_display conversions
URL   : https://patchwork.freedesktop.org/series/138010/
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
commit 883092d92af1f9ccee6154713951a59b8e2a3f89
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Aug 30 13:15:48 2024 +0300

    drm/i915/dp: hide dp_to_i915() inside intel_dp.c
    
    Now that only intel_dp.c uses dp_to_i915(), hide it there. This removes
    a header dependency on to_i915().
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 2c1b4f4d497c7c28266d94a00170aad1bbaec5e3 drm-intel
8d6479ebc2f5 drm/xe/display: use xe && 0 to avoid warnings about unused variables
0f86fd861781 drm/i915/hdmi: convert to struct intel_display
e46ff2db0705 drm/i915/dp: convert g4x_dp.[ch] to struct intel_display
3ac5dbf14584 drm/i915/dp: convert intel_dp_tunnel.[ch] to struct intel_display
49010666ab02 drm/i915/dp: convert intel_dp_aux.[ch] to struct intel_display
03715fa0c1bd drm/i915/dp: convert intel_dp_link_training.[ch] to struct intel_display
32f08e60bcca drm/i915/pps: pass intel_dp to pps_name()
d3cfbc38879e drm/i915/pps: convert intel_pps.[ch] to struct intel_display
1b0eae9b4782 drm/i915/psr: convert intel_psr.[ch] to struct intel_display
-:1291: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#1291: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1722:
+		    intel_de_read(display, EDP_PSR2_CTL(display, cpu_transcoder)) & EDP_PSR2_ENABLE);

total: 0 errors, 1 warnings, 0 checks, 2394 lines checked
cefa5c0a597a drm/i915/ddi: stop using dp_to_i915()
883092d92af1 drm/i915/dp: hide dp_to_i915() inside intel_dp.c


