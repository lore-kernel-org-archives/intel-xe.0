Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA9FC2A07A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEEE10E359;
	Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ht1aHPN/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751C510E1FF
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/RuygoF5aLM82Hq77T1sA/K3MPYaUzKJSloyiwIYpBg=;
 b=ht1aHPN/c/Rji+4rTCZ8FWlBayvDcKjT8FFGpAhaw5W0vTXuLJrJPkYZ
 tdfmji4glleMI8Fs1dVW9e3yeFALTWwRG4XSBjHueYvvh4ZeKGzUXeWiE
 AyXU67LutOrLx6aDhMbXq67wJRWHdXl5WqMw1w+ENyVnGbUb+caVhRcn4
 EU9Mvlr2WEYzqsICEd/0YN4iB3d4DtzCwrdiBvv3BDMvVL5oDbJj2igFb
 Xjgbhcew4xpgsFbAzsyUk6rLXZlv3tYyF1qduWHCl2DjHvDhEeAUW/FGR
 JbZpihp/7+4HGLjliQekivp9dnD22Aq+QUlYWlxK7YVJieHMzorA+WQdY A==;
X-CSE-ConnectionGUID: 2R8m+PN4TBmH82kYj3yQdQ==
X-CSE-MsgGUID: gSoa4tL4RFaLzQnwrff13Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856259"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: tqVwpmB3TGeUOG8NSyYT/w==
X-CSE-MsgGUID: Lyuv0BSkRQmoO4GMF8ieDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060667"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 09/22] drm/xe: Stub out execlists deadline vfuncs as NOPs
Date: Sun,  4 Jan 2026 20:02:24 -0800
Message-Id: <20260105040237.1307873-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The execlists backend is non-functional but shouldn’t crash. Stub out
execlists deadline vfuncs as NOPs.

v2:
 - Use set_deadline_state vfunc

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 46c17a18a3f4..52c83c4b48ac 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -469,6 +469,19 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 	return false;
 }
 
+static void execlist_exec_queue_set_deadline(struct xe_exec_queue *q,
+					     struct dma_fence *fence,
+					     ktime_t deadline)
+{
+	/* NIY */
+}
+
+static void execlist_exec_queue_set_deadline_state(struct xe_exec_queue *q,
+						   enum xe_deadline_mgr_state state)
+{
+	/* NIY */
+}
+
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
@@ -481,6 +494,8 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
 	.reset_status = execlist_exec_queue_reset_status,
+	.set_deadline = execlist_exec_queue_set_deadline,
+	.set_deadline_state = execlist_exec_queue_set_deadline_state,
 };
 
 int xe_execlist_init(struct xe_gt *gt)
-- 
2.34.1

