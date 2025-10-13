Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CDFCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F0910E503;
	Mon, 13 Oct 2025 22:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhX/+A0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A076810E502
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760394698; x=1791930698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ussF/W66/C3ODSapbGOrg1cZOfRvYmViJlBJ5MXFGz8=;
 b=XhX/+A0F41V68496CFlTB824F2fozJeRMGp2EOMbTKqdmwFoK3JPxMpB
 gGhJcwiWdIJHgNw107P71wfFV1klCWXNWyT+A1S4cUHr5yozBxABndjWw
 nAkS3LofUrGKRxyt/zVeLJVV+a0Cwi6Ij0C+Y31MPiaei7IwbzAPy6CKD
 SbRrAZdNbx0ytXnl+zzsCetAMXv9GB/vWxxfsb76TjGS2yKYMbVviusvk
 9lR9QxlHyUR7rIoeZFPfSFwxQZQsDIxKyUrfF8JCWYIQyep7zIieRvAon
 ip7TGYNc4pU3hkFKyd8tiOLvfylV5HTZ9P6QXG+k6quVzcpGKiHpN0+Nm A==;
X-CSE-ConnectionGUID: eH4i0whDQv+OVdWDKAmWFQ==
X-CSE-MsgGUID: OKw3T801RY29yq5OI+/z6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="79987313"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="79987313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:38 -0700
X-CSE-ConnectionGUID: ON6P2uS/R9ypbEW9rMQRAw==
X-CSE-MsgGUID: wWOkqBUeRBKSd0Virg+BsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="212677593"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 7/7] drm/xe: Check for GuC responses on disabling scheduling
Date: Mon, 13 Oct 2025 22:31:35 +0000
Message-Id: <20251013223135.189357-8-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013223135.189357-1-stuart.summers@intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
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
index c923f13a13ef..ca37c7a8c5ed 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -924,6 +924,8 @@ int xe_guc_read_stopped(struct xe_guc *guc)
 		GUC_CONTEXT_##enable_disable,				\
 	}
 
+static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
+
 static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
 {
@@ -961,6 +963,17 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
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

