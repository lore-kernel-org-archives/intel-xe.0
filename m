Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353D2C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461E10E7D2;
	Thu,  8 Aug 2024 18:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCjosrHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2E510E7D0
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142556; x=1754678556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vrTyIUho6cdHc9k6fQmx+Ypkj3lEIxHqokE9H4wiLO4=;
 b=FCjosrHKTrmPO//5Ycz+2auQmMpoIC59P3C2HAelOnJYmgepDVwAhFVl
 4SWfvpf+Pn3gVYaFeipY5Ezjd9E2mthIg+ogYZTnht6uTc+nFFH3/m2bI
 kb/leIhmAT5CURs91tLD4EmwTsSCaGm7w/iOkEtLdS3WKhPntClGF+Tdt
 f1pZ9tFdC4rHTrMSUwZ4CJqYyFIMWkal6Qk/F5qrwZaCvSsQD0HRC+yZP
 nSJwE8pgvjIEW1f8o6BOyJU7wFYdcYf94ZSVQCeg9nU1q24Xn6MQc1xSh
 6l7O1v3pQACCQUaJBzP+iIxbtraBKaxpA/6YFjb1FTSuCoH9D4S8W5Q1M Q==;
X-CSE-ConnectionGUID: JxEK0171TE2rJ0HzzvdLZQ==
X-CSE-MsgGUID: SuZvKUG2RL2kkPQ6D0NSiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921588"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:36 -0700
X-CSE-ConnectionGUID: iw+M2jCuT4q/zgUgWWJ2Eg==
X-CSE-MsgGUID: B1RCol1aQN+NvZg/q7odFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975913"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 02/11] drm/xe/guc_submit: Make suspend_wait interruptible
Date: Thu,  8 Aug 2024 20:40:20 +0200
Message-ID: <20240808184220.1715625-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

Rely on wait_event_interruptible_timeout() to put the process to sleep
with TASK_INTERRUPTIBLE. It allows using this function in interruptible
context.

v2: Propagate error on wait_event_interruptible_timeout (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 460808507947..97d77fa39070 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1603,11 +1603,11 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 * suspend_pending upon kill but to be paranoid but races in which
 	 * suspend_pending is set after kill also check kill here.
 	 */
-	ret = wait_event_timeout(q->guc->suspend_wait,
-				 !READ_ONCE(q->guc->suspend_pending) ||
-				 exec_queue_killed(q) ||
-				 guc_read_stopped(guc),
-				 HZ * 5);
+	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
+					       !READ_ONCE(q->guc->suspend_pending) ||
+					       exec_queue_killed(q) ||
+					       guc_read_stopped(guc),
+					       HZ * 5);
 
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
@@ -1617,7 +1617,7 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 		return -ETIME;
 	}
 
-	return 0;
+	return ret < 0 ? ret : 0;
 }
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
-- 
2.43.0

