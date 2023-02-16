Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FBDC64ED6
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 23:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2D210E3A3;
	Thu, 16 Feb 2023 23:17:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE4910E390
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676589459; x=1708125459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZHuil74enzw+pmSpw8vOC+jpNcoOs5Ks9RTTUG6gB4=;
 b=glEPWN0qq1AGuW6RvaeNz5Y4dNl7bksDf7ZW+9h9/oCQIZ1i5pZ02BOv
 C6V9yVo6yybfMtYtcU2165Kf8BZtCryN8dKjxuk0yftP4GOToV1mWm1mz
 dIguqLnvYjfnCVERuyN76p5Lz/Jqud71kgW1TwwWs7p8F5gV5TbzjYhgp
 qLXHT2J1xJXHI5ITNRzhHN7U6zCA66iX/FrgCHh5EsNxwqwL/JoNx/Pc5
 UNqLsMnAaEWPllt9ZPiIMex6F7Z/AUt633rR+E0x8UuKdxhbDHm78408K
 7kofi1PBULVL/wHcieG/ial7UAqh7qpYnAYwW8KwKW2ENID7/ovLceHtT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333220836"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333220836"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813169206"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813169206"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 15:17:19 -0800
Message-Id: <20230216231724.2246534-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216231724.2246534-1-matthew.d.roper@intel.com>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe/mocs: Drop unwanted TGL table
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

TGL/RKL/ADLS/ADLP are all supposed to use the same MOCS table, with
values defined in the bspec.  Any entries listed in the bspec as
reserved/error/undefined should always be initialized to the most cached
and least coherent setting possible so that any userspace accidentally
referencing those undefined entries will only experience an increase in
coherency if spec updates down the road start defining real values.

The TGL and gen12 tables that exist in the driver today are identical
except that the TGL includes one additional (incorrect) setting for PAT
index 1.  This is a holdover from i915 where the platform was enabled
with an incorrect setting and by the time we noticed, it was too late to
fix the table without breaking ABI compatibility (and on TGL we did
indeed have some buggy userspace that was referencing the 'reserved'
entry 1).  Since the Xe driver starts fresh with a clean slate on ABI,
there's no need to repeat the mistakes of i915 here.

Bspec: 45101
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 46 ------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 86b966fffbe5..09adb69d1545 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -247,47 +247,6 @@ struct xe_mocs_info {
 		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
 		L3_1_UC)
 
-static const struct xe_mocs_entry tgl_mocs_desc[] = {
-	/*
-	 * NOTE:
-	 * Reserved and unspecified MOCS indices have been set to (L3 + LCC).
-	 * These reserved entries should never be used, they may be changed
-	 * to low performant variants with better coherency in the future if
-	 * more entries are needed. We are programming index XE_MOCS_PTE(1)
-	 * only, __init_mocs_table() take care to program unused index with
-	 * this entry.
-	 */
-	MOCS_ENTRY(XE_MOCS_PTE,
-		   LE_0_PAGETABLE | LE_TC_0_PAGETABLE,
-		   L3_1_UC),
-	GEN11_MOCS_ENTRIES,
-
-	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */
-	MOCS_ENTRY(48,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_3_WB),
-	/* Implicitly enable L1 - HDC:L1 + L3 */
-	MOCS_ENTRY(49,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_3_WB),
-	/* Implicitly enable L1 - HDC:L1 + LLC */
-	MOCS_ENTRY(50,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_1_UC),
-	/* Implicitly enable L1 - HDC:L1 */
-	MOCS_ENTRY(51,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_1_UC),
-	/* HW Special Case (CCS) */
-	MOCS_ENTRY(60,
-		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
-		   L3_1_UC),
-	/* HW Special Case (Displayable) */
-	MOCS_ENTRY(61,
-		   LE_1_UC | LE_TC_1_LLC,
-		   L3_3_WB),
-};
-
 static const struct xe_mocs_entry dg1_mocs_desc[] = {
 	/* UC */
 	MOCS_ENTRY(1, 0, L3_1_UC),
@@ -422,11 +381,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->unused_entries_index = 5;
 		break;
 	case XE_TIGERLAKE:
-		info->size  = ARRAY_SIZE(tgl_mocs_desc);
-		info->table = tgl_mocs_desc;
-		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
-		info->uc_index = 3;
-		break;
 	case XE_ALDERLAKE_S:
 	case XE_ALDERLAKE_P:
 		info->size  = ARRAY_SIZE(gen12_mocs_desc);
-- 
2.39.1

