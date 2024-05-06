Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F9CC25B5F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 11:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0310EFCE;
	Mon,  6 May 2024 11:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hswjOQTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4037F10F2A6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714996647; x=1746532647;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=b5+Csb5koNuslnCvjiiRdmNjefcvWEPa2enR/WLm+s0=;
 b=hswjOQTX9uL+kuJE3JmCiS302ZE3RBdW8b5h8K4JJj8BczMJXOWz7RUz
 HfoXT5ZKwVuazv/qYM8zf7DR8M7/p2XDv+gw+9HfvOEAZWGol+gVwNPsk
 A/byYRC+Ot68w5SYa9+zgvS+jPVL2/K7OR5JMdOem6X7oR8y4fxInRqVQ
 RT4o5DdXS5VvgC5uEOlVJkgUhuYsG1A1a9UQ9oYKMMpBs6x1SFsV4riew
 tR8angY8TychLP9qmVK3ZxsFFs1YGIwkzIgYCxNcASwXYSqcMxL7bsZ7R
 fCXpRmMbQ1V92esAaHfxxK+xtINxWtKz2znoQ+Rbef3Nq9sDDkv9QAc5L g==;
X-CSE-ConnectionGUID: uwgu0QFsT7a9I7EwcTRqxg==
X-CSE-MsgGUID: Lz77DTpHTMOTCQCmmF5g+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14542282"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="14542282"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 04:57:26 -0700
X-CSE-ConnectionGUID: GVL6pSrzTACMi3Kse0gbrQ==
X-CSE-MsgGUID: KQ51Yn0xRYmDl4/bEehcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28238006"
Received: from unknown (HELO [10.245.245.120]) ([10.245.245.120])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 04:57:25 -0700
Message-ID: <b0a3a3b1a847c07bb625ab88b8ee6ed0e2cc2b0f.camel@linux.intel.com>
Subject: Re: [PATCH 3/7] drm/xe: Relax runtime pm protection during execution
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.brost@intel.com, 
 francois.dugast@intel.com, matthew.auld@intel.com, anshuman.gupta@intel.com
Date: Mon, 06 May 2024 13:57:22 +0200
In-Reply-To: <20240503191309.7022-4-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-4-rodrigo.vivi@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Fri, 2024-05-03 at 15:13 -0400, Rodrigo Vivi wrote:
> In the regular use case scenario, user space will create an
> exec queue, and keep it alive to reuse that until it is done
> with that kind of workload.
>=20
> For the regular desktop cases, it means that the exec_queue
> is alive even on idle scenarios where display goes off. This
> is unacceptable since this would entirely block runtime PM
> indefinitely, blocking deeper Package-C state. This would be
> a waste drainage of power.
>=20
> So, let's limit the protection for the moments where we are
> really sending jobs for execution.
>=20
> This patch also introduces a protection to guc submit fini,
> which is not protected anymore by the exec_queue life.

Nit: Imperative language ^^^

>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Otherwise LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>



> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c | 14 --------------
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c |=C2=A0 3 +++
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0 | 10 +++-------
> =C2=A03 files changed, 6 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 395de93579fa..33b03605a1d1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -106,7 +106,6 @@ static struct xe_exec_queue
> *__xe_exec_queue_alloc(struct xe_device *xe,
> =C2=A0
> =C2=A0static int __xe_exec_queue_init(struct xe_exec_queue *q)
> =C2=A0{
> -	struct xe_device *xe =3D gt_to_xe(q->gt);
> =C2=A0	int i, err;
> =C2=A0
> =C2=A0	for (i =3D 0; i < q->width; ++i) {
> @@ -119,17 +118,6 @@ static int __xe_exec_queue_init(struct
> xe_exec_queue *q)
> =C2=A0	if (err)
> =C2=A0		goto err_lrc;
> =C2=A0
> -	/*
> -	 * Normally the user vm holds an rpm ref to keep the device
> -	 * awake, and the context holds a ref for the vm, however
> for
> -	 * some engines we use the kernels migrate vm underneath
> which offers no
> -	 * such rpm ref, or we lack a vm. Make sure we keep a ref
> here, so we
> -	 * can perform GuC CT actions when needed. Caller is
> expected to have
> -	 * already grabbed the rpm ref outside any sensitive locks.
> -	 */
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags &
> EXEC_QUEUE_FLAG_VM || !q->vm))
> -		xe_pm_runtime_get_noresume(xe);
> -
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_lrc:
> @@ -216,8 +204,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
> =C2=A0
> =C2=A0	for (i =3D 0; i < q->width; ++i)
> =C2=A0		xe_lrc_finish(q->lrc + i);
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags &
> EXEC_QUEUE_FLAG_VM || !q->vm))
> -		xe_pm_runtime_put(gt_to_xe(q->gt));
> =C2=A0	__xe_exec_queue_free(q);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d274a139010b..86baebd49c19 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -35,6 +35,7 @@
> =C2=A0#include "xe_macros.h"
> =C2=A0#include "xe_map.h"
> =C2=A0#include "xe_mocs.h"
> +#include "xe_pm.h"
> =C2=A0#include "xe_ring_ops_types.h"
> =C2=A0#include "xe_sched_job.h"
> =C2=A0#include "xe_trace.h"
> @@ -1071,6 +1072,7 @@ static void __guc_exec_queue_fini_async(struct
> work_struct *w)
> =C2=A0	struct xe_exec_queue *q =3D ge->q;
> =C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> =C2=A0
> +	xe_pm_runtime_get(guc_to_xe(guc));
> =C2=A0	trace_xe_exec_queue_destroy(q);
> =C2=A0
> =C2=A0	if (xe_exec_queue_is_lr(q))
> @@ -1081,6 +1083,7 @@ static void __guc_exec_queue_fini_async(struct
> work_struct *w)
> =C2=A0
> =C2=A0	kfree(ge);
> =C2=A0	xe_exec_queue_fini(q);
> +	xe_pm_runtime_put(guc_to_xe(guc));
> =C2=A0}
> =C2=A0
> =C2=A0static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> b/drivers/gpu/drm/xe/xe_sched_job.c
> index cd8a2fba5438..a4e030f5e019 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -158,11 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0	for (i =3D 0; i < width; ++i)
> =C2=A0		job->batch_addr[i] =3D batch_addr[i];
> =C2=A0
> -	/* All other jobs require a VM to be open which has a ref */
> -	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_pm_runtime_get_noresume(job_to_xe(job));
> -	xe_device_assert_mem_access(job_to_xe(job));
> -
> +	xe_pm_runtime_get_noresume(job_to_xe(job));
> =C2=A0	trace_xe_sched_job_create(job);
> =C2=A0	return job;
> =C2=A0
> @@ -191,13 +187,13 @@ void xe_sched_job_destroy(struct kref *ref)
> =C2=A0{
> =C2=A0	struct xe_sched_job *job =3D
> =C2=A0		container_of(ref, struct xe_sched_job, refcount);
> +	struct xe_device *xe =3D job_to_xe(job);
> =C2=A0
> -	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_pm_runtime_put(job_to_xe(job));
> =C2=A0	xe_exec_queue_put(job->q);
> =C2=A0	dma_fence_put(job->fence);
> =C2=A0	drm_sched_job_cleanup(&job->drm);
> =C2=A0	job_free(job);
> +	xe_pm_runtime_put(xe);
> =C2=A0}
> =C2=A0
> =C2=A0void xe_sched_job_set_error(struct xe_sched_job *job, int error)

