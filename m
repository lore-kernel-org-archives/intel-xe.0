Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D995CD4845
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB9E10E64D;
	Wed,  4 Sep 2024 00:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNPSvaoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643510E63A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409276; x=1756945276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O2GkszPTI8CfFcFkyn8N/lJKCftQtYwZ4WC+bO/0aPU=;
 b=WNPSvaoE/oX1GvacZar0wDmsFpxSNyiHQp8GTgWV6Jam7RDQWIlAOqI8
 eybHw1dVSp/mNxX1e4lJFoz4UNSnxd1Ypoad3ixgCAe0fuDy8gkbhVvr9
 7kplBlKHNEbEgAZVGqrDYM30hWNFPlPJ3HGAqBRnbz5DlU0MGOjJMMz1W
 LYIhV5nVMI8hfvZmnZNmrWMI5yK7XvBUti42Pw8hcl7txBlCJb4PiYsh9
 Wyg8xtVBjV4GqZa+mdadvV/M4l6EM6wVmI5s2y2TFXQ/KMEPbta4grvEL
 mPzFbnh8WlHlMbsGlbQ6ALg/5eMbVARk3PuLjbyxyU03UjGwOdPZpM5aQ g==;
X-CSE-ConnectionGUID: zqhFua5qR3u1r4SplqwRoA==
X-CSE-MsgGUID: JATIjrN6R3KwZPEno36HcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904806"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904806"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:16 -0700
X-CSE-ConnectionGUID: 7T2kd6ptTEuOxl2MzKZIbA==
X-CSE-MsgGUID: B2O8Nx0EQZ6/5dyiy44DBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944255"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 18/43] drm/xe/pci: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:19 -0700
Message-ID: <20240904002100.2023834-63-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 04d34fd015ce..b8012d3a8b89 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -472,13 +472,15 @@ enum xe_gmdid_type {
 
 static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
 {
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct xe_reg gmdid_reg = GMD_ID;
 	u32 val;
 
 	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
 
 	if (IS_SRIOV_VF(xe)) {
+		struct xe_gt *gt = xe_root_mmio_gt(xe);
+
 		/*
 		 * To get the value of the GMDID register, VFs must obtain it
 		 * from the GuC using MMIO communication.
@@ -514,14 +516,15 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
 	} else {
 		/*
-		 * We need to apply the GSI offset explicitly here as at this
-		 * point the xe_gt is not fully uninitialized and only basic
-		 * access to MMIO registers is possible.
+		 * We need to apply the GSI offset explicitly here since we're
+		 * reading through the tile-level MMIO accessor (at this
+		 * point the GT is not fully uninitialized and only basic
+		 * access to MMIO registers is possible).
 		 */
 		if (type == GMDID_MEDIA)
 			gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
 
-		val = xe_mmio_read32(gt, gmdid_reg);
+		val = xe_mmio_read32(mmio, gmdid_reg);
 	}
 
 	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
-- 
2.45.2

