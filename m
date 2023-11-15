Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FDEC54F83
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 14:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA03C10E044;
	Wed, 15 Nov 2023 14:38:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830D10E010
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700059133; x=1731595133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PqL6bjXkCZvvFuLwA02+EB+Lq2svX8MfVrIkj3lekhs=;
 b=my035/4KD1I20FQ/+EFH0YaqCnGdDfKsZFaROLLIJXLFxW1AnK4jLCmb
 h6/JnSqwpUqa8/6ns5F/r1exkWg3bKxPg5GOyg5n7B/JOjF2cOzBM+hw8
 Qra5Q+OO5YseMg3pCxEb3mO4iXXsHxHORNi9BXxls934oYkZGDpCyYWVM
 sEauwDPXg5l20YPGgtethkX1pv4+8dxZzDV4BLSdiyw+7D/siHqA6kgDZ
 Bw+O7CrfM5/Iz3hqC5BzaHLIiy8jcTE5yr3ZL17rR0Ra+AmiGFPBxjoiC
 cyGiqYd8aF1XV/keSjRlDZi0OEhKqeEURpiIYa4S1XaNXxaStWRx+GkCm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370231009"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370231009"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="830964695"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="830964695"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:38:52 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 15:38:37 +0100
Message-Id: <20231115143838.2081-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115143838.2081-1-michal.wajdeczko@intel.com>
References: <20231115143838.2081-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe: Use dedicated function to read
 topology registers
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
 drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..0902f9ad392f 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -26,7 +26,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 
 	va_start(argp, numregs);
 	for (i = 0; i < numregs; i++)
-		fuse_val[i] = xe_mmio_read32(gt, va_arg(argp, struct xe_reg));
+		fuse_val[i] = xe_mmio_fuse_read32(gt, va_arg(argp, struct xe_reg));
 	va_end(argp);
 
 	bitmap_from_arr32(mask, fuse_val, numregs * 32);
@@ -36,7 +36,7 @@ static void
 load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
+	u32 reg_val = xe_mmio_fuse_read32(gt, XELP_EU_ENABLE);
 	u32 val = 0;
 	int i;
 
-- 
2.25.1

