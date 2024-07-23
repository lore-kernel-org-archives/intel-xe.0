Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09606C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 19:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833AA10E620;
	Tue, 23 Jul 2024 19:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fc1qXf+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC2210E620
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721762298; x=1753298298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5rCnBT/WsTgGuQKpFwo+Ne4yznZPm+ASx/LLuZNPrkc=;
 b=fc1qXf+GDv4HZHtQf/M8FD7EceW+5oHKoR87zREhHKt1NSpigEc4aznZ
 B6M+pSvQcogacRfGpKoNnLPt3dGVmYw+mnTT+jrFQ/h7XRE0S5G+iEeNX
 nRd4BMSo9vZdYQ8PTj4eyvIp2cjDSbI1L3Ive5sebozUqNqW61vHBOLr+
 3U5PvHZlvxklbwIOkz1WjMN+zSw8sA5Yp8QRP753DR48W4tA22aARPptw
 PsM/xCnvI87adgI310Fkb6PNEbjmF9iDeDllF1CLjRwO3FcPKm3XESmMr
 C7auaAbHQ08vDwmkySHWxu/gTz0Sk6nboY5WC7sjFFkQXmJ18FgLLqBfa g==;
X-CSE-ConnectionGUID: 9PMyOAFBTTK8+REGPDC1gQ==
X-CSE-MsgGUID: nfRq8g5/S1GYuTj+rJTiHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19537200"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="19537200"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 12:18:18 -0700
X-CSE-ConnectionGUID: 3XXQdgHJTA6dtz8bZVNlKA==
X-CSE-MsgGUID: hgRl2xIoSL2VzoEyevY7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="75552895"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 12:18:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dan.carpenter@linaro.org
Subject: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Date: Tue, 23 Jul 2024 12:19:03 -0700
Message-Id: <20240723191903.1753729-1-matthew.brost@intel.com>
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

v2:
 - Including missing local changes

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index da2ead86b9ae..b8f938539a90 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1395,6 +1395,8 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
+	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
+
 	trace_xe_sched_msg_recv(msg);
 
 	switch (msg->opcode) {
@@ -1414,7 +1416,7 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 		XE_WARN_ON("Unknown message type");
 	}
 
-	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
+	xe_pm_runtime_put(xe);
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
-- 
2.34.1

