Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A1FC982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AA210E5C1;
	Mon, 21 Sep 2026 09:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+yf5O+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308B510E5B9
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982479; x=1821518479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KbqR5IvFgwedOJG44iWDWLem9mgg/JM138Rf8fGF9a0=;
 b=n+yf5O+EgQGE/xRafznG6bmi5gVIzsDptNFd+or8kDa+feMSVLCCluT9
 qLU9GwXDhgu3beRK90efJzRAplkTJ6aU5oEve48PKa/ErfKccSQw+obTk
 uOpyo5kLfknMTira/fZ6WFw75jYgtpvEh7Tw1OPOZwMsEqQPeGZ/jg8ST
 nV5cxM82ARp6oYXalfzU0dQcj2Vc0VFvVgnbUhfDXGq592a86TRFJT1dF
 +XshE+WCo2imm5J6+j+8Fbk7rfjYndtL8Npys8fYfLkhCDxKHq2TgHROC
 ouDWNScmALjsvLZ/bS/mcLEVzjjJZtA/rizkhRFyClPD11mkK9y9aS0SE g==;
X-CSE-ConnectionGUID: bLyUtV/iQ3qdmsvEr9Umbg==
X-CSE-MsgGUID: 6zpoPt4nQDevLkL5hBpVzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606612"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606612"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:19 -0700
X-CSE-ConnectionGUID: LXg6rAsgTM+rqRDF+lFvHg==
X-CSE-MsgGUID: +eRMjhw7SW+3F3/L9BNQEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578414"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:17 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Sashiko <sashiko-bot@kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v10 05/10] drm/xe/ggtt: Avoid integer overflow when validating
 VF GGTT range
Date: Mon, 21 Sep 2026 14:51:04 +0530
Message-ID: <20260921092101.1243989-17-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260728095026.2197333-6-satyanarayana.k.v.p%40intel.com
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
V9 -> V10:
- Cleanup old stale code added in the previous revision.

V8 -> V9:
- Fixed review comments (Michal W).
- Used check_add_overflow() for range checks (Michal W).
---
 drivers/gpu/drm/xe/xe_ggtt.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7cac01cef1ee..2557e51bb7cc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -8,6 +8,7 @@
 #include <kunit/visibility.h>
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/overflow.h>
 #include <linux/sizes.h>
 
 #include <drm/drm_drv.h>
@@ -393,8 +394,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u64 ggtt_start, ggtt_size, ggtt_end;
+	u64 wopcm = xe_wopcm_size(xe);
 	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
 	int err;
 
 	if (!IS_SRIOV_VF(xe)) {
@@ -408,14 +410,21 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		}
 		ggtt_start = wopcm;
 		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
+
+		if (check_add_overflow(ggtt_start, ggtt_size, &ggtt_end) ||
+		    ggtt_end > GUC_GGTT_TOP)
+			ggtt_size = GUC_GGTT_TOP - ggtt_start;
+
 	} else {
 		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
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
@@ -424,9 +433,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (xe_vram_needs_64k(xe))
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
-- 
2.53.0

