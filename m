Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2467606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFp37b6J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE4F10E466;
	Tue, 27 Oct 2026 18:48:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2702A10E466
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:47:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 572E760142;
 Tue, 27 Oct 2026 18:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E561D1F01825;
 Tue, 27 Oct 2026 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793126878;
 bh=31F/uK01w57z0yFf30wO02CT4pe1nfwB2jLX5cRQAM0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=mFp37b6Jfm/VHxeXulWssQiKTQ//KEIQer/Mjh41gUhFUTjvByMyDH9WBTtkOl1GL
 iyoh+xtIA/sY6DOWltDdZW3HMr5LOQvSn+RbXIYBD68Bxp0sFY/lfnUPiudXJrRBeL
 Lv9LDRezyTf4ZdUggCp1Zngw0W9cqAWW9bhtbCFgNOJlz27SedCrlwRNBsZV7b5Wp5
 m96HR/ZbWt0YPJWhc83gRZilxEcX4fgBPt83tIh+F3kw3x0pa+ob74k9TcDwcY6eGM
 ChCzrlVA4MdaqLMETXOw+XXQViCaegYUnbFwEagABoAtCHzEJW4zNGvr9AqX4r1FgM
 a8imaJs6FW50Q==
Message-ID: <sashiko-outbox-187039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] drm/xe: Leave the VM bulk move on BO release,
 not on GEM close
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261027183638.1031299-4-matthew.brost@intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
 <20261027183638.1031299-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 18:47:57 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe: bulk_move detach in xe_ttm_bo_release_notify() violates TT=
M invariants
--

commit 5d85520c1e2e507cc032c4248bd48c50a734e710
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Leave the VM bulk move on BO release, not on GEM close

This commit removes xe_gem_object_close() and moves the detachment of a
VM-private BO from its VM's LRU bulk move into xe_ttm_bo_release_notify()
so that BOs outliving their GEM handles remain part of the VM bulk move
until release.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a0..ba16b260dbcb7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1869,6 +1869,14 @@ static void xe_ttm_bo_release_notify(struct ttm_bu=
ffer_object *ttm_bo)
>  	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
>  		return;
> =20
> +	/*
> +	 * Leave the VM's bulk move, which is only kept alive by the VM, and
> +	 * whose LRU position no longer says anything about a BO on its way
> +	 * out.
> +	 */
> +	if (ttm_bo->bulk_move)
> +		ttm_bo_set_bulk_move(ttm_bo, NULL);

[Severity: High]
Does detaching from bulk_move in xe_ttm_bo_release_notify() happen too late
in the TTM teardown sequence?

When the final reference to a VM-private user BO on a non-fault-mode VM is
dropped via xe_gem_object_free() -> ttm_bo_fini() -> ttm_bo_put() ->
ttm_bo_release(), ttm_bo_release() checks bo->bulk_move and individualizes
bo->base.resv before invoking bdev->funcs->release_notify():

drivers/gpu/drm/ttm/ttm_bo.c:ttm_bo_release() {
    ...
	WARN_ON_ONCE(bo->pin_count);
	WARN_ON_ONCE(bo->bulk_move);

	if (!bo->deleted) {
		ret =3D ttm_bo_individualize_resv(bo);
		if (ret) {
			/* Last resort, if we fail to allocate memory for the
			 * fences block for the BO to become idle
			 */
			dma_resv_wait_timeout(bo->base.resv,
					      DMA_RESV_USAGE_BOOKKEEP, false,
					      30 * HZ);
		}

		if (bdev->funcs->release_notify)
			bdev->funcs->release_notify(bo);
    ...
}

Because bo->bulk_move is still set upon entering ttm_bo_release(), releasing
such a BO will immediately trigger WARN_ON_ONCE(bo->bulk_move).

In addition, ttm_bo_individualize_resv() switches bo->base.resv away from
xe_vm_resv(vm) to &bo->base._resv under bo->bdev->lru_lock and then drops
lru_lock while the BO's resource is still linked in vm->lru_bulk_move:

drivers/gpu/drm/ttm/ttm_bo.c:ttm_bo_individualize_resv() {
    ...
		spin_lock(&bo->bdev->lru_lock);
		bo->base.resv =3D &bo->base._resv;
		spin_unlock(&bo->bdev->lru_lock);
    ...
}

In the window between ttm_bo_individualize_resv() and
ttm_bo_set_bulk_move(ttm_bo, NULL) in xe_ttm_bo_release_notify(), another
thread holding xe_vm_resv(vm) can access vm->lru_bulk_move while the dying
BO is still pos->first or pos->last:

- Calling xe_vm_bump_lru() -> ttm_lru_bulk_move_tail() will fail
  dma_resv_assert_held(pos->first->bo->base.resv) or
  dma_resv_assert_held(pos->last->bo->base.resv) in
  drivers/gpu/drm/ttm/ttm_resource.c:

drivers/gpu/drm/ttm/ttm_resource.c:ttm_lru_bulk_move_tail() {
    ...
			lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
			dma_resv_assert_held(pos->first->bo->base.resv);
			dma_resv_assert_held(pos->last->bo->base.resv);
    ...
}

- Adding or moving another resource in the same bucket via
  ttm_resource_add_bulk_move() -> ttm_lru_bulk_move_add() will trigger
  WARN_ON(pos->first->bo->base.resv !=3D res->bo->base.resv):

drivers/gpu/drm/ttm/ttm_resource.c:ttm_lru_bulk_move_add() {
    ...
	} else {
		WARN_ON(pos->first->bo->base.resv !=3D res->bo->base.resv);
		ttm_lru_bulk_move_pos_tail(pos, res);
	}
}

Conversely, if ttm_bo_individualize_resv() fails (for example, if
dma_resv_copy_fences() returns -ENOMEM), bo->base.resv remains
xe_vm_resv(vm), while xe_ttm_bo_lock_in_destructor() only trylocks
&ttm_bo->base._resv. Calling ttm_bo_set_bulk_move(ttm_bo, NULL) in
xe_ttm_bo_release_notify() will then fail dma_resv_assert_held(bo->base.res=
v)
in ttm_bo_set_bulk_move() and ttm_resource_is_swapped(), and mutate
vm->lru_bulk_move without holding xe_vm_resv(vm).

Should bulk_move be cleared before ttm_bo_release() runs (or before
ttm_bo_individualize_resv() detaches bo->base.resv from the VM reservation
object) while holding the VM reservation lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027183638.1031=
299-1-matthew.brost@intel.com?part=3D3
