Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF686C79FBF
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6208E10F0FE;
	Wed,  9 Sep 2026 12:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e900N5Y5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACDA10F0FE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957716; x=1820493716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XoFxUhZGhDBN4TWbPDLlZgjlWO6U/MrDrMb30JUkOsw=;
 b=e900N5Y5KvJzaVuT1VuzyaTlEZu0EoqqfNJZCR0F+5ss8N16F8I+Yd4R
 l8MRb8+N/i6l28b1zzwqYC/L+228nDPxq+YApGaVtpEltcIZQMiZTkigO
 3ECcsHVVTXVhdsA7D1Ot0MUPlO75x4knI2utuyoI+AJMXbYTzgaZT4tX7
 oITxvhJ3Xz/Oi7LeDzh7FeK7EyKawUnUWROpBh6SA7JwIJ5iIy/gF2yUw
 f1TIs8VQdsnnuZp9ruDaashf4wHgkXlUc+Fj8mBNweEVCLGI2bPgVIgvn
 FRyY6DBsIeMhysgpwInbkUSFQhRjmvHR/+QVagVb+xkqcrYpIhRUFcIM2 A==;
X-CSE-ConnectionGUID: YcldYDLpQOS1rzEoaMfsIA==
X-CSE-MsgGUID: uBBTl9+7RFunaM35730Onw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715486"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:41:56 -0700
X-CSE-ConnectionGUID: Z65I0cn7TqW9Pvi74OOa3A==
X-CSE-MsgGUID: JkdCxToXTvOADajexZ7yww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246527"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:55 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 04/21] drm/xe: Implement xe_access_counter_handler
Date: Wed,  9 Sep 2026 18:14:58 +0530
Message-ID: <20260909124457.1610890-27-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Enqueue access counter notifications to the appropriate worker to
process them.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index ae939576b72d..6920e52cf154 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -78,6 +78,12 @@ int xe_access_counter_init(struct xe_device *xe)
 	return 0;
 }
 
+static int xe_access_counter_work_index(struct xe_device *xe)
+{
+	lockdep_assert_held(&xe->usm.ac_queue.lock);
+	return xe->usm.ac_workers_indx++ % XE_ACCESS_COUNTER_WORKER_COUNT;
+}
+
 /**
  * xe_access_counter_handler - Handle an access counter notification
  * @xe: xe device
@@ -90,6 +96,22 @@ int xe_access_counter_init(struct xe_device *xe)
  */
 int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
 {
-	/* Stub implementation - to be filled in */
-	return 0;
+	struct xe_usm_queue *ac_queue = &xe->usm.ac_queue;
+	int idx;
+	unsigned long flags;
+	bool full;
+
+	spin_lock_irqsave(&ac_queue->lock, flags);
+	idx = xe_access_counter_work_index(xe);
+	full = xe_usm_queue_full(ac_queue);
+	if (!full) {
+		xe_usm_queue_push(ac_queue, ac);
+		queue_work(xe->usm.pagefault_wq, &xe->usm.ac_workers[idx].work);
+	} else {
+		drm_warn(&xe->drm,
+			 "AccessCounter Queue full, shouldn't be possible\n");
+	}
+	spin_unlock_irqrestore(&ac_queue->lock, flags);
+
+	return full ? -ENOSPC : 0;
 }
-- 
2.43.0

