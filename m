Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAF8D59D89
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2F10E931;
	Fri, 12 Dec 2025 18:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcOMe6xB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4EA10E92C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564134; x=1797100134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bd/Cy6bgQ9mAuDoIbILLERK9fgdsqMmzUEjVYrbPKC8=;
 b=kcOMe6xBb2yA34u8J3IblDLwQiJKIYcAUVzH2uVgD11nY4WInHOgJv5s
 QRgo9erzChFWz+Fw8g5FpNaUgduva7sPSs4pnqWagz52uehl2igTQVZd7
 +977nQzPnFhDwhWj7wM0D4pOQFxuNu2MJ9wM8t2Kk1e3M+Cn8F8Gm8fgK
 9ZhL6vXy3HJFonw/+SIlSC1VTUisCMqnnXiMNYDhVhIh4ScmNpzHv80gl
 7QcLMovyI2QqdH/olt+gz0pfWbdd7y++eXFdfcAK8UK09/XUeXqaK5IRI
 la6r76eJLz+nUrFHe4IAFL9vsRfuoIjBVKSsV0luUqZ6PYAlcXzgwaQPG A==;
X-CSE-ConnectionGUID: V1niy0FZTeaRX1wZNke+Ig==
X-CSE-MsgGUID: ghxVHBIySY2h9Z9Tg0i/NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432797"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: rqEciMM4Qxu/E6J5ALNQmA==
X-CSE-MsgGUID: HwCuWnb6T5aZmhfkPI97Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633943"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 2/7] drm/xe: Use usleep_range for accurate long-running
 workload timeslicing
Date: Fri, 12 Dec 2025 10:28:42 -0800
Message-Id: <20251212182847.1683222-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21a8bd2ec672..18cac5594d6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -990,6 +990,24 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
 	return (WQ_SIZE - q->guc->wqi_tail);
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
@@ -1903,7 +1921,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 				since_resume_ms;
 
 			if (wait_ms > 0 && q->guc->resume_time)
-				msleep(wait_ms);
+				relaxed_ms_sleep(wait_ms);
 
 			set_exec_queue_suspended(q);
 			disable_scheduling(q, false);
-- 
2.34.1

