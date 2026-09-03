Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED292C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD0E10E1A5;
	Thu,  3 Sep 2026 16:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AkrY1g+R";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C1E10E1A5
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:55:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7AAEF4017D;
 Thu,  3 Sep 2026 16:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4181F000E9;
 Thu,  3 Sep 2026 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788454553;
 bh=gJwv/QmSppgU2bEAc8rRfkZdxLCUAGHbWFcnxnKj3fw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AkrY1g+RYQaiZzvOEATl2j7WdRF+jNZp1sKOAydZCYy8LZSCA4Vor5oohg6WbOkDK
 aFtCBz7oPVRkpQXRphIX0l5zqaegZOhIE3KhwGlBBT0wlq4+ECrtlQdVN1Z4UwsDD+
 zGv+9G+XG7WFozMkhj6e/8teiDJdbz1ImrP8t9ctkZqRHJs4P1u68nsJ/xFLTynVa2
 cEp1X16YzfYc7tfEEu7TOMkqiuA28BdpTSrOAdxByywcT+UIXLA7bZwDzJAeaYd5R0
 ZJEFLWjbAsS7+HiMlv4d4KQ2lqcQ/BQe6VejrIQXnLWFB5SxyYoZGE50Qb2s3buhC5
 45oK6REbFyyIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V21 06/15] drm/xe: Guard teardown paths against purged BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903161553.528932-23-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
 <20260903161553.528932-23-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 16:55:52 +0000
Message-Id: <20260903165553.3D4181F000E9@smtp.kernel.org>
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
- [High] Unsafe access to purged pt_root vmap in xe_pt_clear() during VM te=
ardown.
--

commit 93911d5c837da7fe0353a26b41f2f3b5ce75d05b
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Guard teardown paths against purged BOs

VRAM page offlining can purge BOs that are still referenced by page
tables, exec queues, and DMA-buf exports. Add xe_bo_is_purged()
guards in the teardown paths to prevent unpinning or mapping an
already-purged BO.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c255327669da5..b162753cebb70 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3267,6 +3267,9 @@ void xe_bo_unpin(struct xe_bo *bo)
>  	struct ttm_place *place =3D &bo->placements[0];
>  	struct xe_device *xe =3D xe_bo_device(bo);
> =20
> +	if (xe_bo_is_purged(bo))
> +		return;
> +

[Severity: High]
Does xe_vm_close() also need to be guarded against purged BOs?

During VM teardown, if a VRAM page offline fault occurs on a userspace root
page table BO, the offliner purges the BO which unmaps its CPU vmap. Later,
when userspace closes the VM or the process exits, xe_vm_close()
unconditionally calls xe_pt_clear() on the root page table:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_close() {
    ...
			for_each_tile(tile, xe, id)
				if (vm->pt_root[id])
					xe_pt_clear(xe, vm->pt_root[id]);
    ...
}

This passes the cleared vmap to xe_map_memset(), leading to a kernel panic
due to a NULL pointer dereference:

drivers/gpu/drm/xe/xe_pt.c:xe_pt_clear() {
	struct iosys_map *map =3D &pt->bo->vmap;

	xe_map_memset(xe, map, 0, 0, SZ_4K);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903161553.5289=
32-17-tejas.upadhyay@intel.com?part=3D6
