Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCFCEF5866
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6346F10E371;
	Sun,  8 Mar 2026 13:31:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69F110E371;
 Sun,  8 Mar 2026 13:31:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_support_for_vswing/preemp?=
 =?utf-8?q?hasis_override?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 08 Mar 2026 13:31:49 -0000
Message-ID: <177297670972.330866.7803474216778054179@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260308132446.3320848-1-michal.grzelak@intel.com>
In-Reply-To: <20260308132446.3320848-1-michal.grzelak@intel.com>
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

Series: support for vswing/preemphasis override
URL   : https://patchwork.freedesktop.org/series/162813/
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
commit a8f8d00edb4f3222259177cc0b422e526b0aa431
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Sun Mar 8 14:24:46 2026 +0100

    drm/i915/mtl: add V/P Override support for mtl+
    
    Add macros to reflect the layout of vswing/preemphasis override tables
    for mtl. Add separate macros for C10 & C20.
    
    Add separate intel_ddi_buf_trans_entry to be overridden for mtl onward.
    Set & return it when port requests to override default table. Use same
    setter for both C10 & C20 cases.
    
    Set the value by extracting the lowest byte from entry from the table.
    
    There are no changes to intel_ddi_dp_level() since selection of correct
    row of intel_ddi_buf_trans_entry is same as when no override request has
    been done.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch f705e865254996e9a099a22a9320e523e6debdcf drm-intel
bc1824f5c1f7 drm/i915/bios: search for Block 57 by default
6ddca3e03774 drm/i915/bios: cache V/P Override block
39d73b41836c drm/i915/bios: remove V/P Override warning
cc3b213c7af3 drm/i915/bios: print V/P Override port info
d0a12b9e3daa drm/i915/buf_trans: add intel_dp_above_hbr1() helper
b0398db83482 drm/i915/buf_trans: add intel_edp_above_hbr2() helper
619b322a52c3 drm/i915/lt: align xe3plpd with V/P Override layout
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
241c0a42c9fb drm/i915/buf_trans: switch from u8 to u32
2c831cdfa1cb drm/i915/xe3p: add V/P Override support for xe3p
-:101: WARNING:LINE_SPACING: Missing a blank line after declarations
#101: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1231:
+	size_t offset = idx * tbl_sz + row * row_sz;
+	return &tables[offset];

-:122: CHECK:SPACING: No space is necessary after a cast
#122: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1846:
+	entries = (union intel_ddi_buf_trans_entry *) buf_trans->entries;

-:156: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#156: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1878:
+		 /* FIXME need to check correct parsing & table index should
+		 * this ever trigger.

-:158: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#158: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1880:
+^I^I * ^I^I^I^I   XE3P_VS_PE_EDP,$

total: 0 errors, 3 warnings, 1 checks, 139 lines checked
396ec1c11c89 drm/i915/dg2: warn on V/P Override request on dg2
a8f8d00edb4f drm/i915/mtl: add V/P Override support for mtl+
-:99: CHECK:SPACING: No space is necessary after a cast
#99: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1864:
+	entries = (union intel_ddi_buf_trans_entry *) buf_trans->entries;

-:131: ERROR:SPACING: space required before the open brace '{'
#131: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1896:
+		} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)){

total: 1 errors, 0 warnings, 1 checks, 137 lines checked


