Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB8CD343E
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 05:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0398610E3C5;
	Tue, 19 Sep 2023 05:01:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC11F10E3B0;
 Tue, 19 Sep 2023 05:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695099705; x=1726635705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mCkEIkoU/zqkpPHcVuC1RoxhKnPUBS63Jd2NtJTyyag=;
 b=Ln5ffmWwwfv+TnVun16MyofTQEYLkVLGa5nPHAeDukX5BjwOfdrlbauA
 38S5SNINNfkCCQ5NSs1SzKVNsdc1c5AT+RHNzwySqtC5pVJd0IpZRrfrk
 zlvTpPomqh0Gzo+Eq+ZjgrBkNQuEBRfXgnkQz/s9Ctva1Ui3L//Qc9OKC
 vlk9dg9SeCBg6o1TJ/RbDJpOdVgENK+HfbTinsCf2b0qepNkviiAEuMur
 xmhE/b/Ej6HdEiELok2QPrmOpqEfQOfQROU42caOyZIJd02Um96iBmVH1
 QrHTmhTCQMdkE48pnk8jUzmjTWscNyrlKlTuutCnaUZR/SDsD8QCeKNBB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377163519"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="377163519"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 22:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775409083"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="775409083"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 22:01:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 22:01:54 -0700
Message-Id: <20230919050155.2647172-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919050155.2647172-1-matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 09/10] drm/sched: Add helper to queue TDR
 immediately for current and future jobs
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
Cc: robdclark@chromium.org, lina@asahilina.net, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, mcanal@igalia.com,
 frank.binns@imgtec.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, daniel@ffwll.ch, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper to queue TDR immediately for current and future jobs. This
will be used in XE, new Intel GPU driver, to trigger the TDR to cleanup
a drm_scheduler that encounter errors.

v2:
 - Drop timeout args, rename function, use mod delayed work (Luben)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e8a3e6033f66..88ef8be2d3c7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -435,7 +435,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
-		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
 static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
@@ -445,6 +445,23 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_tdr_queue_imm: - immediately start timeout handler including future
+ * jobs
+ *
+ * @sched: scheduler where the timeout handling should be started.
+ *
+ * Start timeout handling immediately for current and future jobs
+ */
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	sched->timeout = 0;
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
+
 /**
  * drm_sched_fault - immediately start timeout handler
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7e6c121003ca..27f5778bbd6d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -568,6 +568,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
-- 
2.34.1

