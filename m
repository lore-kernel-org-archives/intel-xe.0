Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B10CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC12112485;
	Fri, 29 May 2026 19:37:32 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126C6112481;
 Fri, 29 May 2026 19:37:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Pre-emphasis_Ove?=
 =?utf-8?q?rride?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 May 2026 19:37:32 -0000
Message-ID: <178008345207.23778.2284005023456836253@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260529192859.4172376-1-michal.grzelak@intel.com>
In-Reply-To: <20260529192859.4172376-1-michal.grzelak@intel.com>
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

Series: Vswing / Pre-emphasis Override
URL   : https://patchwork.freedesktop.org/series/167570/
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
commit 2312e9972dafa2761ea84b249678e4f0b6e95711
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Fri May 29 21:28:59 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch 3e2c8f106571c584ffbde0b25bcc8000052aad17 drm-intel
0e0e181d5e52 drm/i915/bios: search for VBT #57 by default
88fa30b9e1e7 drm/i915/bios: store VBT #57's metadata in intel_vbt_data
6af8a4db6b09 drm/i915/bios: structurize VS/PE-O metadata
82946fcca3c6 drm/i915/bios: print VS/PE-O port info
9223887f9dc6 drm/i915/bios: de/allocate VS/PE-O buffer for each port
61d788843d8c drm/i915/buf_trans: abstract VS/PE-O access and index computation
-:88: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#88: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:297:
+	const struct intel_ddi_buf_trans *(*get_phy_vspeo)(const struct intel_bios_encoder_data *devdata,

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
7c24389525fd drm/i915: override LT's VS/PE when requested
-:55: CHECK:SPACING: No space is necessary after a cast
#55: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3868:
+	struct intel_ddi_buf_trans *vspeo = (void *) devdata->vspeo;

-:56: CHECK:SPACING: No space is necessary after a cast
#56: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3869:
+	union intel_ddi_buf_trans_entry *entries = (void *) devdata->vspeo->entries;

-:73: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#73: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3886:
+		u32 pre_cursor = tables[offset+1];
 		                              ^

-:74: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#74: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3887:
+		u32 post_cursor = tables[offset+2];
 		                               ^

total: 0 errors, 0 warnings, 4 checks, 121 lines checked
f2547341dde8 drm/i915: override Snps's VS/PE when requested
-:60: CHECK:SPACING: No space is necessary after a cast
#60: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3907:
+	struct intel_ddi_buf_trans *vspeo = (void *) devdata->vspeo;

-:61: CHECK:SPACING: No space is necessary after a cast
#61: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3908:
+	union intel_ddi_buf_trans_entry *entries = (void *) vspeo->entries;

-:75: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#75: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3922:
+		u32 pre_cursor = tables[offset+1];
 		                              ^

-:76: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#76: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3923:
+		u32 post_cursor = tables[offset+2];
 		                               ^

total: 0 errors, 0 warnings, 4 checks, 129 lines checked
e676dd2e6bb9 drm/i915: override Combo's VS/PE when requested
-:53: CHECK:SPACING: No space is necessary after a cast
#53: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3941:
+	struct intel_ddi_buf_trans *vspeo = (void *) devdata->vspeo;

-:54: CHECK:SPACING: No space is necessary after a cast
#54: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3942:
+	union intel_ddi_buf_trans_entry *entries = (void *) vspeo->entries;

-:69: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#69: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3957:
+	for (level = 0; level < num_rows; level++) {
+

-:71: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#71: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3959:
+		u32 dw7_n_scalar = tables[offset+1];
 		                                ^

-:72: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#72: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3960:
+		u32 dw4_cursor_coeff = tables[offset+2];
 		                                    ^

-:73: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#73: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3961:
+		u32 dw4_post_cursor_2 = tables[offset+3];
 		                                     ^

-:74: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#74: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3962:
+		u32 dw4_post_cursor_1 = tables[offset+4];
 		                                     ^

-:166: CHECK:BRACES: braces {} should be used on all arms of this statement
#166: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1928:
+		if (display->platform.jasperlake) {
[...]
+			encoder->get_phy_vspeo = intel_bios_encoder_get_combo_vspeo;
[...]
+			encoder->get_phy_vspeo_index = ehl_get_combo_vspeo_index;
[...]
+		} else if (intel_encoder_is_combo(encoder))
[...]

total: 0 errors, 0 warnings, 8 checks, 136 lines checked
2312e9972daf drm/i915/bios: remove VS/PE-O warning


