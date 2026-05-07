Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2FECD342C
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75F010EF42;
	Thu,  7 May 2026 01:47:45 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011BA10EF42;
 Thu,  7 May 2026 01:47:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing/Preemphasis_Overri?=
 =?utf-8?q?de_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 01:47:43 -0000
Message-ID: <177811846399.45592.10882969447359530880@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507013137.527510-1-michal.grzelak@intel.com>
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
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

Series: Vswing/Preemphasis Override (rev2)
URL   : https://patchwork.freedesktop.org/series/164959/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 754b36fba08360f4e560f247296fadd43983f5ba
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Thu May 7 03:31:37 2026 +0200

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
+ /mt/dim checkpatch ad7a1f718b8cb631948c94f74dd48cd2867d99fb drm-intel
dfdbe27e6eda drm/i915/buf_trans: align xe3plpd with VS/PE-O layout
264e61792a85 drm/i915/bios: search for VBT #57 by default
7b05824bfd44 drm/i915/bios: log unsupported VS/PE-O parsing
0a573a4bcc5e drm/i915/bios: store VBT #57's metadata in intel_vbt_data
a2807548a44d drm/i915/bios: de/allocate VS/PE-O buffers' matrix
86f2ce7e07bd drm/i915/bios: structurize VS/PE-O metadata
02457c971d27 drm/i915/bios: add buf_trans for each bios_encoder
1e2dc720cb1b drm/i915/bios: de/allocate buf_trans for each port
927009044644 drm/i915/bios: check VS/PE-O in helper func
9e8a70e7bd95 drm/i915/bios: print VS/PE-O port info
98dc0741bfa3 drm/i915/bios: remove VS/PE-O warning
a26730cc80a1 drm/i915/ddi: expose VS/PE-O buffers to intel_encoder
ef5b29c07cc6 drm/i915/buf_trans: override VS/PE-O when requested
ba3f981f079a drm/i915/buf_trans: abstract VS/PE-O index computation
0db38eac01ba drm/i915/bios: parse LT's VS/PE-O tables
d52b40ba51e0 drm/i915/bios: shrink all LT's VS/PE tables
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
255c87b259e1 drm/i915/buf_trans: compute LT's VS/PE-O index
-:79: CHECK:SPACING: No space is necessary after a cast
#79: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1898:
+	buf_trans = (void *) encoder->vspeo;

total: 0 errors, 0 warnings, 1 checks, 57 lines checked
67c5f3fcaecc drm/i915/buf_trans: enumerate LT's VS/PE-O indices
19f54e5c7cc7 drm/i915/bios: parse Snps's VS/PE-O tables
-:72: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#72: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2261:
+	if (HAS_LT_PHY(display)) {
[...]
-	else
[...]
+		parse_vswing_preemph_snps(bufs_mtrx, block);
[...]

-:88: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#88: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2725:
+	if (HAS_LT_PHY(display)) {
[...]
+	} else if (DISPLAY_VER(display) >= 14) {
[...]

total: 0 errors, 2 warnings, 0 checks, 69 lines checked
1b1ac83753e6 drm/i915/bios: shrink all Snps's VS/PE tables
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
ad6231f2a2ce drm/i915/buf_trans: compute C20's VS/PE-O index
32b243cec191 drm/i915/buf_trans: enumerate C20's VS/PE-O indices
8ef96a837d64 drm/i915/buf_trans: compute C10's VS/PE-O index
f806eb23fd46 drm/i915/buf_trans: enumerate C10's VS/PE-O indices
c0a5fdc7cf1c drm/i915/bios: parse EHL's VS/PE-O tables
aad3d2d93897 drm/i915/bios: shrink all ICL's VS/PE tables
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
340f371e0e6d drm/i915/buf_trans: compute EHL's VS/PE-O index
52e70a3e3dbf drm/i915/buf_trans: enumerate EHL's VS/PE-O indices
b4217a24335a drm/i915/bios: parse JSL's VS/PE-O tables
556ed51417d5 drm/i915/buf_trans: compute JSL's VS/PE-O index
754b36fba083 drm/i915/buf_trans: enumerate JSL's VS/PE-O indices


