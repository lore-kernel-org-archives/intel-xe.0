Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB90CEFCEC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 19:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF810E549;
	Tue,  6 Jan 2026 19:01:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753CF10E548;
 Tue,  6 Jan 2026 19:01:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_compressi?=
 =?utf-8?q?ble_surfaces_to_be_1-way_coherent_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Jan 2026 19:01:05 -0000
Message-ID: <176772606547.130241.16285688473829071498@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260106185501.964562-1-x.wang@intel.com>
In-Reply-To: <20260106185501.964562-1-x.wang@intel.com>
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

Series: drm/xe: Allow compressible surfaces to be 1-way coherent (rev4)
URL   : https://patchwork.freedesktop.org/series/157036/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 689777d70aa7750fcdefdc00ecbfd86bc7545371
Author: Xin Wang <x.wang@intel.com>
Date:   Tue Jan 6 18:55:01 2026 +0000

    drm/xe: Allow compressible surfaces to be 1-way coherent
    
    Previously, compressible surfaces were required to be non-coherent (allocated
    as WC) because compression and coherency were mutually exclusive. Starting
    with Xe3, hardware supports combining compression with 1-way coherency,
    allowing compressible surfaces to be allocated as WB memory. This provides
    applications with more efficient memory allocation by avoiding WC allocation
    overhead that can cause system stuttering and memory management challenges.
    
    The implementation adds support for compressed+coherent PAT entry for the
    xe3_lpg devices and updates the driver logic to handle the new compression
    capabilities.
    
    v2: (Matthew Auld)
     - Improved error handling with XE_IOCTL_DBG()
     - Enhanced documentation and comments
     - Fixed xe_bo_needs_ccs_pages() outdated compression assumptions
    
    v3:
     - Improve WB compression support detection by checking PAT table instead
    of version check
    
    Bspec: 71582, 59361, 59399
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Xin Wang <x.wang@intel.com>
+ /mt/dim checkpatch 3d6700a02638d446a4e8ad92a8212c3efef84ae0 drm-intel
689777d70aa7 drm/xe: Allow compressible surfaces to be 1-way coherent
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Previously, compressible surfaces were required to be non-coherent (allocated

-:206: ERROR:SPACING: space prohibited after that open square bracket '['
#206: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:206: ERROR:SPACING: space prohibited after that open parenthesis '('
#206: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:206: ERROR:SPACING: space prohibited before that close parenthesis ')'
#206: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:207: ERROR:SPACING: space prohibited after that open square bracket '['
#207: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:207: ERROR:SPACING: space prohibited after that open parenthesis '('
#207: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:207: ERROR:SPACING: space prohibited before that close parenthesis ')'
#207: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:208: ERROR:SPACING: space prohibited after that open square bracket '['
#208: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:208: ERROR:SPACING: space prohibited after that open parenthesis '('
#208: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:208: ERROR:SPACING: space prohibited before that close parenthesis ')'
#208: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:209: ERROR:SPACING: space prohibited after that open square bracket '['
#209: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:209: ERROR:SPACING: space prohibited after that open parenthesis '('
#209: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:209: ERROR:SPACING: space prohibited before that close parenthesis ')'
#209: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:210: ERROR:SPACING: space prohibited after that open square bracket '['
#210: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:210: ERROR:SPACING: space prohibited after that open parenthesis '('
#210: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:210: ERROR:SPACING: space prohibited before that close parenthesis ')'
#210: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:211: ERROR:SPACING: space prohibited after that open square bracket '['
#211: FILE: drivers/gpu/drm/xe/xe_pat.c:190:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:211: ERROR:SPACING: space prohibited after that open parenthesis '('
#211: FILE: drivers/gpu/drm/xe/xe_pat.c:190:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:211: ERROR:SPACING: space prohibited before that close parenthesis ')'
#211: FILE: drivers/gpu/drm/xe/xe_pat.c:190:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:212: ERROR:SPACING: space prohibited after that open square bracket '['
#212: FILE: drivers/gpu/drm/xe/xe_pat.c:191:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:212: ERROR:SPACING: space prohibited after that open parenthesis '('
#212: FILE: drivers/gpu/drm/xe/xe_pat.c:191:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:212: ERROR:SPACING: space prohibited before that close parenthesis ')'
#212: FILE: drivers/gpu/drm/xe/xe_pat.c:191:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:213: ERROR:SPACING: space prohibited after that open square bracket '['
#213: FILE: drivers/gpu/drm/xe/xe_pat.c:192:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:213: ERROR:SPACING: space prohibited after that open parenthesis '('
#213: FILE: drivers/gpu/drm/xe/xe_pat.c:192:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:213: ERROR:SPACING: space prohibited before that close parenthesis ')'
#213: FILE: drivers/gpu/drm/xe/xe_pat.c:192:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:214: ERROR:SPACING: space prohibited after that open square bracket '['
#214: FILE: drivers/gpu/drm/xe/xe_pat.c:193:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:214: ERROR:SPACING: space prohibited after that open parenthesis '('
#214: FILE: drivers/gpu/drm/xe/xe_pat.c:193:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:214: ERROR:SPACING: space prohibited before that close parenthesis ')'
#214: FILE: drivers/gpu/drm/xe/xe_pat.c:193:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:215: ERROR:SPACING: space prohibited after that open square bracket '['
#215: FILE: drivers/gpu/drm/xe/xe_pat.c:194:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:215: ERROR:SPACING: space prohibited after that open parenthesis '('
#215: FILE: drivers/gpu/drm/xe/xe_pat.c:194:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:215: ERROR:SPACING: space prohibited before that close parenthesis ')'
#215: FILE: drivers/gpu/drm/xe/xe_pat.c:194:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:216: ERROR:SPACING: space prohibited after that open parenthesis '('
#216: FILE: drivers/gpu/drm/xe/xe_pat.c:195:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:216: ERROR:SPACING: space prohibited before that close parenthesis ')'
#216: FILE: drivers/gpu/drm/xe/xe_pat.c:195:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:217: ERROR:SPACING: space prohibited after that open parenthesis '('
#217: FILE: drivers/gpu/drm/xe/xe_pat.c:196:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:217: ERROR:SPACING: space prohibited before that close parenthesis ')'
#217: FILE: drivers/gpu/drm/xe/xe_pat.c:196:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:218: ERROR:SPACING: space prohibited after that open parenthesis '('
#218: FILE: drivers/gpu/drm/xe/xe_pat.c:197:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:218: ERROR:SPACING: space prohibited before that close parenthesis ')'
#218: FILE: drivers/gpu/drm/xe/xe_pat.c:197:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:219: ERROR:SPACING: space prohibited after that open parenthesis '('
#219: FILE: drivers/gpu/drm/xe/xe_pat.c:198:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:219: ERROR:SPACING: space prohibited before that close parenthesis ')'
#219: FILE: drivers/gpu/drm/xe/xe_pat.c:198:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:220: ERROR:SPACING: space prohibited after that open parenthesis '('
#220: FILE: drivers/gpu/drm/xe/xe_pat.c:199:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:220: ERROR:SPACING: space prohibited before that close parenthesis ')'
#220: FILE: drivers/gpu/drm/xe/xe_pat.c:199:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:221: ERROR:SPACING: space prohibited after that open parenthesis '('
#221: FILE: drivers/gpu/drm/xe/xe_pat.c:200:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:221: ERROR:SPACING: space prohibited before that close parenthesis ')'
#221: FILE: drivers/gpu/drm/xe/xe_pat.c:200:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:222: ERROR:SPACING: space prohibited after that open parenthesis '('
#222: FILE: drivers/gpu/drm/xe/xe_pat.c:201:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:222: ERROR:SPACING: space prohibited before that close parenthesis ')'
#222: FILE: drivers/gpu/drm/xe/xe_pat.c:201:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:224: ERROR:SPACING: space prohibited after that open parenthesis '('
#224: FILE: drivers/gpu/drm/xe/xe_pat.c:203:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:224: ERROR:SPACING: space prohibited before that close parenthesis ')'
#224: FILE: drivers/gpu/drm/xe/xe_pat.c:203:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:225: ERROR:SPACING: space prohibited after that open parenthesis '('
#225: FILE: drivers/gpu/drm/xe/xe_pat.c:204:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:225: ERROR:SPACING: space prohibited before that close parenthesis ')'
#225: FILE: drivers/gpu/drm/xe/xe_pat.c:204:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:226: ERROR:SPACING: space prohibited after that open parenthesis '('
#226: FILE: drivers/gpu/drm/xe/xe_pat.c:205:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:226: ERROR:SPACING: space prohibited before that close parenthesis ')'
#226: FILE: drivers/gpu/drm/xe/xe_pat.c:205:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:227: ERROR:SPACING: space prohibited after that open parenthesis '('
#227: FILE: drivers/gpu/drm/xe/xe_pat.c:206:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:227: ERROR:SPACING: space prohibited before that close parenthesis ')'
#227: FILE: drivers/gpu/drm/xe/xe_pat.c:206:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:228: ERROR:SPACING: space prohibited after that open parenthesis '('
#228: FILE: drivers/gpu/drm/xe/xe_pat.c:207:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:228: ERROR:SPACING: space prohibited before that close parenthesis ')'
#228: FILE: drivers/gpu/drm/xe/xe_pat.c:207:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:229: ERROR:SPACING: space prohibited after that open parenthesis '('
#229: FILE: drivers/gpu/drm/xe/xe_pat.c:208:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:229: ERROR:SPACING: space prohibited before that close parenthesis ')'
#229: FILE: drivers/gpu/drm/xe/xe_pat.c:208:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:230: ERROR:SPACING: space prohibited after that open parenthesis '('
#230: FILE: drivers/gpu/drm/xe/xe_pat.c:209:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:230: ERROR:SPACING: space prohibited before that close parenthesis ')'
#230: FILE: drivers/gpu/drm/xe/xe_pat.c:209:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:231: ERROR:SPACING: space prohibited after that open parenthesis '('
#231: FILE: drivers/gpu/drm/xe/xe_pat.c:210:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:231: ERROR:SPACING: space prohibited before that close parenthesis ')'
#231: FILE: drivers/gpu/drm/xe/xe_pat.c:210:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:232: ERROR:SPACING: space prohibited after that open parenthesis '('
#232: FILE: drivers/gpu/drm/xe/xe_pat.c:211:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:232: ERROR:SPACING: space prohibited before that close parenthesis ')'
#232: FILE: drivers/gpu/drm/xe/xe_pat.c:211:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:233: ERROR:SPACING: space prohibited after that open parenthesis '('
#233: FILE: drivers/gpu/drm/xe/xe_pat.c:212:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:233: ERROR:SPACING: space prohibited before that close parenthesis ')'
#233: FILE: drivers/gpu/drm/xe/xe_pat.c:212:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:234: ERROR:SPACING: space prohibited after that open parenthesis '('
#234: FILE: drivers/gpu/drm/xe/xe_pat.c:213:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:234: ERROR:SPACING: space prohibited before that close parenthesis ')'
#234: FILE: drivers/gpu/drm/xe/xe_pat.c:213:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:235: ERROR:SPACING: space prohibited after that open parenthesis '('
#235: FILE: drivers/gpu/drm/xe/xe_pat.c:214:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

-:235: ERROR:SPACING: space prohibited before that close parenthesis ')'
#235: FILE: drivers/gpu/drm/xe/xe_pat.c:214:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

total: 68 errors, 1 warnings, 0 checks, 237 lines checked


