Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D70C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 18:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC90310E094;
	Thu, 23 Feb 2023 18:57:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DEC10E0E4
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677178674; x=1708714674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lu5CQyMK7Hi1Js54wNHb6jsGkLzFtW7xuC2kj3OEp/4=;
 b=I6bzvxn89JZJG810kxDftGPNR0nEFqpZiiMhEuIkCxUMjXRPuHIE8ZWD
 KRj6aDOZFT95mwVr4KzVC5GUyBl6ctAppYSSdFskE95oWFgSJXUq9f61q
 fbsTRxR535rS2gPfZn/i9OK8VGqsEvzwtOJC5PVhGsG2XpP1nnFyRw2Ex
 jSeKb+KAEbPy0+al8fQjPkyePw5NlL9NcmmEbUvEiVbJzXiz6aDbin0M9
 E9wFSTOZ5V48HNMP0bFdPpCy9XMoxntV2ZU0QZLv73GSaveA7mAJAz8eo
 s9MjOg2r98xIXFcQV1Hzln879yvnkiUaSnXucwTvIQdz9MhWdL4gGxNIh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360793758"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360793758"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782018612"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782018612"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Feb 2023 10:57:38 -0800
Message-Id: <20230223185740.3356127-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223185740.3356127-1-matthew.d.roper@intel.com>
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/7] drm/xe/mocs: add MTL mocs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com,
 Philippe Lecluse <philippe.lecluse@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Philippe Lecluse <philippe.lecluse@intel.com>

It was incorrectly using dg2_mocs for now.

v2 (MattR):
 - Use REG_GENMASK/REG_FIELD_PREP for bitfields
 - Add bspec references

Bspec: 45101, 45410, 63882
Signed-off-by: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 69 +++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index d0f42f17a29e..1ede2d46e778 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -62,6 +62,10 @@ struct xe_mocs_info {
 #define L3_GLBGO(value)		((value) << 6)
 #define L3_LKUP(value)		((value) << 7)
 
+/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
+#define _L4_CACHEABILITY	REG_GENMASK(3, 2)
+#define IG_PAT			REG_BIT(8)
+
 /* Helper defines */
 #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
 #define PVC_NUM_MOCS_ENTRIES	3
@@ -89,6 +93,12 @@ struct xe_mocs_info {
 #define L3_2_RESERVED		_L3_CACHEABILITY(2)
 #define L3_3_WB			_L3_CACHEABILITY(3)
 
+/* L4 caching options */
+#define L4_0_WB                 REG_FIELD_PREP(_L4_CACHEABILITY, 0)
+#define L4_1_WT                 REG_FIELD_PREP(_L4_CACHEABILITY, 1)
+#define L4_2_RESERVED           REG_FIELD_PREP(_L4_CACHEABILITY, 2)
+#define L4_3_UC                 REG_FIELD_PREP(_L4_CACHEABILITY, 3)
+
 #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
 	[__idx] = { \
 		.control_value = __control_value, \
@@ -310,6 +320,57 @@ static const struct xe_mocs_entry pvc_mocs_desc[] = {
 	MOCS_ENTRY(2, 0, L3_3_WB),
 };
 
+static const struct xe_mocs_entry mtl_mocs_desc[] = {
+	/* Error - Reserved for Non-Use */
+	MOCS_ENTRY(0,
+		   0,
+		   L3_LKUP(1) | L3_3_WB),
+	/* Cached - L3 + L4 */
+	MOCS_ENTRY(1,
+		   IG_PAT,
+		   L3_LKUP(1) | L3_3_WB),
+	/* L4 - GO:L3 */
+	MOCS_ENTRY(2,
+		   IG_PAT,
+		   L3_LKUP(1) | L3_1_UC),
+	/* Uncached - GO:L3 */
+	MOCS_ENTRY(3,
+		   IG_PAT | L4_3_UC,
+		   L3_LKUP(1) | L3_1_UC),
+	/* L4 - GO:Mem */
+	MOCS_ENTRY(4,
+		   IG_PAT,
+		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
+	/* Uncached - GO:Mem */
+	MOCS_ENTRY(5,
+		   IG_PAT | L4_3_UC,
+		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
+	/* L4 - L3:NoLKUP; GO:L3 */
+	MOCS_ENTRY(6,
+		   IG_PAT,
+		   L3_1_UC),
+	/* Uncached - L3:NoLKUP; GO:L3 */
+	MOCS_ENTRY(7,
+		   IG_PAT | L4_3_UC,
+		   L3_1_UC),
+	/* L4 - L3:NoLKUP; GO:Mem */
+	MOCS_ENTRY(8,
+		   IG_PAT,
+		   L3_GLBGO(1) | L3_1_UC),
+	/* Uncached - L3:NoLKUP; GO:Mem */
+	MOCS_ENTRY(9,
+		   IG_PAT | L4_3_UC,
+		   L3_GLBGO(1) | L3_1_UC),
+	/* Display - L3; L4:WT */
+	MOCS_ENTRY(14,
+		   IG_PAT | L4_1_WT,
+		   L3_LKUP(1) | L3_3_WB),
+	/* CCS - Non-Displayable */
+	MOCS_ENTRY(15,
+		   IG_PAT,
+		   L3_GLBGO(1) | L3_1_UC),
+};
+
 static unsigned int get_mocs_settings(struct xe_device *xe,
 				      struct xe_mocs_info *info)
 {
@@ -327,11 +388,11 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->unused_entries_index = 2;
 		break;
 	case XE_METEORLAKE:
-		info->size = ARRAY_SIZE(dg2_mocs_desc);
-		info->table = dg2_mocs_desc;
+		info->size = ARRAY_SIZE(mtl_mocs_desc);
+		info->table = mtl_mocs_desc;
 		info->n_entries = MTL_NUM_MOCS_ENTRIES;
-		info->uc_index = 1;
-		info->unused_entries_index = 3;
+		info->uc_index = 9;
+		info->unused_entries_index = 1;
 		break;
 	case XE_DG2:
 		if (xe->info.subplatform == XE_SUBPLATFORM_DG2_G10 &&
-- 
2.39.1

