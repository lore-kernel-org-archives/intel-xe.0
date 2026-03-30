Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1F11061B13
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 16:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639210E15F;
	Mon, 30 Mar 2026 16:05:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573B610E15F;
 Mon, 30 Mar 2026 16:05:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_More_uncore_n?=
 =?utf-8?q?ukage_from_display_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Mar 2026 16:05:21 -0000
Message-ID: <177488672133.413457.6061126305015690028@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: More uncore nukage from display code (rev2)
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
commit 4238fd7d6d6ded049bc118c560c5dd88b061a5d8
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Mar 25 20:53:41 2026 +0200

    drm/i915/rom: Use intel_de for SPI ROM register access
    
    Since we moved intel_rom.c back into the display code, juse
    use intel_de_{read,write}() for the register accesses.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch bd31fb142d057e5995cfeaad45b36e051ccb7ccb drm-intel
c1da6d5d3aef drm/i915/qgv: Use intel_de_read() for MTL_MEM_SS_INFO* reads
f973f89a738c drm/i915/mchbar: Provide intel_mchbar_read*() abstraction
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 68 lines checked
75287a4fab41 drm/i915/mchbar: Define the end of the MCHBAR mirror
384c6568ce41 drm/i915/mchbar: WARN when accessing non-MCHBAR registers via intel_mchbar_read*()
2105a8c9e0cb drm/i915/mchbar: Use intel_mchbar_read() instead of intel_de_read()
2dd44457c7a6 drm/i915/mchbar: Use intel_mchbar_read*() instead of intel_uncore_read*()
8332568468da drm/i915/de: Add intel_de_read16()
4e1106d22c39 drm/i915/de: s/intel_de_read64_2x32()/intel_de_read64_2x32_volatile()/
-:60: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#60: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:1056:
+			intel_de_read64_2x32_volatile(display, TRANS_CMRR_N_LO(display, cpu_transcoder),

-:65: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:1059:
+			intel_de_read64_2x32_volatile(display, TRANS_CMRR_M_LO(display, cpu_transcoder),

total: 0 errors, 2 warnings, 0 checks, 35 lines checked
aff964c0fb83 drm/i915/de: Add a simple intel_de_read64_2x32()
ffee75a3b527 drm/i915/vrr: Use intel_de_read64_2x32()
19e72eba6338 drm/i915/mchbar: Use intel_de_read*() for MCHBAR register accesses
4238fd7d6d6d drm/i915/rom: Use intel_de for SPI ROM register access
-:9: WARNING:TYPO_SPELLING: 'juse' may be misspelled - perhaps 'just'?
#9: 
Since we moved intel_rom.c back into the display code, juse
                                                       ^^^^

total: 0 errors, 1 warnings, 0 checks, 48 lines checked


