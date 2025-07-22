Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F097AC87FC5
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 20:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E0F10E713;
	Tue, 22 Jul 2025 20:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGs79IOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C6410E709
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753215733; x=1784751733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lkWkV7C5LirnYjxR9K3lWIzBjJqaEUrYyU4vLwQt/go=;
 b=MGs79IOy2Bvd6UdSLzbIteIoqToAXcW0h2DdfZEgzZXVGLIaaIu0HdCE
 hTvlEF/kGP0ZRnMRhOcpcPoU79ZLMItYhHvYXD7wBjZd/TObnl/YMH5il
 DvT3eCHnVq7OCEYUymX8+1vO36YcBunFCf9byPJfdXXUf+0oloOBm94/T
 LNqnFJ21DGsdINK7STdGgJC/n/UjFmFLP4FCLjxzemxE8wEnuhrHaYNDV
 m8QSAT1k5ug2njGbWuiVHV5O/gF5Cr8MsvryFj30m+IKl4KQGZaClBn5Q
 vvLntFTO+IAmiUp3ZtqROkONUqVsaOxWAMwQs00pB+kko7Zgg2QnDMJGI A==;
X-CSE-ConnectionGUID: gUpKR/v7QMer93RFUO6PQA==
X-CSE-MsgGUID: rme2GsZLT3Sy9aiExs+4ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="58098050"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="58098050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:13 -0700
X-CSE-ConnectionGUID: jnKlR1ZeQoeGKIKdCjCAKw==
X-CSE-MsgGUID: Ta95qKr2SxS/CVDZnGau8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="182947254"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 13:22:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 2/7] drm/xe: Add generic dependecy jobs / scheduler
Date: Tue, 22 Jul 2025 13:23:52 -0700
Message-Id: <20250722202357.3718853-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722202357.3718853-1-matthew.brost@intel.com>
References: <20250722202357.3718853-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add generic dependecy jobs / scheduler which serves as wrapper for DRM
scheduler. Useful when we want delay a generic operation until a
dma-fence signals.

Existing use cases could be destroying of resources based fences /
dma-resv, the preempt rebind worker, and pipelined GT TLB invalidations.

Written in such a way it could be moved to DRM subsystem if needed.

v3:
 - Remove unnecessary cast (Staurt)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_dep_job_types.h |  29 ++++++
 drivers/gpu/drm/xe/xe_dep_scheduler.c | 143 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_dep_scheduler.h |  21 ++++
 4 files changed, 194 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 07c71a29963d..b79a0ba643ac 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -35,6 +35,7 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_dep_scheduler.o \
 	xe_devcoredump.o \
 	xe_device.o \
 	xe_device_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h b/drivers/gpu/drm/xe/xe_dep_job_types.h
