Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B73C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 14:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B9910E4E9;
	Tue, 31 Oct 2023 14:05:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADDC10E4E9
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698761149; x=1730297149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cR+kpsoir4SpP/9BcvtEnPmTfRVQ/+BTjAKsFfjr5bA=;
 b=A3mUNLcxHndSaJEUMwwjP/glfYueexwhkvMXieUsHV0r5VR/VOSdKN9x
 k9lJWsFXANsGGoLVNqjtzfo1aK/B7+vhoMjr1hm7HQYcY8hFBsb2FY/I0
 Lgk+Ju8JH3zz9tn05LYNwY//3ZyEyf/mOIjDN9Pc74ECU5BhCjtxhIseO
 0990d8Ev2feuqQQPiqp8TjT4yDQLF343LLPSeJx9wkpaJVtSbJJwSONvY
 x3K162pK99tWNFw+2I/wk5qeK2intdY+y1sAVYudTn/Q1fZgYRhWSge01
 X90oriZGaYNQGJskEVWnnk9u9nBJMzsij8GZuN3MRgMrP9DEdYRsunx4l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="9823724"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="9823724"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851257808"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="851257808"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:05:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 07:05:37 -0700
Message-ID: <20231031140536.303746-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031140151.303296-2-matthew.d.roper@intel.com>
References: <20231031140151.303296-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/xe2: Program correct MOCS registers
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

v2:
 - Fix typo (global mocs condition is >=, not >)

Bspec: 71582
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 21972bbef8fd..46e999257862 100644
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
+	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) >= 20)
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

