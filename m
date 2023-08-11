Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E65C04E69
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B2510E6B4;
	Fri, 11 Aug 2023 16:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040110E6AF
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TdJ/meJSV2uUIS/Y4LgwdINGGUx6IZPqJbBv2rL0TWk=;
 b=eo0BbiVfDkeNwo/dThW6TO0FOFUwgwVI4+MV1OYqA1RHZBr6PS9XJS+K
 JFTjapbQTFFdLKreDBjRXmADwkIxmkusnPuTTual2KDIKSpfC0XvTbDlk
 fgMbAKn8cecoHBDSV6Ngv+HRZ9hV66gR+E6GBo5D24SFb7gRJDPFACdjz
 R2jpKn4AvXsd1CdsqK9az5wX8PqKBXqtQv0dtFQcRHhVDOjazSFMeHUyl
 ROLjjOT702LLd4LKFNjHYKnFw0vngApvvt361/oKC+NPKvTwuYK8geXIr
 R5fKZqwD6OYaSux5xJrrFsehBwhF0VcuT+/PeUyrPPOvE3/9QYQr8vyhv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044335"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044335"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300472"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300472"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:14 -0700
Message-Id: <20230811160618.477297-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/15] drm/xe/xe2: Add MOCS table
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Additional minor change to remove L4_2_RESERVED, which will never be
required.

Bspec: 71582
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index c9653978fc9f5..d779ab8466d32 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -62,13 +62,15 @@ struct xe_mocs_info {
 #define L3_LKUP(value)		((value) << 7)
 
 /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
-#define _L4_CACHEABILITY	REG_GENMASK(3, 2)
-#define IG_PAT			REG_BIT(8)
+#define IG_PAT				REG_BIT(8)
+#define GLOB_L3_CACHEABILITY_MASK	REG_GENMASK(5, 4)
+#define L4_CACHEABILITY_MASK		REG_GENMASK(3, 2)
 
 /* Helper defines */
 #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
 #define PVC_NUM_MOCS_ENTRIES	3
 #define MTL_NUM_MOCS_ENTRIES    16
+#define XE2_NUM_MOCS_ENTRIES	16
 
 /* (e)LLC caching options */
 /*
@@ -93,10 +95,14 @@ struct xe_mocs_info {
 #define L3_3_WB			_L3_CACHEABILITY(3)
 
 /* L4 caching options */
-#define L4_0_WB                 REG_FIELD_PREP(_L4_CACHEABILITY, 0)
-#define L4_1_WT                 REG_FIELD_PREP(_L4_CACHEABILITY, 1)
-#define L4_2_RESERVED           REG_FIELD_PREP(_L4_CACHEABILITY, 2)
-#define L4_3_UC                 REG_FIELD_PREP(_L4_CACHEABILITY, 3)
+#define L4_0_WB                 REG_FIELD_PREP(L4_CACHEABILITY_MASK, 0)
+#define L4_1_WT                 REG_FIELD_PREP(L4_CACHEABILITY_MASK, 1)
+#define L4_3_UC                 REG_FIELD_PREP(L4_CACHEABILITY_MASK, 3)
+
+#define XE2_L3_0_WB		REG_FIELD_PREP(GLOB_L3_CACHEABILITY_MASK, 0)
+/* XD: WB Transient Display */
+#define XE2_L3_1_XD		REG_FIELD_PREP(GLOB_L3_CACHEABILITY_MASK, 1)
+#define XE2_L3_3_UC		REG_FIELD_PREP(GLOB_L3_CACHEABILITY_MASK, 3)
 
 #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
 	[__idx] = { \
@@ -370,6 +376,17 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
 		   L3_GLBGO(1) | L3_1_UC),
 };
 
+static const struct xe_mocs_entry xe2_mocs_table[] = {
+	/* Defer to PAT */
+	MOCS_ENTRY(0, XE2_L3_0_WB | L4_0_WB, 0),
+	/* Cached L3 + L4 */
+	MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
+	/* Uncached L3, Cached L4 */
+	MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
+	/* Uncached L3 + L4 */
+	MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
+};
+
 static unsigned int get_mocs_settings(struct xe_device *xe,
 				      struct xe_mocs_info *info)
 {
-- 
2.40.1

