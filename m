Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F05D606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qt34DKMK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E294410F483;
	Tue, 20 Oct 2026 10:24:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DFF10F4B1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 10:24:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AE40C40A09;
 Tue, 20 Oct 2026 10:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBC71F000C4;
 Tue, 20 Oct 2026 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792491876;
 bh=au2jDvygtTJTr5+P6tUa+IzGpbXM3XOxMXC9VenPErY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Qt34DKMKJhsuE8Hpgojn8xX1Ck65/R+ENWsa+DDN+jrzCR3NKnxCJpfutekfferoU
 0r9x0ZlGpreYCPyvbLaQ2NY8E5BA6Zhj2BxcdxbXrl+ad9PKuK7m6nChTxgS72AgLJ
 rnUSC/kMXWEk/pfoDe2UayBtwQjHTu3Fffi7NPnKsV/0aiB5J/PvdILS/6tejPhzNk
 9ckF76PI4RMwJBBJAmHj4ED7ADcBWHOXb86YstQ6tWlxUyQSj5Ha4J8gLveft7mQU7
 066PY7WV3uGuOUCv6O7W3o9XtjkK4OJWWKAjXmFOKeaNCI3y4Ca/Kxsy13rYhbT5gK
 2K2pdLNoRd/Ng==
Message-ID: <sashiko-outbox-178829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Don't fail runtime suspend permanently on VRAM
 eviction -ENOMEM
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261020100545.46715-1-thomas.hellstrom@linux.intel.com>
References: <20261020100545.46715-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:24:35 +0000
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
- [Critical] drm/xe: missing pinned BO rollback on -ENOMEM in xe_pm_runtime=
_suspend()
--

commit c1d7f6ee67a2e6a9eb3953b3524ff03d2efde556
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Don't fail runtime suspend permanently on VRAM eviction -ENOMEM

This commit converts -ENOMEM from xe_bo_evict_all() into -EAGAIN during
runtime suspend to D3cold so that the runtime PM core treats the memory
shortage as transient, keeps the device active, and retries runtime
suspend later.

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4f1035ab1eb2b..5652511294bc6 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -649,8 +649,16 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> =20
>  	if (xe->d3cold.allowed) {
>  		err =3D xe_bo_evict_all(xe);
> -		if (err)
> +		if (err) {
> +			/*
> +			 * Runtime PM treats errors other than -EAGAIN and
> +			 * -EBUSY as fatal, so report memory shortage as
> +			 * transient to allow a later retry.
> +			 */
> +			if (err =3D=3D -ENOMEM)
> +				err =3D -EAGAIN;
>  			goto out_resume;
> +		}
>  	}
> =20
>  	for_each_gt(gt, xe, id) {

[Severity: Critical]
When xe_bo_evict_all() fails with -ENOMEM and xe_pm_runtime_suspend()
returns -EAGAIN via out_resume, what rolls back the pinned BOs that were
already backed up and moved to the evicted lists before the allocation
failure?

Unlike system suspend, runtime suspend does not run the PM notifier
(xe_bo_notifier_prepare_all_pinned()), so xe_bo_evict_all() allocates
bo->backup_obj on the fly inside xe_bo_evict_pinned() using
xe_bo_init_locked():

drivers/gpu/drm/xe/xe_bo_evict.c:xe_bo_evict_all() {
	...
	ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
				    &xe->pinned.late.external, xe_bo_evict_pinned);

	if (!ret)
		ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
					    &xe->pinned.late.evicted, xe_bo_evict_pinned);
	...
	return xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
				     &xe->pinned.early.evicted,
				     xe_bo_evict_pinned);
}

In xe_bo_apply_to_pinned(), each BO that succeeds is moved to
still_in_list with bo->backup_obj populated (and backup->parent_obj
holding a reference to bo). If a subsequent BO fails in
xe_bo_evict_pinned() with -ENOMEM, only that failing BO is put back on
pinned_list, while all previously processed BOs in still_in_list are
spliced onto new_list (xe->pinned.late.evicted or
xe->pinned.early.evicted):

drivers/gpu/drm/xe/xe_bo_evict.c:xe_bo_apply_to_pinned() {
		...
		ret =3D pinned_fn(bo);
		if (ret && pinned_list !=3D new_list) {
			spin_lock(&xe->pinned.lock);
			if (!list_empty(&bo->pinned_link))
				list_move(&bo->pinned_link, pinned_list);
			spin_unlock(&xe->pinned.lock);
		}
		xe_bo_put(bo);
		spin_lock(&xe->pinned.lock);
	}
	list_splice_tail(&still_in_list, new_list);
	spin_unlock(&xe->pinned.lock);
}

Because returning -EAGAIN leaves the device active in D0 without calling
xe_pm_runtime_resume(), neither xe_bo_restore_early() nor
xe_bo_restore_late() runs, and out_resume in xe_pm_runtime_suspend() does
not restore or unprepare those pinned BOs:

drivers/gpu/drm/xe/xe_pm.c:xe_pm_runtime_suspend() {
	...
out_resume:
	xe_pm_update_pme_enabled(xe, false);
	xe_display_pm_runtime_resume(xe);
	xe_pxp_pm_resume(xe->pxp);
}

While the device stays active in D0 and later retries suspend, can this
cause three issues?

1. While the device remains active in D0, the GPU, GuC, and CPU continue
modifying pinned kernel BOs in VRAM. When runtime suspend is later
retried (or system suspend runs), xe_bo_evict_all() only iterates
xe->pinned.late.kernel_bo_present and xe->pinned.early.kernel_bo_present,
skipping all kernel BOs left on xe->pinned.late.evicted and
xe->pinned.early.evicted. When that later suspend succeeds and the device
subsequently resumes from D3cold, won't xe_bo_restore_early() and
xe_bo_restore_late() overwrite modified VRAM with the stale bo->backup_obj
snapshots from the earlier aborted runtime suspend?

2. For external BOs on xe->pinned.late.external that succeeded before
-ENOMEM, bo->backup_obj remains set with a mutual reference between
bo->backup_obj and backup->parent_obj. If an external BO is unpinned while
the device is active via xe_bo_unpin_external():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_unpin_external() {
	...
	xe_bo_unpin_account(bo);
	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
}

it is removed from xe->pinned.late.external without releasing
bo->backup_obj (unlike xe_bo_unpin()). Doesn't that leave an unbreakable
reference cycle leaking both bo and bo->backup_obj?

3. If system suspend or hibernation runs after an aborted runtime suspend,
xe_bo_notifier_prepare_all_pinned() -> xe_bo_notifier_prepare_pinned()
iterates xe->pinned.late.external:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_notifier_prepare_pinned() {
	...
		xe_assert(xe, !bo->backup_obj);
	...
		backup->parent_obj =3D xe_bo_get(bo); /* Released by bo_destroy */
		xe_bo_pin_account(backup);
		bo->backup_obj =3D backup;
}

Won't any external BO that already had bo->backup_obj allocated during the
failed runtime suspend trigger xe_assert(xe, !bo->backup_obj) and leak the
previous backup_obj when bo->backup_obj is overwritten?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020100545.4671=
5-1-thomas.hellstrom@linux.intel.com?part=3D1
