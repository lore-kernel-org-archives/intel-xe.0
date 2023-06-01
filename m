Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25142C7EE31
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558ED10E5E7;
	Thu,  1 Jun 2023 21:52:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30610E5DC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656368; x=1717192368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKRvsPtB2rEFah1k9R/rXrG1cU7Idf1Ouq8rOu5SiUc=;
 b=LE5mKvV8tw68CD6gPSLEIWRiN8Ya15wg1WUvYGHdHkE6MkU7VRTOAz8X
 07vy6ezMLUZETYmfvkm9GCHVMXbSiwZ8sRB9njQ6MT32gQxIRTiWyRkzd
 xinRkBK8mBX8W9oCy96+WwO5UgzeebpU7PtfW8/C2KdnB1IKSrjsit72c
 maBJLllPNnFGzIPC2Tv7r16Yyse/9PyHHCv4TjVZJ1TuuCwv81gsP2YGd
 4WaNTIN6u2dx0dum0ucNzXlNhLKH5tPAGQGtp5Co7knJTB7nmkeuBmqKm
 cxJXo/NMJ7wVwc8vbA3wxt3eNryAB/ykOBcA1Ip9QYU0K+IHAlLbvuZ6/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313614"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313614"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563597"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563597"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:29 -0700
Message-Id: <20230601215244.678611-17-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 16/31] drm/xe: Drop vram_id
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The VRAM ID is always the tile ID; there's no need to track it
separately within a GT.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7fc91e7ec5a7..4cb4b5810f40 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -33,7 +33,6 @@ struct xe_subplatform_desc {
 
 struct xe_gt_desc {
 	enum xe_gt_type type;
-	u8 vram_id;
 	u32 mmio_adj_limit;
 	u32 mmio_adj_offset;
 };
@@ -275,7 +274,6 @@ static const struct xe_device_desc dg2_desc = {
 static const struct xe_gt_desc pvc_gts[] = {
 	{
 		.type = XE_GT_TYPE_REMOTE,
-		.vram_id = 1,
 		.mmio_adj_limit = 0,
 		.mmio_adj_offset = 0,
 	},
-- 
2.40.1

