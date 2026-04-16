Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE948F433D6
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 02:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C12710E07A;
	Thu, 16 Apr 2026 02:04:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61BD10E100;
 Thu, 16 Apr 2026 02:04:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing/Preemphasis_Overri?=
 =?utf-8?q?de?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 02:04:30 -0000
Message-ID: <177630507099.466823.5979660967614454564@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415234639.3577774-1-michal.grzelak@intel.com>
In-Reply-To: <20260415234639.3577774-1-michal.grzelak@intel.com>
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

Series: Vswing/Preemphasis Override
URL   : https://patchwork.freedesktop.org/series/164959/
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
commit 272cccd759cf8b4147c513fae2c37246324be780
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Thu Apr 16 01:46:39 2026 +0200

    drm/i915/buf_trans: enumerate JSL's VS/PE-O indices
    
    Encapsulate JSL's VS/PE-O's indices in enum jsl_vspeo_index.
    
    Use index of -1 as an indication of error case. Refer to it as JSL_ERR.
    
    1st VS/PE-O's table is used for external DP. Use it also if eDP does not
    use low vswing. Use it as well when eDP uses low vswing but supports
    HBR3. Refer to it as JSL_COMBO_DP_DEF.
    
    2nd table is used for eDP using low vswing and supporting HBR2. Refer to
    it as JSL_COMBO_EDP_HBR2.
    
    3rd table is used for eDP using low vswing and supporting modes lower
    than HBR2. Refer to it as JSL_COMBO_EDP_HBR.
    
    Indices for other tables have not yet been observed to be used as of
    now.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch 137513b61b4f187957d0c0f44c63c8549893f970 drm-intel
d91c2c5f05b4 drm/i915/buf_trans: align xe3plpd with VS/PE-O layout
-:37: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#37: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1121:
+	{ .lt = { 21, 0, 0 , 1, 0 } },
 	                   ^

-:38: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1122:
+	{ .lt = { 24, 0, 3 , 1, 1 } },
 	                   ^

-:39: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#39: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1123:
+	{ .lt = { 28, 0, 7 , 1, 2 } },
 	                   ^

-:41: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#41: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1125:
+	{ .lt = { 27, 0, 0 , 1, 1 } },
 	                   ^

-:42: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#42: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1126:
+	{ .lt = { 31, 0, 4 , 1, 2 } },
 	                   ^

-:43: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#43: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1127:
+	{ .lt = { 39, 0, 9 , 0, 3 } },
 	                   ^

-:44: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#44: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1128:
+	{ .lt = { 35, 0, 0 , 1, 2 } },
 	                   ^

-:45: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#45: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1129:
+	{ .lt = { 41, 0, 7 , 0, 3 } },
 	                   ^

-:46: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#46: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1130:
+	{ .lt = { 48, 0, 0 , 0, 3 } },
 	                   ^

-:67: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#67: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1135:
+	{ .lt = { 48, 0, 0 , 0, 0 } },
 	                   ^

-:68: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#68: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1136:
+	{ .lt = { 43, 0, 5 , 0, 0 } },
 	                   ^

-:69: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#69: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1137:
+	{ .lt = { 40, 0, 8 , 0, 0 } },
 	                   ^

-:72: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#72: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1140:
+	{ .lt = { 46, 2, 0 , 0, 0 } },
 	                   ^

-:73: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#73: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1141:
+	{ .lt = { 42, 2, 4 , 0, 0 } },
 	                   ^

-:74: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#74: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1142:
+	{ .lt = { 38, 2, 8 , 0, 0 } },
 	                   ^

-:77: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#77: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1145:
+	{ .lt = { 44, 4, 0 , 0, 0 } },
 	                   ^

-:78: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#78: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1146:
+	{ .lt = { 40, 4, 4 , 0, 0 } },
 	                   ^

-:79: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#79: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1147:
+	{ .lt = { 37, 4, 7 , 0, 0 } },
 	                   ^

-:81: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#81: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1149:
+	{ .lt = { 40, 8, 0 , 0, 0 } },
 	                   ^

-:82: ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#82: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1150:
+	{ .lt = { 26, 2, 2 , 1, 0 } },
 	                   ^

total: 20 errors, 0 warnings, 0 checks, 100 lines checked
fa4c711440f6 drm/i915/bios: search for VBT #57 by default
a555c939abcb drm/i915/bios: log unsupported VS/PE-O parsing
7680f3350ac0 drm/i915/bios: store VBT #57's metadata in intel_vbt_data
ff912907db65 drm/i915/bios: de/allocate VS/PE-O buffers' matrix
-:71: WARNING:ALLOC_WITH_MULTIPLY: Prefer kzalloc_objs over kzalloc with multiply
#71: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2207:
+	bufs_mtrx = kzalloc(block->num_tables * sizeof(*bufs_mtrx), GFP_KERNEL);

