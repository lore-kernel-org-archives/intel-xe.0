Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5240EFD45F9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 23:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1444610E847;
	Wed, 25 Feb 2026 23:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A14ne5y+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811A410E845
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772063407; x=1803599407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKC94lUGgM8to4eXRMhbdYC1axuMW8r0jfrALvZvgqM=;
 b=A14ne5y+wbHerN+0QWBKotM0jI5jDCeoKWfMEiNbpZhAuo2860smbnGM
 12Gw47gAuQhx8iyQPpIVB4ddgCyeEAgi1ay6nCkgULTuu+DLdjmh3euYU
 Y8LS+c/MyJ836dqdxDE6xPszBETzL+ayVNGRFD4A65HVLgxXhOZ0YYa7M
 1MK6AGDaT4ZHoM87AfnaJLqaAvA9PCPhzFT72lUO5KGCJ6PhXke5AVtmM
 vm+QDs2q2kBTPg7I5qRZ+54TJBFPpktLWVto1OKewR25c4MbaliYPUMOa
 MYC8c9SOokvX1BMGu9NwCCHAMiUEQjM0hXPqAbQlK+wSWl7P9ShgnE9Ca w==;
X-CSE-ConnectionGUID: 84mr+fhjRhWOJqLOG7C9VQ==
X-CSE-MsgGUID: JzatPeHIT9WNRhzCD4baPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95730750"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="95730750"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 15:50:07 -0800
X-CSE-ConnectionGUID: iOVL+CHHRTuFAekoHtzCBA==
X-CSE-MsgGUID: 8Vjc8Ep/RourIxOhdH3mtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="246934343"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa002.jf.intel.com with ESMTP; 25 Feb 2026 15:50:06 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 2/4] drm/xe/queue: Wrappers for setting and getting LRC
 references
Date: Thu, 26 Feb 2026 00:54:45 +0100
Message-Id: <20260225235447.2772383-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225235447.2772383-1-tomasz.lis@intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
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

There is a small but non-zero chance that VF post migration fixups
are running on an exec queue during teardown. The chances are
decreased by starting the teardown by releasing guc_id, but remain
non-zero. On the other hand the sync between fixups and EQ creation
(wait_valid_ggtt) drastically increases the chance for such parallel
teardown if queue creation error path is entered (err_lrc label).

The exec queue itself is not going to cause an issue, but LRCs have
a small chance of getting freed during the fixups.

Creating a setter and a getter makes it easier to protect the fixup
operations with a lock. For other driver activities, the original
access method (without any protection) can still be used.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 71 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 2 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b4ef725a682d..2cb37af42021 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -270,6 +270,54 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
+static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u16 idx)
+{
+	xe_assert(gt_to_xe(q->gt), idx < q->width);
+
+	scoped_guard(spinlock, &q->multi_queue.lock)
+		q->lrc[idx] = lrc;
+}
+
+/**
+ * xe_exec_queue_get_lrc() - Get the LRC from exec queue.
+ * @q: The exec_queue.
+ * @idx: Index within multi-LRC array.
+ *
+ * Retrieves LRC of given index for the exec queue.
+ *
+ * Return: Pointer to LRC on success, error on failure
+ */
+struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx)
+{
+	struct xe_lrc *lrc;
+
+	xe_assert(gt_to_xe(q->gt), idx < q->width);
+
+	scoped_guard(spinlock, &q->multi_queue.lock) {
+		lrc = q->lrc[idx];
+		if (lrc)
+			xe_lrc_get(lrc);
+	}
+
+	return lrc;
+}
+
+/**
+ * xe_exec_queue_lrc() - Get the LRC from exec queue.
+ * @q: The exec_queue.
+ *
+ * Retrieves the primary LRC for the exec queue. Note that this function
+ * returns only the first LRC instance, even when multiple parallel LRCs
+ * are configured. This function does not increment reference count,
+ * so the reference can be just forgotten after use.
+ *
+ * Return: Pointer to LRC on success, error on failure
+ */
+struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
+{
+	return q->lrc[0];
+}
+
 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
@@ -327,8 +375,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 			goto err_lrc;
 		}
 
-		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
-		WRITE_ONCE(q->lrc[i], lrc);
+		xe_exec_queue_set_lrc(q, lrc, i);
 	}
 
 	return 0;
@@ -1288,21 +1335,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-/**
- * xe_exec_queue_lrc() - Get the LRC from exec queue.
- * @q: The exec_queue.
- *
- * Retrieves the primary LRC for the exec queue. Note that this function
- * returns only the first LRC instance, even when multiple parallel LRCs
- * are configured.
- *
- * Return: Pointer to LRC on success, error on failure
- */
-struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
-{
-	return q->lrc[0];
-}
-
 /**
  * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
  * @q: The exec_queue
@@ -1662,14 +1694,13 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 	for (i = 0; i < q->width; ++i) {
 		struct xe_lrc *lrc;
 
-		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
-		lrc = READ_ONCE(q->lrc[i]);
+		lrc = xe_exec_queue_get_lrc(q, i);
 		if (!lrc)
 			continue;
-
 		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(lrc);
 		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
+		xe_lrc_put(lrc);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index c9e3a7c2d249..a82d99bd77bc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -160,6 +160,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
+struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
 
 /**
  * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
-- 
2.25.1

