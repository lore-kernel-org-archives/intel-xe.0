Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC798CCFA04
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 00:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FB310E083;
	Wed,  5 Nov 2025 00:19:36 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ECB10E083;
 Wed,  5 Nov 2025 00:19:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_compressi?=
 =?utf-8?q?ble_surfaces_to_be_1-way_coherent?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wang, X" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 00:19:35 -0000
Message-ID: <176230197565.17530.8240279201743736516@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104191705.1433993-1-x.wang@intel.com>
In-Reply-To: <20251104191705.1433993-1-x.wang@intel.com>
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

Series: drm/xe: Allow compressible surfaces to be 1-way coherent
URL   : https://patchwork.freedesktop.org/series/157036/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 18bb27341dad4ba6a865d76eb42f608269eb4b05
Author: Xin Wang <x.wang@intel.com>
Date:   Tue Nov 4 19:17:05 2025 +0000

    drm/xe: Allow compressible surfaces to be 1-way coherent
    
    enable EN_CMP_1WCOH when initialising or restarting each GT.
    
    add PAT entry 16 describing the compressed+coherent mapping and
    expose helpers to query compression support.
    
    remove the legacy mutual-exclusion assumption between compression
    and ≥1-way coherency in the PAT macros.
    
    reject PAT indices that enable compression for userptr mappings
    or imported dma-bufs to avoid stale CCS state.
    
    Bspec: 71582, 59361, 59399
    
    Signed-off-by: Xin Wang <x.wang@intel.com>
+ /mt/dim checkpatch 957ab9ac657700dee50f42438ed79652dad939a0 drm-intel
18bb27341dad drm/xe: Allow compressible surfaces to be 1-way coherent
-:139: ERROR:SPACING: space prohibited after that open square bracket '['
#139: FILE: drivers/gpu/drm/xe/xe_pat.c:149:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:139: ERROR:SPACING: space prohibited after that open parenthesis '('
#139: FILE: drivers/gpu/drm/xe/xe_pat.c:149:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:139: ERROR:SPACING: space prohibited before that close parenthesis ')'
#139: FILE: drivers/gpu/drm/xe/xe_pat.c:149:
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),

-:140: ERROR:SPACING: space prohibited after that open square bracket '['
#140: FILE: drivers/gpu/drm/xe/xe_pat.c:150:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:140: ERROR:SPACING: space prohibited after that open parenthesis '('
#140: FILE: drivers/gpu/drm/xe/xe_pat.c:150:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:140: ERROR:SPACING: space prohibited before that close parenthesis ')'
#140: FILE: drivers/gpu/drm/xe/xe_pat.c:150:
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),

-:141: ERROR:SPACING: space prohibited after that open square bracket '['
#141: FILE: drivers/gpu/drm/xe/xe_pat.c:151:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:141: ERROR:SPACING: space prohibited after that open parenthesis '('
#141: FILE: drivers/gpu/drm/xe/xe_pat.c:151:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:141: ERROR:SPACING: space prohibited before that close parenthesis ')'
#141: FILE: drivers/gpu/drm/xe/xe_pat.c:151:
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),

-:142: ERROR:SPACING: space prohibited after that open square bracket '['
#142: FILE: drivers/gpu/drm/xe/xe_pat.c:152:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:142: ERROR:SPACING: space prohibited after that open parenthesis '('
#142: FILE: drivers/gpu/drm/xe/xe_pat.c:152:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:142: ERROR:SPACING: space prohibited before that close parenthesis ')'
#142: FILE: drivers/gpu/drm/xe/xe_pat.c:152:
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),

-:143: ERROR:SPACING: space prohibited after that open square bracket '['
#143: FILE: drivers/gpu/drm/xe/xe_pat.c:153:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:143: ERROR:SPACING: space prohibited after that open parenthesis '('
#143: FILE: drivers/gpu/drm/xe/xe_pat.c:153:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:143: ERROR:SPACING: space prohibited before that close parenthesis ')'
#143: FILE: drivers/gpu/drm/xe/xe_pat.c:153:
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),

