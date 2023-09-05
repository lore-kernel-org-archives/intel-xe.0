Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FA0C83F2C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0790510E543;
	Tue,  5 Sep 2023 14:31:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253E010E542
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693924305; x=1725460305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iiT6ECSiHPrbk20uADcdVeziOPNG6heu8Ovbxy5oe8U=;
 b=QQCkR/V2YsHGLjybjI1OaJH4ZOkas5VyqC7jxhsT11LX+syTiDSVw63L
 hWD16o02cxl41wuxAUZLV1+bMbyaL1x5DdC1J8MKigh045TIL9ZjCD4Pc
 dkagWzZMbUYUJyYi8s/QqI/XjCDVGQSR6AhdQPQQ/kTcOBBkXoFAqxWEj
 W1WhQC3ui+n4wvxOaoHl5S79oAo8KcYxToxzLZmRIpt39Gm4cvX+XwDow
 eYH7Ek0Rlx7WbsQy8dviO+lMHh45bCAgRhGaLl4/DC3FeBadL4dW76867
 v/jJE+dlFE4ZQA4DT4diF4fRLw3Qf1H9kLveyXq1wiD7HnibZrcXUx0/0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407798202"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407798202"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="856008690"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="856008690"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:31:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 07:31:43 -0700
Message-Id: <20230905143144.1706967-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230905143144.1706967-1-lucas.demarchi@intel.com>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add dbg messages for LRC WAs
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

Just like the GT and engine workarounds, add debug message with the
final value being written to the register for easy debugging.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3d6a7c11bac1..bd307770a620 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -116,6 +116,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 
 static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
@@ -133,10 +134,14 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 		++count;
 
 	if (count) {
+		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);
+
 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
 		xa_for_each(&sr->xa, reg, entry) {
 			bb->cs[bb->len++] = reg;
 			bb->cs[bb->len++] = entry->set_bits;
+			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
+				entry->set_bits);
 		}
 	}
 
-- 
2.40.1

