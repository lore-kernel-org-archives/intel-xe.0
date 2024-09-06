Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33301E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACEB10E1D0;
	Fri,  6 Sep 2024 23:31:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A87B10E1D0;
 Fri,  6 Sep 2024 23:31:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_Xe3_and_Panther_Lake_?=
 =?utf-8?q?support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 23:31:32 -0000
Message-ID: <172566549203.955479.4721331852601309067@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

Series: Add Xe3 and Panther Lake support
URL   : https://patchwork.freedesktop.org/series/138349/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f5a0f3afa637829a1c6db3042e933f13931c3c6c
Author: Haridhar Kalvala <haridhar.kalvala@intel.com>
Date:   Fri Sep 6 14:51:53 2024 -0700

    drm/xe/ptl: Add PTL platform definition
    
    PTL is an integrated GPU based on the Xe3 architecture.
    
    Bspec: 72574
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a drm-intel
6dcf93d4f441 drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
a14bf898238e drm/xe/xe3: Define Xe3 feature flags
adb1193d312e drm/xe/xe3: Generate and store the L3 bank mask
9e5d4ed4e6fc drm/xe/xe3: Add initial set of workarounds
-:83: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/xe_wa.c:601:
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),

total: 0 errors, 1 warnings, 0 checks, 87 lines checked
39037a1f98f7 drm/xe/xe3: Extend wa_15015404425 for xe3
9ba274ac1866 drm/xe/xe3lpm: Add new "instance0" steering table
-:8: WARNING:REPEATED_WORD: Possible repeated word: 'to'
#8: 
"MEDIAINF" range on Xe3.  Since we can always steer to to grpid /

total: 0 errors, 1 warnings, 0 checks, 29 lines checked
dba781687d47 drm/xe/ptl: PTL re-uses Xe2 MOCS table
46295d37f5cd drm/xe/ptl: Add performance tuning settings for PTL
f5a0f3afa637 drm/xe/ptl: Add PTL platform definition
-:62: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#62: FILE: include/drm/intel/xe_pciids.h:225:
+#define XE_PTL_U_IDS(MACRO__, ...) \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__)

-:62: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#62: FILE: include/drm/intel/xe_pciids.h:225:
+#define XE_PTL_U_IDS(MACRO__, ...) \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__)

-:66: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#66: FILE: include/drm/intel/xe_pciids.h:229:
+#define XE_PTL_IDS(MACRO__, ...) \
+	XE_PTL_P_IDS(MACRO__, ## __VA_ARGS__), \
+	XE_PTL_U_IDS(MACRO__, ## __VA_ARGS__)

-:66: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#66: FILE: include/drm/intel/xe_pciids.h:229:
+#define XE_PTL_IDS(MACRO__, ...) \
+	XE_PTL_P_IDS(MACRO__, ## __VA_ARGS__), \
+	XE_PTL_U_IDS(MACRO__, ## __VA_ARGS__)

total: 2 errors, 0 warnings, 2 checks, 41 lines checked


