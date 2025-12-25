Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3A8E784AC
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6C4112ACD;
	Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kc8tyJC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F172113F6E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6i4+mdZgDmSZZcyFTD+hUJnrNJzR8OXB2TNx6NJ2t0E=;
 b=kc8tyJC7gl2+K9NuQ+AoWXgfgXeIBePmNan9/rD1OjW2PKbVVoLjHAEU
 GenySjJIfunx4EQ+TSBsa5jl9mJ7sdm5RkR2ZTxyyxQ552uFs+bqY8PsC
 K1MYE0Y5D044ZzoGNcQpOkFpCQoA3TZBodxQusD+Fbokoy3cxycfwF7gv
 6mnxMFoEHi2nzqpUj2BoJyDgQ3s5DoYDEpFYJe/5CCCBkUJFmOeYwyScW
 iuz8b6aGXB/z77KNb3s9dR8nUpydgshOCXpO2iltcd4gQHvCljtEQTFeL
 wyN159IVUpKgcOImODW9Uhdb0+Aj33Wpy2K2nkMYnPqHRRAJCiggJrcnq Q==;
X-CSE-ConnectionGUID: IZQifoFeSGS+h2alvxmC8g==
X-CSE-MsgGUID: i1VqU9xNRMW+nbklR4JAkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866355"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: 57Z5WegOQNqu3axBQ4xVDg==
X-CSE-MsgGUID: gWIfEzeQTzqACK+M8iKoaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629118"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 01/13] drm/xe: Add dedicated message lock
Date: Wed, 24 Dec 2025 17:17:22 -0800
Message-Id: <20251225011734.341683-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Stop abusing DRM scheduler job list lock for messages, add dedicated
message lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Acked-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 5 +++--
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       | 4 ++--
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 2 ++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f91e06d03511..f4f23317191f 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -77,6 +77,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
 
@@ -117,7 +118,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add_tail(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
@@ -131,7 +132,7 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
 			   struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index c7a77a3a9681..dceb2cd0ee5b 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -33,12 +33,12 @@ void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
 
 static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
 {
-	spin_lock(&sched->base.job_list_lock);
+	spin_lock(&sched->msg_lock);
 }
 
 static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
 {
-	spin_unlock(&sched->base.job_list_lock);
+	spin_unlock(&sched->msg_lock);
 }
 
 static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 6731b13da8bb..63d9bf92583c 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -47,6 +47,8 @@ struct xe_gpu_scheduler {
 	const struct xe_sched_backend_ops	*ops;
 	/** @msgs: list of messages to be processed in @work_process_msg */
 	struct list_head			msgs;
+	/** @msg_lock: Message lock */
+	spinlock_t				msg_lock;
 	/** @work_process_msg: processes messages */
 	struct work_struct		work_process_msg;
 };
-- 
2.34.1

