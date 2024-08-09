Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6257C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D5910E9E5;
	Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjrPJ5e7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB9910E9E4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723231120; x=1754767120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zdjXHVcu2vAwBQXQw+aIAVUUWqjRui9ZYczQ9Z+L3Kc=;
 b=AjrPJ5e7/+VzokenBb7ky6MRK0ywbFzBkwG6xmdnTkeYo/2BstIlZH3e
 JDOHueb8Axqk0OjriThG3VTSfD+frM0GZ42WOBrzVj0okRmhUD064vUWa
 KQ7l1rDMkn7+4VxxORpKixQEqrJfZOzrMdok+uz2x2lN04woV9D5BHlsL
 yRu9nsa0sDDfIOWAjq6pnbrNbZjAtGYLC2OUFkw8ZPVvHeu1NGtzE2izN
 TDT+EafnPJ00B8Hwkof/0Ov7961esa1Wy7r3Bh+OgPJ1b3pCP1eiAdU7c
 SglcNJZE+6h2f7Nv6FfwMdivV/OpGIEulSgI+MviYHbasTsfPyWNeCP+D A==;
X-CSE-ConnectionGUID: ox0URrylTCq02QDCBSriVQ==
X-CSE-MsgGUID: kdBuCACQRNWteXAMSS49nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32566812"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32566812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
X-CSE-ConnectionGUID: yC5FVvcRRACBLaSkM5U/PQ==
X-CSE-MsgGUID: cDK7mFoSTdaik/x6P2Nogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88294752"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH 1/5] drm/xe: Add xe_sched_msg_lock/unlock helper
Date: Fri,  9 Aug 2024 12:19:25 -0700
Message-Id: <20240809191929.3138956-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809191929.3138956-1-matthew.brost@intel.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
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

Will help callers to own locking when adding messages to scheduler.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 10 ++++++++++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index e4ad1d6ce1d5..eea71c67cf2a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -15,11 +15,11 @@ static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
 {
 	struct xe_sched_msg *msg;
 
-	spin_lock(&sched->base.job_list_lock);
+	xe_sched_msg_lock(sched);
 	msg = list_first_entry_or_null(&sched->msgs, struct xe_sched_msg, link);
 	if (msg)
 		xe_sched_process_msg_queue(sched);
-	spin_unlock(&sched->base.job_list_lock);
+	xe_sched_msg_unlock(sched);
 }
 
 static struct xe_sched_msg *
@@ -27,12 +27,12 @@ xe_sched_get_msg(struct xe_gpu_scheduler *sched)
 {
 	struct xe_sched_msg *msg;
 
-	spin_lock(&sched->base.job_list_lock);
+	xe_sched_msg_lock(sched);
 	msg = list_first_entry_or_null(&sched->msgs,
 				       struct xe_sched_msg, link);
 	if (msg)
 		list_del(&msg->link);
-	spin_unlock(&sched->base.job_list_lock);
+	xe_sched_msg_unlock(sched);
 
 	return msg;
 }
@@ -93,9 +93,9 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg)
 {
-	spin_lock(&sched->base.job_list_lock);
+	xe_sched_msg_lock(sched);
 	list_add_tail(&msg->link, &sched->msgs);
-	spin_unlock(&sched->base.job_list_lock);
+	xe_sched_msg_unlock(sched);
 
 	xe_sched_process_msg_queue(sched);
 }
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 10c6bb9c9386..a54038fb3094 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -25,6 +25,16 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg);
 
+static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
+{
+	spin_lock(&sched->base.job_list_lock);
+}
+
+static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
+{
+	spin_unlock(&sched->base.job_list_lock);
+}
+
 static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
 {
 	drm_sched_stop(&sched->base, NULL);
-- 
2.34.1

