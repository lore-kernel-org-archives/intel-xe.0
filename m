Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DB6CCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 04:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BB910E1B1;
	Tue, 18 Nov 2025 04:26:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553B410E1B1;
 Tue, 18 Nov 2025 04:26:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_compressi?=
 =?utf-8?q?ble_surfaces_to_be_1-way_coherent_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 04:26:56 -0000
Message-ID: <176344001632.3615.9492373897165025355@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118042048.597801-1-x.wang@intel.com>
In-Reply-To: <20251118042048.597801-1-x.wang@intel.com>
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

Series: drm/xe: Allow compressible surfaces to be 1-way coherent (rev2)
URL   : https://patchwork.freedesktop.org/series/157036/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b32aaf2f2fd8b7c9d2d87a36d280e0109901e197
Author: Xin Wang <x.wang@intel.com>
Date:   Tue Nov 18 04:20:48 2025 +0000

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
    
    Bspec: 71582, 59361, 59399
    Signed-off-by: Xin Wang <x.wang@intel.com>
+ /mt/dim checkpatch 91fc6d984707c9bfd4a60550e6a85f1a991e7ec8 drm-intel
b32aaf2f2fd8 drm/xe: Allow compressible surfaces to be 1-way coherent
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Previously, compressible surfaces were required to be non-coherent (allocated

-:159: ERROR:SPACING: space prohibited after that open square bracket '['
#159: FILE: drivers/gpu/drm/xe/xe_pat.c:155:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:159: ERROR:SPACING: space prohibited after that open parenthesis '('
#159: FILE: drivers/gpu/drm/xe/xe_pat.c:155:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:159: ERROR:SPACING: space prohibited before that close parenthesis ')'
#159: FILE: drivers/gpu/drm/xe/xe_pat.c:155:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:160: ERROR:SPACING: space prohibited after that open square bracket '['
#160: FILE: drivers/gpu/drm/xe/xe_pat.c:156:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:160: ERROR:SPACING: space prohibited after that open parenthesis '('
#160: FILE: drivers/gpu/drm/xe/xe_pat.c:156:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:160: ERROR:SPACING: space prohibited before that close parenthesis ')'
#160: FILE: drivers/gpu/drm/xe/xe_pat.c:156:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:161: ERROR:SPACING: space prohibited after that open square bracket '['
#161: FILE: drivers/gpu/drm/xe/xe_pat.c:157:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:161: ERROR:SPACING: space prohibited after that open parenthesis '('
#161: FILE: drivers/gpu/drm/xe/xe_pat.c:157:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:161: ERROR:SPACING: space prohibited before that close parenthesis ')'
#161: FILE: drivers/gpu/drm/xe/xe_pat.c:157:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:162: ERROR:SPACING: space prohibited after that open square bracket '['
#162: FILE: drivers/gpu/drm/xe/xe_pat.c:158:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:162: ERROR:SPACING: space prohibited after that open parenthesis '('
#162: FILE: drivers/gpu/drm/xe/xe_pat.c:158:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:162: ERROR:SPACING: space prohibited before that close parenthesis ')'
#162: FILE: drivers/gpu/drm/xe/xe_pat.c:158:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:163: ERROR:SPACING: space prohibited after that open square bracket '['
#163: FILE: drivers/gpu/drm/xe/xe_pat.c:159:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:163: ERROR:SPACING: space prohibited after that open parenthesis '('
#163: FILE: drivers/gpu/drm/xe/xe_pat.c:159:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:163: ERROR:SPACING: space prohibited before that close parenthesis ')'
#163: FILE: drivers/gpu/drm/xe/xe_pat.c:159:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:164: ERROR:SPACING: space prohibited after that open square bracket '['
#164: FILE: drivers/gpu/drm/xe/xe_pat.c:160:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:164: ERROR:SPACING: space prohibited after that open parenthesis '('
#164: FILE: drivers/gpu/drm/xe/xe_pat.c:160:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:164: ERROR:SPACING: space prohibited before that close parenthesis ')'
#164: FILE: drivers/gpu/drm/xe/xe_pat.c:160:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:165: ERROR:SPACING: space prohibited after that open square bracket '['
#165: FILE: drivers/gpu/drm/xe/xe_pat.c:161:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:165: ERROR:SPACING: space prohibited after that open parenthesis '('
#165: FILE: drivers/gpu/drm/xe/xe_pat.c:161:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:165: ERROR:SPACING: space prohibited before that close parenthesis ')'
#165: FILE: drivers/gpu/drm/xe/xe_pat.c:161:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:166: ERROR:SPACING: space prohibited after that open square bracket '['
#166: FILE: drivers/gpu/drm/xe/xe_pat.c:162:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:166: ERROR:SPACING: space prohibited after that open parenthesis '('
#166: FILE: drivers/gpu/drm/xe/xe_pat.c:162:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:166: ERROR:SPACING: space prohibited before that close parenthesis ')'
#166: FILE: drivers/gpu/drm/xe/xe_pat.c:162:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:167: ERROR:SPACING: space prohibited after that open square bracket '['
#167: FILE: drivers/gpu/drm/xe/xe_pat.c:163:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:167: ERROR:SPACING: space prohibited after that open parenthesis '('
#167: FILE: drivers/gpu/drm/xe/xe_pat.c:163:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:167: ERROR:SPACING: space prohibited before that close parenthesis ')'
#167: FILE: drivers/gpu/drm/xe/xe_pat.c:163:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:168: ERROR:SPACING: space prohibited after that open square bracket '['
#168: FILE: drivers/gpu/drm/xe/xe_pat.c:164:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:168: ERROR:SPACING: space prohibited after that open parenthesis '('
#168: FILE: drivers/gpu/drm/xe/xe_pat.c:164:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:168: ERROR:SPACING: space prohibited before that close parenthesis ')'
#168: FILE: drivers/gpu/drm/xe/xe_pat.c:164:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:169: ERROR:SPACING: space prohibited after that open parenthesis '('
#169: FILE: drivers/gpu/drm/xe/xe_pat.c:165:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:169: ERROR:SPACING: space prohibited before that close parenthesis ')'
#169: FILE: drivers/gpu/drm/xe/xe_pat.c:165:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:170: ERROR:SPACING: space prohibited after that open parenthesis '('
#170: FILE: drivers/gpu/drm/xe/xe_pat.c:166:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:170: ERROR:SPACING: space prohibited before that close parenthesis ')'
#170: FILE: drivers/gpu/drm/xe/xe_pat.c:166:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:171: ERROR:SPACING: space prohibited after that open parenthesis '('
#171: FILE: drivers/gpu/drm/xe/xe_pat.c:167:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:171: ERROR:SPACING: space prohibited before that close parenthesis ')'
#171: FILE: drivers/gpu/drm/xe/xe_pat.c:167:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:172: ERROR:SPACING: space prohibited after that open parenthesis '('
#172: FILE: drivers/gpu/drm/xe/xe_pat.c:168:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:172: ERROR:SPACING: space prohibited before that close parenthesis ')'
#172: FILE: drivers/gpu/drm/xe/xe_pat.c:168:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:173: ERROR:SPACING: space prohibited after that open parenthesis '('
#173: FILE: drivers/gpu/drm/xe/xe_pat.c:169:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:173: ERROR:SPACING: space prohibited before that close parenthesis ')'
#173: FILE: drivers/gpu/drm/xe/xe_pat.c:169:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:174: ERROR:SPACING: space prohibited after that open parenthesis '('
#174: FILE: drivers/gpu/drm/xe/xe_pat.c:170:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:174: ERROR:SPACING: space prohibited before that close parenthesis ')'
#174: FILE: drivers/gpu/drm/xe/xe_pat.c:170:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:175: ERROR:SPACING: space prohibited after that open parenthesis '('
#175: FILE: drivers/gpu/drm/xe/xe_pat.c:171:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:175: ERROR:SPACING: space prohibited before that close parenthesis ')'
#175: FILE: drivers/gpu/drm/xe/xe_pat.c:171:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:177: ERROR:SPACING: space prohibited after that open parenthesis '('
#177: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:177: ERROR:SPACING: space prohibited before that close parenthesis ')'
#177: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:178: ERROR:SPACING: space prohibited after that open parenthesis '('
#178: FILE: drivers/gpu/drm/xe/xe_pat.c:174:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:178: ERROR:SPACING: space prohibited before that close parenthesis ')'
#178: FILE: drivers/gpu/drm/xe/xe_pat.c:174:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:179: ERROR:SPACING: space prohibited after that open parenthesis '('
#179: FILE: drivers/gpu/drm/xe/xe_pat.c:175:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:179: ERROR:SPACING: space prohibited before that close parenthesis ')'
#179: FILE: drivers/gpu/drm/xe/xe_pat.c:175:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:180: ERROR:SPACING: space prohibited after that open parenthesis '('
#180: FILE: drivers/gpu/drm/xe/xe_pat.c:176:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:180: ERROR:SPACING: space prohibited before that close parenthesis ')'
#180: FILE: drivers/gpu/drm/xe/xe_pat.c:176:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:181: ERROR:SPACING: space prohibited after that open parenthesis '('
#181: FILE: drivers/gpu/drm/xe/xe_pat.c:177:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:181: ERROR:SPACING: space prohibited before that close parenthesis ')'
#181: FILE: drivers/gpu/drm/xe/xe_pat.c:177:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:182: ERROR:SPACING: space prohibited after that open parenthesis '('
#182: FILE: drivers/gpu/drm/xe/xe_pat.c:178:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:182: ERROR:SPACING: space prohibited before that close parenthesis ')'
#182: FILE: drivers/gpu/drm/xe/xe_pat.c:178:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:183: ERROR:SPACING: space prohibited after that open parenthesis '('
#183: FILE: drivers/gpu/drm/xe/xe_pat.c:179:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:183: ERROR:SPACING: space prohibited before that close parenthesis ')'
#183: FILE: drivers/gpu/drm/xe/xe_pat.c:179:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:184: ERROR:SPACING: space prohibited after that open parenthesis '('
#184: FILE: drivers/gpu/drm/xe/xe_pat.c:180:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:184: ERROR:SPACING: space prohibited before that close parenthesis ')'
#184: FILE: drivers/gpu/drm/xe/xe_pat.c:180:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:185: ERROR:SPACING: space prohibited after that open parenthesis '('
#185: FILE: drivers/gpu/drm/xe/xe_pat.c:181:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:185: ERROR:SPACING: space prohibited before that close parenthesis ')'
#185: FILE: drivers/gpu/drm/xe/xe_pat.c:181:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:186: ERROR:SPACING: space prohibited after that open parenthesis '('
#186: FILE: drivers/gpu/drm/xe/xe_pat.c:182:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:186: ERROR:SPACING: space prohibited before that close parenthesis ')'
#186: FILE: drivers/gpu/drm/xe/xe_pat.c:182:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:187: ERROR:SPACING: space prohibited after that open parenthesis '('
#187: FILE: drivers/gpu/drm/xe/xe_pat.c:183:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:187: ERROR:SPACING: space prohibited before that close parenthesis ')'
#187: FILE: drivers/gpu/drm/xe/xe_pat.c:183:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:188: ERROR:SPACING: space prohibited after that open parenthesis '('
#188: FILE: drivers/gpu/drm/xe/xe_pat.c:184:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

-:188: ERROR:SPACING: space prohibited before that close parenthesis ')'
#188: FILE: drivers/gpu/drm/xe/xe_pat.c:184:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

total: 68 errors, 1 warnings, 0 checks, 197 lines checked


