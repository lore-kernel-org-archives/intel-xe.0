Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C32FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC2510EBC5;
	Tue, 28 Apr 2026 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo+Yl/93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524BA10EB1E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386472; x=1808922472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hQT6S9m9jPe+AqQSy+gRJnZxjm237bEk3K8Lipd1PUc=;
 b=jo+Yl/93y4B8dfFLpLDDkAa4wIdqVa5P2PnzZCGY26ieaoQgOTvnAD7r
 ZLqcwkLJyeIYW1Bu/kRT+jI9gXHnw/BS75w3JF7mtXFtZKa/QmWJTbhrM
 DI0mloMpI1cJZx41O+yHyOrhHfp6OEF3FcjvC84fWX7GPxIslSO1WyRek
 J91yL9sGZ9Tl//72aazmF4NdjwIM9iYr0do6qhBmbq0/FPO5ASImYXjvl
 0kk8Br3D3kkPXhYG/891yEv9B4MMjBE7ArjLhi/Ji6l+uLfrBMLPAX4u6
 v1kf29W1BfjyRO14rIIScCH3S3poXgXTUiBMxPoiIjeHuyA9MKcSZzJNY Q==;
X-CSE-ConnectionGUID: A/yPnfBpRMK7Gzi7OAwdTw==
X-CSE-MsgGUID: 3YP7lnH4T16L2WM8R5LCeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862341"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862341"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:52 -0700
X-CSE-ConnectionGUID: szEALwjXTNi2e5GYvkO4BA==
X-CSE-MsgGUID: nmWRmh/oTXm+WqU4X0gyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942436"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 12/13] drm/xe/memirq: Dump additional source pages if MSI-X
Date: Tue, 28 Apr 2026 16:27:19 +0200
Message-ID: <20260428142722.582-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

In MSI-X setup engines report their source/status as instance 0
and we should dump additional source pages, not just the first one.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 35 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_memirq_types.h |  2 ++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 30266b258087..b6fdefaf9463 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -169,6 +169,21 @@ static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 	return xe_device_has_msix(memirq_to_xe(memirq));
 }
 
+static unsigned int max_instance(struct xe_tile *tile)
+{
+	enum xe_engine_class ec;
+	struct xe_gt *gt;
+	unsigned int id;
+	u32 emask = 0;
+
+	for_each_gt_on_tile(gt, tile, id) {
+		for (ec = XE_ENGINE_CLASS_RENDER; ec < XE_ENGINE_CLASS_MAX; ec++)
+			emask |= xe_hw_engine_mask_per_class(gt, ec);
+	}
+
+	return fls(emask);
+}
+
 static int memirq_alloc_pages(struct xe_memirq *memirq)
 {
 	struct xe_device *xe = memirq_to_xe(memirq);
@@ -210,6 +225,9 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
 		     XE_MEMIRQ_STATUS_OFFSET(0));
 
+	memirq->num_pages = hw_reports_to_instance_zero(memirq) ? max_instance(tile) : 1;
+	memirq_debug(memirq, "page instances: %u\n", memirq->num_pages);
+
 	return 0;
 
 out:
@@ -525,6 +543,18 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
 				       guc_name(guc));
 }
 
+static void memirq_dump_source_pages(struct xe_memirq *memirq)
+{
+	memirq_assert(memirq, !memirq->source.is_iomem);
+
+	for (int n = 0; n < memirq->num_pages; n++) {
+		memirq_debug(memirq, "SOURCE %*ph\n", 32,
+			     memirq->bo->vmap.vaddr + memirq_source_page_offset(memirq, n));
+		memirq_debug(memirq, "SOURCE %*ph\n", 32,
+			     memirq->bo->vmap.vaddr + memirq_source_page_offset(memirq, n) + 32);
+	}
+}
+
 /**
  * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
  * @memirq: the &xe_memirq
@@ -544,9 +574,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 	if (!memirq->bo)
 		return;
 
-	memirq_assert(memirq, !memirq->source.is_iomem);
-	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
-	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ))
+		memirq_dump_source_pages(memirq);
 
 	for_each_gt(gt, xe, gtid) {
 		if (gt->tile != tile)
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
index 02ac938cadb4..eab384342878 100644
--- a/drivers/gpu/drm/xe/xe_memirq_types.h
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -14,6 +14,7 @@ struct xe_bo;
  * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
  *
  * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
+ * @num_pages: number of per-instance source/status pages.
  * @source: iosys pointer to `Interrupt Source Report Page`_.
  * @status: iosys pointer to `Interrupt Status Report Page`_.
  * @mask: iosys pointer to Interrupt Enable Mask.
@@ -21,6 +22,7 @@ struct xe_bo;
  */
 struct xe_memirq {
 	struct xe_bo *bo;
+	unsigned int num_pages;
 	struct iosys_map source;
 	struct iosys_map status;
 	struct iosys_map mask;
-- 
2.47.1

