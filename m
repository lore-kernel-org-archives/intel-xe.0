Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D35C7EE32
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F0010E528;
	Thu,  1 Jun 2023 00:04:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED4110E51E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577857; x=1717113857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+i+UyGPn3a6hn+BU3u4xKWISVjukz/QLcZzIkVSxgws=;
 b=KGEhm6lGhw/H54NjY/sRwD7xmnsjAiOiibMmyCtT5S+yqmkc1BfqnvHB
 Kg/8Qy3iYrUNWIc8E5uWMiQyscU3haFNn6QHImMfz5JdtYbFgM8S0cnqr
 fToqJTHHksO45alBd4WOLKLMn+PdQtfuvQaUYWYAtqzXYOTDE2pMrHL0E
 hNd+v7O5D8JpOcyz4RjEC/lq/MlW/Ov5zqjtUkrQP+AutfreqGPLJdwBA
 cw9irN45VfbqYjv5VC7YmeZjS2mNZ/F93BoG63/d5brS1dvvSw0Hnca7m
 VxuE0H7jSzkXmM6GDWSKvh9XkrcL7nWksmgE/tXrcPhQdzbAFPI0fUpYm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996876"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996876"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556250"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556250"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:04:02 -0700
Message-Id: <20230601000403.432517-31-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 30/31] drm/xe: Reinstate media GT support
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

Now that tiles and GTs are handled separately and other prerequisite
changes are in place, we're ready to re-enable the media GT.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 ++++++++
 drivers/gpu/drm/xe/xe_pci.c          | 26 +++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index b6ef531ca930..0f920175526e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -8,6 +8,14 @@
 
 #include "regs/xe_reg_defs.h"
 
+/*
+ * The GSI register range [0x0 - 0x40000) is replicated at a higher offset
+ * for the media GT.  xe_mmio and xe_gt_mcr functions will automatically
+ * translate offsets by MEDIA_GT_GSI_OFFSET when operating on the media GT.
+ */
+#define MEDIA_GT_GSI_OFFSET				0x380000
+#define MEDIA_GT_GSI_LENGTH				0x40000
+
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0					XE_REG(0xd00)
 #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 51207e94b254..bd1f59b49928 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -566,7 +566,31 @@ static int xe_info_init(struct xe_device *xe,
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.__engine_mask |= media_desc->hw_engine_mask;
 
-		/* TODO: Init media GT, if present */
+		if (MEDIA_VER(xe) < 13 || !media_desc)
+			continue;
+
+		/*
+		 * Allocate and setup media GT for platforms with standalone
+		 * media.
+		 */
+		tile->media_gt = xe_gt_alloc(tile);
+		if (IS_ERR(tile->media_gt))
+			return PTR_ERR(tile->media_gt);
+
+		gt = tile->media_gt;
+		gt->info.type = XE_GT_TYPE_MEDIA;
+		gt->info.__engine_mask = media_desc->hw_engine_mask;
+		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
+		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
+
+		/*
+		 * FIXME: At the moment multi-tile and standalone media are
+		 * mutually exclusive on current platforms.  We'll need to
+		 * come up with a better way to number GTs if we ever wind
+		 * up with platforms that support both together.
+		 */
+		drm_WARN_ON(&xe->drm, id != 0);
+		gt->info.id = 1;
 	}
 
 	return 0;
-- 
2.40.1

