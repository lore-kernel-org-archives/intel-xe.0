Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F588C25B10
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 05:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07B11A168;
	Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5TIIl0H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805B511A165
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024493; x=1745560493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SFpG42BeKr4kajxzlDr+I3M+6fc+KmYVOF/vuPL8VT0=;
 b=F5TIIl0HmWAEa1PK3nzxDX43+vI+HwcA8YA/qoLHBrl1qtls3JCJRaKv
 MDeaKhzdmKYvqwZrB6XvJnVwOK2RKKfXCZQLy3IjPbZk42ckjeYyrOG6Z
 DXJDc+r+as3k7UYJSHFYa9cmwwysckQyenUzj81TH+diVHKkqg1YkL8KT
 Js8lx6fgUyxRXLf3qzoT43VFxsFM0dD8Yp6WNhFacnR/kJMQxfdUa23dF
 8htcfxbeZX//G0le9xLbGLeMULgkM2PcayXRzj6IWO01xSr4dBByRWFIY
 kJE9uNGTQ/+isrur6G60l6btB9tbIUImJ0WhyNtjo6G8kanh3bHxkisRa g==;
X-CSE-ConnectionGUID: opcPCv+WSZS7y1ydDGsIhw==
X-CSE-MsgGUID: x1+ZeIVqQ9uH4iOaL7qbzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9554285"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9554285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
X-CSE-ConnectionGUID: tDniWC2PQEyd2Bfphm4Dvg==
X-CSE-MsgGUID: F6y7IbkTQnO6rd9DXajMtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="55894777"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/5] drm/xe:
 s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
Date: Wed, 24 Apr 2024 22:55:19 -0700
Message-Id: <20240425055522.1919005-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425055522.1919005-1-matthew.brost@intel.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 689093259302..b26f374ca20b 100644
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
 
@@ -142,17 +142,17 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
 
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
@@ -1406,7 +1406,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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

