Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF1C4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41610E617;
	Tue,  7 Nov 2023 16:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE6310E615
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699373775; x=1730909775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXcfS+FbF//oVFO/awAGvT3VKYjlaZGMWTczVdgXyzc=;
 b=jiGEHIPZjmwBjoiI51pZrp5Sz9DzoKC5VA9I5ZW2NJWhmz887BadFivK
 gYAoZQ9Gbr7M0jQsazg8IRaGfHPJUKQoLHpgMFOpXAj3pgYS+XSjfMt3+
 hYh/SVQm4u1Vy3/PfjUKREc4yxEeq98qdGh/S9eSCbFWjsuuwzsqw8EZW
 4Mv1nyz6MYl1wsUUbHlwtMb7wRCev94ZVPC9MaIwfMNcgGJXMXTHkYS4y
 kmSgNcPrBhEBt6jGUOu2VbnKaVc9gLJMD27IVXFTYK34iRw2qogNrUKC2
 8MiwNSplEqkkhoatu/Y0NV6/it+DVvup1k9jG5UJIgReKrAfY/JCT0QFR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="386719720"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="386719720"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797709675"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="797709675"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  7 Nov 2023 08:16:21 -0800
Message-Id: <20231107161623.135419-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107161623.135419-1-matthew.brost@intel.com>
References: <20231107161623.135419-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe:
 s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
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
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3d559c5654fc..0ca2e06d591d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -65,7 +65,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
 #define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
 #define EXEC_QUEUE_STATE_RESET		(1 << 6)
-#define ENGINE_STATE_KILLED		(1 << 7)
+#define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -174,12 +174,12 @@ static void set_exec_queue_reset(struct xe_exec_queue *q)
 
 static bool exec_queue_killed(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_KILLED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_KILLED;
 }
 
 static void set_exec_queue_killed(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_KILLED, &q->guc->state);
 }
 
 static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
-- 
2.34.1

