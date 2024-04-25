Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423D8C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 23:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C8C10F203;
	Thu, 25 Apr 2024 23:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9QJ4bZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7A910F201
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714087530; x=1745623530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eGvoygW+BygwmT/XFTqt4xzf5yfIn/S0kd7vpZet0vg=;
 b=M9QJ4bZHiU9142JnFHb5f/yuhwNVxPrSvZ483rvvlY/37xlH4zctdm96
 8NCNCc4k5eaj0UMgzV5R7xcKlf5JQ4OA8pUrfz9mkHdXDqXwBWe9GoXOU
 AvxZvLvZkIKxLtRcCeBFRbGDVbgT8+3K7TNkMd3lngXVjDiZs2GZuZhbG
 BpNxQe26Bk2luZBEdCvwL9STrzHTy92h8WfIqFpqcurkTb2lZoahhZrIE
 G4pZYbBgj51hwHIenfsjlukpbHDaq3kaupNH1qRMTvLKHJlBGcM5cK73F
 9nnvTDX/v6XOceRJeI60HKLpkumKWKeuQD4XdU2oZNXkwRnnQRmw9S2bs Q==;
X-CSE-ConnectionGUID: OtGTuEejSw+2XSIQvCc0fw==
X-CSE-MsgGUID: enVVzG25Qo28i2fIr4JvhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9970877"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9970877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:15 -0700
X-CSE-ConnectionGUID: Co7bDRi/QSCAtTmIX4CN+A==
X-CSE-MsgGUID: w83cEO4HR6K1jIYcSrz1qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56411985"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 2/5] drm/xe:
 s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
Date: Thu, 25 Apr 2024 16:25:41 -0700
Message-Id: <20240425232544.1935578-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425232544.1935578-1-matthew.brost@intel.com>
References: <20240425232544.1935578-1-matthew.brost@intel.com>
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

Exec queue has replaced engine nomenclature.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 872a782337f2..5dab20fa6d74 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -56,7 +56,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
 #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
-#define ENGINE_STATE_SUSPENDED		(1 << 5)
+#define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
 #define EXEC_QUEUE_STATE_RESET		(1 << 6)
 #define ENGINE_STATE_KILLED		(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
@@ -143,17 +143,17 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
 
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
@@ -1471,7 +1471,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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

