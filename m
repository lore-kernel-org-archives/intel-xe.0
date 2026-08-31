Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39552C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C9210E75F;
	Mon, 31 Aug 2026 08:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0sMI1xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7151110E77B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165385; x=1819701385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rlu3OTg4Az8n35fVaggbiz1ABedxmxZc7cs1IwTy9eg=;
 b=Z0sMI1xsydiQ01QaFRCxJ36AtSOhDHZscFYErlKR6rFXgWNlypaUaP+w
 Eh2turSnm/88KvRBWTq1TcyZPaY5gqvUdX/zeJtU60IUSior6AmBoca6M
 tIQ8trKbN8IkHse2312y5/eDqpnoiPzA/N4zH+wHmBtsGdbFfGUmqDrmd
 CbE+5p5HEBU8BxIxwHx6JST+IlXWwoSfcnR1+08zn98SD1rBCGqllUdD6
 GhtfFvn2IFU2t5K39KLQ7lo1WA7s/GzbgKurn5ee6SV5WW1/IX6dQbRRB
 +mI44uTpo8kK8jW8mC9kPCWcNLvSZc7UmvaVN+oBEmqk2aQWQY3IPRERU g==;
X-CSE-ConnectionGUID: NkEx6RueSbq/6WK8oh4RJA==
X-CSE-MsgGUID: uduoWwurT5qmpPDyGN+tJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106089716"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106089716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:36:25 -0700
X-CSE-ConnectionGUID: 7I6SBYxgQR6XOTd2aXgESQ==
X-CSE-MsgGUID: t1vtS3xyREOncsTNILBM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293546350"
Received: from unknown (HELO ksatya-dev.iind.intel.com) ([10.190.229.72])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 01:36:23 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 06/10] drm/xe/ggtt: Avoid integer overflow when validating
 VF GGTT range
Date: Mon, 31 Aug 2026 14:06:08 +0530
Message-ID: <20260831083605.2115328-18-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
References: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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
V6 -> V7:
- New commit.
- Issue is reported by Sashiko.
---
 drivers/gpu/drm/xe/xe_ggtt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 4067125510c3..51d4f1d91637 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -8,6 +8,7 @@
 #include <kunit/visibility.h>
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/overflow.h>
 #include <linux/sizes.h>
 
 #include <drm/drm_drv.h>
@@ -393,7 +394,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size, ggtt_end;
 	int err;
 
 	if (!IS_SRIOV_VF(xe)) {
@@ -412,9 +413,11 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
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
@@ -423,7 +426,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (xe_vram_needs_64k(xe))
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
+	if (ggtt_size > GUC_GGTT_TOP - ggtt_start)
 		ggtt_size = GUC_GGTT_TOP - ggtt_start;
 
 	if (GRAPHICS_VERx100(xe) >= 1270)
-- 
2.53.0

