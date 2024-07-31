Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BAFC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A116B10E62D;
	Wed, 31 Jul 2024 14:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDGViGdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507EB10E636
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435855; x=1753971855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KsjpUL58mfIOqwhppE/d5uqBDEkzU3YiO3pNwGwjNzM=;
 b=TDGViGdcROUmyuFA9WvTCyDoKreCBOIEpYRhCvHT71DlpQsgO90nZDdX
 8hLVcscZbxLx7Gu1uIFcuTQZWkprO9Cr5aLcjd7oioP7unSm6nAFGR4VT
 dDlI9jhbuW0qW4hTOb10kQfd3YVtsENa5uUMLwO86Kuyo+jya4Uk8YaRU
 QPqqmIdiOLcPJy3Y4o9J7FcA/viQ/vIk3h3CRJHi1uygti4bL/66Hd3Sq
 XRSJ02nF8Vfr2l74g8UtHYG62Z+/v5HS4deCGd/5DnOdSg03bETZ/y91T
 lsFpYv5GmRGCE5Zo3AnuHHG300H/Dqf2Bk8/JDgML629fCccNmnI5Xo58 g==;
X-CSE-ConnectionGUID: gkyt4IqYQX2Nxn9JipQ6Bw==
X-CSE-MsgGUID: 58+yiVFURGa6C8upxQpMXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469192"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:14 -0700
X-CSE-ConnectionGUID: lKNKQwL9SDyRCJBl3CxH8w==
X-CSE-MsgGUID: M0SP+f9OTHCb21jZhH+GRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59501011"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:13 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 07/13] drm/xe/hw_engine_group: Add helper to wait for dma
 fence jobs
Date: Wed, 31 Jul 2024 16:21:41 +0200
Message-ID: <20240731142349.4101307-8-francois.dugast@intel.com>
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

This is a required feature for faulting long running jobs not to be
submitted while dma fence jobs are running on the hw engine group.

v2: Switch to lockdep_assert_held_write in worker, get a proper reference
    for the last fence (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 4dabb0e8908a..9ee372f434a6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -174,3 +174,36 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
 		q->ops->suspend_wait(q);
 	}
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
+		xe_exec_queue_last_fence_put_for_resume(q, q->vm);
+
+		if (timeout < 0)
+			return -ETIME;
+	}
+
+	return 0;
+}
-- 
2.43.0

