Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF29FEE01F4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE8C10E941;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHjjJk2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54FA10E93B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OCQyV5iqCVr0zjkuByKhktD7BuP9fPQ2+hSIRFClPKg=;
 b=YHjjJk2hna0P2q4Rz+Gc15uRCU78zpKNXXqDQaKJYJj8Pck4vtbLNv8O
 o8le43UE24tTkBUsM7IcS6QvvT61gYhx6YAfA5ke7fhl7Q3E0N4AtKASY
 cyKcLPXAaaVLtcY1c0DeVAU1giuqmH9yFVNZO89zeWW9rOv4Bye8tsDPm
 frlYwDBfgswZM6VAB569kc4f9wPc6XA/cb0Iy2OlHg61MOPrX2w6YShhv
 PBgO1kzRCFFt6rLSQfjn8Ehvv1oKY0x8GDPGNoft2C3nBKVEw0nybiZbR
 w9hEVYPPqigG0XlaRAQDMaJhQXHb+yVYYf4+oQx2mFpbDZKxR4PO48Adp w==;
X-CSE-ConnectionGUID: 9nhtiyfCSIGqFvRsTZmQjQ==
X-CSE-MsgGUID: LRmYwJPbQz+3nEzzf6jG1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144309"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144309"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
X-CSE-ConnectionGUID: lLIY2VC8QKKC7wvQF7Dy8w==
X-CSE-MsgGUID: HjkAAYSHQCmoj1F3CLTbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989595"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 18/43] drm/xe/pci: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:38 -0700
Message-ID: <20240910234719.3335472-63-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

v2:
 - Clarify comment about manual GSI offset handling.  (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index aa0c29450b4a..5ba4ec229494 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -473,13 +473,15 @@ enum xe_gmdid_type {
 
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
@@ -515,14 +517,17 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
 	} else {
 		/*
-		 * We need to apply the GSI offset explicitly here as at this
-		 * point the xe_gt is not fully uninitialized and only basic
-		 * access to MMIO registers is possible.
+		 * GMD_ID is a GT register, but at this point in the driver
+		 * init we haven't fully initialized the GT yet so we need to
+		 * read the register with the tile's MMIO accessor.  That means
+		 * we need to apply the GSI offset manually since it won't get
+		 * automatically added as it would if we were using a GT mmio
+		 * accessor.
 		 */
 		if (type == GMDID_MEDIA)
 			gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
 
-		val = xe_mmio_read32(gt, gmdid_reg);
+		val = xe_mmio_read32(mmio, gmdid_reg);
 	}
 
 	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
-- 
2.45.2

