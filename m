Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799B3C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 11:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095B110E35F;
	Tue, 18 Aug 2026 11:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WosSyoei";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9B310E35F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 11:06:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0395F601FB;
 Tue, 18 Aug 2026 11:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5931F000E9;
 Tue, 18 Aug 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787051213;
 bh=8BFkIZsMLNgcd0z1R+Yv5jPMEGQQDdWOs9WJBWFBknc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WosSyoeiQMaloI00+JK7yEwly72e9uXNMCyisB33X3z44UCODdTuF3jVFXDrDeMNj
 5Ldy2bKZpRoRMzakyPG/PLN6ycm2cjMyMi9lHQKLfWAXcOFnqVzfWt1iL2UMk8yK/P
 +l8pahHxwTzYCCGiOMWg8CR5npLf9VTTylsiaLoR7zKHDlA/3uGeo33MH2AK3kBcvN
 8Zh2KxyTPNwosB6S+Dp/YllGJakSuQXxmCeLDGrSzMwOXutlKfyeRGad2jdNxrSQwa
 SkGaJOMmSakKZ6gCBE7rtYWwvf/GuLlKmpLbVh0Qy7hK5obw4S5Sx5Q/c3lr1evIsZ
 aa7PS4EI9m8Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 05/12] drm/xe: Guard teardown paths against purged BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818104055.3833974-19-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <20260818104055.3833974-19-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 11:06:53 +0000
Message-Id: <20260818110653.8D5931F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Calling xe_bo_lock() in xe_pt_destroy() causes a recursive sel=
f-deadlock because the page table BO shares the VM's dma_resv lock, which i=
s already held by callers.
- [Medium] The patch assumes that pinned kernel BOs (Page Table, Exec Queue=
) can be purged, adding dead code guards. Pinned kernel BOs can never be pu=
rged.
--

--- Patch [5]: [PATCH V17 05/12] drm/xe: Guard teardown paths against purge=
d BOs ---
commit 77ed38896aea34c9e5dc27cf110f773e0afaba91
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe: Guard teardown paths against purged BOs

This commit adds guards using xe_bo_is_purged() to teardown and update
paths. It prevents unpinning or mapping a BO that has already been
purged during VRAM page offlining.

> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index eede678ad303a..dfcd0e57073be 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -364,7 +364,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo=
 *bo)
>  {
>  	if (likely(bo)) {
>  		xe_bo_lock(bo, false);
> -		xe_bo_unpin(bo);
> +		if (!xe_bo_is_purged(bo))
> +			xe_bo_unpin(bo);
>  		xe_bo_unlock(bo);

[Severity: Medium]
Will this condition ever be true? xe_bo_unpin_map_no_vm() is used exclusive=
ly
for kernel BOs, which cannot be purged. Since kernel BOs cannot transition =
to
the purged state, this guard appears to be dead code.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index d6c7f346f49bc..5432710c1cfb6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1575,8 +1575,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec=
_queue *q)
>  	 * errors.
>  	 */
>  	lrc =3D q->lrc[0];
> -	new_ts =3D xe_lrc_update_timestamp(lrc, &old_ts);
> -	q->xef->run_ticks[q->class] +=3D (new_ts - old_ts) * q->width;
> +	xe_bo_lock(lrc->bo, false);
> +	if (!xe_bo_is_purged(lrc->bo)) {

[Severity: Medium]
Since LRC BOs are permanently pinned kernel BOs, is it possible for them to
ever be purged? If kernel BOs are never purged, this check and the new
locking operations are unnecessary dead code.

> +		new_ts =3D xe_lrc_update_timestamp(lrc, &old_ts);
> +		q->xef->run_ticks[q->class] +=3D (new_ts - old_ts) * q->width;
> +	}
> +	xe_bo_unlock(lrc->bo);
> =20
>  	drm_dev_exit(idx);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740a..b6575a6bada44 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -212,7 +212,10 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, stru=
ct llist_head *deferred)
>  		return;
> =20
>  	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
> -	xe_bo_unpin(pt->bo);
> +	xe_bo_lock(pt->bo, false);

[Severity: Critical]
Does calling xe_bo_lock() here cause a recursive self-deadlock?

When tearing down a VM, xe_vm_pt_destroy() asserts that the VM's lock is he=
ld
and then calls xe_pt_destroy(). The page table BO shares the VM's dma_resv
lock.

Because the lock is already held by the current thread, won't attempting to
acquire the non-recursive ww_mutex again here cause a guaranteed deadlock w=
hen
destroying or modifying page tables?

Additionally, as with the other kernel BOs, can a page table BO ever actual=
ly
be purged?

> +	if (!xe_bo_is_purged(pt->bo))
> +		xe_bo_unpin(pt->bo);
> +	xe_bo_unlock(pt->bo);
>  	xe_bo_put_deferred(pt->bo, deferred);
> =20
>  	if (pt->level > 0 && pt->num_live) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818104055.3833=
974-14-tejas.upadhyay@intel.com?part=3D5
