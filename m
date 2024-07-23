Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE700C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 19:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE8510E61C;
	Tue, 23 Jul 2024 19:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/GgQWIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710DE10E61C
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721762182; x=1753298182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Se8hglLR1fvUcrDehvG7YYGE/Y8gJO/C1wV2D4fz2Q=;
 b=c/GgQWILp8tEMbTfqV+ItyA5FJAgP5aELAQiD5OMaEC74pYqESYIXE9c
 xTIOxTvMDJ6oa//7d7MSizxHVXbNJEgsErAY9xeA9x5xslh6HGAii3YJA
 64fD+E44gWCLBbXev/CBRmD02D7RlyX5KcLyqY6fuXgkYVq2+gRbdORYq
 NLqZfvjZmVXBcl2aeyI08cstpBHmWCDzBC1Oeg/4T+AxeD+/yezpC/bkA
 dK6hO7PXBHYNPlExOr82MEDv8pLNvzBXjSuVSR+uM9fJlvqiEwaN3k6Gs
 3yaKTTlWxoDad/C1Ge9fA0Tq9mhuWPsts0cGB9E2YiMOmI3PTwfj661eu A==;
X-CSE-ConnectionGUID: 9q7l0HXoRqqmVm6dy6yJtg==
X-CSE-MsgGUID: +hvIjs/ERoOPHHc9I9cIDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19536976"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="19536976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 12:16:11 -0700
X-CSE-ConnectionGUID: tO9SrI31QXyNXvju8RmIXQ==
X-CSE-MsgGUID: 8tTSjxhgQQ6INSHSo3pDnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="75552602"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 12:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dan.carpenter@linaro.org
Subject: [PATCH] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Date: Tue, 23 Jul 2024 12:16:57 -0700
Message-Id: <20240723191657.1751451-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Store xe_device ahead of processing message as message can be free'd in
some cases.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index da2ead86b9ae..43b8aad4dc70 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1395,6 +1395,8 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
+	struct xe_device = guc_to_xe(exec_queue_to_guc(msg->private_data));
+
 	trace_xe_sched_msg_recv(msg);
 
 	switch (msg->opcode) {
@@ -1414,7 +1416,7 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 		XE_WARN_ON("Unknown message type");
 	}
 
-	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
+	xe_pm_runtime_put(xe;
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
-- 
2.34.1

