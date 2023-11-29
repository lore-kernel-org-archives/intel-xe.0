Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED936C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 10:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E8A10E198;
	Wed, 29 Nov 2023 10:44:26 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 10:44:24 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA08F10E198
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701254665; x=1732790665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PpF7VV5dkZaN2UomMUysrwXEobCCnh7QutxMy1f6Wqg=;
 b=el5pwpe+6jatDnol5XJZcqgfaa07A5CM+k2+v+ULTXFVMUjs9amBLB2W
 Yu0FPB/TG0/fHVSHgbXeWdB+D3PU9mE5eYK8TX25aKbshJiR/B/OiyB2O
 2sggoWExPB75Dqo0S9bnnVKW7bVCE3o/Vch7A++0+i8l/GSqvMr7kYaOx
 TOrH0HObAr/pu6ZWSHIsbCB2UnVhCb/wyDf9CzkMAHW/F0yS2CCQWKs1t
 Ud1cB6BoVv1k1GkOJKuhobAXX9CM8uz312aOsuYCxU+JaTJ5HvVvu8wec
 yoNoj4db7v+wOTxAJzu5DWR0asDj66GWu3OsGfC/slSm+dytIEpfR4lCr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="123262"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="123262"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 02:37:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762271268"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="762271268"
Received: from rsexton-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.8.118])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 02:37:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 10:37:07 +0000
Message-ID: <20231129103706.329056-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mocs: update MOCS table for xe2
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

Looks like there were some changes at some point here for preferring L4
uncached for some of the indexes. Triple checked the PAT settings also,
but that looks all correct as per current BSpec.

BSpec: 71582
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 12a6d39fcd4a..ef79552e4f2f 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -366,9 +366,9 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
 
 static const struct xe_mocs_entry xe2_mocs_table[] = {
 	/* Defer to PAT */
-	MOCS_ENTRY(0, XE2_L3_0_WB | L4_0_WB, 0),
-	/* Cached L3 + L4 */
-	MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
+	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0),
+	/* Cached L3, Uncached L4 */
+	MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_3_UC, 0),
 	/* Uncached L3, Cached L4 */
 	MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
 	/* Uncached L3 + L4 */
@@ -390,8 +390,8 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->table = xe2_mocs_table;
 		info->n_entries = XE2_NUM_MOCS_ENTRIES;
 		info->uc_index = 3;
-		info->wb_index = 1;
-		info->unused_entries_index = 1;
+		info->wb_index = 4;
+		info->unused_entries_index = 4;
 		break;
 	case XE_PVC:
 		info->size = ARRAY_SIZE(pvc_mocs_desc);
-- 
2.43.0

