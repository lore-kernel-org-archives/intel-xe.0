Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E2E743EE
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660B410E6C1;
	Fri, 29 Sep 2023 05:04:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9852A10E6B2
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695963868; x=1727499868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uu24YTXB4mAH8ShWE7I0cp+u6pkFMDcvp4CO76dWylU=;
 b=J4xjzYwdln0OnczusZd5FZJp91RkOXaO3npYU42XsVJqAaHeG7WghOWj
 tE6QHq1VuyC7obpgJXu5QI4QmEfQ3AWzFZnn46AAeYl6CAdLAC3+nOTiV
 necxdduxV+U9cBw+Wl1HUJNfZ903gHSlIuBTIflWdQL/q5EqpMQrMk8Ub
 BtR/oajnC9P7Yz4YDWCCT/j5qH8FUOUgpIouBfs+9xXBlb4NVytVWsjHV
 uhj74gkoOsNUROkai6BNwzDab9QR1XcrbQUI08bWtzeL+dzLNZ+12BieD
 RGftnDXMxtGnkCc5iRMFa49fOLYmgI/kZtyGLzpPqu5rriGkfLm2Uq9vv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413142024"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413142024"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865570953"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="865570953"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:02:47 -0700
Message-Id: <20230929050253.3153804-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929050253.3153804-1-lucas.demarchi@intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe/xe2: Program PAT tables
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

The PAT tables become significantly more complicated on Xe2 platforms.
They now control L3, L4, and coherency settings, as well as additional
characteristics such as compression.

Aside from the main PAT table, there's an additional register that
also needs to be programmed with PAT settings for PCI Address
Translation Services.

Bspec: 71582
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 92 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 869aee64641f..ea2e3fb3a843 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -10,10 +10,18 @@
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 
+#define _PAT_ATS				0x47fc
 #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
 								   0x4800, 0x4804, \
 								   0x4848, 0x484c)
 
+#define XE2_NO_PROMOTE				REG_BIT(10)
+#define XE2_COMP_EN				REG_BIT(9)
+#define XE2_L3_CLOS				REG_GENMASK(7, 6)
+#define XE2_L3_POLICY				REG_GENMASK(5, 4)
+#define XE2_L4_POLICY				REG_GENMASK(3, 2)
+#define XE2_COH_MODE				REG_GENMASK(1, 0)
+
 #define XELPG_L4_POLICY_MASK			REG_GENMASK(3, 2)
 #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
 #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
@@ -67,6 +75,64 @@ static const u32 xelpg_pat_table[] = {
 	[4] = XELPG_PAT_0_WB | XELPG_3_COH_2W,
 };
 
+/*
+ * The Xe2 table is getting large/complicated so it's easier to review if
+ * provided in a form that exactly matches the bspec's formatting.  The meaning
+ * of the fields here are:
+ *   - no_promote:  0=promotable, 1=no promote
+ *   - comp_en:     0=disable, 1=enable
+ *   - l3clos:      L3 class of service (0-3)
+ *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
+ *   - l4_policy:   0=WB, 1=WT, 3=UC
+ *   - coh_mode:    0=no snoop, 2=1-way coherent, 3=2-way coherent
+ *
+ * Reserved entries should be programmed with the maximum caching, minimum
+ * coherency (which matches an all-0's encoding), so we can just omit them
+ * in the table.
+ */
+#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, coh_mode) \
+	(no_promote ? XE2_NO_PROMOTE : 0) | \
+	(comp_en ? XE2_COMP_EN : 0) | \
+	REG_FIELD_PREP(XE2_L3_CLOS, l3clos) | \
+	REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
+	REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
+	REG_FIELD_PREP(XE2_COH_MODE, coh_mode)
+
+static const u32 xe2_pat_table[] = {
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),
+	/* 16..19 are reserved; leave set to all 0's */
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
+};
+
+/* Special PAT values programmed outside the main table */
+#define XE2_PAT_ATS	XE2_PAT( 0, 0, 0, 0, 3, 3 )
+
 static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
 {
 	for (int i = 0; i < n_entries; i++) {
@@ -102,9 +168,33 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 	.program_media = program_pat_mcr,
 };
 
+static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+{
+	program_pat_mcr(gt, table, n_entries);
+	xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), XE2_PAT_ATS);
+}
+
+static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+{
+	program_pat(gt, table, n_entries);
+	xe_mmio_write32(gt, XE_REG(_PAT_ATS), XE2_PAT_ATS);
+}
+
+static const struct xe_pat_ops xe2_pat_ops = {
+	.program_graphics = xe2lpg_program_pat,
+	.program_media = xe2lpm_program_pat,
+};
+
 void xe_pat_init_early(struct xe_device *xe)
 {
-	if (xe->info.platform == XE_METEORLAKE) {
+	if (GRAPHICS_VER(xe) == 20) {
+		xe->pat.ops = &xe2_pat_ops;
+		xe->pat.table = xe2_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);
+		xe->pat.idx[XE_CACHE_NONE] = 3;
+		xe->pat.idx[XE_CACHE_WT] = 15;
+		xe->pat.idx[XE_CACHE_WB] = 2;
+	} else if (xe->info.platform == XE_METEORLAKE) {
 		xe->pat.ops = &xelpg_pat_ops;
 		xe->pat.table = xelpg_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(xelpg_pat_table);
-- 
2.40.1

