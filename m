Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE340C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D6310E1AB;
	Fri,  4 Sep 2026 12:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I/mRjj1k";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF9610E1AB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 12:40:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EFBF04396D;
 Fri,  4 Sep 2026 12:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EB81F00A3D;
 Fri,  4 Sep 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788525622;
 bh=2fYpB1R0/qQrhY5fJ6jIH2LRQdb6gmOWCNDtBeOwVcc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=I/mRjj1khmnbHJMjZXRp1qpAvSiGG+F1YqSSazJYb+wvAoINvICNbVTk17wJ0TH6R
 e+JYCU02UuqFX4gv81sxy8W/hzOhFRWDBj2ouEe8YxVaj4SRgR60oUct2NDwwYHgoZ
 TkL9cUUrwBGR7EoO0AUuRi4bL5lcCGR33FhHZMowaKKwFgPhG3h71wEkkrCy/UvVTq
 IeH/yRzPIiEQTukjdg3Z0YI3KLPbUQWtLSqlghuMmue6zf2QdVYN3aWnGtxAWsf5Xs
 sEy4IaEjDt8CO9PWD7Hhzp3GOqemw2DS9T2S6fk8nT1KaMd2aImfgAWswmqF+JUpgB
 cDMS6mOI2K8bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Skip clearing purged page-table BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904122121.806122-2-tejas.upadhyay@intel.com>
References: <20260904122121.806122-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:40:22 +0000
Message-Id: <20260904124022.A6EB81F00A3D@smtp.kernel.org>
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

Pre-existing issues:
- [High] Incomplete fix: Page-table BOs accessed in `xe_pt_zap_ptes_entry` =
and `xe_pt_stage_unbind_entry` may be purged, leading to a NULL pointer der=
eference when accessing their `vmap`.
--

commit d85d3cf8e80d3cf9458c1419a52b39bf03260f55
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Skip clearing purged page-table BOs

This commit updates xe_pt_clear() to check if a page-table buffer object
has been purged before writing to its mapping. It acquires the dma-resv
lock to safely check the purged state and avoid NULL pointer dereferences.

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a07316a45d79b..74a6174aae4e3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -236,9 +236,12 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, stru=
ct llist_head *deferred)
>   */
>  void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
>  {
> -	struct iosys_map *map =3D &pt->bo->vmap;
> +	struct xe_bo *bo =3D pt->bo;
> =20
> -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +	xe_bo_lock(bo, false);
> +	if (!xe_bo_is_purged(bo))
> +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> +	xe_bo_unlock(bo);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but while this successfully
prevents a NULL pointer dereference here, does the same vulnerability
still exist in other page-table accessors in drivers/gpu/drm/xe/xe_pt.c?

For example, in xe_pt_zap_ptes_entry():

	xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
		      offset * sizeof(u64), 0,
		      (end_offset - offset) * sizeof(u64));

If xe_child->bo has been purged by VRAM page offlining, its vmap is cleared
and xe_map_memset() will dereference a NULL pointer. Since this executes
without the dma_resv lock, could it be vulnerable to concurrent purges?

Similarly, in xe_pt_stage_unbind_entry():

	pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);

If the BO was previously purged, its vmap is NULL, and reading from it via
xe_map_rd() will also result in a NULL pointer dereference.

Can these paths be triggered by unprivileged userspace via standard VM
unbind ioctls or MMU notifier invalidations?

> =20
>  /**

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904122121.8061=
22-2-tejas.upadhyay@intel.com?part=3D1
