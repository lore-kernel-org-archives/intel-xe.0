Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C882DCD343D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 05:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9200A10E3C2;
	Tue, 19 Sep 2023 05:01:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6643910E3B0;
 Tue, 19 Sep 2023 05:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695099705; x=1726635705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mr2ZrLN6RPkvIIkB8OG8EperKj+TJKOhZSSbYFbjuE=;
 b=aQBFI1nJsQpXrIXG0p3U/NX5fjvDJ5oaCQuvfnjf7/U0gU6j/dIjPqRp
 iI+e5QI6a6lhHVvFlyCZeNOigkz1hIhXn6fTY259O4MltxK29n/ZcuQ2r
 fEpjui9udnL2Ic5D977AwBEra/u58BP6pviUzHpxa8BS8fn2THr4Ni7y4
 p4aV80zmFO6zPoG4K6lBQhGd7QR3wSiNhI0lPoDP1/TzC3OvjiQrfC401
 j7mn83vJsgYTDGL/ugGzo3RQ8zrC9a2jFWWauuqgrISzFJnNLsz0CO4mW
 WO7NCjLTXHuLDK4VDl7Qkwy8bYDKjn97bcIy7hddE2uLYcdWJJ6NJ+MxP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377163495"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="377163495"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 22:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775409076"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="775409076"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 22:01:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 22:01:52 -0700
Message-Id: <20230919050155.2647172-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919050155.2647172-1-matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 07/10] drm/sched: Start submission before TDR
 in drm_sched_start
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

If the TDR is set to a very small value it can fire before the
submission is started in the function drm_sched_start. The submission is
expected to running when the TDR fires, fix this ordering so this
expectation is always met.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 09ef07b9e9d5..a5cc9b6c2faa 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -684,10 +684,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
+	drm_sched_submit_start(sched);
+
 	if (full_recovery)
 		drm_sched_start_timeout_unlocked(sched);
-
-	drm_sched_submit_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
-- 
2.34.1

