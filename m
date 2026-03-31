Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD1D10F9303
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 20:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E0910EB75;
	Tue, 31 Mar 2026 20:52:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE09310EB75;
 Tue, 31 Mar 2026 20:52:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VS/PE_Override_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 31 Mar 2026 20:52:40 -0000
Message-ID: <177499036068.419871.11315193969285007026@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331183332.1773886-1-michal.grzelak@intel.com>
In-Reply-To: <20260331183332.1773886-1-michal.grzelak@intel.com>
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

Series: VS/PE Override support
URL   : https://patchwork.freedesktop.org/series/164195/
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
commit 7c6e91cdbf73dd708206ef6c3f94d32014f0b1e7
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Tue Mar 31 20:33:32 2026 +0200

    drm/i915/bios: remove VS/PE Override warning
    
    There is not much use of drm_WARN() from print_ddi_port() since
    searching for VBT #57 is switched on by default. Remove it and
    child_device from print_ddi_port() since drm_WARN() was the only user of
    it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch 3ad1bb41eb2b0a6f40601c2b69ebf4b8a2f09e69 drm-intel
0b110b591562 drm/i915/lt: align xe3plpd with VS/PE Override layout
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
46e3f981ef0e drm/i915/buf_trans: switch from u8 to u32
e3bae6adba7a drm/i915/buf_trans: describe VS/PE Override layout
-:30: ERROR:CODE_INDENT: code indent should use tabs where possible
#30: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:78:
+        XE3P_VS_PE_UNSET = -1,$

-:30: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#30: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:78:
+        XE3P_VS_PE_UNSET = -1,$

-:32: ERROR:CODE_INDENT: code indent should use tabs where possible
#32: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:80:
+        XE3P_VS_PE_EDP = 3,$

-:32: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#32: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:80:
+        XE3P_VS_PE_EDP = 3,$

-:33: ERROR:CODE_INDENT: code indent should use tabs where possible
#33: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:81:
+        XE3P_VS_PE_DP14 = 4,$

-:33: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#33: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:81:
+        XE3P_VS_PE_DP14 = 4,$

-:34: ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:82:
+        XE3P_VS_PE_DP21 = 5$

-:34: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:82:
+        XE3P_VS_PE_DP21 = 5$

-:38: ERROR:CODE_INDENT: code indent should use tabs where possible
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:86:
+        MTL_C10_VS_PE_UNSET = -1,$

-:38: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:86:
+        MTL_C10_VS_PE_UNSET = -1,$

-:39: ERROR:CODE_INDENT: code indent should use tabs where possible
#39: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:87:
+        MTL_C10_VS_PE_DP14_RBR_HBR = 0,$

-:39: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#39: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:87:
+        MTL_C10_VS_PE_DP14_RBR_HBR = 0,$

-:40: ERROR:CODE_INDENT: code indent should use tabs where possible
#40: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:88:
+        MTL_C10_VS_PE_DP14_HBR2_HBR3 = 1,$

-:40: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#40: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:88:
+        MTL_C10_VS_PE_DP14_HBR2_HBR3 = 1,$

-:41: ERROR:CODE_INDENT: code indent should use tabs where possible
#41: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:89:
+        MTL_C10_VS_PE_EDP_NON_HBR3 = 2,$

-:41: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#41: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:89:
+        MTL_C10_VS_PE_EDP_NON_HBR3 = 2,$

-:42: ERROR:CODE_INDENT: code indent should use tabs where possible
#42: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:90:
+        MTL_C10_VS_PE_EDP_HBR3 = 3,$

-:42: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#42: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:90:
+        MTL_C10_VS_PE_EDP_HBR3 = 3,$

-:44: ERROR:CODE_INDENT: code indent should use tabs where possible
#44: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:92:
+        MTL_C20_VS_PE_DP14 = 4,$

-:44: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#44: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:92:
+        MTL_C20_VS_PE_DP14 = 4,$

-:45: ERROR:CODE_INDENT: code indent should use tabs where possible
#45: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:93:
+        MTL_C20_VS_PE_DP20 = 5$

-:45: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#45: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:93:
+        MTL_C20_VS_PE_DP20 = 5$

-:49: ERROR:CODE_INDENT: code indent should use tabs where possible
#49: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:97:
+        ICL_VS_PE_UNSET = -1,$

