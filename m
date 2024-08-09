Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C1C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CEF10E969;
	Fri,  9 Aug 2024 15:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KI5+xjzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65E010E969
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218734; x=1754754734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yms+VmkXjOyTqOyPJnjuIBqiDY1rsHm0Mm1v8dGUIHI=;
 b=KI5+xjzln5T8LhdiT3nVMzjW5YN7IhBBhFs/J5n95UQqs6nniHSmPm0b
 Y2l+otPph8kz8MaqItq8c34yL3xtH5395FT2FsZwBBH1MbnAAuHHAmQmG
 1zFD3SYCLtZB4oqZ2sQt/h8GK9pNhSEPM0F2GdWR/hV4a6iM/f2ly9JYO
 gBU0N12k8MKw2qsK00tVXHzWhH+7CKwqZ3GU9/S3WSf6dQTtgEZi8Xj1p
 fghC59VIEyw1pwW0gbdBklW7pkAJyoMMTvI9iVN9rHHCaQDqiZtuDuLs3
 H2melBNylgFneRNWx6564hLMtRY1itHQwYznIAByqDBHBSQaJUz0mtBgq A==;
X-CSE-ConnectionGUID: m6zdeq2AQHKnbiuVAl8xJg==
X-CSE-MsgGUID: 7yC20R2NRYa/aYyUq0kIHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207378"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207378"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:14 -0700
X-CSE-ConnectionGUID: ro5ppcReSTmwxbnz+bNbQA==
X-CSE-MsgGUID: X9wmZlZYRb6wmsS9v1wfOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728758"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:12 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 02/11] drm/xe/guc_submit: Make suspend_wait interruptible
Date: Fri,  9 Aug 2024 17:51:27 +0200
Message-ID: <20240809155156.1955925-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
References: <20240809155156.1955925-1-francois.dugast@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

