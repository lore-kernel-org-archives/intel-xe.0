Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E126FC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A909910E9E8;
	Fri,  9 Aug 2024 19:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIMH6Qjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F2810E9E4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723231120; x=1754767120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T0mnGIqaICYdJEMmNucZ2MXCa6GpidYyhwY+e3xe8+k=;
 b=RIMH6Qjt3r8PwWSR+J+rVtdl2v5Yp9ki4qyuQPJgRvI0KcMG34l8XyPG
 /vMYp8VF6+xWkUy3qDvJYZZOqxQIT1Qy8SpNzwBkEGNKTbLpdG6yCDqd9
 ty4BD6FKvRs7P/dj5OqtGUsWAv3mDcdDc0qwJcblc8rpxe2UBhxAdhXdV
 513893+Q9x2xUKw/sD1q9sB0HON+QucSJtcocujgrnkTZJJbxSTPnFqgP
 EcaGrg7HQV9UV9ZR6MvFqxLc6rsiNi+M3F0b4fN8nX2OKoVvezOVQE1U0
 2P8zCcEY2LXI+T1hof2t5iS4fkd902eoCYZCsM7RjiHa5eQ0nmBhgDOMo g==;
X-CSE-ConnectionGUID: UIC4aX8BTYKVxpAU/ljr7g==
X-CSE-MsgGUID: LSk9laZ1SAiNWYh4koLpAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32566814"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32566814"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
X-CSE-ConnectionGUID: lakAcIybTBSencYH8wgfdA==
X-CSE-MsgGUID: y9oYuc2BQT+nsRptgy79Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88294757"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH 4/5] drm/xe: Only enable scheduling upon resume if needed
Date: Fri,  9 Aug 2024 12:19:28 -0700
Message-Id: <20240809191929.3138956-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809191929.3138956-1-matthew.brost@intel.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
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

No need to enable scheduling in already enabled.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 460808507947..a9af33ff8aa7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1374,9 +1374,11 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 	struct xe_exec_queue *q = msg->private_data;
 
 	if (guc_exec_queue_allowed_to_change_state(q)) {
-		q->guc->resume_time = RESUME_PENDING;
 		clear_exec_queue_suspended(q);
-		enable_scheduling(q);
+		if (!exec_queue_enabled(q)) {
+			q->guc->resume_time = RESUME_PENDING;
+			enable_scheduling(q);
+		}
 	} else {
 		clear_exec_queue_suspended(q);
 	}
-- 
2.34.1