-:49: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#49: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:97:
+        ICL_VS_PE_UNSET = -1,$

-:50: ERROR:CODE_INDENT: code indent should use tabs where possible
#50: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:98:
+        ICL_VS_PE_DEFAULT = 0$

-:50: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#50: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:98:
+        ICL_VS_PE_DEFAULT = 0$

-:54: ERROR:CODE_INDENT: code indent should use tabs where possible
#54: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:102:
+        enum lt_vswing_preemph_index lt;$

-:54: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#54: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:102:
+        enum lt_vswing_preemph_index lt;$

-:55: ERROR:CODE_INDENT: code indent should use tabs where possible
#55: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:103:
+        enum snps_vswing_preemph_index snps;$

-:55: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#55: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:103:
+        enum snps_vswing_preemph_index snps;$

-:56: ERROR:CODE_INDENT: code indent should use tabs where possible
#56: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:104:
+        enum icl_vswing_preemph_index icl;$

-:56: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#56: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:104:
+        enum icl_vswing_preemph_index icl;$

-:60: ERROR:CODE_INDENT: code indent should use tabs where possible
#60: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:108:
+        struct intel_ddi_buf_trans *buf_trans;$

-:60: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#60: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:108:
+        struct intel_ddi_buf_trans *buf_trans;$

-:61: ERROR:CODE_INDENT: code indent should use tabs where possible
#61: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:109:
+        union ddi_vswing_preemph_index index;$

-:61: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#61: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h:109:
+        union ddi_vswing_preemph_index index;$

total: 18 errors, 18 warnings, 0 checks, 41 lines checked
7ed62266408e drm/i915/bios: prepare for parsing VBT #57
-:58: WARNING:ALLOC_WITH_MULTIPLY: Prefer kzalloc_objs over kzalloc with multiply
#58: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2205:
+	bufs_table = kzalloc(block->num_tables * sizeof(*bufs_table), GFP_KERNEL);

