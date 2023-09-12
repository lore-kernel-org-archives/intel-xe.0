Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64D6CA0EC8
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 02:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E4F10E389;
	Tue, 12 Sep 2023 02:17:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743F010E2CF;
 Tue, 12 Sep 2023 02:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485041; x=1726021041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXoqE0x5u4dHKPEC69ly/YQdK6nbsiuyO0FdqF1kW/g=;
 b=Dl5IQmRlH6IU2xuc1Rds6PhyCCd++MUxsDE2B8j3uyeOk5bbseaHw1xB
 zDtoQqSUJLLaB64aUA8/q9MyORnb/V5oW/a9JwokyeAyYA7IpOt2F1G1l
 X1/iogp1TbgZiAOoVbn7dJvSFsX6R5uL9nf4tRgkU6go4mcwRHcPBpRv4
 3eOYr/R0TapNCg/ByVdAEJ27B+S6FBnIILU9LuxciiSO0kTSfOxMYU1Cj
 8jCQJvZ5umB7XVZmJrtM9Y6mNGuCvnMoSs1OUrChu/JzEr2ZYc+/XXgPZ
 1XjSLTQ8+gNF52JKIJypFoYVFPs1u1NsKrVX35720tprRtpJZ9CvosZar Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172603"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172603"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255590"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255590"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Mon, 11 Sep 2023 19:16:14 -0700
Message-Id: <20230912021615.2086698-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 12/13] drm/sched/doc: Add Entity teardown
 documentaion
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 frank.binns@imgtec.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 daniel@ffwll.ch, boris.brezillon@collabora.com, airlied@gmail.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Provide documentation to guide in ways to teardown an entity.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/drm-mm.rst             |  6 ++++++
 drivers/gpu/drm/scheduler/sched_entity.c | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index c19b34b1c0ed..cb4d6097897e 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -552,6 +552,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
    :doc: Overview
 
+Entity teardown
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_entity.c
+   :doc: Entity teardown
+
 Scheduler Function References
 -----------------------------
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 37557fbb96d0..76f3e10218bb 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -21,6 +21,25 @@
  *
  */
 
+/**
+ * DOC: Entity teardown
+ *
+ * Drivers can teardown down an entity for several reasons. Reasons typically
+ * are a user closes the entity via an IOCTL, the FD associated with the entity
+ * is closed, or the entity encounters an error. The GPU scheduler provides the
+ * basic infrastructure to do this in a few different ways.
+ *
+ * 1. Let the entity run dry (both the pending list and job queue) and then call
+ * drm_sched_entity_fini. The backend can accelerate the process of running dry.
+ * For example set a flag so run_job is a NOP and set the TDR to a low value to
+ * signal all jobs in a timely manner (this example works for
+ * DRM_SCHED_POLICY_SINGLE_ENTITY).
+ *
+ * 2. Kill the entity directly via drm_sched_entity_flush /
+ * drm_sched_entity_fini ensuring all pending and queued jobs are off the
+ * hardware and signaled.
+ */
+
 #include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
-- 
2.34.1

