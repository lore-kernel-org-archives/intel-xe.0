Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71275CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 08:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FABF10E8B3;
	Thu, 30 Oct 2025 08:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7LA/rXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11FD10E8B3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761813830; x=1793349830;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=28WuyI4SlRVhw+4i++NqcKCF+AeyB5GECC2Vy09Hqps=;
 b=J7LA/rXM5kFWml3jrG4rXvhiMcyxpEX0hIBuwek74kfjAiYbp1AJeDJq
 FtioqqXVS9h4wF9sqgKXQ8FXm+IAn8FyrNvzPuZO3XWJUDaVi8KawR4ec
 C3TiBeId8GddGiqOxLDCEHaXCszf1bXLGEM9IjpB7HNAnAzKvR+2QODX3
 Ti5yU6P2VpvNd5/52IkrCAHKI/FQp+/hTeRXBnrwV1nP5toQuql0XSpDA
 pnrKjW6UXPL58fGLKotrKF7RjyKBx0dwQxD8xGWEPlx+enfds2CZZ10at
 fvhRuycTdCITHBYLW05iC4ak34Z8bErYtxpByhiKwPkW9X9w/RyISzTIf w==;
X-CSE-ConnectionGUID: JvV6uQXpRpK+/qbL9bv04w==
X-CSE-MsgGUID: LOKwSXskQNKE5xIgspAfrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63857969"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63857969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:43:50 -0700
X-CSE-ConnectionGUID: PM6aXs8lRMSzKj39ZchwVw==
X-CSE-MsgGUID: kcCGAEEZTPaFvq76gnfSFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="191034423"
Received: from opintica-mobl1 (HELO [10.245.245.172]) ([10.245.245.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:43:49 -0700
Message-ID: <fbd6f305c5650ccd43721ee6fe4fd1ee87a8d611.camel@linux.intel.com>
Subject: Re: [PATCH v5 6/6] drm/xe: Remove last fence dependency check from
 binds
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 09:43:47 +0100
In-Reply-To: <20251029205719.2746501-7-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
 <20251029205719.2746501-7-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Wed, 2025-10-29 at 13:57 -0700, Matthew Brost wrote:
> Eliminate redundant last fence dependency checks in bind jobs, as
> they
> are now equivalent to xe_exec_queue_is_idle. Simplify the code by
> removing this dead logic.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c | 23 -----------------------
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.h |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 7 -------
> =C2=A03 files changed, 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b7551592fe3f..3486744a8dfd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1122,29 +1122,6 @@ void xe_exec_queue_last_fence_set(struct
> xe_exec_queue *q, struct xe_vm *vm,
> =C2=A0	q->last_fence =3D dma_fence_get(fence);
> =C2=A0}
> =C2=A0
> -/**
> - * xe_exec_queue_last_fence_test_dep - Test last fence dependency of
> queue
> - * @q: The exec queue
> - * @vm: The VM the engine does a bind or exec for
> - *
> - * Returns:
> - * -ETIME if there exists an unsignalled last fence dependency, zero
> otherwise.
> - */
> -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> struct xe_vm *vm)
> -{
> -	struct dma_fence *fence;
> -	int err =3D 0;
> -
> -	fence =3D xe_exec_queue_last_fence_get(q, vm);
> -	if (fence) {
> -		err =3D test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> >flags) ?
> -			0 : -ETIME;
> -		dma_fence_put(fence);
> -	}
> -
> -	return err;
> -}
> -
> =C2=A0/**
> =C2=A0 * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB
> invalidation fence
> =C2=A0 * @q: The exec queue
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 1ba7354b33d1..fda4d4f9bda8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -88,8 +88,6 @@ struct dma_fence
> *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> =C2=A0							=C2=A0 struct
> xe_vm *vm);
> =C2=A0void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct
> xe_vm *vm,
> =C2=A0				=C2=A0 struct dma_fence *fence);
> -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm);
> =C2=A0
> =C2=A0void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q=
,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a4b9cdf016d9..01056b51ac9f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1338,13 +1338,6 @@ static int xe_pt_vm_dependencies(struct
> xe_sched_job *job,
> =C2=A0			return err;
> =C2=A0	}
> =C2=A0
> -	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> -		if (job)
> -			err =3D xe_sched_job_last_fence_add_dep(job,
> vm);
> -		else
> -			err =3D
> xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> -	}
> -
> =C2=A0	for (i =3D 0; job && !err && i < vops->num_syncs; i++)
> =C2=A0		err =3D xe_sync_entry_add_deps(&vops->syncs[i], job);
> =C2=A0

