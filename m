Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A72EC52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E4110E7D5;
	Thu,  8 Aug 2024 18:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxpaa85a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA62610E7D4
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142563; x=1754678563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HngWjlc9DO6GuJJGuKfN/uFSm5yyn4o2JfEmCaZLiE0=;
 b=lxpaa85aj/HjIGRaDCMa+0icnGjhpqzA6XxtkLkR44GGJYRoWsjXU/8D
 //ul78BZxdYXSDcywp++n4E3M6dsN6SnQztGgUcH2Ud2PWw32HMGkm26i
 vFhoWLp8/t6TQidbJl0XPJacNjlrTbxTesP4B4qnAD+eK+cbzemcwG0ln
 2MzPbnzUqGApt0TKa/ocSaPmLK5+PD2q2kFKmBJc/Po75KmNFXKrN/Y0A
 jeblj7U3j7Vp/uhmqyCNIhGDgz4g5sS18c0A24rHWL3Z+ay3REPPi53xv
 i9os6aexSn5b4TSwRrTlm1JT9mG8o2avBlCgdoP1BEoDKUXlP4Ze+BrZL w==;
X-CSE-ConnectionGUID: OIWH4l+/QSqyCnrDozVkcQ==
X-CSE-MsgGUID: tneUKd0xQxSl2OBvXxfslA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921602"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921602"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:43 -0700
X-CSE-ConnectionGUID: oPZsp7sGTAKmgKErCeEx0Q==
X-CSE-MsgGUID: UDnub5toQx+yG52IzkS7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975929"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 07/11] drm/xe/hw_engine_group: Add helper to wait for dma
 fence jobs
Date: Thu,  8 Aug 2024 20:40:25 +0200
Message-ID: <20240808184220.1715625-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

This is a required feature for faulting long running jobs not to be
submitted while dma fence jobs are running on the hw engine group.

v2: Switch to lockdep_assert_held_write in worker, get a proper reference
    for the last fence (Matt Brost)

v3: Directly call dma_fence_put with the fence ref (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 8659332012dd..8d3ddfc4ee82 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -202,3 +202,36 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 	up_write(&group->mode_sem);
 	return err;
 }
+
+/**
+ * xe_hw_engine_group_wait_for_dma_fence_jobs() - Wait for dma fence jobs to complete
+ * @group: The hw engine group
+ *
+ * This function is not meant to be called directly from a user IOCTL as dma_fence_wait()
+ * is not interruptible.
+ *
+ * Return: 0 on success,
+ *	   -ETIME if waiting for one job failed
+ */
+static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group *group)
+{
+	long timeout;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+
+	lockdep_assert_held_write(&group->mode_sem);
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (xe_vm_in_lr_mode(q->vm))
+			continue;
+
+		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
+		timeout = dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+
+		if (timeout < 0)
+			return -ETIME;
+	}
+
+	return 0;
+}
-- 
2.43.0

