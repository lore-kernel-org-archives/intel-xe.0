Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2E1C25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 08:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC72610E140;
	Tue,  4 Jun 2024 08:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQ9LYavA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594C810E140
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717490780; x=1749026780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aBkICzmHsO7U7RNhvGiHxKjFIQj4w9+XZEPYHiPNTrY=;
 b=MQ9LYavAl4GsszOWQfElr50RpdIF4aGNx4VCaB7hDOGZZfRXctEiZbSz
 nSnPtHYT6Jz+jHo9Qk9wHoLTHrkH/VLVNZv4a5dWnO/PkZApWMdQgcRAQ
 j2aYqJVjm+xjVRKYT97suYcXIhok/wG4E7YG9pUvVCjawytiAbFH9e1U6
 YGREYD9PQ4t7LrytMWsxYyL6LdkknBetlJE7yl+7JaiJk/2J4yhTjeo1c
 bE4y2aflkHCD2C5FHsmor21gxS/+hwloiymEqxd11CImIp8lgpaUrd77O
 q9V5PzrykPodstCS210UL/p6mFxPjrd8h6ivaVCbiuUqQv1pfQKLS+wvR A==;
X-CSE-ConnectionGUID: Drm9LrE/Sn+onTK8RUcKgg==
X-CSE-MsgGUID: RhfW0LO1S1Wqy6aTiqV4Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17810591"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="17810591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:46:17 -0700
X-CSE-ConnectionGUID: 9ZSSjkk3Tvah5pkoysi7/w==
X-CSE-MsgGUID: G4Hdq3PzR8u9HytWEhgH9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="67992805"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa002.jf.intel.com with ESMTP; 04 Jun 2024 01:46:16 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Access port only after lock acquired
Date: Tue,  4 Jun 2024 14:16:42 +0530
Message-Id: <20240604084642.761688-1-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index db906117db6d..61dc08318ceb 100644
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
 	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
 
-	spin_lock_irq(&port->lock);
+	spin_lock_irq(&exl->port->lock);
 
+	port = exl->port;
 	if (exl->active_priority != priority &&
 	    exl->active_priority != XE_EXEC_QUEUE_PRIORITY_UNSET) {
 		/* Priority changed, move it to the right list */
-- 
2.25.1

