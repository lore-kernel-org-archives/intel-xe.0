Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A5C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D3A10E96E;
	Fri,  9 Aug 2024 15:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTUOHLBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623B610E96D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218741; x=1754754741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x1n7kgFrswEDFS8HTgGMK19Dc0UkK7MQ1NFwkppqKFk=;
 b=FTUOHLBoRM38hKX7ulMyRsBHpweVhHP/cKjKrNkMO9f3nrqr11z40NB6
 LCYTtsU8lOuJgLQznJ+J4ZlEurOUPoojthNSqOuCUPPFldS9alt2gYPko
 Z2DShtrcRwqrKe3aj6S2Zse+FkO6rG05ZXeik5EGInMWu/cINrp+6obIB
 QXIrzyryS004Zv0ffHIxTPgSZE6i84Cnjd0q94GD4QV518VGt2ZAEqIN+
 ZZGGTE87UZylft41Rttd0t+TbnyVvl/oCBCfxBrmIh6GqJWQ2A3o7xHcU
 671XjheXvzb4rKPMklsWQtWU783RYEGjHYfTU9GVwabls1A3hkpkx0/oo A==;
X-CSE-ConnectionGUID: Ses3PLAgTtKpbQsei4VoOQ==
X-CSE-MsgGUID: PtM8RHWcReWni0d2ttHPag==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207401"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207401"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:21 -0700
X-CSE-ConnectionGUID: Puwx9bh3SeSxeqpw6mO5VA==
X-CSE-MsgGUID: UJX3O3hSTh2Do+1OZBA3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728829"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:20 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 07/11] drm/xe/hw_engine_group: Add helper to wait for dma
 fence jobs
Date: Fri,  9 Aug 2024 17:51:32 +0200
Message-ID: <20240809155156.1955925-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
References: <20240809155156.1955925-1-francois.dugast@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

