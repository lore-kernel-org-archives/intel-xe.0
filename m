Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B97C41513
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 15:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAE210E30A;
	Tue, 17 Oct 2023 15:09:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB21310E308;
 Tue, 17 Oct 2023 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697555378; x=1729091378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2S8PcZ1eWRywLaL/2P6uGQDgoWGp1RlLAEFLr1zUrsg=;
 b=AACAKEiYlSwiK6E14a7gVFw+KGrpDLdNVrA9QeCCf8QApaVBYuFAXPqe
 A6tCyIvRNeGDKFZN7vMjIiVe44myTUG6JZEUovbF+QgHLmwcJOmNtT4CS
 X1IZt3YemmZIxtOyRGtnbirO2Ficr2kta6HRO6A/Xn4rSXxOHb0lolWFu
 ApAADl6RBfWrcBrYIz2Osn4gDpa9lKlbqKX53JUYUIMZau/bAx276Kz+a
 iwv3XtlBXA+jdZHyLhbghM+uo42WOzvmj9NNo1TM+vdG9yYEKk2243wIE
 XUA1c1fR2YTpwCZBVKAN70ozNBdZWrXCsQRyRGAerLV+O9xOL7GpRRPVu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388665152"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="388665152"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791257584"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="791257584"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 08:09:58 -0700
Message-Id: <20231017150958.838613-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017150958.838613-1-matthew.brost@intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 7/7] drm/sched: Add a helper to queue TDR
 immediately
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

Add a helper whereby a driver can invoke TDR immediately.

v2:
 - Drop timeout args, rename function, use mod delayed work (Luben)
v3:
 - s/XE/Xe (Luben)
 - present tense in commit message (Luben)
 - Adjust comment for drm_sched_tdr_queue_imm (Luben)
v4:
 - Adjust commit message (Luben)

Cc: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ff2cfad54342..563a4f0f6956 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -431,7 +431,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
-		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
 static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
@@ -441,6 +441,22 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_tdr_queue_imm: - immediately start job timeout handler
+ *
+ * @sched: scheduler for which the timeout handling should be started.
+ *
+ * Start timeout handling immediately for the named scheduler.
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
index 625ffe040de3..998b32b8d212 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -568,6 +568,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
-- 
2.34.1

