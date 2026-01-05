Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFFBC2A072
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D98F10E375;
	Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwxSuMp1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EC010E375
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585766; x=1799121766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEyadU88a+IbWFvLjjOadOkAKVdep1cWp+vf0ii6Ml0=;
 b=jwxSuMp1zD+Hnnc3TfjbcRuQcCqDs1B2H/vk791zUunrNpf5fiMM/M6p
 fM4cIGNYMHE7HG2OBYPZSMmtg4DYfWAKPGv6U4CRqbjiZAAwrEWYILGN0
 zINlyXRiPqIhFjVjLGbWs1paZ8dwcyqQoRYeCByLdb0azMRVOlG8B8E1b
 Rety/E0jVpI/etxkVhiY/iWBXDuyUm+VVjdHgn8QE73ni3xh5vo8b6GM5
 yBUONM5Y9zb6NgKprja8RoqtU82DIEdTDK2O7km0or5EMlPzuC7Ua63bG
 7tYhksXf8pjPgWpUnYKXu6MWLFB94Pe0qESWDomhv15F52MLPFfGA23d/ Q==;
X-CSE-ConnectionGUID: OOjUKoWtTWOM+MgjHvCl7g==
X-CSE-MsgGUID: 51iBcy5NR86L/3hSRkEnJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856273"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856273"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:45 -0800
X-CSE-ConnectionGUID: c3rCKegUSqaeW1TROJVy1g==
X-CSE-MsgGUID: N1vftiyYTaai4bT1hIhu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060691"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 19/22] drm/xe: Enforce GuC static message defines
Date: Sun,  4 Jan 2026 20:02:34 -0800
Message-Id: <20260105040237.1307873-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Ensure GuC static message defines fit within the static message memory
layout using BUILD_BUG_ON.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7e47c375f530..051e57d3e540 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2294,15 +2294,20 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 	return true;
 }
 
-#define STATIC_MSG_CLEANUP		0
-#define STATIC_MSG_SUSPEND		1
-#define STATIC_MSG_RESUME		2
-#define STATIC_MSG_SET_DEADLINE_STATE	3
+enum {
+	STATIC_MSG_CLEANUP = 0,
+	STATIC_MSG_SUSPEND,
+	STATIC_MSG_RESUME,
+	STATIC_MSG_SET_DEADLINE_STATE,
+	STATIC_MSG_COUNT,
+};
 
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
+	BUILD_BUG_ON(STATIC_MSG_COUNT != MAX_STATIC_MSG_TYPE);
+
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
-- 
2.34.1

