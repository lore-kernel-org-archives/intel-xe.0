Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF9DCC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 15:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6170610E96C;
	Tue, 13 Oct 2026 15:25:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9445010EAA1
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791905105; x=1823441105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uc4eqsKzj/nNnG9SJYU3+L9KR7eOg5zd+YCavQ774BM=;
 b=CztkswzJTias7VT/mX6r+TA4BUFofkkX3rHR7Oo7HqpayXYsKn34K5ET
 XIAzJ4Ltyp5culVQCF/W6zq+2bDnybTSoSpfsCsboupRd2fRIZWtO5DPn
 bd9OD2o7K5rfzxjQoXQ3MIqw+gcXMnP3EJw28trjXqMFXt7kL3G8Fd4s8
 JH7OSH3BQKza4wgvpJ7cCd0jnIQ5BIw9VNTnGBcIQSQzD7NqBOW7XpTMH
 WUlbw6cJCwXljD0UzGWocr5rcDgIy4TLT39x0oufZQuQBtvD+deEEI7dQ
 lKF4Qtp3UIdVD7WKGD+OG4sR6spstfYp1F0Tm0PRKMuoJQVqMCXOlU4Hx Q==;
X-CSE-ConnectionGUID: CFsXf6uaSVWSrMMgdm7VKw==
X-CSE-MsgGUID: E1txKq5GQA6zJFGct4GD3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="621594"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="621594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:24:24 -0700
X-CSE-ConnectionGUID: XmNAufelS+yY/ihFwFFRLg==
X-CSE-MsgGUID: AT2RUUdIQ9KkPp0D/kuIyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1116818"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa005.jf.intel.com with ESMTP; 13 Oct 2026 08:24:21 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v7 1/3] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
Date: Tue, 13 Oct 2026 15:24:18 +0000
Message-ID: <20261013152417.3189567-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
References: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The VF memory IRQ handler iterates over HW engines whose names are set.
Engine teardown clears hwe->gt but leaves hwe->name set, so the handler
can select an engine whose GT has already been invalidated. This can
cause a NULL pointer dereference in xe_hw_engine_handle_irq().

Invalidate the engine name during teardown so subsequent engine scans
skip it.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Fixes: 6eb2aad402cc ("drm/xe: Move hw_engine_fini to devm managed")
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
V3 -> V4:
- Fix issue with xe_execlist_port_destroy() with V3 version (Sashiko).

V2 -> V3:
- Updated spin_lock_irq() to spin_lock_irqsave().

V1 -> V2:
- Fix race with xe_memirq_handler() and hw_engine_fini() (Sashiko & Piotr).
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 17 ++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.c       |  3 +++
 drivers/gpu/drm/xe/xe_memirq.c    |  3 +++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 265f95c0c899..55ee0c892c1e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -275,11 +275,22 @@ static const struct engine_info engine_infos[] = {
 static void hw_engine_fini(void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
+	struct xe_gt *gt = hwe->gt;
+
+	if (gt) {
+		struct xe_device *xe = gt_to_xe(gt);
+		unsigned long flags;
 
-	if (hwe->exl_port)
-		xe_execlist_port_destroy(hwe->exl_port);
+		if (hwe->exl_port)
+			xe_execlist_port_destroy(hwe->exl_port);
 
-	hwe->gt = NULL;
+		spin_lock_irqsave(&xe->irq.lock, flags);
+		hwe->name = NULL;
+		hwe->gt = NULL;
+		spin_unlock_irqrestore(&xe->irq.lock, flags);
+	} else {
+		hwe->name = NULL;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..b394c8edf89c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -908,6 +908,7 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct xe_tile *tile;
+	unsigned long flags;
 	struct xe_gt *gt;
 
 	if (!atomic_read(&xe->irq.enabled))
@@ -922,8 +923,10 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 			if (gt->tile != tile)
 				continue;
 
+			spin_lock_irqsave(&xe->irq.lock, flags);
 			for_each_hw_engine(hwe, gt, id)
 				xe_memirq_hwe_handler(memirq, hwe);
+			spin_unlock_irqrestore(&xe->irq.lock, flags);
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..1073132f2ded 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -555,6 +555,7 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	struct iosys_map map;
+	unsigned long flags;
 	unsigned int gtid;
 	struct xe_gt *gt;
 
@@ -568,8 +569,10 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 		if (gt->tile != tile)
 			continue;
 
+		spin_lock_irqsave(&xe->irq.lock, flags);
 		for_each_hw_engine(hwe, gt, id)
 			xe_memirq_hwe_handler(memirq, hwe);
+		spin_unlock_irqrestore(&xe->irq.lock, flags);
 	}
 
 	/* GuC and media GuC (if present) must be checked separately */
-- 
2.43.0