-:61: WARNING:ALLOC_WITH_MULTIPLY: Prefer kzalloc_objs over kzalloc with multiply
#61: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2208:
+		bufs_table[idx] = kzalloc(num_rows * sizeof(**bufs_table), GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 89 lines checked
428d1c55339a drm/i915/bios: parse LT's VS/PE Override Block #57
22f1846e1307 drm/i915/bios: parse Snps's VS/PE Override Block #57
916a01a248cd drm/i915/bios: parse EHL's VS/PE Override Block #57
-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2193:
+parse_vswing_preemph_icl(union intel_ddi_buf_trans_entry **bufs_table,
+			     const struct bdb_vswing_preemph *block)

total: 0 errors, 0 warnings, 1 checks, 43 lines checked
bec2eacf64df drm/i915/bios: support VS/PE Override per each ddi port
-:48: CHECK:SPACING: No space is necessary after a cast
#48: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2767:
+	devdata->vswing_preemph.index = (union ddi_vswing_preemph_index) -1;

-:53: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#53: FILE: drivers/gpu/drm/i915/display/intel_bios.c:2772:
+	buf_trans = kzalloc(sizeof(*buf_trans), GFP_KERNEL);

-:74: CHECK:SPACING: No space is necessary after a cast
#74: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3178:
+			(union ddi_vswing_preemph_index) -1;

-:84: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#84: FILE: drivers/gpu/drm/i915/display/intel_bios.c:3514:
+		if (devdata->vswing_preemph.buf_trans)
+			kfree(devdata->vswing_preemph.buf_trans);

total: 0 errors, 2 warnings, 2 checks, 72 lines checked
49c21d7e12ca drm/i915/bios: print VS/PE Override port info
24fab0471e03 drm/i915/ddi: cache VS/PE struct pointer into intel_encoder
9db9b055c14d drm/i915/buf_trans: override encoder->get_buf_trans when asked
-:61: CHECK:SPACING: No space is necessary after a cast
#61: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1797:
+	index = (union ddi_vswing_preemph_index) 0;

-:68: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1804:
+vswing_preemph_cast_index(struct intel_display *display,
+			   union ddi_vswing_preemph_index index)

-:90: CHECK:SPACING: No space is necessary after a cast
#90: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1826:
+		vswing_preemph = (void *) encoder->vswing_preemph;

-:95: CHECK:SPACING: No space is necessary after a cast
#95: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1831:
+	buf_trans = (void *) encoder->vswing_preemph->buf_trans;

total: 0 errors, 0 warnings, 4 checks, 71 lines checked
e7535085d2de drm/i915/buf_trans: compute LT's VS/PE Override index
-:27: ERROR:CODE_INDENT: code indent should use tabs where possible
#27: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1792:
+        if (intel_crtc_has_dp_encoder(crtc_state) && intel_dp_is_uhbr(crtc_state)) {$

-:27: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#27: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1792:
+        if (intel_crtc_has_dp_encoder(crtc_state) && intel_dp_is_uhbr(crtc_state)) {$

-:28: ERROR:CODE_INDENT: code indent should use tabs where possible
#28: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1793:
+                return XE3P_VS_PE_DP21;$

-:28: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#28: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1793:
+                return XE3P_VS_PE_DP21;$

-:29: ERROR:CODE_INDENT: code indent should use tabs where possible
#29: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1794:
+        } else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {$

-:29: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#29: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1794:
+        } else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {$

-:30: ERROR:CODE_INDENT: code indent should use tabs where possible
#30: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1795:
+                 /* FIXME need to check correct parsing & table index should$

-:31: ERROR:CODE_INDENT: code indent should use tabs where possible
#31: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1796:
+                 * this ever trigger.$

-:31: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#31: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1796:
+                 /* FIXME need to check correct parsing & table index should
+                 * this ever trigger.

-:32: ERROR:CODE_INDENT: code indent should use tabs where possible
#32: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1797:
+                 */$

-:33: ERROR:CODE_INDENT: code indent should use tabs where possible
#33: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1798:
+                drm_WARN(to_intel_display(crtc_state)->drm, 1,$

-:33: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#33: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1798:
+                drm_WARN(to_intel_display(crtc_state)->drm, 1,$

-:34: ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1799:
+                         "Ask to override EDP's vswing/preemph tables\n");$

-:34: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1799:
+                         "Ask to override EDP's vswing/preemph tables\n");$

-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1800:
+                return XE3P_VS_PE_EDP;$

-:35: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#35: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1800:
+                return XE3P_VS_PE_EDP;$

-:36: ERROR:CODE_INDENT: code indent should use tabs where possible
#36: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1801:
+        } else {$

-:36: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#36: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1801:
+        } else {$

-:37: ERROR:CODE_INDENT: code indent should use tabs where possible
#37: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1802:
+                return XE3P_VS_PE_DP14;$

-:37: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#37: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1802:
+                return XE3P_VS_PE_DP14;$

-:38: ERROR:CODE_INDENT: code indent should use tabs where possible
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1803:
+        }$

-:38: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1803:
+        }$

-:40: ERROR:CODE_INDENT: code indent should use tabs where possible
#40: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1805:
+        return (enum lt_vswing_preemph_index) 0;$

-:40: CHECK:SPACING: No space is necessary after a cast
#40: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1805:
+        return (enum lt_vswing_preemph_index) 0;

-:40: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#40: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1805:
+        return (enum lt_vswing_preemph_index) 0;$

-:56: CHECK:SPACING: No space is necessary after a cast
#56: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1819:
+		index = (union ddi_vswing_preemph_index) 0;

-:65: WARNING:BRACES: braces {} are not necessary for single statement blocks
#65: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1829:
+	if (HAS_LT_PHY(display)) {
+		return index.lt;
+	}

total: 13 errors, 12 warnings, 2 checks, 49 lines checked
356efcbabbd8 drm/i915/buf_trans: compute Snps's VS/PE Override index
-:26: ERROR:CODE_INDENT: code indent should use tabs where possible
#26: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1792:
+        if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP)) {$

-:26: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#26: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1792:
+        if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP)) {$

-:28: ERROR:CODE_INDENT: code indent should use tabs where possible
#28: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1794:
+                        return MTL_C10_VS_PE_DP14_HBR2_HBR3;$

-:28: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#28: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1794:
+                        return MTL_C10_VS_PE_DP14_HBR2_HBR3;$

-:29: ERROR:CODE_INDENT: code indent should use tabs where possible
#29: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1795:
+                else$

-:29: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#29: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1795:
+                else$

-:30: ERROR:CODE_INDENT: code indent should use tabs where possible
#30: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1796:
+                        return MTL_C10_VS_PE_DP14_RBR_HBR;$

-:30: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#30: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1796:
+                        return MTL_C10_VS_PE_DP14_RBR_HBR;$

-:31: ERROR:CODE_INDENT: code indent should use tabs where possible
#31: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1797:
+        } else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)){$

-:31: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#31: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1797:
+        } else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)){$

-:31: ERROR:SPACING: space required before the open brace '{'
#31: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1797:
+        } else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)){

-:33: ERROR:CODE_INDENT: code indent should use tabs where possible
#33: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1799:
+                        return MTL_C10_VS_PE_EDP_HBR3;$

-:33: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#33: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1799:
+                        return MTL_C10_VS_PE_EDP_HBR3;$

-:34: ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1800:
+                else$

-:34: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1800:
+                else$

-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1801:
+                        return MTL_C10_VS_PE_EDP_NON_HBR3;$

-:35: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#35: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1801:
+                        return MTL_C10_VS_PE_EDP_NON_HBR3;$

-:36: ERROR:CODE_INDENT: code indent should use tabs where possible
#36: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1802:
+        }$

