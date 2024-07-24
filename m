Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB67C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 16:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7110E764;
	Wed, 24 Jul 2024 16:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cinFoGQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE08310E764
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721839374; x=1753375374;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4vnwkJyUqnAGm5MsJCY1wGVcAUrzAZ1VtzBKBi1yo6I=;
 b=cinFoGQaod63xs2MsYOojnbCEdHsTqGmf8aR8RxnJHRqKFZ+Y+48T8gs
 IpCnYUC2bpR8lH3tPhRd58sN28cV3mdnDIL16cE95/AbCvmRT4Jiykbyq
 jT22KEAL0W4v8bL9Y7+00C8np9Hn480YR/To+EAgdZ7P9AWsJCQMS+8FE
 pVbEr/MZfPOUBqFoJY2+2pYV5MPBm8T6mhTzN0NRnEU8TFCUEUKLAfewX
 jpui8mqKXgU0w5c3IwII2m6teJ1AjwJ8dFdIMnvzw6xKfSHsJZ5KyvWRI
 RMZggxLnLa5bKVbq8ktRJO0no7P92pXEKUZe0uTBGu4+xSeCm1nK+d8gy w==;
X-CSE-ConnectionGUID: HzrWxmwLSh6H4ZjtFL9tBA==
X-CSE-MsgGUID: aFItLx+WQN2EC3VnUmyLIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19410405"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19410405"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 09:42:53 -0700
X-CSE-ConnectionGUID: 8CvwDhvQT8iKGOOs5DldIA==
X-CSE-MsgGUID: ffD0h+JiSc6aIohjU/OrJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83250676"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 09:42:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Date: Wed, 24 Jul 2024 09:43:41 -0700
Message-Id: <20240724164341.1848954-1-matthew.brost@intel.com>
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
v3:
 - Resend for CI

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a4570631926f..460808507947 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1389,6 +1389,8 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
+	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
+
 	trace_xe_sched_msg_recv(msg);
 
 	switch (msg->opcode) {
@@ -1408,7 +1410,7 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 		XE_WARN_ON("Unknown message type");
 	}
 
-	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
+	xe_pm_runtime_put(xe);
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
-- 
2.34.1

