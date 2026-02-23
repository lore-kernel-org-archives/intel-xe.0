Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB41AEEC282
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A55710E298;
	Mon, 23 Feb 2026 21:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXoE5ZAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20210E298
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771881888; x=1803417888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8GXbj3CGQ0I9TJNXKKW+fS+QtEWwWG3Dv33gOeBqp28=;
 b=mXoE5ZAHZVMOQuJU6qbKTaBnUrYUbNMvIbqkBNcVh8XVSqQOND81Xl1Z
 1HpGkpiwJ2XzCeTMtY1J3K0BIF3UkpQGLbBeCK05l3hN1ldGzMtZHXoen
 BrkFb+xcYB9TEWD+/i01T+6ekpcVtA/3e/uSBecjz8MYT1XkSuxQUFPoH
 FJMutTSjEP/JlvHbs8QCowW1hOSzMMNCLhn07B9KOcjzWESMbAZ15xnWo
 vZiIt/0LR7xY58I+uN/3CnVQZVb5UBrvxg9i+qyJQ6zHKVy482s0gA1Ur
 dZ6UEiolTGjAMDGDaLthN5swYCi0GPrdw4hfiFZcP6SZGt7vWkT/bWxKi Q==;
X-CSE-ConnectionGUID: jON0r4/FTgOnZInWUq8mdQ==
X-CSE-MsgGUID: S7A91ZpSSqOPAlZ2CELNvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73068666"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73068666"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:24:48 -0800
X-CSE-ConnectionGUID: whm4NhiWSxSLvz2eum1ArA==
X-CSE-MsgGUID: sEVby6RiQx+9m7wvL/deyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214762141"
Received: from dut4094arlh.fm.intel.com ([10.105.8.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:24:47 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, michal.mrozek@intel.com,
 fei.yang@intel.com, daniel.charles@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Document exec queue priority rules
Date: Mon, 23 Feb 2026 21:24:42 +0000
Message-Id: <20260223212442.8923-1-stuart.summers@intel.com>
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

Add some documentation around how the GuC will employ
the xe_exec_queue priorities provided by userspace
application.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 3791fed34ffa..aefebfc6996e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -22,6 +22,30 @@ struct xe_guc_exec_queue;
 struct xe_hw_engine;
 struct xe_vm;
 
+/**
+ * enum xe_exec_queue_priority - Exec Queue priority values
+ *
+ * XeKMD uses GuC as the primary submission vehicle to HW.
+ * GuC has 4 priority levels that roughly map to the 4 levels
+ * shown here but in reverse order. GuC scheduler uses time
+ * slicing to determine how long a queue should remain on the
+ * command streamer before issuing a preemption request to
+ * allow execution of another queue.
+ *
+ * The following rules should be considered by applications
+ * employing these queue priorities:
+ *  - A HIGH priority request will preempt a NORMAL and LOW
+ *    priority request when submitted and based on the time
+ *    slice quantum.
+ *  - A NORMAL priority request will preempt a LOW priority
+ *    request when submitted and based on that time slice
+ *    quantum but will not preempt a HIGH priority request
+ *    until that time slice quantum has been reached.
+ *  - A LOW priority request will never preempt either a
+ *    MEDIUM or HIGH priority context.
+ *  - Currently KERNEL level priority is reserved, as the name
+ *    suggests, for kernel-submitted queues only.
+ */
 enum xe_exec_queue_priority {
 	XE_EXEC_QUEUE_PRIORITY_UNSET = -2, /* For execlist usage only */
 	XE_EXEC_QUEUE_PRIORITY_LOW = 0,
-- 
2.34.1

