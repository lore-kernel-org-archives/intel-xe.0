Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F44C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C289F10E5B9;
	Tue, 15 Sep 2026 07:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZpHfdQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B740610E25C
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789456336; x=1820992336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QfRbFDqYcQfNoV0whtY0vUMxcA1UYviFv9PYEBmRctg=;
 b=DZpHfdQN8gRzRMp3T4Waxx9DzPlCOnQpmvsolDs8D/kjD7cyqnxbnRxh
 mkNsZxaJniAesw7p9k7QXfyuiGMDr/g20pVWtuCOyWCyklb9YBu0o/GNx
 ae+9R1zU64a22G8v+KM5hCNxN1eu6xjS+EB3I58kMOrt4IqngZJqGKjqQ
 JeO7tW0evISQrmNmN/VjNlK2F1LrxDWX/c6y/nuFFjh/u8VzqQfckHfgn
 SNZetHodXj8V4eXPOb0UaibaLbB5W/8kT25F1rVHKdelopOrVh9l1WGM3
 /b067e6q27g4I/YnQjR8pOp1oYux8RRth5g9QbQNgo8lEHg0klfjNZ8r1 g==;
X-CSE-ConnectionGUID: IDmTRX+iR5+HTVzkvxdFjA==
X-CSE-MsgGUID: +boF8qC3Q+COlAkmE5hvyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93511750"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93511750"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:12:16 -0700
X-CSE-ConnectionGUID: BiCgohDUSMGCFWKHNirEaA==
X-CSE-MsgGUID: /psSMhiJQUazGrmvUdsUyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1081598"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 15 Sep 2026 00:12:14 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 05/10] drm/xe/ggtt: Avoid integer overflow when validating
 VF GGTT range
Date: Tue, 15 Sep 2026 12:42:02 +0530
Message-ID: <20260915071159.51402-17-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use check_add_overflow() for the VF range check, and rearrange the
subsequent clamping into the subtraction form so the expression
does not overflow.

Fixes: e904c56ba6e0 ("drm/xe: Rewrite GGTT VF initialization")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7cac01cef1ee..d65929720704 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -8,6 +8,7 @@
 #include <kunit/visibility.h>
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/overflow.h>
 #include <linux/sizes.h>
 
 #include <drm/drm_drv.h>
@@ -394,7 +395,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size, ggtt_end;
 	int err;
 
 	if (!IS_SRIOV_VF(xe)) {
@@ -413,9 +414,11 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
 
 		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
-				    ggtt_start, ggtt_start + ggtt_size - 1);
+		    check_add_overflow(ggtt_start, ggtt_size, &ggtt_end) ||
+		    ggtt_end > GUC_GGTT_TOP) {
+			xe_tile_err(ggtt->tile,
+				    "Invalid GGTT configuration: base %#llx, size %#llx\n",
+				    ggtt_start, ggtt_size);
 			return -ERANGE;
 		}
 	}
@@ -424,7 +427,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (xe_vram_needs_64k(xe))
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
+	if (ggtt_size > GUC_GGTT_TOP - ggtt_start)
 		ggtt_size = GUC_GGTT_TOP - ggtt_start;
 
 	if (GRAPHICS_VERx100(xe) >= 1270)
-- 
2.53.0

