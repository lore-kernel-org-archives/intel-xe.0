Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C4C49EA1
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11810E630;
	Wed, 31 Jul 2024 14:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7QoDNo1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EAC10E642
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435851; x=1753971851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qj/SWDr0Ze3V3ah5bf1QwJCejcVXI8mD2neXW5aVJVo=;
 b=V7QoDNo1yg+c9Jid64j1vgS+31NkAfmwRolZY3uLyEHgBOvdvKTD20/D
 qQDKec29/kxmJ7fr+YDCI1IBhYZRKILu4KBhJakxWWE4KmslhIJ5xxxPW
 0+5XsRPnr9P3SEomdSD8HPMe56il+td+7pvl5Hxunhdk+hxgFTvrYPdlu
 dbPuESAlM9YgggUSZcmai7j3QST3sgLhFaT7JDHbERQVblJk3zPjEwuuu
 mHejcd+AgqQldTEMPpAW6bNdbBMt0nfItlvBC+Bp8JPUMu5q1Ex9YwK9Q
 9E2Xvtm8pYa7ioFMiS3R1+N1y3NK5tpIas4PjoByPKv/XrzHeDcgkfCSq Q==;
X-CSE-ConnectionGUID: 0rjlVWpmQ16F1QUChP+55A==
X-CSE-MsgGUID: wmOjbbaBTESAk5wnlYzdxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469186"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:11 -0700
X-CSE-ConnectionGUID: KfJQjAKyT0W77VLDA3raRg==
X-CSE-MsgGUID: 9IQqHC6qT8KUFKTAfjLOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59500995"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:10 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 05/13] drm/xe/exec_queue: Remove duplicated code
Date: Wed, 31 Jul 2024 16:21:39 +0200
Message-ID: <20240731142349.4101307-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731142349.4101307-1-francois.dugast@intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
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

This code section is the same as the body of
xe_exec_queue_last_fence_put_unlocked() so call the function instead and
remove duplicated code to make maintenance easier.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 77edb20aa21c..85da2a30a4a4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -833,10 +833,7 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
 {
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
 
-	if (q->last_fence) {
-		dma_fence_put(q->last_fence);
-		q->last_fence = NULL;
-	}
+	xe_exec_queue_last_fence_put_unlocked(q);
 }
 
 /**
-- 
2.43.0