-:144: ERROR:SPACING: space prohibited after that open square bracket '['
#144: FILE: drivers/gpu/drm/xe/xe_pat.c:154:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:144: ERROR:SPACING: space prohibited after that open parenthesis '('
#144: FILE: drivers/gpu/drm/xe/xe_pat.c:154:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:144: ERROR:SPACING: space prohibited before that close parenthesis ')'
#144: FILE: drivers/gpu/drm/xe/xe_pat.c:154:
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),

-:145: ERROR:SPACING: space prohibited after that open square bracket '['
#145: FILE: drivers/gpu/drm/xe/xe_pat.c:155:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:145: ERROR:SPACING: space prohibited after that open parenthesis '('
#145: FILE: drivers/gpu/drm/xe/xe_pat.c:155:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:145: ERROR:SPACING: space prohibited before that close parenthesis ')'
#145: FILE: drivers/gpu/drm/xe/xe_pat.c:155:
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),

-:146: ERROR:SPACING: space prohibited after that open square bracket '['
#146: FILE: drivers/gpu/drm/xe/xe_pat.c:156:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:146: ERROR:SPACING: space prohibited after that open parenthesis '('
#146: FILE: drivers/gpu/drm/xe/xe_pat.c:156:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:146: ERROR:SPACING: space prohibited before that close parenthesis ')'
#146: FILE: drivers/gpu/drm/xe/xe_pat.c:156:
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),

-:147: ERROR:SPACING: space prohibited after that open square bracket '['
#147: FILE: drivers/gpu/drm/xe/xe_pat.c:157:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:147: ERROR:SPACING: space prohibited after that open parenthesis '('
#147: FILE: drivers/gpu/drm/xe/xe_pat.c:157:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:147: ERROR:SPACING: space prohibited before that close parenthesis ')'
#147: FILE: drivers/gpu/drm/xe/xe_pat.c:157:
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),

-:148: ERROR:SPACING: space prohibited after that open square bracket '['
#148: FILE: drivers/gpu/drm/xe/xe_pat.c:158:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:148: ERROR:SPACING: space prohibited after that open parenthesis '('
#148: FILE: drivers/gpu/drm/xe/xe_pat.c:158:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:148: ERROR:SPACING: space prohibited before that close parenthesis ')'
#148: FILE: drivers/gpu/drm/xe/xe_pat.c:158:
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),

-:149: ERROR:SPACING: space prohibited after that open parenthesis '('
#149: FILE: drivers/gpu/drm/xe/xe_pat.c:159:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:149: ERROR:SPACING: space prohibited before that close parenthesis ')'
#149: FILE: drivers/gpu/drm/xe/xe_pat.c:159:
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),

-:150: ERROR:SPACING: space prohibited after that open parenthesis '('
#150: FILE: drivers/gpu/drm/xe/xe_pat.c:160:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:150: ERROR:SPACING: space prohibited before that close parenthesis ')'
#150: FILE: drivers/gpu/drm/xe/xe_pat.c:160:
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),

-:151: ERROR:SPACING: space prohibited after that open parenthesis '('
#151: FILE: drivers/gpu/drm/xe/xe_pat.c:161:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:151: ERROR:SPACING: space prohibited before that close parenthesis ')'
#151: FILE: drivers/gpu/drm/xe/xe_pat.c:161:
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),

-:152: ERROR:SPACING: space prohibited after that open parenthesis '('
#152: FILE: drivers/gpu/drm/xe/xe_pat.c:162:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:152: ERROR:SPACING: space prohibited before that close parenthesis ')'
#152: FILE: drivers/gpu/drm/xe/xe_pat.c:162:
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),

-:153: ERROR:SPACING: space prohibited after that open parenthesis '('
#153: FILE: drivers/gpu/drm/xe/xe_pat.c:163:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:153: ERROR:SPACING: space prohibited before that close parenthesis ')'
#153: FILE: drivers/gpu/drm/xe/xe_pat.c:163:
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),

-:154: ERROR:SPACING: space prohibited after that open parenthesis '('
#154: FILE: drivers/gpu/drm/xe/xe_pat.c:164:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:154: ERROR:SPACING: space prohibited before that close parenthesis ')'
#154: FILE: drivers/gpu/drm/xe/xe_pat.c:164:
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),

