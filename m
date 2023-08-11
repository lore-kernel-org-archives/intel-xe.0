Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51606C04FDF
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 02:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F188510E630;
	Fri, 11 Aug 2023 02:31:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7691F10E627;
 Fri, 11 Aug 2023 02:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691721103; x=1723257103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nkr4lFWb5q586BumVDtISFqgzuwHjyNS9TAu3K1cihw=;
 b=TOdzuD8Y0fPlI19Uuu9ZsL7Ip4cTBXzsNpViqF1FH5Ur6j+U9hHpKUc+
 6X25/vIs44JK+Xlv4U/1Ru3NEnbeU7d239KZeS177rdABC44ukcB4vaon
 NpfNAcu8X91aN597G8sPbMl88DEeoD8zoSk6XJhZhl/DXmechgmI95YdG
 3vMWrz87y/jLuTP0ieXZOzhFJzE2gfanZncGsx5CaEviiqVEuQRthBdCS
 v4olQyg/GSph5HUTHOqJ8nOtDGdTqxxVanadm8r1piqhR7NXtz3wOkkm2
 KG4wGQmd0BiDtVXP8Ocosof+jcomDv26MyE1htwMlFDp2wceVIpq2UBQ7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361714866"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="361714866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797838420"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="797838420"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Thu, 10 Aug 2023 19:31:37 -0700
Message-Id: <20230811023137.659037-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811023137.659037-1-matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 9/9] drm/sched: Add helper to set TDR timeout
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 frank.binns@imgtec.com, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 lina@asahilina.net, donald.robson@imgtec.com, daniel@ffwll.ch,
 boris.brezillon@collabora.com, airlied@gmail.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper to set TDR timeout and restart the TDR with new timeout
value. This will be used in XE, new Intel GPU driver, to trigger the TDR
to cleanup drm_sched_entity that encounter errors.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 ++++++++++++++++++
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6aa3a35f55dc..67e0fb6e7d18 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -426,6 +426,24 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_set_timeout - set timeout for reset worker
+ *
+ * @sched: scheduler instance to set and (re)-start the worker for
+ * @timeout: timeout period
+ *
+ * Set and (re)-start the timeout for the given scheduler.
+ */
+void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
+{
+	spin_lock(&sched->job_list_lock);
+	sched->timeout = timeout;
+	cancel_delayed_work(&sched->work_tdr);
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+EXPORT_SYMBOL(drm_sched_set_timeout);
+
 /**
  * drm_sched_fault - immediately start timeout handler
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5d753ecb5d71..b7b818cd81b6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -596,6 +596,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-- 
2.34.1

