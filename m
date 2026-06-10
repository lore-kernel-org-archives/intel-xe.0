Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348AECD98CF
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41CB10EBFA;
	Wed, 10 Jun 2026 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmOPJnzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333210EBFA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126920; x=1812662920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGdV+H3zdMBrHjPwtY4SsqmQYImqXb+8SMARQAJwTG4=;
 b=CmOPJnzdP38MHddM7KpGUwZcmsuoFOWr9us49cbqgQklNQX87hPQ8oyx
 zNwMKa6gAFqZ/rKmTFAB3wfpSpTdn/dw7Mwr3hGrhD4IKVOeHwDgXmJ8N
 7aV9eCwasfAVD50GhNGRuto7h8mKsWSjImUgvZzcr2iayjtZaTE0gYqHl
 1+CdUXjLHo5I64R/Zl6pt2hrEPTeOMXNQVOAjuuz7fEr468DUdz0Gl+av
 7C+3ltuJLNqNbPpPaVI1UoCyLueAfcuErBsVFUl20uxOcBp5aVNOzE4sQ
 QKoldfO4lVrsEz0Sz4y+TkZg++nCtreg4QxtzvlCeY29ksPMj1iBzjdni w==;
X-CSE-ConnectionGUID: YftOm2GaSeKvmzDZsvXDQg==
X-CSE-MsgGUID: yB8ZCPhYT9u0lBoP61/WtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934688"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:39 -0700
X-CSE-ConnectionGUID: r51CAuD0QyixXp0LW6kMiw==
X-CSE-MsgGUID: lCttpCp2SKa+Vmq5OEzOXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292074"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:38 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 09/11] drm/xe: Hook up per queue thread wake to the unique
 MSI-X vector allocation
Date: Wed, 10 Jun 2026 21:28:41 +0000
Message-ID: <20260610212833.153366-22-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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
 drivers/gpu/drm/xe/xe_memirq.c | 13 +++++++++----
 drivers/gpu/drm/xe/xe_memirq.h |  4 +++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index fc99d021405f..b25cfcdc4b43 100644
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
index 318ef7c72eba..dc21f154db71 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -479,10 +479,15 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
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
 	memirq_debug(memirq, "dispatching engine %s\n", hwe->name);
 
@@ -493,7 +498,7 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 	 * is opportunistic, unconditionally pass MI_USER_INTERRUPT to issue
 	 * that check.
 	 */
-	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT, NULL);
+	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT, q);
 }
 
 /**
@@ -553,7 +558,7 @@ void xe_memirq_handler(struct xe_memirq *memirq)
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

