Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA09CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 23:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1211124B3;
	Wed,  3 Jun 2026 23:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMqR5FUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81651124B3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 23:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780529992; x=1812065992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C12XFM9Q2bcHv35yx9AmXS9VY9W1DOoAKeB4Gp6kxgQ=;
 b=cMqR5FUKjTX94Q37DLwzfRm0KMt/7NHJwTSe+XMa+d0vjO36vlif4RYc
 OghrLKcGziYDgRA5AOfDms9YK8rT/G+jsyPKfr5iG8bjxO1HuZ5ebm+aY
 VwWqSuVwjUQ6C6pu/+SmnB5V/P5IKMArlCO/zua0E03NCYUk46N3Gm466
 /ghQajk++WChRaWH/h4aWBfTSJkxLLdOZ0Mk6Kmh3iMH2m3lmMz2fRdcU
 vZnaRlpZN7jSJBxK7vdrK6aC6XMNz25vZQFPorRJYwR9QpkqnZ9DS5Pxm
 KLEFXvq5vKOmaTuzi/jCB8/FAfPCCYgzzryXlBohXv5mzwRub+UGE/uC7 A==;
X-CSE-ConnectionGUID: 3bhJew4/QFmWfZFLubydlg==
X-CSE-MsgGUID: +z5py+piQHuH9VkZohpurg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85242550"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="85242550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 16:39:51 -0700
X-CSE-ConnectionGUID: a/VI9N4HR8ez88ny2ee3gw==
X-CSE-MsgGUID: +JiXk4BQQVyUC6FYNPH3NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="248330703"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 16:39:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com
Subject: [PATCH v2] drm/xe/multi_queue: skip submit when primary queue is
 suspended
Date: Wed,  3 Jun 2026 16:39:47 -0700
Message-ID: <20260603233946.863663-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Return early in submit path when the multi-queue primary exec
queue is suspended to avoid submitting while suspended.

v2: Remove idle_skip_suspend fix as that feature is being
reverted here https://patchwork.freedesktop.org/series/167262/

Fixes: bc5775c59258 ("drm/xe/multi_queue: Add GuC interface for multi queue support")
Cc: stable@vger.kernel.org # v7.0+
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 122a0983df18..4b247a3019d2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1151,9 +1151,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 
 	/*
 	 * All queues in a multi-queue group will use the primary queue
-	 * of the group to interface with GuC.
+	 * of the group to interface with GuC. If primay is suspended,
+	 * just return. Jobs will get scheduled once primary is resumed.
 	 */
 	q = xe_exec_queue_multi_queue_primary(q);
+	if (exec_queue_suspended(q))
+		return;
 
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
-- 
2.43.0

