Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C01C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 17:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE3B112D3B;
	Tue, 30 Apr 2024 17:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2RK87a+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBFF112D3B
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714496627; x=1746032627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vvue4TM3V9qv4yv+f95j5+CgU/ARSyvGZL6Og8dQmA0=;
 b=T2RK87a+JiragJi9RwgroepYKFX2sdKckq/oGUE/WAbAYAn8b1IyiUEc
 r+U/Eyk0mvoh5q9WDgBbgQJNhdgPT7O53woBQd7hhcTiHxe2V5Qfg3cfR
 lzY+761w1e83FhFTog1bKxtYTIHve/zzX9QSFrPMkncTV+Q94Lq7o+jy0
 mB7OyiKtk8NW4YTIWEg7tq9/c606XjvqzLhc4CgsKdkIemfOMMPnLyzWC
 BSIPKgbbaCaGA1wkvxNiDlrHKASAc+w+pYGA2rO5nASSJi5O9eUE9W6B2
 LUF5+UNOQf1Qh39Of5uhQzte4mY/P3LIVkele/e4UIOSOjVVagdoojQ9X A==;
X-CSE-ConnectionGUID: UBSz3r3uTnWVnk6yGKkTEg==
X-CSE-MsgGUID: 3D7f8gmhSqy8ckkqGYZXzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10048146"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10048146"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 10:03:47 -0700
X-CSE-ConnectionGUID: ZqQwc90SRga8Ka9ZqY33Yg==
X-CSE-MsgGUID: ZiQOko7OR/uTKSJqERmvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="57409983"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa002.jf.intel.com with ESMTP; 30 Apr 2024 10:03:45 -0700
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH v4 1/2] drm/xe: Relocate regs_are_mcr function
Date: Tue, 30 Apr 2024 22:34:26 +0530
Message-Id: <20240430170427.1808136-2-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
References: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
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

Relocate regs_are_mcr funciton to a higher position in the file
for improved visibility.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 1e92f8ee07ba..aef09eb423e9 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -255,6 +255,16 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
 		   L3_1_UC)
 };
 
+static bool regs_are_mcr(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_gt_is_media_type(gt))
+		return MEDIA_VER(xe) >= 20;
+	else
+		return GRAPHICS_VERx100(xe) >= 1250;
+}
+
 static const struct xe_mocs_entry dg1_mocs_desc[] = {
 	/* UC */
 	MOCS_ENTRY(1, 0, L3_1_UC),
@@ -467,16 +477,6 @@ static u32 get_entry_control(const struct xe_mocs_info *info,
 	return info->table[info->unused_entries_index].control_value;
 }
 
-static bool regs_are_mcr(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	if (xe_gt_is_media_type(gt))
-		return MEDIA_VER(xe) >= 20;
-	else
-		return GRAPHICS_VERx100(xe) >= 1250;
-}
-
 static void __init_mocs_table(struct xe_gt *gt,
 			      const struct xe_mocs_info *info)
 {
-- 
2.25.1

