Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DB3C54F94
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 14:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0E710E033;
	Wed, 15 Nov 2023 14:38:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6666210E010
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700059132; x=1731595132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jn1jw2SFTfZdXSuBj05CuxvxEjj/rgb4wahu9J8AQ4E=;
 b=cZ0F5Kml8QXt1ktnReAd5w/xiCTefbjheYmrYsecOxqi/Oyuc6HCfghh
 wYIx4PhR1ZsDv1c1UQjgYLk4wiQVIF1BGetvDtf9m4RCRKuWRC0zVoHQD
 Zp0IikCLB2QaxbDgMua5f4CYVonCOC4uqXP6QnwK+wWpeT96U4P6RfrrI
 suHB0SbUEMThRyot9FzbOoRRCC7b+GQEkVt/iQe3TkE1EpAVGJ2UkHr8n
 z+RbxG935l6A2pjr+zsWSyFWN2Y7WfkXRM4rL6iSDTPXm3Nu+X/GS9Djb
 b8jUTORgtrTKtgEkxrMtRfIn4QCnsbJdVnOpOnPmWW9eXwJ7l5aHXTCE8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370231004"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370231004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="830964689"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="830964689"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:51 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 15:38:36 +0100
Message-Id: <20231115143838.2081-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115143838.2081-1-michal.wajdeczko@intel.com>
References: <20231115143838.2081-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Use dedicated function to read
 engine fuse registers
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

These registers are not directly exposed to VFs, use function that
will provide required data also when running as a VF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e831e63c5e48..1cf26c3c15c5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -496,7 +496,7 @@ static void read_media_fuses(struct xe_gt *gt)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
-	media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE);
+	media_fuse = xe_mmio_fuse_read32(gt, GT_VEBOX_VDBOX_DISABLE);
 
 	/*
 	 * Pre-Xe_HP platforms had register bits representing absent engines,
@@ -541,7 +541,7 @@ static void read_copy_fuses(struct xe_gt *gt)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
-	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
+	bcs_mask = xe_mmio_fuse_read32(gt, MIRROR_FUSE3);
 	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
 
 	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
@@ -588,7 +588,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 ccs_mask;
 
-	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
+	ccs_mask = xe_mmio_fuse_read32(gt, XEHP_FUSE4);
 	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
 
 	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
-- 
2.25.1