-:74: WARNING:ALLOC_WITH_MULTIPLY: Prefer kzalloc_objs over kzalloc with multiply
#74: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2210:
+		bufs_mtrx[idx] = kzalloc(num_rows * sizeof(**bufs_mtrx), GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 62 lines checked
bb21331ba674 drm/i915/bios: structurize VS/PE-O metadata
a5e0e5044aa6 drm/i915/bios: add buf_trans for each bios_encoder
3d831d97824c drm/i915/bios: de/allocate buf_trans for each port
-:33: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#33: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2669:
+	buf_trans = kzalloc(sizeof(*buf_trans), GFP_KERNEL);

-:44: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#44: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3411:
+		if (devdata->buf_trans)
+			kfree(devdata->buf_trans);

total: 0 errors, 2 warnings, 0 checks, 25 lines checked
754acb54ce1a drm/i915/bios: check VS/PE-O in helper func
bf0980c3c970 drm/i915/bios: print VS/PE-O port info
daf034870873 drm/i915/bios: remove VS/PE-O warning
6dd520685a27 drm/i915/ddi: expose VS/PE-O buffers to intel_encoder
39cd127f07c1 drm/i915/ddi: add wrapper for calling ->get_buf_trans() hook
1d9076df97d0 drm/i915/buf_trans: override VS/PE-O when requested
46fe32d9ea1d drm/i915/buf_trans: abstract VS/PE-O index computation
7773d0434197 drm/i915/bios: parse LT's VS/PE-O tables
-:64: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#64: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2237:
+	if (HAS_LT_PHY(display)) {
[...]
+	} else {
[...]

-:84: WARNING:BRACES: braces {} are not necessary for single statement blocks
#84: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2699:
+	if (HAS_LT_PHY(display)) {
+		parseable = true;
+	}

total: 0 errors, 2 warnings, 0 checks, 75 lines checked
0ff78fa048f2 drm/i915/bios: shrink all LT's VS/PE tables
-:31: CHECK:SPACING: No space is necessary after a cast
#31: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2205:
+			entry->lt.main_cursor = (u8) vals[0];

-:32: CHECK:SPACING: No space is necessary after a cast
#32: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2206:
+			entry->lt.pre_cursor = (u8) vals[1];

-:33: CHECK:SPACING: No space is necessary after a cast
#33: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2207:
+			entry->lt.post_cursor = (u8) vals[2];

total: 0 errors, 0 warnings, 3 checks, 28 lines checked
3a7b16aca5bb drm/i915/buf_trans: compute LT's VS/PE-O index
-:52: WARNING:BRACES: braces {} are not necessary for single statement blocks
#52: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1812:
+	if (HAS_LT_PHY(display)) {
+		return lt_compute_index(crtc_state);
+	}

-:69: CHECK:SPACING: No space is necessary after a cast
#69: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1898:
+	buf_trans = (void *) encoder->vspeo;

total: 0 errors, 1 warnings, 1 checks, 58 lines checked
87397bee75de drm/i915/buf_trans: enumerate LT's VS/PE-O indices
a26233d554a1 drm/i915/bios: parse Snps's VS/PE-O tables
962c6915d857 drm/i915/bios: shrink all Snps's VS/PE tables
-:31: CHECK:SPACING: No space is necessary after a cast
#31: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2205:
+			entry->snps.vswing = (u8) vals[0];

-:32: CHECK:SPACING: No space is necessary after a cast
#32: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2206:
+			entry->snps.pre_cursor = (u8) vals[1];

-:33: CHECK:SPACING: No space is necessary after a cast
#33: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2207:
+			entry->snps.post_cursor = (u8) vals[2];

total: 0 errors, 0 warnings, 3 checks, 24 lines checked
2f7374aff868 drm/i915/buf_trans: compute C20's VS/PE-O index
608fba703873 drm/i915/buf_trans: enumerate C20's VS/PE-O indices
55341b2939b3 drm/i915/buf_trans: compute C10's VS/PE-O index
905df3f193b5 drm/i915/buf_trans: enumerate C10's VS/PE-O indices
8e0ddbbbf6d3 drm/i915/bios: parse EHL's VS/PE-O tables
-:66: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#66: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2292:
+		if (display->platform.elkhartlake) {
[...]
+		} else {
[...]

-:79: WARNING:BRACES: braces {} are not necessary for single statement blocks
#79: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2762:
+		if (display->platform.elkhartlake) {
+			parseable = true;
+		}

total: 0 errors, 2 warnings, 0 checks, 70 lines checked
805038edff42 drm/i915/bios: shrink all ICL's VS/PE tables
-:32: CHECK:SPACING: No space is necessary after a cast
#32: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2205:
+			entry->icl.dw2_swing_sel = (u8) vals[0];

-:33: CHECK:SPACING: No space is necessary after a cast
#33: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2206:
+			entry->icl.dw7_n_scalar = (u8) vals[1];

-:34: CHECK:SPACING: No space is necessary after a cast
#34: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2207:
+			entry->icl.dw4_cursor_coeff = (u8) vals[2];

-:35: CHECK:SPACING: No space is necessary after a cast
#35: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2208:
+			entry->icl.dw4_post_cursor_2 = (u8) vals[3];

-:36: CHECK:SPACING: No space is necessary after a cast
#36: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2209:
+			entry->icl.dw4_post_cursor_1 = (u8) vals[4];

total: 0 errors, 0 warnings, 5 checks, 32 lines checked
649777a4ac3d drm/i915/buf_trans: compute EHL's VS/PE-O index
-:74: WARNING:BRACES: braces {} are not necessary for single statement blocks
#74: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1888:
+		if (display->platform.elkhartlake) {
+			return ehl_compute_index(encoder, crtc_state);
+		}

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
84c5098840d7 drm/i915/buf_trans: enumerate EHL's VS/PE-O indices
45672d9a9c08 drm/i915/bios: parse JSL's VS/PE-O tables
e5c4a564f550 drm/i915/buf_trans: compute JSL's VS/PE-O index
272cccd759cf drm/i915/buf_trans: enumerate JSL's VS/PE-O indices


