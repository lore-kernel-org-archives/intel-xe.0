Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA8FCD4F54
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C913910E33D;
	Mon, 18 May 2026 19:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjFEW7Xr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1D010E14A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132358; x=1810668358;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=D3rWqIobQdH5G82bh6eTlredloxIEhxd8oI5jTW6AN8=;
 b=DjFEW7Xr5S2t44X7Xxnm7LlFaeSh2OBgHaKrYzGRndxYcyaGVq4vfmAd
 Lx8hUUdfLLnn2BpamRgfcFoAa6ZDGp8c8kNI6triPDHLx5JmBw3yTuG5e
 QegvCO2LXdJYyEyDIplJkHbmvjS40iKCIiQTDYqQ3eiwlIXNE1UPPyhkh
 8LpRe7RDdB3zg/oXHtV81EvtPSpCprp9hzlZ8VFvmWBK1SxtHd9dlvRe9
 67hFqck+vDMwWbb23duU2zRL2qvxM8EDQlamxbLVn21mANDdIK+Cie4UR
 nznOh/w0YChggWxmf69jz3jLxJaRKDK0xqETDGyh6vw8JCGGbzZi5a2zw g==;
X-CSE-ConnectionGUID: kRRhZKLFSCCQbPVAGDe8HQ==
X-CSE-MsgGUID: FWtSJzRoTFSSK0wt4614sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304786"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:57 -0700
X-CSE-ConnectionGUID: 7j006pKUQcCLg5mtoCfWzQ==
X-CSE-MsgGUID: fetmGcTLQlqnUuc6Hdr7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276015"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/xe: Add IRQ page to HW engine definition
Date: Mon, 18 May 2026 21:25:39 +0200
Message-ID: <20260518192547.600-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518192547.600-1-michal.wajdeczko@intel.com>
References: <20260518192547.600-1-michal.wajdeczko@intel.com>
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

For each HW engine definition, we already make changes to the IRQ
offset, as required when using MSI-X, but we leave actual MEMIRQ
page selection to the MEMIRQ handler, repeated on every interrupt.

As a preparation step to simplify the MEMIRQ handler, store the
MEMIRQ page number as part of the HW engine definition.

Suggested-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 11 ++++++++---
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 05f0932dbb94..8c66ff6f3d3c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -514,9 +514,14 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->class = info->class;
 	hwe->instance = info->instance;
 	hwe->mmio_base = info->mmio_base;
-	hwe->irq_offset = xe_device_has_msix(gt_to_xe(gt)) ?
-		get_msix_irq_offset(gt, info->class) :
-		info->irq_offset;
+	if (xe_device_has_msix(gt_to_xe(gt))) {
+		hwe->irq_offset = get_msix_irq_offset(gt, info->class);
+		hwe->irq_page = info->instance;
+
+	} else {
+		hwe->irq_offset = info->irq_offset;
+		hwe->irq_page = 0;
+	}
 	hwe->domain = info->domain;
 	hwe->name = info->name;
 	hwe->fence_irq = &gt->fence_irq[info->class];
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 0f87128c6529..2cf898e682f5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -118,6 +118,8 @@ struct xe_hw_engine {
 	u16 logical_instance;
 	/** @irq_offset: IRQ offset of this hw engine */
 	u16 irq_offset;
+	/** @irq_page: MEMIRQ page used by this HW engine */
+	u16 irq_page;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/**
-- 
2.47.1

