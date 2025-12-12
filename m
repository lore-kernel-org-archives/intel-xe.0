Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4144ED59F59
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 23:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CC110E979;
	Fri, 12 Dec 2025 23:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+IIlYbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937FA10E132
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 23:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765582490; x=1797118490;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2OmJ9LWlhSxAZsvddv9uA39sdhJkrnzfAQaKhgTL5mY=;
 b=Z+IIlYbGzjzbsli6Zw5A+0aSvGsnbQJ3fba6UEk3afwFf0zFEH/bFJex
 0AbXtBo5q7pZKJXBkGcQsDUbgBYaMyYb37fgQdCWQ+H5elo/UJk6ApC8m
 /RCaBSDwAYhrzCWCcJEIrGc0/0ln1v6v+ohTwEjO33hwYngpdxzPkyFWL
 mpFBAn9aNU7jPIOWyK11Akugv7WJwxXPH6KpKq95lc6xFgwj45qwoUAW+
 G2APhug8F7n2IbUxhTJ6qz/n6PUVbA9AcELFEhvvICTjtbgau5O8Zo/Md
 b1SxHbBur02YI6/R7cx60elBII3BTwrO7ZCiV15IBFOjdGNoIgxtavUho Q==;
X-CSE-ConnectionGUID: zpJ8GczMTF2Fkjhybi/zdg==
X-CSE-MsgGUID: otQNNp1rR3aH7Xdic+7/fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71216669"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71216669"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 15:34:49 -0800
X-CSE-ConnectionGUID: rS0YXeISQE2qM5QWkLKhCQ==
X-CSE-MsgGUID: VZoNfeZERdmSre6OFI6PCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201696878"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 15:34:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 1/3] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Fri, 12 Dec 2025 15:34:42 -0800
Message-Id: <20251212233444.1717326-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212233444.1717326-1-matthew.brost@intel.com>
References: <20251212233444.1717326-1-matthew.brost@intel.com>
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

xe_guc_submit_pause_abort is intended to be called after something
disastrous occurs (e.g., VF migration fails, device wedging, or driver
unload) and should immediately trigger the teardown of remaining
submission state. With that, kill any remaining queues in this function.

Fixes: 7c4b7e34c83b ("drm/xe/vf: Abort VF post migration recovery on failure")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21a8bd2ec672..21c6f8364647 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2823,8 +2823,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
 			continue;
 
 		xe_sched_submission_start(sched);
-		if (exec_queue_killed_or_banned_or_wedged(q))
-			xe_guc_exec_queue_trigger_cleanup(q);
+		guc_exec_queue_kill(q);
 	}
 	mutex_unlock(&guc->submission_state.lock);
 }
-- 
2.34.1

