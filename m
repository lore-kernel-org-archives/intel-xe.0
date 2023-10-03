Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898F7E7AD77
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 17:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4818610E301;
	Tue,  3 Oct 2023 17:11:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85B0610E060;
 Tue,  3 Oct 2023 17:11:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 844E7A47E9;
 Tue,  3 Oct 2023 17:11:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 03 Oct 2023 17:11:27 -0000
Message-ID: <169635308753.4383.9311853004697797476@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
In-Reply-To: <20231003125217.3350838-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?2=3A_Add_PAT_programming_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: xe2: Add PAT programming (rev3)
URL   : https://patchwork.freedesktop.org/series/124430/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 67ea5ce689d4733699ba553c6ec4dc89683289f6
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Oct 3 05:52:17 2023 -0700

    drm/xe/gt: Dump PAT table when failing to initialize
    
    When failing on early initialization, one cause may be that the PAT
    configuration is not correct. Dump it for ease of debugging.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36 drm-intel
8da39e4c1 drm/xe/vm: Prefer xe_assert() over XE_WARN_ON()
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '99a8844441ba', maybe rebased or not pulled?
#6: 
When xelp_pte_encode_addr() was added in commit 99a8844441ba

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
b5e4cc92c drm/xe/xe2: Follow XeHPC for TLB invalidation
10f7a90da fixup! drm/xe/pat: Prefer the arch/IP names
f2e3ce5d4 drm/xe/xe2: Program PAT tables
-:61: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#61: FILE: drivers/gpu/drm/xe/xe_pat.c:93:
+#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, coh_mode) \
+	(no_promote ? XE2_NO_PROMOTE : 0) | \
+	(comp_en ? XE2_COMP_EN : 0) | \
+	REG_FIELD_PREP(XE2_L3_CLOS, l3clos) | \
+	REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
+	REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
+	REG_FIELD_PREP(XE2_COH_MODE, coh_mode)

