Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D7210F92E0
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 16:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C3A10E1B0;
	Tue, 31 Mar 2026 16:41:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AAA10E1B0;
 Tue, 31 Mar 2026 16:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_More_uncore_n?=
 =?utf-8?q?ukage_from_display_code_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 31 Mar 2026 16:41:23 -0000
Message-ID: <177497528370.417276.12865785532892324928@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: More uncore nukage from display code (rev3)
URL   : https://patchwork.freedesktop.org/series/163872/
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
commit b366536f225dba9bc693f3fe03083c8941caac50
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Mar 31 18:42:59 2026 +0300

    drm/i915/rom: Use intel_de for SPI ROM register access
    
    Since we moved intel_rom.c back into the display code, just
    use intel_de_{read,write}() for the register accesses.
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 779129c7868f4c7205901d6e57b25de52b411d1c drm-intel
05f15ccccf10 drm/i915/qgv: Use intel_de_read() for MTL_MEM_SS_INFO* reads
84bb8a98efa9 drm/i915/mchbar: Provide intel_mchbar_read*() abstraction
-:40: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#40: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
0da11f4a94c5 drm/i915/mchbar: Define the end of the MCHBAR mirror
5e79193a522f drm/i915/mchbar: WARN when accessing non-MCHBAR registers via intel_mchbar_read*()
a0790bf612f5 drm/i915/mchbar: Use intel_mchbar_read() instead of intel_de_read()
fab5f6f85a24 drm/i915/mchbar: Use intel_mchbar_read*() instead of intel_uncore_read*()
c4bbed92a180 drm/i915/de: Add intel_de_read16()
7fcee374d173 drm/i915/de: s/intel_de_read64_2x32()/intel_de_read64_2x32_volatile()/
-:60: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#60: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:1056:
+			intel_de_read64_2x32_volatile(display, TRANS_CMRR_N_LO(display, cpu_transcoder),

-:65: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:1059:
+			intel_de_read64_2x32_volatile(display, TRANS_CMRR_M_LO(display, cpu_transcoder),

total: 0 errors, 2 warnings, 0 checks, 35 lines checked
0a7dac98ed0e drm/i915/de: Add a simple intel_de_read64_2x32()
a0d3ac3aca0e drm/i915/vrr: Use intel_de_read64_2x32()
51b33a5fc6b1 drm/i915/mchbar: Use intel_de_read*() for MCHBAR register accesses
b366536f225d drm/i915/rom: Use intel_de for SPI ROM register access


