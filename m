Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5ECCD8C85
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBA111ABC4;
	Fri,  5 Jun 2026 23:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzQLGuHD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44B11ABBE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701680; x=1812237680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZGbZUGUUxFEO7RU8pxkPtwRtD26hJWSOUscZHlAHrA=;
 b=IzQLGuHD8tdeY//vtTyxJDgPf1BqKogQIB1o68f/9QVbg0J23VcWkgpm
 8pOfWARfY9HO8vMrVJfakVC+x9AW4NfP6/NblfYNIQFLmLsIR/DnvoQy7
 tv8SZdKPLgRVeP6mfRFsGUJRdXszCexB0UBZahVi3tnRR0yVthtBhKe5t
 s3QR5xCN4ztZFpN4bbRWcQ/2IfyaLkYFhCq0V0KB5JN45EkgObEKWZB3L
 ibLZm+2E3M4q3F/2QNFobzuDZeP5L0tZd13dAXxnxcVyQ6oR/fF2nL2kX
 ty0w/2AhZUVfOUI3y8YbMpQU8RjatXrFOoWQW0W/94aE1YYS+H1H85+4d Q==;
X-CSE-ConnectionGUID: kuUD9olBTl6T+M5rHkBu8w==
X-CSE-MsgGUID: kGIKZMyESCGNac81li1V0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449685"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:20 -0700
X-CSE-ConnectionGUID: 9747IzfeTt+J4Oqbj2OmWw==
X-CSE-MsgGUID: jpS49mp0TcO36oohekySFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018311"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:20 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 10/12] drm/xe: Hook up per queue thread wake to the unique
 MSI-X vector allocation
Date: Fri,  5 Jun 2026 23:21:17 +0000
Message-ID: <20260605232108.674580-24-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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

When a dedicated MSI-X vector fires for a specific exec queue, the
interrupt handler already has the queue pointer available.  Thread it
through the call chain so we can wake the per-queue ufence_wq without
impact any other user threads.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_irq.c    |  4 ++--
 drivers/gpu/drm/xe/xe_memirq.c | 16 +++++++++++-----
 drivers/gpu/drm/xe/xe_memirq.h |  4 +++-
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 935a90719e75..db12e1a371a5 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -927,7 +927,7 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 				continue;
 
 			for_each_hw_engine(hwe, gt, id)
-				xe_memirq_hwe_handler(memirq, hwe);
+				xe_memirq_hwe_handler(memirq, hwe, NULL);
 		}
 	}
 
@@ -942,7 +942,7 @@ irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg)
 	if (!atomic_read(&tile->xe->irq.enabled))
 		return IRQ_NONE;
 
-	xe_memirq_hwe_handler(&tile->memirq, q->hwe);
+	xe_memirq_hwe_handler(&tile->memirq, q->hwe, q);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 427a0e13f7aa..f94b75eac80f 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -448,7 +448,8 @@ static void memirq_assume_received(struct xe_memirq *memirq, const char *source,
 }
 
 static void memirq_dispatch_engine(struct xe_memirq *memirq,
-				   struct xe_hw_engine *hwe)
+				   struct xe_hw_engine *hwe,
+				   struct xe_exec_queue *q)
 {
 	memirq_debug(memirq, "dispatching engine %s\n", hwe->name);
 
@@ -494,12 +495,17 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
  * xe_memirq_hwe_handler - Check and process interrupts for a specific HW engine.
  * @memirq: the &xe_memirq
  * @hwe: the hw engine to process
+ * @q: the exec queue associated with this interrupt, or NULL
  *
- * This function reads and dispatches `Memory Based Interrupts` for the provided HW engine.
+ * This function reads and dispatches `Memory Based Interrupts` for the provided
+ * HW engine. When @q is non-NULL (e.g. called from a dedicated MSI-X vector
+ * handler), it is passed through so the per-queue user fence wait queue is
+ * woken rather than the device-level one.
  */
-void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
+void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe,
+			   struct xe_exec_queue *q)
 {
-	memirq_dispatch_engine(memirq, hwe);
+	memirq_dispatch_engine(memirq, hwe, q);
 }
 
 /**
@@ -559,7 +565,7 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 			continue;
 
 		for_each_hw_engine(hwe, gt, id)
-			xe_memirq_hwe_handler(memirq, hwe);
+			xe_memirq_hwe_handler(memirq, hwe, NULL);
 	}
 
 	/* GuC and media GuC (if present) must be checked separately */
diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
index e25d2234ab87..7e2229ad1d38 100644
--- a/drivers/gpu/drm/xe/xe_memirq.h
+++ b/drivers/gpu/drm/xe/xe_memirq.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct xe_exec_queue;
 struct xe_guc;
 struct xe_hw_engine;
 struct xe_memirq;
@@ -20,7 +21,8 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
 
 void xe_memirq_reset(struct xe_memirq *memirq);
 void xe_memirq_postinstall(struct xe_memirq *memirq);
-void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
+void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe,
+			   struct xe_exec_queue *q);
 void xe_memirq_handler(struct xe_memirq *memirq);
 
 int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
-- 
2.43.0