-:70: ERROR:SPACING: space prohibited after that open square bracket '['
#70: FILE: drivers/gpu/drm/xe/xe_pat.c:102:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:70: ERROR:SPACING: space prohibited after that open parenthesis '('
#70: FILE: drivers/gpu/drm/xe/xe_pat.c:102:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:70: ERROR:SPACING: space prohibited before that close parenthesis ')'
#70: FILE: drivers/gpu/drm/xe/xe_pat.c:102:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:71: ERROR:SPACING: space prohibited after that open square bracket '['
#71: FILE: drivers/gpu/drm/xe/xe_pat.c:103:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:71: ERROR:SPACING: space prohibited after that open parenthesis '('
#71: FILE: drivers/gpu/drm/xe/xe_pat.c:103:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:71: ERROR:SPACING: space prohibited before that close parenthesis ')'
#71: FILE: drivers/gpu/drm/xe/xe_pat.c:103:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:72: ERROR:SPACING: space prohibited after that open square bracket '['
#72: FILE: drivers/gpu/drm/xe/xe_pat.c:104:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:72: ERROR:SPACING: space prohibited after that open parenthesis '('
#72: FILE: drivers/gpu/drm/xe/xe_pat.c:104:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:72: ERROR:SPACING: space prohibited before that close parenthesis ')'
#72: FILE: drivers/gpu/drm/xe/xe_pat.c:104:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:73: ERROR:SPACING: space prohibited after that open square bracket '['
#73: FILE: drivers/gpu/drm/xe/xe_pat.c:105:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:73: ERROR:SPACING: space prohibited after that open parenthesis '('
#73: FILE: drivers/gpu/drm/xe/xe_pat.c:105:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:73: ERROR:SPACING: space prohibited before that close parenthesis ')'
#73: FILE: drivers/gpu/drm/xe/xe_pat.c:105:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:74: ERROR:SPACING: space prohibited after that open square bracket '['
#74: FILE: drivers/gpu/drm/xe/xe_pat.c:106:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:74: ERROR:SPACING: space prohibited after that open parenthesis '('
#74: FILE: drivers/gpu/drm/xe/xe_pat.c:106:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:74: ERROR:SPACING: space prohibited before that close parenthesis ')'
#74: FILE: drivers/gpu/drm/xe/xe_pat.c:106:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:75: ERROR:SPACING: space prohibited after that open square bracket '['
#75: FILE: drivers/gpu/drm/xe/xe_pat.c:107:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:75: ERROR:SPACING: space prohibited after that open parenthesis '('
#75: FILE: drivers/gpu/drm/xe/xe_pat.c:107:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:75: ERROR:SPACING: space prohibited before that close parenthesis ')'
#75: FILE: drivers/gpu/drm/xe/xe_pat.c:107:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:76: ERROR:SPACING: space prohibited after that open square bracket '['
#76: FILE: drivers/gpu/drm/xe/xe_pat.c:108:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:76: ERROR:SPACING: space prohibited after that open parenthesis '('
#76: FILE: drivers/gpu/drm/xe/xe_pat.c:108:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:76: ERROR:SPACING: space prohibited before that close parenthesis ')'
#76: FILE: drivers/gpu/drm/xe/xe_pat.c:108:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:77: ERROR:SPACING: space prohibited after that open square bracket '['
#77: FILE: drivers/gpu/drm/xe/xe_pat.c:109:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:77: ERROR:SPACING: space prohibited after that open parenthesis '('
#77: FILE: drivers/gpu/drm/xe/xe_pat.c:109:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:77: ERROR:SPACING: space prohibited before that close parenthesis ')'
#77: FILE: drivers/gpu/drm/xe/xe_pat.c:109:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:78: ERROR:SPACING: space prohibited after that open square bracket '['
#78: FILE: drivers/gpu/drm/xe/xe_pat.c:110:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:78: ERROR:SPACING: space prohibited after that open parenthesis '('
#78: FILE: drivers/gpu/drm/xe/xe_pat.c:110:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:78: ERROR:SPACING: space prohibited before that close parenthesis ')'
#78: FILE: drivers/gpu/drm/xe/xe_pat.c:110:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:79: ERROR:SPACING: space prohibited after that open square bracket '['
#79: FILE: drivers/gpu/drm/xe/xe_pat.c:111:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:79: ERROR:SPACING: space prohibited after that open parenthesis '('
#79: FILE: drivers/gpu/drm/xe/xe_pat.c:111:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:79: ERROR:SPACING: space prohibited before that close parenthesis ')'
#79: FILE: drivers/gpu/drm/xe/xe_pat.c:111:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:80: ERROR:SPACING: space prohibited after that open parenthesis '('
#80: FILE: drivers/gpu/drm/xe/xe_pat.c:112:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:80: ERROR:SPACING: space prohibited before that close parenthesis ')'
#80: FILE: drivers/gpu/drm/xe/xe_pat.c:112:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:81: ERROR:SPACING: space prohibited after that open parenthesis '('
#81: FILE: drivers/gpu/drm/xe/xe_pat.c:113:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:81: ERROR:SPACING: space prohibited before that close parenthesis ')'
#81: FILE: drivers/gpu/drm/xe/xe_pat.c:113:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:82: ERROR:SPACING: space prohibited after that open parenthesis '('
#82: FILE: drivers/gpu/drm/xe/xe_pat.c:114:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:82: ERROR:SPACING: space prohibited before that close parenthesis ')'
#82: FILE: drivers/gpu/drm/xe/xe_pat.c:114:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:83: ERROR:SPACING: space prohibited after that open parenthesis '('
#83: FILE: drivers/gpu/drm/xe/xe_pat.c:115:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:83: ERROR:SPACING: space prohibited before that close parenthesis ')'
#83: FILE: drivers/gpu/drm/xe/xe_pat.c:115:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:84: ERROR:SPACING: space prohibited after that open parenthesis '('
#84: FILE: drivers/gpu/drm/xe/xe_pat.c:116:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:84: ERROR:SPACING: space prohibited before that close parenthesis ')'
#84: FILE: drivers/gpu/drm/xe/xe_pat.c:116:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:85: ERROR:SPACING: space prohibited after that open parenthesis '('
#85: FILE: drivers/gpu/drm/xe/xe_pat.c:117:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:85: ERROR:SPACING: space prohibited before that close parenthesis ')'
#85: FILE: drivers/gpu/drm/xe/xe_pat.c:117:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:87: ERROR:SPACING: space prohibited after that open parenthesis '('
#87: FILE: drivers/gpu/drm/xe/xe_pat.c:119:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:87: ERROR:SPACING: space prohibited before that close parenthesis ')'
#87: FILE: drivers/gpu/drm/xe/xe_pat.c:119:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:88: ERROR:SPACING: space prohibited after that open parenthesis '('
#88: FILE: drivers/gpu/drm/xe/xe_pat.c:120:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:88: ERROR:SPACING: space prohibited before that close parenthesis ')'
#88: FILE: drivers/gpu/drm/xe/xe_pat.c:120:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:89: ERROR:SPACING: space prohibited after that open parenthesis '('
#89: FILE: drivers/gpu/drm/xe/xe_pat.c:121:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:89: ERROR:SPACING: space prohibited before that close parenthesis ')'
#89: FILE: drivers/gpu/drm/xe/xe_pat.c:121:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:90: ERROR:SPACING: space prohibited after that open parenthesis '('
#90: FILE: drivers/gpu/drm/xe/xe_pat.c:122:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:90: ERROR:SPACING: space prohibited before that close parenthesis ')'
#90: FILE: drivers/gpu/drm/xe/xe_pat.c:122:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:91: ERROR:SPACING: space prohibited after that open parenthesis '('
#91: FILE: drivers/gpu/drm/xe/xe_pat.c:123:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:91: ERROR:SPACING: space prohibited before that close parenthesis ')'
#91: FILE: drivers/gpu/drm/xe/xe_pat.c:123:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:92: ERROR:SPACING: space prohibited after that open parenthesis '('
#92: FILE: drivers/gpu/drm/xe/xe_pat.c:124:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:92: ERROR:SPACING: space prohibited before that close parenthesis ')'
#92: FILE: drivers/gpu/drm/xe/xe_pat.c:124:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:93: ERROR:SPACING: space prohibited after that open parenthesis '('
#93: FILE: drivers/gpu/drm/xe/xe_pat.c:125:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:93: ERROR:SPACING: space prohibited before that close parenthesis ')'
#93: FILE: drivers/gpu/drm/xe/xe_pat.c:125:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:94: ERROR:SPACING: space prohibited after that open parenthesis '('
#94: FILE: drivers/gpu/drm/xe/xe_pat.c:126:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:94: ERROR:SPACING: space prohibited before that close parenthesis ')'
#94: FILE: drivers/gpu/drm/xe/xe_pat.c:126:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:95: ERROR:SPACING: space prohibited after that open parenthesis '('
#95: FILE: drivers/gpu/drm/xe/xe_pat.c:127:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:95: ERROR:SPACING: space prohibited before that close parenthesis ')'
#95: FILE: drivers/gpu/drm/xe/xe_pat.c:127:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:96: ERROR:SPACING: space prohibited after that open parenthesis '('
#96: FILE: drivers/gpu/drm/xe/xe_pat.c:128:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:96: ERROR:SPACING: space prohibited before that close parenthesis ')'
#96: FILE: drivers/gpu/drm/xe/xe_pat.c:128:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:97: ERROR:SPACING: space prohibited after that open parenthesis '('
#97: FILE: drivers/gpu/drm/xe/xe_pat.c:129:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:97: ERROR:SPACING: space prohibited before that close parenthesis ')'
#97: FILE: drivers/gpu/drm/xe/xe_pat.c:129:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:98: ERROR:SPACING: space prohibited after that open parenthesis '('
#98: FILE: drivers/gpu/drm/xe/xe_pat.c:130:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

-:98: ERROR:SPACING: space prohibited before that close parenthesis ')'
#98: FILE: drivers/gpu/drm/xe/xe_pat.c:130:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

-:102: ERROR:SPACING: space prohibited after that open parenthesis '('
#102: FILE: drivers/gpu/drm/xe/xe_pat.c:134:
+#define XE2_PAT_ATS	XE2_PAT( 0, 0, 0, 0, 3, 3 )

-:102: ERROR:SPACING: space prohibited before that close parenthesis ')'
#102: FILE: drivers/gpu/drm/xe/xe_pat.c:134:
+#define XE2_PAT_ATS	XE2_PAT( 0, 0, 0, 0, 3, 3 )

total: 69 errors, 0 warnings, 0 checks, 116 lines checked
b169528ad drm/xe/xe2: Add one more bit to encode PAT to ppgtt entries
9a1904618 drm/xe/pat: Add debugfs node to dump PAT
67ea5ce68 drm/xe/gt: Dump PAT table when failing to initialize


