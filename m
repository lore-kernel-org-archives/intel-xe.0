Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2CACA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 15:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784D10E97E;
	Thu,  8 Oct 2026 15:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QInQkzAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239110E8BC
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 15:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791473670; x=1823009670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2/aFQmPALZMEKfuMcKwu2s/ay/Q9bRiohKk/NhFlH8=;
 b=QInQkzAchaMYoFeWD61M+NwNd258Xk99O6WDQmCRxQIdJynO6uizD4nh
 Wyqn+bDKYVuyTFibxp7T7ByF0wegRGti8XdBU+846KmxG33eI3EnnIqzw
 Tzqy2HvNTbfH/jdOXp1ffOMRlpl7JRkgMKR0IlcDsWWWp+G9+ipOWkG1I
 XpJBA4ubOE02aPp5Vc7OE6d3shG1kS+YjwfDea2HgZHQxLqCp9EzAPmVM
 Mx+I3osHWvEEoT7iv3GBftawv4hYK3NDj0KWTaSC2eWL7R8CY2MEEPjNg
 gsC7DjXN0Nu0J2vHxYdEb0AtvnGEXlbl5d54Z2ctCNP9cPpwkhqiRLrxb A==;
X-CSE-ConnectionGUID: Q5BsT6NDTb29/j5lTKuGLA==
X-CSE-MsgGUID: l+cuZakkS5axJj5uMjn6bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="136847"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="136847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 08:34:30 -0700
X-CSE-ConnectionGUID: +6iUN7A/QDacKKI8vhPpPA==
X-CSE-MsgGUID: k38lJjTgRcGRSs2/L/4SsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="28370"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa007.jf.intel.com with ESMTP; 08 Oct 2026 08:34:30 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/1] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
Date: Thu,  8 Oct 2026 15:34:27 +0000
Message-ID: <20261008153425.607925-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008153425.607925-3-satyanarayana.k.v.p@intel.com>
References: <20261008153425.607925-3-satyanarayana.k.v.p@intel.com>
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
---
V1 -> V2:
- Fix race with xe_memirq_handler() and hw_engine_fini() (Sashiko & Piotr).
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 6 ++++++
 drivers/gpu/drm/xe/xe_irq.c       | 2 ++
 drivers/gpu/drm/xe/xe_memirq.c    | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 265f95c0c899..578b6ca926e7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -275,6 +275,12 @@ static const struct engine_info engine_infos[] = {
 static void hw_engine_fini(void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
+	struct xe_device *xe = gt_to_xe(hwe->gt);
+	unsigned long flags;
+
+	spin_lock_irqsave(&xe->irq.lock, flags);
+	hwe->name = NULL;
+	spin_unlock_irqrestore(&xe->irq.lock, flags);
 
 	if (hwe->exl_port)
 		xe_execlist_port_destroy(hwe->exl_port);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..16913dfb9707 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -922,8 +922,10 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 			if (gt->tile != tile)
 				continue;
 
+			spin_lock(&xe->irq.lock);
 			for_each_hw_engine(hwe, gt, id)
 				xe_memirq_hwe_handler(memirq, hwe);
+			spin_unlock(&xe->irq.lock);
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..49669f83a55d 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -568,8 +568,10 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 		if (gt->tile != tile)
 			continue;
 
+		spin_lock(&xe->irq.lock);
 		for_each_hw_engine(hwe, gt, id)
 			xe_memirq_hwe_handler(memirq, hwe);
+		spin_unlock(&xe->irq.lock);
 	}
 
 	/* GuC and media GuC (if present) must be checked separately */
-- 
2.43.0

