Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B22C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D9110E7A0;
	Wed, 24 Jul 2024 19:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKkVzmW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1527E10E79B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849703; x=1753385703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uEde615hYEkV29CKCGyk8ndLNleKn3sVCvnlIKq+17M=;
 b=oKkVzmW5DUKgHbXRYOb67Z0iKCT5gmVpyWZXJSawdwR3ZX76pUCEz3vg
 A5fRLRwZUaEunMiquaY2nRwv3m9WnRcYiMbf5iR4S135iXMk1sYi9kdHm
 KR/wxopVhJsgT+MI6K1l7eq0ih1MoAxWY8nTnt1ahGObOUYwbfIxZOr5g
 Lu3Odk/Kx0ufeb38f/bRs2P+uZVzDq2uYA+eSGTPMBhc1p9FVxA80PFkN
 JwFm61fMVWoI55JoClO50cRnTAEcvsknrEPOaA2bGg8ydcwXB5J+sw9Id
 Gkt0Y72COI2Sd+8QefSCQcfAsBdR7v9zd9UQgR/4JH5ukgVL4mCuMweYm g==;
X-CSE-ConnectionGUID: iMLAjFIQQOexGv+2wiatoQ==
X-CSE-MsgGUID: PqfgD3G9TdOhMZeDXAiCsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691128"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:03 -0700
X-CSE-ConnectionGUID: MqF+gYQOTqGkiX+UQf+qqg==
X-CSE-MsgGUID: P9v6+A51TL+02NDs24R9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292237"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:02 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 02/12] drm/xe/guc_submit: Make suspend_wait interruptible
Date: Wed, 24 Jul 2024 21:32:55 +0200
Message-ID: <20240724193431.2685833-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
References: <20240724193431.2685833-1-francois.dugast@intel.com>
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

Use wait_event_interruptible() instead of wait_event() to put the process
in sleep with TASK_INTERRUPTIBLE. It allows using this function in
interruptible context.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8d7e7f4bbff7..d5c272a48e64 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1575,9 +1575,14 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
+	ret = wait_event_interruptible(q->guc->suspend_wait, !q->guc->suspend_pending ||
+				       guc_read_stopped(guc));
 
-	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
-		   guc_read_stopped(guc));
+	if (!ret)
+		drm_warn(&xe->drm, "Exec queue suspend failed to respond");
 }
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
-- 
2.43.0

