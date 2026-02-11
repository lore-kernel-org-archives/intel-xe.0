Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C6DECD6F8
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDFE10E150;
	Wed, 11 Feb 2026 22:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtDS9XCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83B89E69
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770848424; x=1802384424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QIdzlmeRuW02yxleV9RXkd4SZV/3Vp/4Ei7AIjsUXLo=;
 b=XtDS9XCwMpgZNW7iqfxEUo6HEsT/XBfO0XFnNZIKOZ7SSo9+mgbCtuh8
 +PX9UkFU+/bM3eSr7KAit777IBTRw7EXcbL3gGzEaSAhKcR6L+kIQcR06
 mgVylRfgv92iFkiZPzkrZ8fMuBS/7nQH63wNcqo+lYH1iqCZIg7GM9mlG
 rOkiVnaTXC0fe3Nod+hBPpy+dLzHJJzqYvKkP5hQnthakGAZtIUIkEaZM
 CteajJeM5OTIUTiZxRAMmuAjoOlUwrixDARvHIpZJD4k/InOwC1Ol/W3+
 54sPLRBAqgMAS4qdE7WtjacWToCmV+gvuQqR8VRltK6ETzqow9lQT5i5M g==;
X-CSE-ConnectionGUID: +ikW/jGpThuwYzFI9khwaQ==
X-CSE-MsgGUID: UFtNuaRlRZiDSibTv32lwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89415207"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="89415207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 14:20:23 -0800
X-CSE-ConnectionGUID: PSgv1R+CT7WVlOaTMpnHkw==
X-CSE-MsgGUID: gkVDmZFMS/G+SouVuBqNVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212479573"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 11 Feb 2026 14:20:23 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v6 1/6] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Wed, 11 Feb 2026 17:20:15 -0500
Message-Id: <20260211222020.848341-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211222020.848341-1-zhanjun.dong@intel.com>
References: <20260211222020.848341-1-zhanjun.dong@intel.com>
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
index de716c1fb18e..42712acf2ec2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2763,8 +2763,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
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

