Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA2C7EE29
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 09:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19D10E422;
	Tue, 23 May 2023 09:47:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E119510E420
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684835266; x=1716371266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s+45vHHpMcm0QuP6VadF/5jV8xqk+7H4omzrQ7IdSpY=;
 b=QGhrCmPHCpqBESP9sWzvKxc+nmevToRcJz+luweA2cvDcXNK6NZCPuV8
 o7w5mS+NfmqkUKWzsC670+ZvX+Tsos5Ks4/T2wONNXVVER9eeQKwi6L0I
 wz/fc/bBTz2JJFjZeCgjZ44U6+NnR5yBWtxTK7xfaa+Qd40XLZaquWOF4
 Yd2xo6zNee7XX+ooNOvXgCuy251uHXvXlEmumgvSjPwliFGzJ+uAgDW6I
 AHt9vwEhpYyH/8KMOrD+AYcG3i/YO1+CVrOl/Ts7wX4Uug5hHhl3ENoIr
 XxDle3Bl6L+S6gXnOvvq61ijJQ6LsKaILIlRoC1qbYVKgydONPDymtXVF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337777471"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="337777471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="736797315"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="736797315"
Received: from eakeogh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.0.142])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:47:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 10:47:25 +0100
Message-Id: <20230523094727.162266-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523094727.162266-1-matthew.auld@intel.com>
References: <20230523094727.162266-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 6/8] drm/xe/ct: drop mem_access_get from
 g2h_worker_func()
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the next patch we track the current task executing the runtime_pm
callbacks, if any, in order to prevent the runtime_pm code waiting for
itself and deadlocking when called from the callbacks. However with
g2h_worker_func() we are processing g2h packets from a workqueue when
receiving an interrupt. The runtime callbacks needs to talk to the GuC
and so rely on this, however since these are processed from a workqueue
the current task will be different and when calling something like
mem_access_get() we deadlock. Callers should in theory already be
holding an access.ref when talking to the GuC (CT communication looks to
be disabled when suspending the GT).

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7a8c9d6a03f3..6e0d2d06b7f5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1081,7 +1081,6 @@ static void g2h_worker_func(struct work_struct *w)
 	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
 	int ret;
 
-	xe_device_mem_access_get(ct_to_xe(ct));
 	do {
 		mutex_lock(&ct->lock);
 		ret = dequeue_one_g2h(ct);
@@ -1095,7 +1094,6 @@ static void g2h_worker_func(struct work_struct *w)
 			kick_reset(ct);
 		}
 	} while (ret == 1);
-	xe_device_mem_access_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-- 
2.40.1

