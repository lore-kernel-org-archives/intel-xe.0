Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E70CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD53110E530;
	Tue, 14 Oct 2025 03:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhdE7oKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C268B10E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPZjnMI2Mk0ytpKs7Kyy9FuHfpmYqb+MsvA4pz8WpUE=;
 b=hhdE7oKvSZ9zz+pYUP4p9dIxpoxKS23bRnhCh01l2RFi/j6EQrWLzzTJ
 xRkaGA37VsFQ8UybtlUTLoopjVDLYP0jGRN2sdGjsd/Gd3ZvFeMVMKFTm
 sJf1om8sSfIf/ii4QaLx7t1JtgyfNkO+Xw1l4Wkff7LokTLH2FDva8cfe
 WH1WIzopXbfpdF9Dhnh++TOPPfn/1+SA751JNiajANZ27DC6LH1Yl02i3
 //SmtbqsirRSLSLcIzXHRczuB7f41U+mSc330YY2C8o4z536IHA+UVlmP
 qMzbpkk/TMIL/DNa+S2D+gxfa0Wv0lmsOCCoMgF+VOPMm44a8y1yxhIEl w==;
X-CSE-ConnectionGUID: M1tVrKLuRMmoQdYqCgVL3g==
X-CSE-MsgGUID: 9ThIPx2eSW2ZXPHTGpzT5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414886"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
X-CSE-ConnectionGUID: sJnxMPnEQYK59twg1KvOnA==
X-CSE-MsgGUID: XzP/XRC2R+Gnjmr/NlGa0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567332"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 22/23] drm/xe/xe3p_xpc: Setup PAT table
Date: Mon, 13 Oct 2025 20:24:54 -0700
Message-ID: <20251013-xe3p-v1-22-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
column than the Xe2/Xe3 tables since compression is not supported.
There's also no "WT" entry (which we wouldn't have used on a platform
without display anyway).

Bspec: 71582
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6e48ff84ad0a0..7649b554942aa 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
 static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
 static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
 
+/*
+ * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
+ * option for compression.  Also note that the "L3" and "L4" register fields
+ * actually control L2 and L3 cache respectively on this platform.
+ */
+#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
+	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
+
+static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
+static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
+
+static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
+	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
+	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
+	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
+	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
+	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
+	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
+	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
+	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
+	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
+	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
+	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
+	/* 11..22 are reserved; leave set to all 0's */
+	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
+	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
+	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
+	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
+	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
+	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
+	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
+	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
+	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
+};
+
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
 	WARN_ON(pat_index >= xe->pat.n_entries);
@@ -380,9 +415,68 @@ static const struct xe_pat_ops xe2_pat_ops = {
 	.dump = xe2_dump,
 };
 
+static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
+	u32 pat;
+	int i;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	drm_printf(p, "PAT table:\n");
+
+	for (i = 0; i < xe->pat.n_entries; i++) {
+		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
+
+		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
+			   !!(pat & XE2_NO_PROMOTE),
+			   REG_FIELD_GET(XE2_L3_CLOS, pat),
+			   REG_FIELD_GET(XE2_L3_POLICY, pat),
+			   REG_FIELD_GET(XE2_L4_POLICY, pat),
+			   REG_FIELD_GET(XE2_COH_MODE, pat),
+			   pat);
+	}
+
+	/*
+	 * Also print PTA_MODE, which describes how the hardware accesses
+	 * PPGTT entries.
+	 */
+	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
+
+	drm_printf(p, "Page Table Access:\n");
+	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
+		   !!(pat & XE2_NO_PROMOTE),
+		   REG_FIELD_GET(XE2_L3_CLOS, pat),
+		   REG_FIELD_GET(XE2_L3_POLICY, pat),
+		   REG_FIELD_GET(XE2_L4_POLICY, pat),
+		   REG_FIELD_GET(XE2_COH_MODE, pat),
+		   pat);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
+}
+
+static const struct xe_pat_ops xe3p_xpc_pat_ops = {
+	.program_graphics = program_pat_mcr,
+	.program_media = program_pat,
+	.dump = xe3p_xpc_dump,
+};
+
 void xe_pat_init_early(struct xe_device *xe)
 {
-	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
+	if (GRAPHICS_VERx100(xe) == 3511) {
+		xe->pat.ops = &xe3p_xpc_pat_ops;
+		xe->pat.table = xe3p_xpc_pat_table;
+		xe->pat.pat_ats = &xe3p_xpc_pat_ats;
+		xe->pat.pat_pta = &xe3p_xpc_pat_pta;
+		xe->pat.n_entries = ARRAY_SIZE(xe3p_xpc_pat_table);
+		xe->pat.idx[XE_CACHE_NONE] = 3;
+		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
+		xe->pat.idx[XE_CACHE_WB] = 2;
+	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
 		xe->pat.table = xe2_pat_table;
 		xe->pat.pat_ats = &xe2_pat_ats;

-- 
2.51.0

