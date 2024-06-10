Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF3EC27C78
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D24710E476;
	Mon, 10 Jun 2024 13:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="As/1JmC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B3D10E475
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718027384; x=1749563384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=n/LVArDCxvw+A+QBYqIrjwusX0FOwuuzX/nkUzxereI=;
 b=As/1JmC2u/BSlTE0/QRXNqNsTGZ386Rj5siGmGIoZ70nfuMWrL9obvBZ
 7IQeCx2I9biJqBW7zC3YkSQbGCdrJXXIhHQbS+eLiwVcM5oovZx6W2nuj
 sTUN/hzisHXbw5oFkDwAM0/rQmLbDPekYIOISJZxDbAasiqtolL7JXzU6
 mK4KQPewjHNvvMSCP8k2D1ngCVHFWbwwSIscbbccBKmWb6uTHJ/vapEau
 bDl9al5Z1PShj5SDneRZeo5o03AgxXx4nrOFBLM99D6lN2qDdqnGPEuoo
 mWHWaPP1IDF/axGhoGdNYu+ZmOMm4PYH/03pJGNCGXBGpyUlhMblp+XX9 Q==;
X-CSE-ConnectionGUID: Xiow3YmRRgSSnoBbDFzWqg==
X-CSE-MsgGUID: cLDPGqxrQgu5Vstt/n0PvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14419834"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14419834"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
X-CSE-ConnectionGUID: 6CeSgpJcQzaobI3x3SKcCg==
X-CSE-MsgGUID: LZOX8itsTwKP55nohbKQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76523128"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 5/7] drm/xe: Add pending disable assert to handle_sched_done
Date: Mon, 10 Jun 2024 06:50:09 -0700
Message-Id: <20240610135011.2605272-6-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e697732f1e74..9e1535c2d8f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1607,6 +1607,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
 	} else {
+		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
+
 		clear_exec_queue_pending_disable(q);
 		if (q->guc->suspend_pending) {
 			suspend_fence_signal(q);
-- 
2.34.1

