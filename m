Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE0AC6FA99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 00:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858410E14C;
	Wed,  8 Mar 2023 00:55:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E0E10E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 00:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678236914; x=1709772914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p9N7VpVy4kAPfwudRsNyiK57W1npmODu/ZIsLQBs66A=;
 b=hxSRAkgNu92yZctcYWum2tFPmylDXT5qJNyz9lnvWCh3pgGzXnOJVmMj
 DuPz49G9XsYGyovmuHHVyg80L6N6xPB1KTT6xyCtuz5jZF2qyO2eeBFhv
 WoXngbZnnlwvJhgcv906dr952d2YyeZ33eiUtGVfOmnQ6qBlgrHMvcwv1
 Kwo2M2niBJiefBQhNGI4vdLCyG9ia6Ogzyv5PZX8yWxY4PsRROLouHsrx
 aQV/lombXcAXUkydxnMG3xGxPNa2y+U+x9mnjP/KCcqqMEeRlW8Bx8Asq
 UYXhWfzppcBTteh9T1uflxgDudQ3oSdOMomLyj1IFzjeLybUHnmg4mdLb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319847491"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="319847491"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 16:55:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800559681"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="800559681"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 16:55:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 16:55:08 -0800
Message-Id: <20230308005509.2975663-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/guc: Handle regset overflow check for
 entire GT
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

Checking whether a single engine's register save/restore entries
overflow the expected/pre-allocated GuC ADS regset area isn't terribly
useful; we actually want to check whether the combined entries from all
engines on the GT overflow the regset space.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 7a892ff7aba3..fd9911ffeae4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -482,8 +482,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
-	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
-
 	return count;
 }
 
@@ -496,6 +494,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 	u32 addr = xe_bo_ggtt_addr(ads->bo) + regset_offset;
 	struct iosys_map regset_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
 							    regset_offset);
+	unsigned int regset_used = 0;
 
 	for_each_hw_engine(hwe, gt, id) {
 		unsigned int count;
@@ -521,7 +520,11 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 
 		addr += count * sizeof(struct guc_mmio_reg);
 		iosys_map_incr(&regset_map, count * sizeof(struct guc_mmio_reg));
+
+		regset_used += count * sizeof(struct guc_mmio_reg);
 	}
+
+	XE_BUG_ON(regset_used > ads->regset_size);
 }
 
 static void guc_um_init_params(struct xe_guc_ads *ads)
-- 
2.39.2

