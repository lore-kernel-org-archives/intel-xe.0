Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3ACCCD190
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8786A10E4AA;
	Mon, 13 Oct 2025 16:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XecUDS2p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA1010E4A4
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760372713; x=1791908713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xC1ta/wPkN7f3cjlaQfrYrZpDm7oNKtxgbzc6PgvZuw=;
 b=XecUDS2pl6pKKXrIwa8cmEne7QtpupS+vkxnnpBiqDjgixY9neoj72jA
 M8j6Cet7mkb8UpKob9wRbMbXBulcsi7Aim9Jr8pMj9qbgrdNAnpwt6ZC8
 nktCfs2YLT8SqyVx8lR+6pYdnVk8mkDFgv/XHGiGKJ7/MyvmQQkL+Acy9
 lXz5NDkKZcfTd8TYyKRWj6yEriQHqkYfJenHV5pyZyo4alP6FM57N82Hx
 IyI6ZiLb5Mk1LLQREm9i48d+agpX33e9u7ArrNRJR8ea79QCp0IbQ4Yys
 ktXutLCPjggN4PU+CyIIq7CBdAY3rpbGM/LYtACprjHoNP5Ah91djJplU Q==;
X-CSE-ConnectionGUID: xHagJdI3QKeBoAgv2IgO1A==
X-CSE-MsgGUID: NtcKb1JXTK+QFRA7zb3JNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73963503"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73963503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:13 -0700
X-CSE-ConnectionGUID: NQEe2vYPR0uKj/mruWWV8w==
X-CSE-MsgGUID: N5FO2X7HQmyR3Yzn1Y3xnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185651416"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 7/7] drm/xe: Check for GuC responses on disabling scheduling
Date: Mon, 13 Oct 2025 16:25:04 +0000
Message-Id: <20251013162504.7768-8-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013162504.7768-1-stuart.summers@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
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

Currently if the GuC becomes unresponsive during a schedule
disable event, after we send the CT request, the driver
doesn't have a good way to recover. In most other cases,
we explicitly wait for GuC to respond by checking either
pending_enable, pending_disable, or some other state change
that we expect to be set after the response from GuC is
received for that particular request. Add a similar check
on the schedule disable side and make sure the queue state
for the queue being disabled is reset properly in that case.

v2: Only call the deregistration sequence since in this
    case the scheduling handler should be reset during
    the GT reset.
    By doing that, we don't need a way to track the scheduling
    disable request handler for that queue, making this sequence
    simpler. As a result, don't mark the queue as banned.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5ec1e4a83d68..6ba4a29007eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -918,6 +918,8 @@ int xe_guc_read_stopped(struct xe_guc *guc)
 		GUC_CONTEXT_##enable_disable,				\
 	}
 
+static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
+
 static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
 {
@@ -955,6 +957,17 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
 		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
+
+	ret = wait_event_timeout(guc->ct.wq,
+				 !exec_queue_pending_disable(q) ||
+				 xe_guc_read_stopped(guc),
+				 HZ * 5);
+	if (!ret || xe_guc_read_stopped(guc)) {
+		xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
+		handle_deregister_done(guc, q);
+		xe_gt_reset_async(q->gt);
+	}
+
 }
 
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
-- 
2.34.1

