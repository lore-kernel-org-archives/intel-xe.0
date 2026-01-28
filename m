Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516F5D46C19
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60C010E782;
	Wed, 28 Jan 2026 23:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pev0HXCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802D010E77C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769642196; x=1801178196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5g7eNrockMgk0yivVHjBlRycQ6V13a9tjJgfB5sdCxI=;
 b=Pev0HXCKeLd88gSlA6Qe16RbkuHcLEH2NYHOuzzUrPx4bMV0b+v6/F4N
 emu8KPS4s72/qgftQTWFyo/OpBan9WIy5tlhdkK0RZhxy6d1xcIwKD7q+
 mLfjz9mIb3GleVWL/Xd9mJ3Od8GSZeX2fvg3Bab2hbyI/7tVoTn49opAR
 LPsF4QCyUc4i9oD8jkXjDJdzlLBH3JdamMbWaOTAurGDfhbIn/CGzxkLL
 Z3Gm0qAIuDiOl9tAYyqo0KBIEUi4HAwMy59xl8elB1GQ5wD0jLe0qBqmn
 DOh/5/pH+WXiRwLgzVA8VOaaPs9eemrQUoETKoiIC49MqB8WDW/slapjw g==;
X-CSE-ConnectionGUID: QH8zuXUeTuqxqbapOduOTw==
X-CSE-MsgGUID: pSubEmHCQvyFj1yXufyb3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73462215"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="73462215"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:16:36 -0800
X-CSE-ConnectionGUID: 75HHaZAQTTeeqRMYqE6vgQ==
X-CSE-MsgGUID: WS/uZoy8St6Mqwz17DDxbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213266639"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 15:16:35 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 1/6] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Wed, 28 Jan 2026 18:16:29 -0500
Message-Id: <20260128231634.982494-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128231634.982494-1-zhanjun.dong@intel.com>
References: <20260128231634.982494-1-zhanjun.dong@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

xe_guc_submit_pause_abort is intended to be called after something
disastrous occurs (e.g., VF migration fails, device wedging, or driver
unload) and should immediately trigger the teardown of remaining
submission state. With that, kill any remaining queues in this function.

Fixes: 7c4b7e34c83b ("drm/xe/vf: Abort VF post migration recovery on failure")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 456f549c16f6..d61bd0094e0b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2774,8 +2774,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
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

