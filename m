Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A1EC7EE20
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 07:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E5810E8C5;
	Wed, 19 Apr 2023 07:45:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4FE10E8DB
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 07:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681890298; x=1713426298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gsIihECOVrRx36TQFHCGYRMP6BeGOS2a33/EYNkBxDQ=;
 b=TPuSYQYyu8dTyUKaZpAjKVPbcIV9dxTh5yG65xomqjhHsR+7E3NOrqro
 hSZ/35pTe8H9162MpVrRyOgeFXOGGzAkwcKQjbJ0QjDZ54cHr3RBUrml8
 Sk3YczLDBx+W2ajoGBvKzHfNfdG6aM9KC+IPRhG3OmnhvXM5d0otLg0XF
 ps9ziRh7lfMDScYOroOYaTAfHCdYTyoy/FC5iE8boihdVJ7BBH+jqpa+G
 jcbw8wVbSRBLGdawsxxrzDam1N7GJhv5eCIGLNuX+3yUgjy2+QYdK6WVO
 xOSA5vgC0InttKp/bB/Ep0YP6FaDVPKTx/jhmByZsSSNeqB7RGL8E+/+h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334186122"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334186122"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693951900"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="693951900"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 00:44:35 -0700
Message-Id: <20230419074440.4006398-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230419074440.4006398-1-lucas.demarchi@intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/17] drm/xe: Clarify register types on PAT
 programming
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Clarify a few things related to the PAT programming, particularly on
MTL:

	- The register type doesn't change depending on the GT - what
	  happens is that media GT writes to other set of registers that
	  are not MCR
	- Remove "UNICAST": otherwise it's confusing why it's not using
	  MCR registers with the unicast function variant

Also, there isn't much reason to keep those parts as macros: promote
them to proper functions and let the compiler inline if it sees fit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index c2faf0931649..fcf6ae2c92cc 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -62,31 +62,36 @@ static const u32 mtl_pat_table[] = {
 	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
 };
 
-#define PROGRAM_PAT_UNICAST(gt, table) do { \
-	for (int i = 0; i < ARRAY_SIZE(table); i++) \
-		xe_mmio_write32(gt, _PAT_INDEX(i), table[i]); \
-} while (0)
+static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+{
+	for (int i = 0; i < n_entries; i++)
+		xe_mmio_write32(gt, _PAT_INDEX(i), table[i]);
+}
 
-#define PROGRAM_PAT_MCR(gt, table) do { \
-	for (int i = 0; i < ARRAY_SIZE(table); i++) \
-		xe_gt_mcr_multicast_write(gt, MCR_REG(_PAT_INDEX(i)), table[i]); \
-} while (0)
+static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
+{
+	for (int i = 0; i < n_entries; i++)
+		xe_gt_mcr_multicast_write(gt, MCR_REG(_PAT_INDEX(i)), table[i]);
+}
 
 void xe_pat_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
 	if (xe->info.platform == XE_METEORLAKE) {
+		/*
+		 * SAMedia register offsets are adjusted by the write methods
+		 * and they target registers that are not MCR, while for normal
+		 * GT they are MCR
+		 */
 		if (xe_gt_is_media_type(gt))
-			PROGRAM_PAT_UNICAST(gt, mtl_pat_table);
+			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
 		else
-			PROGRAM_PAT_MCR(gt, mtl_pat_table);
-	} else if (xe->info.platform == XE_PVC) {
-		PROGRAM_PAT_MCR(gt, pvc_pat_table);
-	} else if (xe->info.platform == XE_DG2) {
-		PROGRAM_PAT_MCR(gt, pvc_pat_table);
+			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
+	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
+		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
-		PROGRAM_PAT_UNICAST(gt, tgl_pat_table);
+		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
 	} else {
 		/*
 		 * Going forward we expect to need new PAT settings for most
-- 
2.39.0

