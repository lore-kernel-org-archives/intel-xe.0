Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84927606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6uti45P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8A110E09F;
	Mon, 23 Nov 2026 05:41:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A35410E09F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 05:41:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CA9F61177;
 Mon, 23 Nov 2026 05:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9D61F000C4;
 Mon, 23 Nov 2026 05:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795412509;
 bh=4p0wm+7Fgju03g5UWouN9jDroLLUrY2TswS3yIUC3AI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=X6uti45Ph0+SOZTNa3bJWnYeviVi7MPCsEXJ1Ydc+whtAyN7QFg/MVZLYYasxUJve
 A1w+7Jo3x1zjV/GikbaEjyj7e97Cm+2K0vwyqpBBo6euhoJ6Fl93w6mOOXzrEiMkYU
 BECn39piIyBRK7ntCI+eRe3wx8be6bwgr8O5QYEZzaLWmLPqm5pgF+GrDNGPekbYTO
 BC5xUdEjhdiqV1XybFpmrn5PPkwk0FPr9f0/0gXWFmyKuk+af66I3QqrAh6jVuwzul
 Ao8cl7JEptG/0cbzpXzAjmTtgZduQk0aM6dv+jokdZDoitTRU2lJx76Mb9dHaspLNR
 Dh53Ph4XI6OYw==
Message-ID: <sashiko-outbox-228726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe/bo: Fix self-flush deadlock in async BO free
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261123045652.3575516-5-sanjay.kumar.yadav@intel.com>
References: <20261123045652.3575516-4-sanjay.kumar.yadav@intel.com>
 <20261123045652.3575516-5-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 05:41:48 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe/bo: device ref in xe_bo_dev_work_func() misses delayed
  TTM delete
- [High] drm/xe/bo: use-after-free in xe_bo_dev_fini() due to drmm
  teardown order
--

commit 5fbac2ccb59bdff95da98ffe9fb0729223881834
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

drm/xe/bo: Fix self-flush deadlock in async BO free

This commit holds a temporary drm_device reference across xe_bo_put_commit()
in the async BO free worker and skips flush_work() in xe_bo_dev_fini() when
called from the worker itself.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a0..b8c6d6a643d3a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -4157,8 +4157,17 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  static void xe_bo_dev_work_func(struct work_struct *work)
>  {
>  	struct xe_bo_dev *bo_dev =3D container_of(work, typeof(*bo_dev), async_=
free);
> +	struct xe_device *xe =3D container_of(bo_dev, struct xe_device, bo_devi=
ce);
> +	/*
> +	 * Freeing a BO may drop the last device ref, so hold one until the
> +	 * list is processed. Zero if xe_bo_dev_fini() is already flushing us.
> +	 */
> +	bool dev_ref =3D kref_get_unless_zero(&xe->drm.ref);
> =20
>  	xe_bo_put_commit(&bo_dev->async_list);
> +
> +	if (dev_ref)
> +		drm_dev_put(&xe->drm);
>  }

[Severity: High]
Does holding xe->drm.ref only across xe_bo_put_commit() protect against the
same deadlock when TTM defers freeing the BO to bo->delayed_delete?

When xe_bo_put_commit() reaches ttm_bo_release(), TTM queues
ttm_bo_delayed_delete() onto bdev->wq (xe->ttm.wq) instead of calling
xe_ttm_bo_destroy() synchronously whenever bookkeep fences on the BO are not
yet signaled or want_init_on_free() is active with a non-NULL bo->ttm.
Because xe_ttm_bo_destroy() has not run yet, bo->vm still holds its xe_vm a=
nd
drm_device references when xe_bo_dev_work_func() drops dev_ref and exits.

When ttm_bo_delayed_delete() later runs on xe->ttm.wq with no outer
drm_device reference held, xe_ttm_bo_destroy() calls xe_vm_put(bo->vm) ->
drm_gpuvm_free() -> drm_dev_put(), dropping the final drm_device reference
from inside xe->ttm.wq:

drivers/gpu/drm/xe/xe_bo.c:xe_ttm_bo_destroy() {
	...
	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
		xe_vm_put(bo->vm);

	if (bo->parent_obj)
		xe_bo_put(bo->parent_obj);

	mutex_lock(&xe->mem_access.vram_userfault.lock);
	...
}

That triggers xe_device_destroy() -> ttm_device_fini(), which calls
drain_workqueue(bdev->wq) from a worker running on bdev->wq and deadlocks;
even apart from the workqueue drain, dropping the last drm_device reference
in xe_vm_put(bo->vm) frees struct xe_device before the following
mutex_lock(&xe->mem_access.vram_userfault.lock).

>  /**
> @@ -4176,7 +4185,16 @@ void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
>   */
>  void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
>  {
> -	flush_work(&bo_dev->async_free);
> +	/*
> +	 * Final device put from the worker itself: flushing would deadlock,
> +	 * so cancel any requeue and free the pending BOs inline.
> +	 */
> +	if (current_work() =3D=3D &bo_dev->async_free) {
> +		cancel_work(&bo_dev->async_free);
> +		xe_bo_put_commit(&bo_dev->async_list);
> +	} else {
> +		flush_work(&bo_dev->async_free);
> +	}
>  }

[Severity: High]
Can freeing pending BOs in xe_bo_dev_fini() access BO resources that
drm_managed_release() has already destroyed?

In xe_device_init_early(), xe_device_destroy() is the first drmm action
registered, before xe_shrinker_create(), drmm_mutex_init() for
xe->mem_access.vram_userfault.lock, and the TTM resource managers.  Because
drm_managed_release() runs actions in reverse registration order, those
resources are already destroyed and freed by the time xe_device_destroy()
calls xe_bo_dev_fini().

If a BO that does not pin a drm_device reference while queued (such as an S=
VM
devmem BO with bo->vm =3D=3D NULL queued via xe_svm_devmem_release() ->
xe_bo_put_async()) is added to bo_dev->async_list while xe_bo_put_commit() =
is
sleeping in xe_bo_dev_work_func(), drm_dev_put(&xe->drm) starts
drm_managed_release() with that BO still on bo_dev->async_list.  When
xe_bo_dev_fini() then runs xe_bo_put_commit(&bo_dev->async_list) (or flushes
the worker), xe_ttm_bo_destroy() locks the destroyed
xe->mem_access.vram_userfault.lock and xe_ttm_tt_unpopulate() accesses the
freed xe->mem.shrinker.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123045652.3575=
516-4-sanjay.kumar.yadav@intel.com?part=3D1
