Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A52D711C7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8671610EB95;
	Thu, 18 Dec 2025 21:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHnJ17ZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B3A10EB95
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766094264; x=1797630264;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AtKbPt/ryG3GYMqiflDvSKEyiMCtqwwUtRUxdkB+r9I=;
 b=OHnJ17ZJc/RtyZSuUzbkmkNNmT/nPb1fB8Hsx4bqHUPZqWK9chochwGp
 zdNUyVPliQ0R7yLIvBA+8SM1XomQQhYQbI2eS3ITHGxQ7n9uHgZBvIfY9
 UpsVPBAga1TiLK6GafDr6D10iv1uxUN+PB8B3WT5/lmuStb5wQi8dO0jV
 n+/XR6MkMgezFfldi5mHkgAs0Iyv4oRkIITaAylU7MgkmkxKY18zVQ/G4
 4wxQL8t6ef1POmCU4dGgCwMC8Y5+/EcU132CG5RojYf9JVRd25VYpfhAL
 atl3v+DYVsQfTpFaXkdDk+CfsBsUKkGOt9wSmchh/8MtWq8jQY3Vum+7e Q==;
X-CSE-ConnectionGUID: coIrHbp6S6Wn0t7OPSCouA==
X-CSE-MsgGUID: MHG6Pck8TLe3zLGXEHdi7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68104129"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68104129"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:44:24 -0800
X-CSE-ConnectionGUID: risKfXghSLi6GIB27pPKxw==
X-CSE-MsgGUID: wioUhd8CSL2TRkfe+Ure1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199166550"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:44:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Thu, 18 Dec 2025 13:44:16 -0800
Message-Id: <20251218214418.4037401-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218214418.4037401-1-matthew.brost@intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
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
index 43fd2069f9b2..071cbfec2401 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2890,8 +2890,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
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

