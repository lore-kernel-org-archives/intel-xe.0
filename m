Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C2C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91E10E62A;
	Fri, 19 May 2023 23:19:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107F10E4D4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538331; x=1716074331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJBrq4nzZVLcMkMXmzx5KK+ZpvpsqFSQ50gwyHmPob4=;
 b=EJkbNFBtXfubHnqlYzevAj+S1N7L6uOVKsDaHrjO7gYojeM1Pis4TQli
 79fIx1FojQlRbcT55iWCRBRhIrzzwt7zrY1Xtw2LX1VzTJttEfZUaWGU4
 hSMrSl2bvlfnwKaop2vzkmscQ8dfa9oMzhVqsRI6UfKaWnC+xpMrUscjT
 ZK/lXYVPL5CgbvtntUH+qkatno5i/51Ltj+DiPG35/uCiNgsUQj1VSgHv
 iqgXI8DWAXkFPHrWrZkC9oUU+7GDWgLwLYVIVegLHcB88Pf4LI1LbfO2V
 7ns4UqQaWHJC/RWAr2jsegJbjPf95Inw90iWPJhEjANw8EXMk3Sc5rdrX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526387"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888773"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888773"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:26 -0700
Message-Id: <20230519231827.3572452-30-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 29/30] drm/xe: Reinstate media GT support
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

Now that tiles and GTs are handled separately and other prerequisite
changes are in place, we're ready to re-enable the media GT.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 ++++++++
 drivers/gpu/drm/xe/xe_pci.c          | 26 +++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4d87f1fe010d..26247725e0d8 100644
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
index bc0ed2a0e44f..890625598209 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -552,7 +552,31 @@ static int xe_info_init(struct xe_device *xe,
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
2.40.0

