Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81942CED24E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B5B10E07D;
	Tue,  8 Oct 2024 01:40:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A84610E347;
 Tue,  8 Oct 2024 01:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_Xe3_and_Panther_Lake_?=
 =?utf-8?q?support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 01:40:32 -0000
Message-ID: <172835163203.1201242.17807925216134852881@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
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

Series: Add Xe3 and Panther Lake support (rev3)
URL   : https://patchwork.freedesktop.org/series/138349/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5981634f9039ffc98e498d412b0908f47e0970d8
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Oct 7 18:35:09 2024 -0700

    drm/xe/xe3lpm: Add new "instance0" steering table
    
    MCR steering on Xe3 media IP is almost the same as it was on Xe2, except
    for one new range (0x38D0D0 - 0x38D0FF) which has changed to an MCR
    "MEDIAINF" range on Xe3.  Since we can always steer to to grpid /
    instanceid 0 for MEDIAINF ranges, define a new "INSTANCE0" steering
    table for Xe3 media.  Xe3 can continue to use the same OADDRM/GPMXMT
    table as Xe2.
    
    v2: Merge continuous entries 38D0D0 - 38F0FF
    
    Bspec: 74298
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch fc6867c683c18ec3ac31682fd37d418d8a8ebde1 drm-intel
aabfc85a8c42 drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
11f5d4378fce drm/xe/xe3: Define Xe3 feature flags
-:15: WARNING:TYPO_SPELLING: 'defintion' may be misspelled - perhaps 'definition'?
#15: 
v2: reuse graphics_xe2 defintion
                       ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
9ebe318dd134 drm/xe/xe3: Add initial set of workarounds
-:85: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#85: FILE: drivers/gpu/drm/xe/xe_wa.c:602:
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
f93654a75db8 drm/xe/ptl: PTL re-uses Xe2 MOCS table
dbe811b03f80 drm/xe/ptl: Add PTL platform definition
-:60: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#60: FILE: include/drm/intel/xe_pciids.h:223:
+#define XE_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)

-:60: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#60: FILE: include/drm/intel/xe_pciids.h:223:
+#define XE_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 41 lines checked
5981634f9039 drm/xe/xe3lpm: Add new "instance0" steering table
-:8: WARNING:REPEATED_WORD: Possible repeated word: 'to'
#8: 
"MEDIAINF" range on Xe3.  Since we can always steer to to grpid /

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


