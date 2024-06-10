Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB3FC27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBCA10E475;
	Mon, 10 Jun 2024 13:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBt33OVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC9F10E189
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718027384; x=1749563384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ahlUwscNnEiCx4WjoCLCcHJY4dX/WNkfqSY/lTLtsh0=;
 b=PBt33OVtiFCG41NPm5DxVtlenWMlYXU0yp2017dgW4yhBSUFSva7z8yo
 E0QIbGLpP8J+BniKy4mbudUN6Cp0W/j85OsbtDaBGaT+GYmFs7zLeVmWq
 iOi/j2bgLLTj4CgUo3wNlaZRf3Xk/4rJJHnz3ArkOEoTJCjRGYhCsUyKj
 BxUkfL+qPNL9ZblWA2+gzOQHEmla/iTNVLWfn0y9UAhwV+hIy3VLIk5jH
 7xDGJo5/qRVv9Wo8+oVQunfUp2UqgaPY9fx9uOZgJDYuAt6x5cbZtiO62
 r5tByGxROvR+qkVI96isbbJ6leJjIO4KT/u99R9CHdJrKuSreZ2d3r0m4 g==;
X-CSE-ConnectionGUID: oP8FlUi8RSKvyXrRXgC1JQ==
X-CSE-MsgGUID: P4wvDEu7TLqd3eWMywj+Zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14419833"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14419833"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
X-CSE-ConnectionGUID: 4NFYN1lNRk2GvDadWL6LPQ==
X-CSE-MsgGUID: 5JhyYZOfQ9yP9b2HoCg0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76523127"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/xe: Add GuC state asserts to deregister_exec_queue
Date: Mon, 10 Jun 2024 06:50:08 -0700
Message-Id: <20240610135011.2605272-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610135011.2605272-1-matthew.brost@intel.com>
References: <20240610135011.2605272-1-matthew.brost@intel.com>
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

Will help catch bugs in GuC state machine.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 766ff8e48dde..e697732f1e74 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1587,6 +1587,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 		q->guc->id,
 	};
 
+	xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
+
 	trace_xe_exec_queue_deregister(q);
 
 	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
-- 
2.34.1

