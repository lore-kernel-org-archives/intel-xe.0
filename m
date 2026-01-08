Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E34FD1488C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 01:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4347210E2F6;
	Thu,  8 Jan 2026 01:59:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0831D10E2F6;
 Thu,  8 Jan 2026 01:59:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_compressi?=
 =?utf-8?q?ble_surfaces_to_be_1-way_coherent_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 01:59:10 -0000
Message-ID: <176783755001.134482.8416038092871793876@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108014257.398697-1-x.wang@intel.com>
In-Reply-To: <20260108014257.398697-1-x.wang@intel.com>
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

Series: drm/xe: Allow compressible surfaces to be 1-way coherent (rev5)
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
commit e3fb7f05c04e8cb6ce09d0aa59f97f1d258ac321
Author: Xin Wang <x.wang@intel.com>
Date:   Thu Jan 8 01:42:57 2026 +0000

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
    
    v4:
     - Add XE_CACHE_WB_COMPRESSION, which simplifies the logic.
    
    Bspec: 71582, 59361, 59399
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Xin Wang <x.wang@intel.com>
+ /mt/dim checkpatch 25815d6185d3efe226238025baddf01299c4b070 drm-intel
e3fb7f05c04e drm/xe: Allow compressible surfaces to be 1-way coherent
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Previously, compressible surfaces were required to be non-coherent (allocated

-:185: ERROR:SPACING: space prohibited after that open square bracket '['
#185: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:185: ERROR:SPACING: space prohibited after that open parenthesis '('
#185: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:185: ERROR:SPACING: space prohibited before that close parenthesis ')'
#185: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:186: ERROR:SPACING: space prohibited after that open square bracket '['
#186: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:186: ERROR:SPACING: space prohibited after that open parenthesis '('
#186: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:186: ERROR:SPACING: space prohibited before that close parenthesis ')'
#186: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:187: ERROR:SPACING: space prohibited after that open square bracket '['
#187: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:187: ERROR:SPACING: space prohibited after that open parenthesis '('
#187: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:187: ERROR:SPACING: space prohibited before that close parenthesis ')'
#187: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:188: ERROR:SPACING: space prohibited after that open square bracket '['
#188: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:188: ERROR:SPACING: space prohibited after that open parenthesis '('
#188: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:188: ERROR:SPACING: space prohibited before that close parenthesis ')'
#188: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:189: ERROR:SPACING: space prohibited after that open square bracket '['
#189: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:189: ERROR:SPACING: space prohibited after that open parenthesis '('
#189: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:189: ERROR:SPACING: space prohibited before that close parenthesis ')'
#189: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:190: ERROR:SPACING: space prohibited after that open square bracket '['
#190: FILE: drivers/gpu/drm/xe/xe_pat.c:190:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:190: ERROR:SPACING: space prohibited after that open parenthesis '('
#190: FILE: drivers/gpu/drm/xe/xe_pat.c:190:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:190: ERROR:SPACING: space prohibited before that close parenthesis ')'
#190: FILE: drivers/gpu/drm/xe/xe_pat.c:190:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:191: ERROR:SPACING: space prohibited after that open square bracket '['
#191: FILE: drivers/gpu/drm/xe/xe_pat.c:191:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:191: ERROR:SPACING: space prohibited after that open parenthesis '('
#191: FILE: drivers/gpu/drm/xe/xe_pat.c:191:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:191: ERROR:SPACING: space prohibited before that close parenthesis ')'
#191: FILE: drivers/gpu/drm/xe/xe_pat.c:191:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:192: ERROR:SPACING: space prohibited after that open square bracket '['
#192: FILE: drivers/gpu/drm/xe/xe_pat.c:192:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:192: ERROR:SPACING: space prohibited after that open parenthesis '('
#192: FILE: drivers/gpu/drm/xe/xe_pat.c:192:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:192: ERROR:SPACING: space prohibited before that close parenthesis ')'
#192: FILE: drivers/gpu/drm/xe/xe_pat.c:192:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:193: ERROR:SPACING: space prohibited after that open square bracket '['
#193: FILE: drivers/gpu/drm/xe/xe_pat.c:193:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:193: ERROR:SPACING: space prohibited after that open parenthesis '('
#193: FILE: drivers/gpu/drm/xe/xe_pat.c:193:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:193: ERROR:SPACING: space prohibited before that close parenthesis ')'
#193: FILE: drivers/gpu/drm/xe/xe_pat.c:193:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:194: ERROR:SPACING: space prohibited after that open square bracket '['
#194: FILE: drivers/gpu/drm/xe/xe_pat.c:194:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:194: ERROR:SPACING: space prohibited after that open parenthesis '('
#194: FILE: drivers/gpu/drm/xe/xe_pat.c:194:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:194: ERROR:SPACING: space prohibited before that close parenthesis ')'
#194: FILE: drivers/gpu/drm/xe/xe_pat.c:194:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:195: ERROR:SPACING: space prohibited after that open parenthesis '('
#195: FILE: drivers/gpu/drm/xe/xe_pat.c:195:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:195: ERROR:SPACING: space prohibited before that close parenthesis ')'
#195: FILE: drivers/gpu/drm/xe/xe_pat.c:195:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:196: ERROR:SPACING: space prohibited after that open parenthesis '('
#196: FILE: drivers/gpu/drm/xe/xe_pat.c:196:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:196: ERROR:SPACING: space prohibited before that close parenthesis ')'
#196: FILE: drivers/gpu/drm/xe/xe_pat.c:196:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:197: ERROR:SPACING: space prohibited after that open parenthesis '('
#197: FILE: drivers/gpu/drm/xe/xe_pat.c:197:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:197: ERROR:SPACING: space prohibited before that close parenthesis ')'
#197: FILE: drivers/gpu/drm/xe/xe_pat.c:197:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:198: ERROR:SPACING: space prohibited after that open parenthesis '('
#198: FILE: drivers/gpu/drm/xe/xe_pat.c:198:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:198: ERROR:SPACING: space prohibited before that close parenthesis ')'
#198: FILE: drivers/gpu/drm/xe/xe_pat.c:198:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:199: ERROR:SPACING: space prohibited after that open parenthesis '('
#199: FILE: drivers/gpu/drm/xe/xe_pat.c:199:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:199: ERROR:SPACING: space prohibited before that close parenthesis ')'
#199: FILE: drivers/gpu/drm/xe/xe_pat.c:199:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:200: ERROR:SPACING: space prohibited after that open parenthesis '('
#200: FILE: drivers/gpu/drm/xe/xe_pat.c:200:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:200: ERROR:SPACING: space prohibited before that close parenthesis ')'
#200: FILE: drivers/gpu/drm/xe/xe_pat.c:200:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:201: ERROR:SPACING: space prohibited after that open parenthesis '('
#201: FILE: drivers/gpu/drm/xe/xe_pat.c:201:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:201: ERROR:SPACING: space prohibited before that close parenthesis ')'
#201: FILE: drivers/gpu/drm/xe/xe_pat.c:201:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:203: ERROR:SPACING: space prohibited after that open parenthesis '('
#203: FILE: drivers/gpu/drm/xe/xe_pat.c:203:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:203: ERROR:SPACING: space prohibited before that close parenthesis ')'
#203: FILE: drivers/gpu/drm/xe/xe_pat.c:203:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:204: ERROR:SPACING: space prohibited after that open parenthesis '('
#204: FILE: drivers/gpu/drm/xe/xe_pat.c:204:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:204: ERROR:SPACING: space prohibited before that close parenthesis ')'
#204: FILE: drivers/gpu/drm/xe/xe_pat.c:204:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:205: ERROR:SPACING: space prohibited after that open parenthesis '('
#205: FILE: drivers/gpu/drm/xe/xe_pat.c:205:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:205: ERROR:SPACING: space prohibited before that close parenthesis ')'
#205: FILE: drivers/gpu/drm/xe/xe_pat.c:205:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:206: ERROR:SPACING: space prohibited after that open parenthesis '('
#206: FILE: drivers/gpu/drm/xe/xe_pat.c:206:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:206: ERROR:SPACING: space prohibited before that close parenthesis ')'
#206: FILE: drivers/gpu/drm/xe/xe_pat.c:206:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:207: ERROR:SPACING: space prohibited after that open parenthesis '('
#207: FILE: drivers/gpu/drm/xe/xe_pat.c:207:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:207: ERROR:SPACING: space prohibited before that close parenthesis ')'
#207: FILE: drivers/gpu/drm/xe/xe_pat.c:207:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:208: ERROR:SPACING: space prohibited after that open parenthesis '('
#208: FILE: drivers/gpu/drm/xe/xe_pat.c:208:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:208: ERROR:SPACING: space prohibited before that close parenthesis ')'
#208: FILE: drivers/gpu/drm/xe/xe_pat.c:208:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:209: ERROR:SPACING: space prohibited after that open parenthesis '('
#209: FILE: drivers/gpu/drm/xe/xe_pat.c:209:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:209: ERROR:SPACING: space prohibited before that close parenthesis ')'
#209: FILE: drivers/gpu/drm/xe/xe_pat.c:209:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:210: ERROR:SPACING: space prohibited after that open parenthesis '('
#210: FILE: drivers/gpu/drm/xe/xe_pat.c:210:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:210: ERROR:SPACING: space prohibited before that close parenthesis ')'
#210: FILE: drivers/gpu/drm/xe/xe_pat.c:210:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:211: ERROR:SPACING: space prohibited after that open parenthesis '('
#211: FILE: drivers/gpu/drm/xe/xe_pat.c:211:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:211: ERROR:SPACING: space prohibited before that close parenthesis ')'
#211: FILE: drivers/gpu/drm/xe/xe_pat.c:211:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:212: ERROR:SPACING: space prohibited after that open parenthesis '('
#212: FILE: drivers/gpu/drm/xe/xe_pat.c:212:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:212: ERROR:SPACING: space prohibited before that close parenthesis ')'
#212: FILE: drivers/gpu/drm/xe/xe_pat.c:212:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:213: ERROR:SPACING: space prohibited after that open parenthesis '('
#213: FILE: drivers/gpu/drm/xe/xe_pat.c:213:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:213: ERROR:SPACING: space prohibited before that close parenthesis ')'
#213: FILE: drivers/gpu/drm/xe/xe_pat.c:213:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:214: ERROR:SPACING: space prohibited after that open parenthesis '('
#214: FILE: drivers/gpu/drm/xe/xe_pat.c:214:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

-:214: ERROR:SPACING: space prohibited before that close parenthesis ')'
#214: FILE: drivers/gpu/drm/xe/xe_pat.c:214:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

total: 68 errors, 1 warnings, 0 checks, 245 lines checked