new file mode 100644
index 000000000000..c6a484f24c8c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_dep_job_types.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_DEP_JOB_TYPES_H_
+#define _XE_DEP_JOB_TYPES_H_
+
+#include <drm/gpu_scheduler.h>
+
+struct xe_dep_job;
+
+/** struct xe_dep_job_ops - Generic Xe dependency job operations */
+struct xe_dep_job_ops {
+	/** @run_job: Run generic Xe dependency job */
+	struct dma_fence *(*run_job)(struct xe_dep_job *job);
+	/** @free_job: Free generic Xe dependency job */
+	void (*free_job)(struct xe_dep_job *job);
+};
+
+/** struct xe_dep_job - Generic dependency Xe job */
+struct xe_dep_job {
+	/** @drm: base DRM scheduler job */
+	struct drm_sched_job drm;
+	/** @ops: dependency job operations */
+	const struct xe_dep_job_ops *ops;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c b/drivers/gpu/drm/xe/xe_dep_scheduler.c
new file mode 100644
index 000000000000..9bd3bfd2e526
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/slab.h>
+
+#include <drm/gpu_scheduler.h>
+
+#include "xe_dep_job_types.h"
+#include "xe_dep_scheduler.h"
+#include "xe_device_types.h"
+
+/**
+ * DOC: Xe Dependency Scheduler
+ *
+ * The Xe dependency scheduler is a simple wrapper built around the DRM
+ * scheduler to execute jobs once their dependencies are resolved (i.e., all
+ * input fences specified as dependencies are signaled). The jobs that are
+ * executed contain virtual functions to run (execute) and free the job,
+ * allowing a single dependency scheduler to handle jobs performing different
+ * operations.
+ *
+ * Example use cases include deferred resource freeing, TLB invalidations after
+ * bind jobs, etc.
+ */
+
+/** struct xe_dep_scheduler - Generic Xe dependency scheduler */
+struct xe_dep_scheduler {
+	/** @sched: DRM GPU scheduler */
+	struct drm_gpu_scheduler sched;
+	/** @entity: DRM scheduler entity  */
+	struct drm_sched_entity entity;
+	/** @rcu: For safe freeing of exported dma fences */
+	struct rcu_head rcu;
+};
+
+static struct dma_fence *xe_dep_scheduler_run_job(struct drm_sched_job *drm_job)
+{
+	struct xe_dep_job *dep_job =
+		container_of(drm_job, typeof(*dep_job), drm);
+
+	return dep_job->ops->run_job(dep_job);
+}
+
+static void xe_dep_scheduler_free_job(struct drm_sched_job *drm_job)
+{
+	struct xe_dep_job *dep_job =
+		container_of(drm_job, typeof(*dep_job), drm);
+
+	dep_job->ops->free_job(dep_job);
+}
+
+static const struct drm_sched_backend_ops sched_ops = {
+	.run_job = xe_dep_scheduler_run_job,
+	.free_job = xe_dep_scheduler_free_job,
+};
+
+/**
+ * xe_dep_scheduler_create() - Generic Xe dependency scheduler create
+ * @xe: Xe device
+ * @submit_wq: Submit workqueue struct (can be NULL)
+ * @name: Name of dependency scheduler
+ * @job_limit: Max dependency jobs that can be scheduled
+ *
+ * Create a generic Xe dependency scheduler and initialize internal DRM
+ * scheduler objects.
+ *
+ * Return: Generic Xe dependency scheduler object on success, ERR_PTR failure
+ */
+struct xe_dep_scheduler *
+xe_dep_scheduler_create(struct xe_device *xe,
+			struct workqueue_struct *submit_wq,
+			const char *name, u32 job_limit)
+{
+	struct xe_dep_scheduler *dep_scheduler;
+	struct drm_gpu_scheduler *sched;
+	const struct drm_sched_init_args args = {
+		.ops = &sched_ops,
+		.submit_wq = submit_wq,
+		.num_rqs = 1,
+		.credit_limit = job_limit,
+		.timeout = MAX_SCHEDULE_TIMEOUT,
+		.name = name,
+		.dev = xe->drm.dev,
+	};
+	int err;
+
+	dep_scheduler = kzalloc(sizeof(*dep_scheduler), GFP_KERNEL);
+	if (!dep_scheduler)
+		return ERR_PTR(-ENOMEM);
+
+	err = drm_sched_init(&dep_scheduler->sched, &args);
+	if (err)
+		goto err_free;
+
+	sched = &dep_scheduler->sched;
+	err = drm_sched_entity_init(&dep_scheduler->entity, 0, &sched, 1, NULL);
+	if (err)
+		goto err_sched;
+
+	init_rcu_head(&dep_scheduler->rcu);
+
+	return dep_scheduler;
+
+err_sched:
+	drm_sched_fini(&dep_scheduler->sched);
+err_free:
+	kfree(dep_scheduler);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_dep_scheduler_fini() - Generic Xe dependency scheduler finalize
+ * @dep_scheduler: Generic Xe dependency scheduler object
+ *
+ * Finalize internal DRM scheduler objects and free generic Xe dependency
+ * scheduler object
+ */
+void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler)
+{
+	drm_sched_entity_fini(&dep_scheduler->entity);
+	drm_sched_fini(&dep_scheduler->sched);
+	/*
+	 * RCU free due sched being exported via DRM scheduler fences
+	 * (timeline name).
+	 */
+	kfree_rcu(dep_scheduler, rcu);
+}
+
+/**
+ * xe_dep_scheduler_entity() - Retrieve a generic Xe dependency scheduler
+ *                             DRM scheduler entity
+ * @dep_scheduler: Generic Xe dependency scheduler object
+ *
+ * Return: The generic Xe dependency scheduler's DRM scheduler entity
+ */
+struct drm_sched_entity *
+xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler)
+{
+	return &dep_scheduler->entity;
+}
diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h b/drivers/gpu/drm/xe/xe_dep_scheduler.h
new file mode 100644
index 000000000000..853961eec64b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+struct drm_sched_entity;
+struct workqueue_struct;
+struct xe_dep_scheduler;
+struct xe_device;
+
+struct xe_dep_scheduler *
+xe_dep_scheduler_create(struct xe_device *xe,
+			struct workqueue_struct *submit_wq,
+			const char *name, u32 job_limit);
+
+void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
+
+struct drm_sched_entity *
+xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);
-- 
2.34.1

