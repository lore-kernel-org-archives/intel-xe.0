Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264AECCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4B410E562;
	Mon, 27 Oct 2025 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kW7VGkzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BF910E19A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601378; x=1793137378;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GyqWXQb5TLKsVpzZYFqaGSTkCysCXAJkrKF/ePuOin4=;
 b=kW7VGkzlCCRqDepRDYh/XnWDrTYP+kH05RHWMI6rY7/YVQr3C7yooeff
 8RrwH+PRn88W00+Pwuxuz0g/bdhHBukpZuYP21khbcE4P4hrARcS+7GMW
 2lqfOOBYT6EVQI/F7CbiUgRcNF8au35BLGV8swdoheChInYXgIcDJ9lsY
 Hb80fqJTYh79ab+30Dwd/7uw9ruP42m8Ge9FVfvpdQtiq29G+lqlqDjA0
 aMiZ4r3c6YXJ7rSC0opFUpZ3NuTeRkKJZuXpCKeXr8ha34uREmkawdo+A
 1uzwbCznXcLbQnfm+yj+FrL0maCEAd9WILPPm30Ort6IqtU+pTgB7oslm w==;
X-CSE-ConnectionGUID: rD/ajIJHRjmkE2+Ux1w6KA==
X-CSE-MsgGUID: 3ncdWe9ETrSJeoFKLuB/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368850"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368850"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:57 -0700
X-CSE-ConnectionGUID: g0WPhr+vTVWqgP7QbmDHew==
X-CSE-MsgGUID: 2uVZVsQgS6C7CSG21H4ahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782350"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 8/8] dma-buf: Fix dma-fence-chain signaling ordering
Date: Mon, 27 Oct 2025 14:42:52 -0700
Message-Id: <20251027214252.2455093-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027214252.2455093-1-matthew.brost@intel.com>
References: <20251027214252.2455093-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-chain.c |  6 +++---
 include/linux/dma-fence-chain.h   | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34..23f5cf467dd1 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -119,7 +119,7 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
         return "unbound";
 }
 
-static void dma_fence_chain_irq_work(struct irq_work *work)
+static void dma_fence_chain_work(struct work_struct *work)
 {
 	struct dma_fence_chain *chain;
 
@@ -137,8 +137,8 @@ static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 	struct dma_fence_chain *chain;
 
 	chain = container_of(cb, typeof(*chain), cb);
-	init_irq_work(&chain->work, dma_fence_chain_irq_work);
-	irq_work_queue(&chain->work);
+	INIT_WORK(&chain->work, dma_fence_chain_work);
+	queue_work(system_ordered_wq, &chain->work);
 	dma_fence_put(f);
 }
 
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 68c3c1e41014..8e88d3d01fe6 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -11,8 +11,8 @@
 #define __LINUX_DMA_FENCE_CHAIN_H
 
 #include <linux/dma-fence.h>
-#include <linux/irq_work.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 /**
  * struct dma_fence_chain - fence to represent an node of a fence chain
@@ -33,18 +33,18 @@ struct dma_fence_chain {
 		 *
 		 * This is used to add the callback for signaling the
 		 * complection of the fence chain. Never used at the same time
-		 * as the irq work.
+		 * as the work.
 		 */
 		struct dma_fence_cb cb;
 
 		/**
-		 * @work: irq work item for signaling
+		 * @work: work item for signaling
 		 *
-		 * Irq work structure to allow us to add the callback without
+		 * Work structure to allow us to add the callback without
 		 * running into lock inversion. Never used at the same time as
 		 * the callback.
 		 */
-		struct irq_work work;
+		struct work_struct work;
 	};
 	spinlock_t lock;
 };
-- 
2.34.1

