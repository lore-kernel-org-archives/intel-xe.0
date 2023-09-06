Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D11CCF9F2
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 01:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E3710E564;
	Wed,  6 Sep 2023 01:20:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4A110E31B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693963251; x=1725499251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R+UkH8KNi5/xjcj1gTNqP6t/bTNqecryPZh08QA2VoE=;
 b=JZgtCFy6AmbwqVFhsuAO8iWBtO0dwzjb5TmUAS70tx3WrePoujEZEgGs
 U/FBM0AShhOsKIMYM2orO2JQr3wbdgYV/JskoHIsD1Xs9o+Q19hcA2Qnx
 TvW4KvDGjhbBIQGXM0drP0UAW4Ftr3LHAkjCO51zjp/PbFvNI6qkZfpOF
 MGqTKCEa4fKXPtk3o2tVyvArUwQ5IY0nNc+Rz2LP0kBZJRuYjzqkTygT5
 44MCNcDmGs5khSszIktSNovPwGI0lb76C7uLCUb+5GSqt5rNEzzeIHriO
 Cn8cp1Ynzjpy42p3BqHsKIvBhq8y/Q1pW334OVAo1Jllc7xxV2d95GS+k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380747241"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="380747241"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915072571"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="915072571"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:20:53 -0700
Message-Id: <20230906012053.1733755-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906012053.1733755-1-lucas.demarchi@intel.com>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] drm/xe: Fix LRC workarounds
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix 2 issues when writing LRC workarounds by copying the same handling
done when processing other RTP entries:

For masked registers, it was not correctly setting the upper 16bits.
Differently than i915, the entry itself doesn't set the upper bits
for masked registers: this is done when applying them. Testing on ADL-P:

Before:
	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00000002
	...
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x00002000
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00000040
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x00000200

After:
	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00060002
	...
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x20002000
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00400040
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x02000200

All of these registers are masked registers, so writing to them without
the relevant bits in the upper 16b doesn't have any effect.

Also, this adds support to regular registers; previously it was assumed
that LRC entries would only contain masked registers. However this is
not true. 0x6604 is not a masked register, but used in workarounds for
e.g.  ADL-P. See commit 28cf243a341a ("drm/i915/gt: Fix context
workarounds with non-masked regs"). In the same test with ADL-P as
above:

Before:
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0000000
After:
	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0efef6f

As can be seen, now it will read what was in the register rather than
completely overwrite the other bits.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 41 +++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9e226b8a005a..678a276a25dc 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -114,11 +114,20 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	return 0;
 }
 
+/*
+ * Convert back from encoded value to type-safe, only to be used when reg.mcr
+ * is true
+ */
+static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
+{
+	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
+}
+
 static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 {
 	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
 	struct xe_reg_sr_entry *entry;
-	unsigned long reg;
+	unsigned long idx;
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
 	struct dma_fence *fence;
@@ -129,18 +138,36 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	xa_for_each(&sr->xa, reg, entry)
+	xa_for_each(&sr->xa, idx, entry)
 		++count;
 
 	if (count) {
 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
 
 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
-		xa_for_each(&sr->xa, reg, entry) {
-			bb->cs[bb->len++] = reg;
-			bb->cs[bb->len++] = entry->set_bits;
-			xe_gt_dbg(gt, "REG[0x%lx] = 0x%08x", reg,
-				  entry->set_bits);
+
+		xa_for_each(&sr->xa, idx, entry) {
+			struct xe_reg reg = entry->reg;
+			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
+			u32 val;
+
+			/*
+			 * Skip reading the register if it's not really needed
+			 */
+			if (reg.masked)
+				val = entry->clr_bits << 16;
+			else if (entry->clr_bits + 1)
+				val = (reg.mcr ?
+				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
+				       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
+			else
+				val = 0;
+
+			val |= entry->set_bits;
+
+			bb->cs[bb->len++] = reg.addr;
+			bb->cs[bb->len++] = val;
+			xe_gt_dbg(gt, "REG[0x%x] = 0x%08x", reg.addr, val);
 		}
 	}
 
-- 
2.40.1

