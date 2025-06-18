Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13778C7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 11:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE6210E13E;
	Wed, 18 Jun 2025 11:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEKfbgLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B9010E13E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 11:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750245647; x=1781781647;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6Brpw136tHxDCTMxTQu/X6+CmPpCTJGeLoRuuVNyLAY=;
 b=DEKfbgLItHa/nKc4qXwrobQ5gX569JSfYMyUJbuaa8s7y8OHGeJYGQgj
 m33iWcxEF/7+NuF0SW12N7QSn8H4eCeCZgBpkql9EwsxECqLc9VRRyL9+
 Tw3w7bvufnKYYjDsRgkdKoW4vFwy8zOyB87Gp5xN65hsIocIdFXYSJ5pB
 MJZyFmuRNYtjiecgour4eB2b+BKNr2Nhj8n7XxPQ8svHQ2WzB6TD6JqBD
 5nsHwPWi7TjVodJVdEh1bTsD58aWhGZdDU6qSS+Jh5KUvsDr7HGYMMVdi
 tDECtqVZfapfuN9aO2fm5eDGXmsEoGSbJ91ky3zhPzZDYtKFPbypoIV9V w==;
X-CSE-ConnectionGUID: xHxuols/Q56z/9dv0J6Chg==
X-CSE-MsgGUID: Fa4bwPY7RfSbLWyaiOr5LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52158370"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="52158370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:20:47 -0700
X-CSE-ConnectionGUID: Bnf1IBNPRHSIX10ynGHEhw==
X-CSE-MsgGUID: GVUNOsHSR56e5FoeJSHsSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="186805801"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.50])
 ([10.245.244.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:20:45 -0700
Message-ID: <84bee0bf7f0bc7bff3127e45da1b3db1862fba25.camel@linux.intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Add generic dependecy jobs / scheduler
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.auld@intel.com
Date: Wed, 18 Jun 2025 13:20:42 +0200
In-Reply-To: <20250617153730.2136174-3-matthew.brost@intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
 <20250617153730.2136174-3-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Tue, 2025-06-17 at 08:37 -0700, Matthew Brost wrote:
> Add generic dependecy jobs / scheduler which serves as wrapper for
> DRM
> scheduler. Useful when we want delay a generic operation until a
> dma-fence signals.
>=20
> Existing use cases could be destroying of resources based fences /
> dma-resv, the preempt rebind worker, and pipelined GT TLB
> invalidations.
>=20
> Written in such a way it could be moved to DRM subsystem if needed.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_dep_job_types.h |=C2=A0 29 ++++++
> =C2=A0drivers/gpu/drm/xe/xe_dep_scheduler.c | 145
> ++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_dep_scheduler.h |=C2=A0 21 ++++
> =C2=A04 files changed, 196 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..3523bd093b7a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> =C2=A0xe-y +=3D xe_bb.o \
> =C2=A0	xe_bo.o \
> =C2=A0	xe_bo_evict.o \
> +	xe_dep_scheduler.o \
> =C2=A0	xe_devcoredump.o \
> =C2=A0	xe_device.o \
> =C2=A0	xe_device_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h
> b/drivers/gpu/drm/xe/xe_dep_job_types.h
> new file mode 100644
> index 000000000000..c6a484f24c8c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_dep_job_types.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_DEP_JOB_TYPES_H_
> +#define _XE_DEP_JOB_TYPES_H_
> +
> +#include <drm/gpu_scheduler.h>
> +
> +struct xe_dep_job;
> +
> +/** struct xe_dep_job_ops - Generic Xe dependency job operations */
> +struct xe_dep_job_ops {
> +	/** @run_job: Run generic Xe dependency job */
> +	struct dma_fence *(*run_job)(struct xe_dep_job *job);
> +	/** @free_job: Free generic Xe dependency job */
> +	void (*free_job)(struct xe_dep_job *job);
> +};
> +
> +/** struct xe_dep_job - Generic dependency Xe job */
> +struct xe_dep_job {
> +	/** @drm: base DRM scheduler job */
> +	struct drm_sched_job drm;
> +	/** @ops: dependency job operations */
> +	const struct xe_dep_job_ops *ops;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c
> b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> new file mode 100644
> index 000000000000..fbd55577d787
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#include <linux/slab.h>
> +
> +#include <drm/gpu_scheduler.h>
> +
> +#include "xe_dep_job_types.h"
> +#include "xe_dep_scheduler.h"
> +#include "xe_device_types.h"
> +
> +/**
> + * DOC: Xe Dependency Scheduler
> + *
> + * The Xe dependency scheduler is a simple wrapper built around the
> DRM
> + * scheduler to execute jobs once their dependencies are resolved
> (i.e., all
> + * input fences specified as dependencies are signaled). The jobs
> that are
> + * executed contain virtual functions to run (execute) and free the
> job,
> + * allowing a single dependency scheduler to handle jobs performing
> different
> + * operations.
> + *
> + * Example use cases include deferred resource freeing, TLB
> invalidations after
> + * bind jobs, etc.
> + */
> +
> +/** struct xe_dep_scheduler - Generic Xe dependency scheduler */
> +struct xe_dep_scheduler {
> +	/** @sched: DRM GPU scheduler */
> +	struct drm_gpu_scheduler sched;

Would it make sense to support sharing a single drm_gpu_scheduler for
many xe_dep_schedulers? Thinking of the first use-case where we'd
probably want just a single drm_gpu_scheduler per GuC since
invalidations are ordered anyway?

/Thomas


> +	/** @entity: DRM scheduler entity=C2=A0 */
> +	struct drm_sched_entity entity;
> +	/** @rcu: For safe freeing of exported dma fences */
> +	struct rcu_head rcu;
> +};
> +
> +static struct dma_fence *xe_dep_scheduler_run_job(struct
> drm_sched_job *drm_job)
> +{
> +	struct xe_dep_job *dep_job =3D
> +		container_of(drm_job, typeof(*dep_job), drm);
> +
> +	return dep_job->ops->run_job(dep_job);
> +}
> +
> +static void xe_dep_scheduler_free_job(struct drm_sched_job *drm_job)
> +{
> +	struct xe_dep_job *dep_job =3D
> +		container_of(drm_job, typeof(*dep_job), drm);
> +
> +	dep_job->ops->free_job(dep_job);
> +}
> +
> +static const struct drm_sched_backend_ops sched_ops =3D {
> +	.run_job =3D xe_dep_scheduler_run_job,
> +	.free_job =3D xe_dep_scheduler_free_job,
> +};
> +
> +/**
> + * xe_dep_scheduler_create() - Generic Xe dependency scheduler
> create
> + * @xe: Xe device
> + * @submit_wq: Submit workqueue struct (can be NULL)
> + * @name: Name of dependency scheduler
> + * @job_limit: Max dependency jobs that can be scheduled
> + *
> + * Create a generic Xe dependency scheduler and initialize internal
> DRM
> + * scheduler objects.
> + *
> + * Return: Generic Xe dependency scheduler object or ERR_PTR
> + */
> +struct xe_dep_scheduler *
> +xe_dep_scheduler_create(struct xe_device *xe,
> +			struct workqueue_struct *submit_wq,
> +			const char *name, u32 job_limit)
> +{
> +	struct xe_dep_scheduler *dep_scheduler;
> +	struct drm_gpu_scheduler *sched;
> +	const struct drm_sched_init_args args =3D {
> +		.ops =3D &sched_ops,
> +		.submit_wq =3D submit_wq,
> +		.num_rqs =3D 1,
> +		.credit_limit =3D job_limit,
> +		.timeout =3D MAX_SCHEDULE_TIMEOUT,
> +		.name =3D name,
> +		.dev =3D xe->drm.dev,
> +	};
> +	int err;
> +
> +	dep_scheduler =3D kzalloc(sizeof(*dep_scheduler), GFP_KERNEL);
> +	if (!dep_scheduler)
> +		return ERR_PTR(-ENOMEM);
> +
> +	err =3D drm_sched_init(&dep_scheduler->sched, &args);
> +	if (err)
> +		goto err_free;
> +
> +	sched =3D &dep_scheduler->sched;
> +	err =3D drm_sched_entity_init(&dep_scheduler->entity, 0,
> +				=C2=A0=C2=A0=C2=A0 (struct drm_gpu_scheduler
> **)&sched, 1,
> +				=C2=A0=C2=A0=C2=A0 NULL);
> +	if (err)
> +		goto err_sched;
> +
> +	init_rcu_head(&dep_scheduler->rcu);
> +
> +	return dep_scheduler;
> +
> +err_sched:
> +	drm_sched_fini(&dep_scheduler->sched);
> +err_free:
> +	kfree(dep_scheduler);
> +
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_dep_scheduler_fini() - Generic Xe dependency scheduler
> finalize
> + * @dep_scheduler: Generic Xe dependency scheduler object
> + *
> + * Finalize internal DRM scheduler objects and free generic Xe
> dependency
> + * scheduler object
> + */
> +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler)
> +{
> +	drm_sched_entity_fini(&dep_scheduler->entity);
> +	drm_sched_fini(&dep_scheduler->sched);
> +	/*
> +	 * RCU free due sched being exported via DRM scheduler
> fences
> +	 * (timeline name).
> +	 */
> +	kfree_rcu(dep_scheduler, rcu);
> +}
> +
> +/**
> + * xe_dep_scheduler_entity() - Retrieve a generic Xe dependency
> scheduler
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 DRM scheduler entity
> + * @dep_scheduler: Generic Xe dependency scheduler object
> + *
> + * Return: The generic Xe dependency scheduler's DRM scheduler
> entity
> + */
> +struct drm_sched_entity *
> +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler)
> +{
> +	return &dep_scheduler->entity;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h
> b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> new file mode 100644
> index 000000000000..853961eec64b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +struct drm_sched_entity;
> +struct workqueue_struct;
> +struct xe_dep_scheduler;
> +struct xe_device;
> +
> +struct xe_dep_scheduler *
> +xe_dep_scheduler_create(struct xe_device *xe,
> +			struct workqueue_struct *submit_wq,
> +			const char *name, u32 job_limit);
> +
> +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
> +
> +struct drm_sched_entity *
> +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);

