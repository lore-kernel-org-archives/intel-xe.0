Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A4DD59F5B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 23:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCBC10E132;
	Fri, 12 Dec 2025 23:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oc2z764S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DD710E132
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 23:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765582490; x=1797118490;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3aMfkop2+7nAW0RSlC6UcrHCu11nsX7JGbpdjpuP90I=;
 b=Oc2z764SIc57qp/BWZoMrUWDkY4+p+zfCoKZgTGpgoawFrx80bNNimv0
 lPhMyrd+fk+Tm2w8NkBN4lj8I0Ac1CeWDB5nodGcF/pwI5wvoYE8wzoao
 m2VOgurxdvRLWYvDU702hW6v5R+52Wdu9VhvVoVjVscI7WHVk982YOHW1
 Wx4LdXB9ICGqg/S9d5817WM5EEDBvvw8MZppmPZv5nHH1u00vCPBjFvBd
 Oq+y+by/MXkMt9ToiFiRcN/ZUwO0TTruoTCCxST15+2BQUTTAubhxKqj9
 7xA/JbheKOXGU0bmb1UdPC5JrVVHfZxFBhiu+XZVUXyMf49xkR6JiVkE6 g==;
X-CSE-ConnectionGUID: VNYhYBX0RxKtac2Xc6AbdQ==
X-CSE-MsgGUID: fkJVXdH2TT++DhT38NqHEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71216670"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71216670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 15:34:49 -0800
X-CSE-ConnectionGUID: YukAOJU6RYKpfnLrZG/hFw==
X-CSE-MsgGUID: I+pqq06oRzGNSUyDeiYYbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201696879"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 15:34:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
Date: Fri, 12 Dec 2025 15:34:43 -0800
Message-Id: <20251212233444.1717326-3-matthew.brost@intel.com>
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

In GuC submit fini, forcefully tear down any exec queues by disabling
CTs, stopping the scheduler (which cleans up lost G2H), killing all
remaining queues, and resuming scheduling to allow any remaining cleanup
actions to complete and signal any remaining fences.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21c6f8364647..857375be9a84 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -280,6 +280,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	/* Forcefully kill any remaining exec queues */
+	xe_guc_ct_stop(&guc->ct);
+	xe_guc_submit_reset_prepare(guc);
+	xe_guc_submit_stop(guc);
+	xe_guc_submit_pause_abort(guc);
+
 	ret = wait_event_timeout(guc->submission_state.fini_wq,
 				 xa_empty(&guc->submission_state.exec_queue_lookup),
 				 HZ * 5);
-- 
2.34.1

