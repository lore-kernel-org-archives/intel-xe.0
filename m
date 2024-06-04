Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34323C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 10:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD46D10E05C;
	Tue,  4 Jun 2024 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SC4PKizP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09E910E05C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717497893; x=1749033893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2LbWWBFZNZOHrATGdPbNyTYafDHbrzqQZ/TiS8Dk14I=;
 b=SC4PKizPRwSL3naVXUgq0Pc6AnT6ciyPXtHB3cv9PU3D4hifc3EseY5J
 3knOdGWIWMwS09s3G93Ddb1Bx0iDiIF2J2wMFVoYLsAvxT7d3VKhC+lWg
 Upf5XK2ax6ga1PRut8k1xCCRLVsBsMhR5JSajV0Nc/Pnn8IvnN4LTqif3
 LrNN3/fC6Ep5CCnru80bMKyuYNErmTTGwtzbeWlw2CoqrM8n1q8KTBiIg
 HRpke9us+LMt+TyrKrhvsq03z/+odbTYMBuwzj3cMHAwZdbk8CK+ZD3//
 QpJQmDsYI8YtzCdv52XSnAgsIMftEEQ5oVsGvp6JlaaYEpAyZFcxG+wi/ w==;
X-CSE-ConnectionGUID: 64wVWHlTSE2SJXRjGr1OPg==
X-CSE-MsgGUID: QNBhUJSqQLGeacev6VFj2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31536875"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="31536875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 03:44:52 -0700
X-CSE-ConnectionGUID: Vq6PHHBzSVWVp+f3zoGGdA==
X-CSE-MsgGUID: rYJzFyX5SH64fT/79Us15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37321941"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2024 03:44:50 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe: Access port only after lock acquired
Date: Tue,  4 Jun 2024 16:15:16 +0530
Message-Id: <20240604104516.766058-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

Currently, port is accessed before lock of port is acquired.
As followed at other places, lets acquire lock before accessing
for even better sync up.

V2:
  - Add port->active check under lock

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index db906117db6d..fcbc3bac1ebe 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -210,15 +210,16 @@ static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
 
 static void xe_execlist_make_active(struct xe_execlist_exec_queue *exl)
 {
-	struct xe_execlist_port *port = exl->port;
+	struct xe_execlist_port *port;
 	enum xe_exec_queue_priority priority = exl->q->sched_props.priority;
 
 	XE_WARN_ON(priority == XE_EXEC_QUEUE_PRIORITY_UNSET);
 	XE_WARN_ON(priority < 0);
-	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
 
-	spin_lock_irq(&port->lock);
+	spin_lock_irq(&exl->port->lock);
 
+	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
+	port = exl->port;
 	if (exl->active_priority != priority &&
 	    exl->active_priority != XE_EXEC_QUEUE_PRIORITY_UNSET) {
 		/* Priority changed, move it to the right list */
-- 
2.25.1

