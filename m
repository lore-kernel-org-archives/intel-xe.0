Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C9FC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC5810E118;
	Fri, 21 Apr 2023 22:33:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDED10E2FB
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116395; x=1713652395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gsIihECOVrRx36TQFHCGYRMP6BeGOS2a33/EYNkBxDQ=;
 b=RqzA6ubsWLAyqMGmF6gxK6Cygdacj3D4ydlss9OrxHakUh7Fi6gK6i3v
 Wyi2Iv2bDvTRzPagpeOzdz8Qx6Tp5pBxBTPKOTlHb6WLQiUnzBuPt9VRR
 eiG+bqTOpKr9nPiWXDCPhTsFf/0avIQBM1V1TMeUAW5Bm+RQncw5pRxVo
 I59zi5n0EjOKRlhpLHHAn3phmdlnCsDWB+gmoLSNcbqNChbWfcTMl3myg
 zeJvXgQfx8UZ9S1AO8aPh5Xr8OdFpNYcy1R6pZXKIkOO2Ard5ZsWK/EY/
 A+4Yno2KjRRIHj9no5vVRZE6XG4xSheYxiB0D4H60gbhlkYxXqeKiumDI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693751"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693751"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913760"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913760"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:52 -0700
Message-Id: <20230421223258.128781-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 11/17] drm/xe: Clarify register types on PAT
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

