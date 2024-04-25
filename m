Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5137C10F1A
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE6111A165;
	Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0zw6hBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604A411A164
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024493; x=1745560493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K6qgmtQFjIpGMhIm+1RRyi4o5hfEtEMoOjOa/IxOc/E=;
 b=a0zw6hBO/kkD+T5s/T8dLGneYKv5Mxj1+jlo6kUMQZbY2iL1O0MNQDw7
 75SxJKB10mHqNDn9JuRoRNwkLXW6GfBtvijl9qdFLUhjXUXJmyEujFPj7
 dVA/JNRMGddBzXtiR0QjSIPlMora8v+eHHs+ar14L+VEq0HOfOjQGoAFB
 ppGqkP55t+DbS+t8dwOpSIJMuPZ5I2PJDVWTsdjrfcx0YzDkwr1KoX9sV
 M3Aq1f6GGjkSNvxel8Ad2NJUd/XydNh9nRPaaVrVvD1YSE41czfdW5pCE
 M2ft00DQlbuPHnld5QlCNEeY9nkiVzv6TL073C9Tba2YL2f6FOUv2K4AB A==;
X-CSE-ConnectionGUID: aTr7ZGsdSReZfmzhiMkZwA==
X-CSE-MsgGUID: RssLR/Q0SZ+BPQn6KQ8g2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9554284"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9554284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
X-CSE-ConnectionGUID: IOop0gFlTzC53OoKXy48/A==
X-CSE-MsgGUID: g5jtnxrXQqq0z/eXFw4qmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="55894773"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/5] drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
Date: Wed, 24 Apr 2024 22:55:18 -0700
Message-Id: <20240425055522.1919005-2-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4e78610d1591..689093259302 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -52,7 +52,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
  * engine done being processed).
  */
 #define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
-#define ENGINE_STATE_ENABLED		(1 << 1)
+#define EXEC_QUEUE_STATE_ENABLED		(1 << 1)
 #define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
 #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
@@ -77,17 +77,17 @@ static void clear_exec_queue_registered(struct xe_exec_queue *q)
 
 static bool exec_queue_enabled(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_ENABLED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_ENABLED;
 }
 
 static void set_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static void clear_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_and(~ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_and(~EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static bool exec_queue_pending_enable(struct xe_exec_queue *q)
-- 
2.34.1

