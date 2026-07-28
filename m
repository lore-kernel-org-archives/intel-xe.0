Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20CFC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 14:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DCC10E952;
	Tue, 28 Jul 2026 14:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7oRQwnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4411D10E949
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785250066; x=1816786066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pvd8CP28HgFuyF0V/0aaptWUiqod00Ylm55G9+FJz3c=;
 b=j7oRQwnjlNJ26B4JEEGIsL5JUDsdkmU5YGcYsizhwTpzHga0EP+q8VaN
 6PNmnOvfTr6yY+omS7K+E1SeeM+fqbBb4PupEdQ8LHe8FC+K8k5qvF8wG
 rqQViUR5QzteJrDB/CDJmifqF2CHZwalNsYi0crJXoq+rAGXd//l6gzBA
 dg05mnWH9ApaZvUvfqbeQtWWZMipTvq02b3otwBgH4E/7LqjlUIs0AghU
 /PVn0/E3Xv/hu4HPvM+oaxGZQKp/DRJpL1dJLvvFdi2yVIBV6supIck1v
 xraPhPkFCpUOeTqABvjWaTpYZY6hrZmCKk8LrSuIn8fAuDUPdWjvFBF7X g==;
X-CSE-ConnectionGUID: pYcdNioNTfy/OXcSgHx4Ug==
X-CSE-MsgGUID: jbmcH9OJSja3Qttnojyxew==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84815065"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="84815065"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:47:46 -0700
X-CSE-ConnectionGUID: picV0aq7QjO0TtvsfXBG2A==
X-CSE-MsgGUID: pptvRbm7QLGwTyNF0xMncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="263517368"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 28 Jul 2026 07:47:45 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/guc: skip CLEANUP message when device is hot-unplugged
Date: Tue, 28 Jul 2026 20:54:53 +0530
Message-ID: <20260728152452.1129581-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

When a device is hot-unplugged while a DRM fd with active exec queues is
still open, the fd close path runs during process exit and calls
guc_exec_queue_destroy(). This queues a CLEANUP message via
guc_exec_queue_add_msg(), which internally calls
xe_pm_runtime_get_noresume().

After hot-unplug, pm_runtime_disable() has already been called, so
xe_pm_runtime_get_noresume() warns with "Missing outer runtime PM
protection".

GuC communication is no longer valid after unplug, so skip the CLEANUP
message and destroy the exec queue locally via __guc_exec_queue_destroy().

Observed with new IGT core_hotunplug subtests:

  igt@core_hotunplug@hotreplug-with-load
  igt@core_hotunplug@hotunplug-rescan-with-load

Link: https://patchwork.freedesktop.org/series/166744/
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8aaed4fd13ea..b5035c19d7b0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2131,12 +2131,15 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 #define STATIC_MSG_RESUME	2
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
+	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
+	/* If the device has been hot-unplugged the GuC is already gone. */
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q) &&
+	    !drm_dev_is_unplugged(&guc_to_xe(guc)->drm))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
-		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
+		__guc_exec_queue_destroy(guc, q);
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
-- 
2.50.1

