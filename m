Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB0C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 14:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526BD10E4EB;
	Tue, 31 Oct 2023 14:02:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B610E4E9
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698760956; x=1730296956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HzEUDrtggSrt3hT3lEx3/TlB3HRBBHaLnkX5XRQCS1I=;
 b=RgW3pEleuDNDrLt00GYUvmSU6S5QjRg3tVZF/eHNqDeYd7KCJqsv7Y5y
 u7uKEpXvvEFiy/ZYa4zNfkLW9t7tvhUAqqmxd/3OgYfb/HwhZViUARZTC
 wwozDwoCrtiafCoyrDphYSjGNMCJqZJAJg4swvIe4knyQEyvU8NqR8G43
 PNgfuSpU36zq+7+FrUq9aBoporqovmWztHm18hcBVHfm95UH8ZVq2l/bP
 sa0ElFdq753ByhJ4DCL1OIxCqBollY/TcSe6LRWcb4BEmEn9Ny3AC8yWj
 RrvPARWZ4O57nOirAgKTO/edSzTuvVqEhP26wLWt3wYg9DLVAV9G8DZDB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="385479356"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="385479356"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092017754"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="1092017754"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:02:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 07:01:52 -0700
Message-ID: <20231031140151.303296-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Program correct MOCS registers
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The LNCFCMOCS registers no longer exist on Xe2 so there's no need to
attempt to program them.  Since GLOB_MOCS is the only set of MOCS
registers now, it's expected to be used for all platforms (both igpu and
dgpu) going forward, so adjust the MOCS programming flags accordingly.

Bspec: 71582
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 21972bbef8fd..fa49d32b5d60 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -26,6 +26,7 @@ static inline void mocs_dbg(const struct drm_device *dev,
 
 enum {
 	HAS_GLOBAL_MOCS = BIT(0),
+	HAS_LNCF_MOCS = BIT(1),
 };
 
 struct xe_mocs_entry {
@@ -473,8 +474,10 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		return 0;
 	}
 
-	if (!IS_DGFX(xe))
+	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) > 20)
 		flags |= HAS_GLOBAL_MOCS;
+	if (GRAPHICS_VER(xe) < 20)
+		flags |= HAS_LNCF_MOCS;
 
 	return flags;
 }
@@ -505,7 +508,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 	for (i = 0;
 	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
 	     i++) {
-		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i,
+		mocs_dbg(&gt_to_xe(gt)->drm, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
 			 XELP_GLOBAL_MOCS(i).addr, mocs);
 
 		if (GRAPHICS_VERx100(gt_to_xe(gt)) > 1250)
@@ -545,7 +548,7 @@ static void init_l3cc_table(struct xe_gt *gt,
 	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
 				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
 	     i++) {
-		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr,
+		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr,
 			 l3cc);
 
 		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
@@ -570,19 +573,18 @@ void xe_mocs_init(struct xe_gt *gt)
 	unsigned int flags;
 
 	/*
-	 * LLC and eDRAM control values are not applicable to dgfx
+	 * MOCS settings are split between "GLOB_MOCS" and/or "LNCFCMOCS"
+	 * registers depending on platform.
+	 *
+	 * These registers should be programmed before GuC initialization
+	 * since their values will affect some of the memory transactions
+	 * performed by the GuC.
 	 */
 	flags = get_mocs_settings(gt_to_xe(gt), &table);
 	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
 
 	if (flags & HAS_GLOBAL_MOCS)
 		__init_mocs_table(gt, &table);
-
-	/*
-	 * Initialize the L3CC table as part of mocs initalization to make
-	 * sure the LNCFCMOCSx registers are programmed for the subsequent
-	 * memory transactions including guc transactions
-	 */
-	if (table.table)
+	if (flags & HAS_LNCF_MOCS)
 		init_l3cc_table(gt, &table);
 }
-- 
2.41.0

