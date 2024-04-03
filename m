Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7CACD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 19:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F788112E64;
	Wed,  3 Apr 2024 19:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9M35OYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2021112E64
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712172910; x=1743708910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l8A4FV8IxpiuFNIOqOdHl/thuKxAJpljgH4pEec2lN0=;
 b=E9M35OYiNojwn/94aHygdI0wgw8+Dmf96nBl76pRhpgXYz+fZmJb9cAh
 LU2QtCjDsVzVzpnGnsUo1mPoarPv1VcDoOKwgXTYAMAebJfZT/55/GhId
 NU7j//W8DRoDgmzoUGsO4/dGmGqeE75PtpV9avajvuyY7duMuLHByJxOr
 zB3Ez7zrTxG/mGumwHBF85lhBW7MO4MRfbgC68oIkBZASluZTxhTys8pS
 mH4uG5pVr8e9L+7sV3njXRz98swQ+1T682sMiVcBc7yQYiOzV0bTtO1gW
 VBMcWlJfdJiAyGcRixFTXBxA3+brMzHxgaceObM+LSl4wKvs+vgG78xDK A==;
X-CSE-ConnectionGUID: AfupdOp2RtWLz/nH74RxwQ==
X-CSE-MsgGUID: /6YFEFxUTpuwaJ59Dtoj9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7296485"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7296485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 12:35:09 -0700
X-CSE-ConnectionGUID: Oh0nULEhRsqdzqXIdvYLXw==
X-CSE-MsgGUID: RMq5dIHPQT20c1CyKeDXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23030551"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 12:35:09 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v2 3/3] drm/xe/xe_guc_submit: Declare reset if banned or killed
Date: Wed,  3 Apr 2024 12:19:50 -0700
Message-Id: <20240403191950.242642-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403191950.242642-1-jonathan.cavitt@intel.com>
References: <20240403191950.242642-1-jonathan.cavitt@intel.com>
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

Add an additional condition to the reset_status guc_exec_queue_op that
returns true if the exec queue has been banned or killed.  The
reset_status op is only used for exiting any xe_wait_user_fence_ioctl
that waits on an exec queue without timing out, so doing this will exit
the ioctl early in cases where the exec queue can no longer function,
such as after a GuC stop during a reset.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c93ba4bc611b8..70ec3cc4f9408 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1371,7 +1371,7 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	return exec_queue_reset(q);
+	return exec_queue_reset(q) || exec_queue_killed_or_banned(q);
 }
 
 /*
-- 
2.25.1

