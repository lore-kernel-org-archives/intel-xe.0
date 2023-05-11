Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DBDC7EE37
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179C910E59F;
	Thu, 11 May 2023 03:47:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C287710E591
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h0YQqu6/YQ+HCmCLW722b5WcZ+Ibv8AAXwSRXTuFlTo=;
 b=Ki2HHCIKJDhDA+33ONZgPJ/XisYbKk4Xah2YTeayaAoJu77debCfp1pd
 Lp20qN0WcT7DZv7m1T9TlJA9+QfmyqeRcytwmeUsZUMcFTi0PyH4qK9lc
 yh5zS3gRYQKXH5VKw7BqFxpnW6cErwUWA220lAcJNdXawDY6KjngDjsC0
 rpOFd/Bu6F0H/JHNTvTSEO/ZJHmIXITTAlrgWraQV6uL/owPMcpSy2qPv
 S/GJz+R093fhKE7ngl7B1zZ2JTl6GkvpimY9V/haBmwhugK+PysiUYypP
 CRU6oMsJf2ChLV0TWDmWaXNDmv+61CKmDgiKl9LdwSrpyavYdiaSULc+V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850655"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850655"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203253"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203253"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:21 -0700
Message-Id: <20230511034722.1929038-26-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 25/26] drm/xe: Reinstate media GT support
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
index 7d5e65d34f39..e24f51560ed8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -530,7 +530,31 @@ static int xe_info_init(struct xe_device *xe,
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

