Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C024EC87FDC
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059F510E5FB;
	Thu,  1 Jun 2023 21:52:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE0C10E61B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656371; x=1717192371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+i+UyGPn3a6hn+BU3u4xKWISVjukz/QLcZzIkVSxgws=;
 b=FpofO+41Gbeal6PHv9OTESRX4k54CNuc8CqcOendC6YvxA+6NlSX2xqy
 q+YqrLIFMfbgs680D1GyznqJZp8AvihJArX2j2lcqM+35WL2eSQr3YF0C
 v9m5UD4JNqzpnpK5PbMzs+Y6MfvDSdJExSZY6D8rSuUNvg8FEbH8zeb/K
 Qy8Ppxg5VEZqw3Op3PmAEMUVCo7XFg0vFuXt08th+f4fQoiUv6/+jyzlX
 BthIe0gBxkomGKxkesrQbY+bJpu/32EYZSwlcJXgAEjSD0XcVaqD2hs8j
 sFca7kDUcrNBFJBHz/gi0wRY/UCv5UddikWaDp0DiYPc2lZSfMuO9X4QW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313645"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313645"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563644"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563644"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:43 -0700
Message-Id: <20230601215244.678611-31-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 30/31] drm/xe: Reinstate media GT support
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

