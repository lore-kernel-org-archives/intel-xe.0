Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FFFC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B2510F0A0;
	Fri,  3 May 2024 19:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1yavh2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B040B10EFAE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714765098; x=1746301098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fg2O/IKjNJN2bNslarEJWt0q9DmviVT2O1pT5kn8AkA=;
 b=h1yavh2XdnYbHqtTAcoJGTF003SRAVQZbMJNezNcDkgj2+hhRCcnEE7t
 ljZxGjooGW+e+pvk1OXidkph3wG74hnXApXPnQ5xNRA0Z+V6Yd9yPGZXr
 QtVdpvF61Ui5r8KXjuJq1FJlzY4+hRcKZGX9dkUqg0CLQ1qaa81IS39xn
 75TmRP+jK9sJo/8Atv6F+4LAxgEXXO7qy+9D1prHAg4W+O/cnRJKSSI05
 s1uORp0lI61+KeSeZJSBrU5Xd/e4biDWtBpbexFDdfDkezNVsVVdfzrWi
 fGRjvPFqii/6yaGBKmBDmVvKUyuWlGt5n2Be7Q46+uej/ajIrkyhh0h56 g==;
X-CSE-ConnectionGUID: iMd7COVMToCidxTEnCYbog==
X-CSE-MsgGUID: sKfKPeluRUuqKVtjVxPJnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14393796"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="14393796"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:38:18 -0700
X-CSE-ConnectionGUID: Esu/rVz0RMmMsWzv/ngdCg==
X-CSE-MsgGUID: jmBvRNduTEaRzPjaFwzyYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64977596"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa001.jf.intel.com with ESMTP; 03 May 2024 12:38:16 -0700
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH v5 1/2] drm/xe: Relocate regs_are_mcr function
Date: Sat,  4 May 2024 01:09:01 +0530
Message-Id: <20240503193902.2056202-2-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
References: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

