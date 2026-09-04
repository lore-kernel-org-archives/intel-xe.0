Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FDEC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F187B10E59A;
	Fri,  4 Sep 2026 21:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jDRzA6/G";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA3910E59A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:40:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 52F25407ED;
 Fri,  4 Sep 2026 21:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F171F00A3D;
 Fri,  4 Sep 2026 21:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788558003;
 bh=maqDPNNBDZQXxkyWKkhFh7+rMFMLiDosJjfFXD3SOC4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jDRzA6/G2B/xC6CiejtljqSwBaNKAAqWL3nfBYEWIRl8TqbFrqND8LvF6UgrUB5Pt
 YY9GckHBlVjKQ9k4VFWNq48caLRpo6SF7WwIzgHhanUh3yDt4b9pSVyyZp9x8ckExN
 cChBbYmdEWO2ClbYQmWvYvygnEuOzbUaHZsbWJDf88KDzadISpGXiTjIBdQMdGbHt/
 5xw2+Ykqi9DQW+gcRrIbr8uzX6aUT/s/LRZWZvNnTaTtIXBCvhXxz1KiXPxfFnbKTK
 f0CoY2G7Fer6AbMXoUvnkBj43CQJaRAseHzFs86v0nn9Nzm99Xc9a6lj0jf/tWsRxK
 GZhHGJcqODKYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/24] drm/xe: Add struct xe_pt_job_ops
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-10-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:40:02 +0000
Message-Id: <20260904214003.09F171F00A3D@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing BO refcount re-initialization causes refcount underflow an=
d memory leak during async free.
--

commit 6e95dc31189c14b0582d03e7feb8e249921d75d3
Author: Matthew Brost <matthew.brost@intel.com>
Subject: drm/xe: Add struct xe_pt_job_ops

This commit introduces struct xe_pt_job_ops, a dynamically refcounted object
containing the information required to issue a CPU bind via a job after the
initial bind IOCTL returns.

Link: https://patch.msgid.link/20260228013501.106680-10-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index e560f167fdf1b..30127ebf1b605 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c

[ ... ]

> @@ -213,7 +214,19 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, stru=
ct llist_head *deferred)
> =20
>  	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
>  	xe_bo_unpin(pt->bo);
> -	xe_bo_put_deferred(pt->bo, deferred, NULL);
> +	xe_bo_put_deferred(pt->bo, deferred, &added);
> +	if (added) {
> +		xe_assert(pt->bo->vm->xe, !kref_read(&pt->bo->ttm.base.refcount));
> +
> +		/*
> +		 * We need the VM present until the BO is destroyed as it shares
> +		 * a dma-resv and BO destroy is async. Reinit BO refcount so
> +		 * xe_bo_put_async can be used when the PT job ops refcount goes
> +		 * to zero.
> +		 */
> +		xe_vm_get(pt->bo->vm);
> +		pt->bo->flags |=3D XE_BO_FLAG_PUT_VM_ASYNC;
> +	}

[Severity: High]
Does this code forget to actually re-initialize the BO refcount? The comment
explicitly mentions reinitializing the BO refcount so xe_bo_put_async can be
used, but it looks like only the VM is retrieved and the flag is set. Witho=
ut a
call to reinitialize the kref (like kref_init for pt->bo->ttm.base.refcount=
),=20
the refcount remains at zero.

[ ... ]

> +static void xe_pt_job_ops_destroy(struct kref *ref)
> +{
> +	struct xe_pt_job_ops *pt_job_ops =3D
> +		container_of(ref, struct xe_pt_job_ops, refcount);
> +	struct llist_node *freed;
> +	struct xe_bo *bo, *next;
> +
> +	xe_pt_update_ops_free(pt_job_ops->ops,
> +			      pt_job_ops->current_op);
> +
> +	freed =3D llist_del_all(&pt_job_ops->deferred);
> +	if (freed) {
> +		llist_for_each_entry_safe(bo, next, freed, freed) {
> +			struct xe_bo_dev *bo_device =3D
> +				&xe_bo_device(bo)->bo_device;
> +			/*
> +			 * If called from run_job, we are in the dma-fencing
> +			 * path and cannot take dma-resv locks so use an async
> +			 * put.
> +			 */
> +			if (llist_add(&bo->freed, &bo_device->async_list))
> +				schedule_work(&bo_device->async_free);
> +		}
> +	}

[Severity: High]
Because the BO refcount was left at zero during xe_pt_destroy, will the lat=
er
xe_bo_put in the async_free worker trigger a refcount underflow here? A kre=
f_put
on a zero refcount returns false and skips the release function (such as
drm_gem_object_free). Can this cause the page table BO memory to be permane=
ntly
leaked?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D9