-:36: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#36: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1802:
+        }$

-:38: ERROR:CODE_INDENT: code indent should use tabs where possible
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1804:
+        return (enum snps_vswing_preemph_index) 0;$

-:38: CHECK:SPACING: No space is necessary after a cast
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1804:
+        return (enum snps_vswing_preemph_index) 0;

-:38: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1804:
+        return (enum snps_vswing_preemph_index) 0;$

-:44: ERROR:CODE_INDENT: code indent should use tabs where possible
#44: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1810:
+        if (intel_crtc_has_dp_encoder(crtc_state) && intel_dp_is_uhbr(crtc_state)) {$

-:44: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#44: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1810:
+        if (intel_crtc_has_dp_encoder(crtc_state) && intel_dp_is_uhbr(crtc_state)) {$

-:44: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#44: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1810:
+        if (intel_crtc_has_dp_encoder(crtc_state) && intel_dp_is_uhbr(crtc_state)) {
[...]
+        } else if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
[...]

-:45: ERROR:CODE_INDENT: code indent should use tabs where possible
#45: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1811:
+                return MTL_C20_VS_PE_DP20;$

-:45: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#45: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1811:
+                return MTL_C20_VS_PE_DP20;$

-:46: ERROR:CODE_INDENT: code indent should use tabs where possible
#46: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1812:
+        } else if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {$

-:46: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#46: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1812:
+        } else if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {$

-:47: ERROR:CODE_INDENT: code indent should use tabs where possible
#47: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1813:
+                return MTL_C20_VS_PE_DP14;$

-:47: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#47: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1813:
+                return MTL_C20_VS_PE_DP14;$

-:48: ERROR:CODE_INDENT: code indent should use tabs where possible
#48: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1814:
+        }$

-:48: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#48: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1814:
+        }$

-:50: ERROR:CODE_INDENT: code indent should use tabs where possible
#50: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1816:
+        return (enum snps_vswing_preemph_index) 0;$

-:50: CHECK:SPACING: No space is necessary after a cast
#50: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1816:
+        return (enum snps_vswing_preemph_index) 0;

-:50: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#50: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1816:
+        return (enum snps_vswing_preemph_index) 0;$

total: 17 errors, 17 warnings, 2 checks, 55 lines checked
37f17d9475bb drm/i915/buf_trans: compute EHL's VS/PE Override index
-:25: ERROR:CODE_INDENT: code indent should use tabs where possible
#25: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1792:
+        return (enum icl_vswing_preemph_index) 0;$

-:25: CHECK:SPACING: No space is necessary after a cast
#25: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1792:
+        return (enum icl_vswing_preemph_index) 0;

-:25: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#25: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1792:
+        return (enum icl_vswing_preemph_index) 0;$

total: 1 errors, 1 warnings, 1 checks, 28 lines checked
ca5894469ad2 drm/i915/bios: search for VBT #57 by default
7c6e91cdbf73 drm/i915/bios: remove VS/PE Override warning


