Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC5BCCF9F5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 01:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A00410E46E;
	Wed,  6 Sep 2023 01:20:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B297110E46E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693963251; x=1725499251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bOoQ4Ez+47Vm+P+bQlFH1lMTwkNQ9Mv3w1kXkPL6lOk=;
 b=MbE5ef0o0sygij747JAbM6CSol051oebL1caYJRurbB2X+inGNUMUcgS
 bVwY8gUNeJzxQ7SJvZPLLl9JeJWBkOSSatAo1m7NWGlWJdxUXM83uExcW
 dDcNnPYvMVeW+/DOBEjSZD6rRILSqsr1Sm/LF1846WIx6+IswbnFQZmn6
 79WGfNPmDOVdgKVdwjOlHHYtWwGTjItR2OVtTPyPrWmnjY/iRF7M1CQcr
 LGKHzrdTMyMBqfJIEHdoT7zE81j2ZU6pgw1cpSmqHM65qC2ByNjv+lywA
 AhEL9TDfcE7aXFSB0J79J/v9mnq4E2bPkFONRIRxRF2bCf77ESTtt5ejh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380747239"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="380747239"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915072565"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="915072565"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:20:51 -0700
Message-Id: <20230906012053.1733755-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906012053.1733755-1-lucas.demarchi@intel.com>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/4] drm/xe/reg_sr: Use xe_gt_dbg
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use xe_gt_dbg() instead of drm_dbg() so the GT is added to the log for
easy identification.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 264520015861..87adefb56024 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -147,7 +147,6 @@ static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
 
 static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg reg = entry->reg;
 	struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
 	u32 val;
@@ -176,7 +175,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
 	 */
 	val |= entry->set_bits;
 
-	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.addr, val);
+	xe_gt_dbg(gt, "REG[0x%x] = 0x%08x", reg.addr, val);
 
 	if (entry->reg.mcr)
 		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
@@ -186,7 +185,6 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
 
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
 	int err;
@@ -194,7 +192,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	if (xa_empty(&sr->xa))
 		return;
 
-	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
+	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
 	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
 	if (err)
@@ -209,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	return;
 
 err_force_wake:
-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
-- 
2.40.1

