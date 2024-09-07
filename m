Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BA0E6FE4B
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0DD10EB36;
	Sat,  7 Sep 2024 00:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGELCI3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDDE10EB33
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3RdUvBctd1jC/ElRPonMBHhh3q8Ziea+0w08It6Hyw=;
 b=nGELCI3I4EMoqbPL0I9umTOcPIjGPBrwlfnEQdAGDVUbgoo8/wOCNAVl
 poj4rOuPZ+2qWOm/Npug2rd0b1vxUKcdDrmGbXO9Zr/BFsCjWlw46YWFR
 aa4583aY7FjMne9/ZMQdMHu4CKNIl4ZVJswh3N7+qRY2rM2mlFK2OX3M0
 gO7qm/cOyq/fAgoiu4C1/BzfjcTEpJWGy4N9ACCQODESCwEwKfhFXWK85
 KjzLhhP7KA4SyXlgLRWGHbrCqRt9RRGL67GsqQZn361pLl6pgRX8fbx3W
 8bH01NmPASOCFfzXX7lsSw1Sdi34D7s1MB+svDECGL29JaYAgn86gFiGQ w==;
X-CSE-ConnectionGUID: ITuB2GiZQ/KAecV/rXTfvw==
X-CSE-MsgGUID: ocRsj/EwQL+0xZJGaOEPiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855322"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: mZFq1y02Q/CBIquPPCrhMQ==
X-CSE-MsgGUID: eXnLEJ66QLm5sNnT0I/OSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792716"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 32/43] drm/xe/topology: Convert register access to use
 xe_mmio
Date: Fri,  6 Sep 2024 17:08:21 -0700
Message-ID: <20240907000748.2614020-77-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0662f71c6ede..651ba53623e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -25,7 +25,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 
 	va_start(argp, numregs);
 	for (i = 0; i < numregs; i++)
-		fuse_val[i] = xe_mmio_read32(gt, va_arg(argp, struct xe_reg));
+		fuse_val[i] = xe_mmio_read32(&gt->mmio, va_arg(argp, struct xe_reg));
 	va_end(argp);
 
 	bitmap_from_arr32(mask, fuse_val, numregs * 32);
@@ -35,7 +35,7 @@ static void
 load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
+	u32 reg_val = xe_mmio_read32(&gt->mmio, XELP_EU_ENABLE);
 	u32 val = 0;
 	int i;
 
@@ -127,7 +127,7 @@ static void
 load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
+	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
 
 	if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
@@ -141,7 +141,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 		xe_l3_bank_mask_t per_node = {};
 		xe_l3_bank_mask_t per_mask_bit = {};
 		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
-		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
+		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
 		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
 
 		bitmap_set_value8(per_mask_bit, 0x3, 0);
-- 
2.45.2