-:155: ERROR:SPACING: space prohibited after that open parenthesis '('
#155: FILE: drivers/gpu/drm/xe/xe_pat.c:165:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:155: ERROR:SPACING: space prohibited before that close parenthesis ')'
#155: FILE: drivers/gpu/drm/xe/xe_pat.c:165:
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),

-:157: ERROR:SPACING: space prohibited after that open parenthesis '('
#157: FILE: drivers/gpu/drm/xe/xe_pat.c:167:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:157: ERROR:SPACING: space prohibited before that close parenthesis ')'
#157: FILE: drivers/gpu/drm/xe/xe_pat.c:167:
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),

-:158: ERROR:SPACING: space prohibited after that open parenthesis '('
#158: FILE: drivers/gpu/drm/xe/xe_pat.c:168:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:158: ERROR:SPACING: space prohibited before that close parenthesis ')'
#158: FILE: drivers/gpu/drm/xe/xe_pat.c:168:
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),

-:159: ERROR:SPACING: space prohibited after that open parenthesis '('
#159: FILE: drivers/gpu/drm/xe/xe_pat.c:169:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:159: ERROR:SPACING: space prohibited before that close parenthesis ')'
#159: FILE: drivers/gpu/drm/xe/xe_pat.c:169:
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),

-:160: ERROR:SPACING: space prohibited after that open parenthesis '('
#160: FILE: drivers/gpu/drm/xe/xe_pat.c:170:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:160: ERROR:SPACING: space prohibited before that close parenthesis ')'
#160: FILE: drivers/gpu/drm/xe/xe_pat.c:170:
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),

-:161: ERROR:SPACING: space prohibited after that open parenthesis '('
#161: FILE: drivers/gpu/drm/xe/xe_pat.c:171:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:161: ERROR:SPACING: space prohibited before that close parenthesis ')'
#161: FILE: drivers/gpu/drm/xe/xe_pat.c:171:
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),

-:162: ERROR:SPACING: space prohibited after that open parenthesis '('
#162: FILE: drivers/gpu/drm/xe/xe_pat.c:172:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:162: ERROR:SPACING: space prohibited before that close parenthesis ')'
#162: FILE: drivers/gpu/drm/xe/xe_pat.c:172:
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),

-:163: ERROR:SPACING: space prohibited after that open parenthesis '('
#163: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:163: ERROR:SPACING: space prohibited before that close parenthesis ')'
#163: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),

-:164: ERROR:SPACING: space prohibited after that open parenthesis '('
#164: FILE: drivers/gpu/drm/xe/xe_pat.c:174:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:164: ERROR:SPACING: space prohibited before that close parenthesis ')'
#164: FILE: drivers/gpu/drm/xe/xe_pat.c:174:
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),

-:165: ERROR:SPACING: space prohibited after that open parenthesis '('
#165: FILE: drivers/gpu/drm/xe/xe_pat.c:175:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:165: ERROR:SPACING: space prohibited before that close parenthesis ')'
#165: FILE: drivers/gpu/drm/xe/xe_pat.c:175:
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),

-:166: ERROR:SPACING: space prohibited after that open parenthesis '('
#166: FILE: drivers/gpu/drm/xe/xe_pat.c:176:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:166: ERROR:SPACING: space prohibited before that close parenthesis ')'
#166: FILE: drivers/gpu/drm/xe/xe_pat.c:176:
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),

-:167: ERROR:SPACING: space prohibited after that open parenthesis '('
#167: FILE: drivers/gpu/drm/xe/xe_pat.c:177:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:167: ERROR:SPACING: space prohibited before that close parenthesis ')'
#167: FILE: drivers/gpu/drm/xe/xe_pat.c:177:
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),

-:168: ERROR:SPACING: space prohibited after that open parenthesis '('
#168: FILE: drivers/gpu/drm/xe/xe_pat.c:178:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

-:168: ERROR:SPACING: space prohibited before that close parenthesis ')'
#168: FILE: drivers/gpu/drm/xe/xe_pat.c:178:
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),

total: 68 errors, 0 warnings, 0 checks, 208 lines checked


