Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59010C87FDE
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3936A10E442;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7DA10E439
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481373; x=1717017373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bet7svweh/Vg9Irx02ZqLhYS+mKoVygOaeRYJ7Yerig=;
 b=PWWKI2VH7vzylrmEFKcwnr2L32PwdUAjlxNTqHQAW+Q0xfj5Nzof50pB
 l328tRSZBNYlxqbrPqDTQynuw8BSk1MjzWU23RUlPyC2vinsVYkpsblg8
 uFrN/EZrzjqvS0yVJS/8xfgaQgJYLWeY2EtSRdJDvEKuGHA9IwmyZmzTI
 8FrBWS+KI36xAZKadtqBpxcTP8Jw4LAW+7cKYQ7YrpzWcU9mr5tsEt4jd
 IFmrNMH6+qD7Y/StaYkhdPkSDLkrHewYDg++8hm09812B5mHLu1vGm1t5
 e4FIGNaggBTY1s5ekXfEId6LPirmSvg9MpqUi1g4008fh4R86e4MY/GKP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311971"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311971"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139500"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139500"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:48 -0700
Message-Id: <20230530211549.2632538-31-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 30/31] drm/xe: Reinstate media GT support
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
index ddb256a4e39c..a5212ff3aacf 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -562,7 +562,31 @@ static int xe_info_init(struct xe_device *xe,
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

