Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F6CC3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77E10EAF2;
	Wed, 17 Jul 2024 13:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpziwsHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E1C10EAEF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221727; x=1752757727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xzWF0k7MIKurYPcZRoK1zRoDBvqqLFb5Dj/ZBvIV9mQ=;
 b=dpziwsHFB/ZwJ8MLJLQAlBGQAZ70dXv4/vz8QtCtmQug/fOzlOdWEUAB
 5A2ONWK7HCUg6q2jB3vtwTRYaUcICh+qf/8hpBlSdzecd2ymbBqJW2S4p
 vR091fthaGsjk4kHZkKdwaI3bXOHroBPtWnnONZeHMf9E2JBg0PamKC1Z
 BhRpy/777lNox37juGATfuO0nIllbKH8tkMYG6hl4blRig7JDVlVEBX0H
 gF7TX691aKeTw9J380rjfokxv/QHz2Fm9DkWA4Y3S1l5ICBFbzTUphRqN
 RCEZ0k86if34SCw3mcMu91IDRB8sNibmUa4Kb3AmY9MRR9nCYytnPBHce g==;
X-CSE-ConnectionGUID: RGP47Tu3Qt2Ep2Hb4rV2gA==
X-CSE-MsgGUID: zdAOtnJeSIea1Alh+8lmyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832065"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832065"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:47 -0700
X-CSE-ConnectionGUID: hSOJsvgISEeyVdCEKyuS2w==
X-CSE-MsgGUID: rYdxSXQYTRW+vNeKOGvxCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532019"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:45 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 4/9] drm/xe/hw_engine_group: Add helper to suspend LR jobs
Date: Wed, 17 Jul 2024 15:07:25 +0200
Message-ID: <20240717130821.1073379-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717130821.1073379-1-francois.dugast@intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
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

This is a required feature for dma fence jobs to preempt long running
jobs in order to ensure mutual exclusion on a given hw engine group.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4dcc885a55c8..850f7b15b154 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1223,3 +1223,31 @@ int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct x
 
 	return 0;
 }
+
+/**
+ * xe_hw_engine_group_suspend_lr_jobs() - Suspend the long running jobs of this hw engine group
+ * @group: The hw engine group
+ *
+ * Return: 0 on success,
+ *	   -EINVAL if one jobs could not be suspended
+ */
+static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
+{
+	int err;
+	struct xe_exec_queue *q;
+
+	lockdep_assert_held(&group->mode_sem);
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (!xe_vm_in_lr_mode(q->vm))
+			continue;
+
+		err = q->ops->suspend(q);
+		if (err)
+			return err;
+
+		q->ops->suspend_wait(q);
+	}
+
+	return 0;
+}
-- 
2.43.0

