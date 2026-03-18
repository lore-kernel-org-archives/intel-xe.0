Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6265FCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860C210E698;
	Wed, 18 Mar 2026 07:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5Tp1bI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83910E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817818; x=1805353818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y9rqCQ82n5OmIC6j9XUQ6vv2ILH7LVfESZ78B5+SLUY=;
 b=N5Tp1bI4kCf7ZT2+qEjmpfP7vDSu/YAcDa5coGbqdeLLfhWn0mF5UX14
 eLXCzh4LG5az51/zwA6uj+qj0sUwWtXBctKxCf9OwC6JcrlqfLCc0krzb
 im0NBgxphiLqu/3FblNrfKg8qBiYeb/ZQwZZnEtWDvqvjHx/2kiArgGlH
 mG8uQHCMy13FF3T5j3NBCwiuDrI87BsQvUyp59qPtRI1TYms9Y05GgUOC
 kslR6KYYo/WNpioutzXSeYSGy4wI+eE6qotnXvrfUQQKHxCfDXrFlAUhQ
 AdtrUOjOdezuUsIi3mFv2Txie/jP7HJu/kckOrllPmrTKF7xb7VVOjpaq Q==;
X-CSE-ConnectionGUID: /tfghtalRXCJROgbPc80Fg==
X-CSE-MsgGUID: 5/zAVDNPR469cqP5uaw6NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764259"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764259"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:18 -0700
X-CSE-ConnectionGUID: rhI/qKiPTduLsVm1ef4ApQ==
X-CSE-MsgGUID: d9wC8D0oR9urAy9t4PnpiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424017"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 05/15] drm/xe: Implement xe_access_counter_handler
Date: Wed, 18 Mar 2026 13:14:46 +0530
Message-Id: <20260318074456.2839499-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Enqueue access counter notifications to the appropriate queue based on
ASID and schedule worker to process them.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index cafcc42897f8..a2ce9dc45d05 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -87,12 +87,29 @@ int xe_access_counter_init(struct xe_device *xe)
  * @xe: xe device
  * @ac: access counter notification
  *
- * Process an access counter notification from the producer layer.
+ * Sink the access counter notification to a queue (i.e., a memory buffer) and
+ * queue a worker to service it.
  *
  * Return: 0 on success, negative error code on error
  */
 int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
 {
-	/* Stub implementation - to be filled in */
-	return 0;
+	struct xe_usm_queue *ac_queue = xe->usm.ac_queue +
+		(ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);
+	unsigned long flags;
+	bool full;
+
+	spin_lock_irqsave(&ac_queue->lock, flags);
+	full = xe_usm_queue_full(ac_queue, sizeof(struct xe_access_counter));
+	if (!full) {
+		xe_usm_queue_push(ac_queue, ac, xe_access_counter_entry_size());
+		queue_work(xe->usm.pf_wq, &ac_queue->worker);
+	} else {
+		drm_warn(&xe->drm,
+			 "AccessCounter Queue (%d) full, shouldn't be possible\n",
+			 ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);
+	}
+	spin_unlock_irqrestore(&ac_queue->lock, flags);
+
+	return full ? -ENOSPC : 0;
 }
-- 
2.34.1

