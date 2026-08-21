Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43644C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 07:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049B910F263;
	Fri, 21 Aug 2026 07:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSHb3TRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E23210F262
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 07:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787298248; x=1818834248;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+KnGYCy+CT2fgKcGG4d4DCmxnPckb1txzVWKE1hGMUo=;
 b=cSHb3TRlVANXv++gnWXSa1pinfSs58U+rtX3YYvfCTnYKuftDpFQq0mT
 tknfTbf6nkQ5Qre6TmK/u5az7MdVxku9nVWSEopbf7qEFxxkf8uLOKfP2
 H5hHDv8mU0FrEJZh+LHKKnAv2Nk95OIHRv/9IGbDXkKveRUdpmx7dBv+8
 Q/9Q1ZQzxbg6ll35cTMzxl7/ezRowFrRze2eFEdtGQDWmP9nMqlOoZM7T
 /N2p1KRzNtu26FsSNM0UzJgUJXa/7Ev9xnm5dPlP42/ddi5f1pMXd2cIs
 GRWhfEROSPDFI5Bk+hKg11OZAm7eG32DbAVEMbCczhcY51J2Utw3ZXRNV g==;
X-CSE-ConnectionGUID: sWzW4JyMT16dvXaR0/LVTA==
X-CSE-MsgGUID: K9w3Ue+xQ52LyROBTVIVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87971611"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87971611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 00:44:08 -0700
X-CSE-ConnectionGUID: EKHeqs01Td2HwPgYPNqakw==
X-CSE-MsgGUID: BHhJGPHlR1m5auwGAWyc2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="296173587"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 21 Aug 2026 00:44:06 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue
 GTs
Date: Fri, 21 Aug 2026 13:12:38 +0530
Message-ID: <20260821074238.3000501-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Engines cache GGTT translations in their own TLBs, which the
xe_tlb_inval_ggtt() does not touch.
After a GGTT unmap the engines can still hit the stale translation and
read the old page.

Issue a FULL_INTRA_VF invalidation on GGTT unmap, gated on the GT
having any multi-queue engine class.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 3564345fd740..60eb9a3d29cc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -458,6 +458,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
 
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 {
@@ -493,8 +494,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 			      xe_ggtt_node_size(node), use_scratch);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
-	if (bound && node->invalidate_on_remove)
+	if (bound && node->invalidate_on_remove) {
 		xe_ggtt_invalidate(ggtt);
+		/* Drain engine TLBs so a recycled range can't hit a stale entry. */
+		xe_ggtt_invalidate_engine(ggtt);
+	}
 	mutex_unlock(&ggtt->lock);
 
 	ggtt_node_fini(node);
@@ -603,6 +607,23 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
+/*
+ * Drain engine-side GGTT TLBs on teardown so a recycled range's next
+ * occupant can't hit a predecessor's cached translation.
+ */
+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
+{
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+	int err;
+
+	if (!gt || !gt->info.multi_queue_engine_class_mask)
+		return;
+
+	err = xe_tlb_inval_ggtt_full(&gt->tlb_inval);
+	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
+		   ERR_PTR(err));
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
-- 
2.46.0

