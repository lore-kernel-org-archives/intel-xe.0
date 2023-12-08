Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A562EC10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 00:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD41110E22F;
	Fri,  8 Dec 2023 00:22:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD8510E1A7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 00:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701994950; x=1733530950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7eDE1fOv6N/fXrrUn3hWHa63HlskGzM31KZMtyhQk/s=;
 b=L1KiCE2VW6lsP4rdpJZDlzFJ6Dk8hhixFTd3n5JMN1oGh1Gf70Q33fS5
 x5MhKSABUPHDepKt8fuqq/3KhYHfDoLE3Tv7Ws30fY7cn7xzHfaZdqD62
 3fbrdqmGDxCLllVrKAFhpDnV1SFSGU+0Fhn/FVhp6iW/AGsggbqv/9AgL
 wM2CjTDC9AZHxY+k5S9KOvhtBOm2Ip5scXOcwQFHs5nz1u5zh6kbt7pVI
 fZCNKvZig1nzArpXqsvPJ2z/fkK+a0JMDeJhxCwMgOPrxdRf4AkJbOM8J
 ZE4GqrmRwTxuRxJocQRTz595OeXP4ZQLXBDPuPhP4eyI27I7LHa1DfbSJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1214056"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="1214056"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 16:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1019156276"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="1019156276"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 16:22:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/xe: Stash GMD_ID value in xe_gt
Date: Thu,  7 Dec 2023 16:22:20 -0800
Message-ID: <20231208002218.1287673-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208002218.1287673-4-matthew.d.roper@intel.com>
References: <20231208002218.1287673-4-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although we've stored the major and minor versions for graphics/media in
xe_device, it will be simpler to implement the uapi version query if we
also stash the raw register value in the GT itself.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6645fa158f09..357943c1ee8f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -385,6 +385,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
 	xe_gt_ccs_mode_sysfs_init(gt);
 
+	/*
+	 * Stash hardware-reported version.  Since this register does not exist
+	 * on pre-MTL platforms, reading it there will (correctly) return 0.
+	 */
+	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 4e48c4643163..4e7a4494a554 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -117,6 +117,8 @@ struct xe_gt {
 		 * hwconfig blob.
 		 */
 		u64 __engine_mask;
+		/** @gmdid: raw GMD_ID value from hardware */
+		u32 gmdid;
 	} info;
 
 	/**
-- 
2.43.0

