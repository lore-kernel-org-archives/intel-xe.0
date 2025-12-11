Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7532AD4335A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A4C10E89C;
	Thu, 11 Dec 2025 21:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHC3BGBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0842C10E06C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486838; x=1797022838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gctuCZ9gSYxod3/MiUrmUUNpH08MoUAWXya+1NTqOCo=;
 b=ZHC3BGBRTs6C4/Mp5Tg2ZxIaOKb4txxjW4U0RMqUi9ZLOLzjFw5EVbeS
 TpooBkXu8YOp/GphUE+Z+S7iJ8c6rmY9s2LPphZk3p0TV25XfVywbroFW
 3qoP0hINRx3rFhYAxqpxJbO6dzwBf8tLzjqAQBEwr/HZjUgl3yUp2oL9K
 AhWDI3KU15Y6NsDv7JficYQ2njL268Rmh/oK+G8J57lDX+o9xeMGIQc54
 NA4ezgTimCqxLx2nMV0h0AnfYRrfkCoNhJiSPvC40UU92gB6xD9ColpZ0
 uns3k1uuQGWR47QQTsQzIirMIJ0o9uLuxEXJybLBGP2fRqmIiVJ9zClnQ Q==;
X-CSE-ConnectionGUID: 5hdKI+ZvS/atC0j4IVskQA==
X-CSE-MsgGUID: VUZjzBOsSOCvmCuGwKxztw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67649719"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67649719"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
X-CSE-ConnectionGUID: Nu0ftqVuTaGC/vn9B9uaDw==
X-CSE-MsgGUID: vDY7prYnTYaJvqYa9fuMPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234297947"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH 2/6] drm/xe: Use usleep_range for accurate long-running
 workload timeslicing
Date: Thu, 11 Dec 2025 13:00:28 -0800
Message-Id: <20251211210032.1520113-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211210032.1520113-1-matthew.brost@intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
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

msleep is not very accurate in terms of how long it actually sleeps,
whereas usleep_range is precise. Replace the timeslice sleep for
long-running workloads with the more accurate usleep_range to avoid
jitter if the sleep period is less than 20ms.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ff6fda84bf0f..92c703888cff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -717,6 +717,24 @@ static bool vf_recovery(struct xe_guc *guc)
 	return xe_gt_recovery_pending(guc_to_gt(guc));
 }
 
+static inline void relaxed_ms_sleep(unsigned int delay_ms)
+{
+	unsigned long min_us, max_us;
+
+	if (!delay_ms)
+		return;
+
+	if (delay_ms > 20) {
+		msleep(delay_ms);
+		return;
+	}
+
+	min_us = mul_u32_u32(delay_ms, 1000);
+	max_us = min_us + 500;
+
+	usleep_range(min_us, max_us);
+}
+
 static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1582,7 +1600,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 				since_resume_ms;
 
 			if (wait_ms > 0 && q->guc->resume_time)
-				msleep(wait_ms);
+				relaxed_ms_sleep(wait_ms);
 
 			set_exec_queue_suspended(q);
 			disable_scheduling(q, false);
-- 
2.34.1

