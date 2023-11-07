Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5BBC00141
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F6E10E618;
	Tue,  7 Nov 2023 16:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2B110E614
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699373775; x=1730909775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BwvPoUUy6j3iCEsAIEDc1A3ekFLEvZZHi2mZa9vsMeU=;
 b=hM36Nw5ohtXK/j3eZfQ1P66+hIJ/cXR3mwPT676k4K3uAVeATccRZsg0
 D1EZpdRzDsXTmXwN/EO8nPfosK5smzY+gf0CmjTFkQz1kXZyptwgzUTSR
 NM2MrtuB+CbTRqS+TLgHvkQiwDdUQNAm/SwPnUj7dws+cSfBzQchnPfGp
 /Pa0EjPIqxKTeDpWhnJW41OcJxcsLF6I5kMW23fx+0WSdudHbq52OJ4UE
 h5Dh3owij0oky7cBh7K5iZlEpWW1NZMRr6KUw6vRJ8QYTwIPUnqFeN/1h
 EsXm2aRFuuEQzx1BXS5oIlzd5poCElxm3xUX67NayN/djQ5mdoy5S1SWU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="386719718"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="386719718"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797709672"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="797709672"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  7 Nov 2023 08:16:20 -0800
Message-Id: <20231107161623.135419-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107161623.135419-1-matthew.brost@intel.com>
References: <20231107161623.135419-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe:
 s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
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

Exec queue has replaced engine nomenclature.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 47b84b8ca78b..3d559c5654fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -63,7 +63,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
 #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
-#define ENGINE_STATE_SUSPENDED		(1 << 5)
+#define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
 #define EXEC_QUEUE_STATE_RESET		(1 << 6)
 #define ENGINE_STATE_KILLED		(1 << 7)
 
@@ -149,17 +149,17 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
 
 static bool exec_queue_suspended(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_SUSPENDED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
 }
 
 static void set_exec_queue_suspended(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_SUSPENDED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_SUSPENDED, &q->guc->state);
 }
 
 static void clear_exec_queue_suspended(struct xe_exec_queue *q)
 {
-	atomic_and(~ENGINE_STATE_SUSPENDED, &q->guc->state);
+	atomic_and(~EXEC_QUEUE_STATE_SUSPENDED, &q->guc->state);
 }
 
 static bool exec_queue_reset(struct xe_exec_queue *q)
@@ -1379,7 +1379,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
-	atomic_and(EXEC_QUEUE_STATE_DESTROYED | ENGINE_STATE_SUSPENDED,
+	atomic_and(EXEC_QUEUE_STATE_DESTROYED | EXEC_QUEUE_STATE_SUSPENDED,
 		   &q->guc->state);
 	q->guc->resume_time = 0;
 	trace_xe_exec_queue_stop(q);
-- 
2.34.1

