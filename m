Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12A9C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAD310E6D9;
	Mon, 31 Aug 2026 08:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fLaVqMau";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E7810E6C9
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:03:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 11F5660120;
 Mon, 31 Aug 2026 08:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9903D1F000E9;
 Mon, 31 Aug 2026 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788163426;
 bh=PsmCGY5x99zDaBpKoDwCcTz2lezJDdN/oYUFGb/v1vA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fLaVqMauBRE6+gkwSowKMltFig1VCOpYLdoPxtBVjE2DqmllFq3d27EcNLdDzcee5
 IGtIsU3eqBudqz9zazhJwJQZV/4rmKqDHkm/JgaC9Qtm8/IVIJt1M4qiDz1SEISLvK
 Y/d3lqveOasS7nwCNdjrJPF9/emMik2C54GdvuIJiObEVLCnHsv/CNEEmZImRG3gz/
 qS785dAW3aqcRkDM32Njb8N/OaTws0R2foYoYXFeXbFRnE5lsmK7sTX9eTwMt5uO++
 TmBp4/RUdj99bwA5DW98ws9BjXf39Vf37TK51MIH13Bx2QT/4QmoKDoectG24UoBUd
 Ov6Wo3JGvfS0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 06/15] drm/xe: Guard teardown paths against purged BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-23-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-23-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:03:46 +0000
Message-Id: <20260831080346.9903D1F000E9@smtp.kernel.org>
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
- [High] `xe_bo_unpin_external()` lacks the `xe_bo_is_purged()` check, lead=
ing to pin count underflow for DMA-buf exported BOs.
--

commit b0d5d3f21885703ffe281bfc361768a0213d2668
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Guard teardown paths against purged BOs

This commit adds xe_bo_is_purged() guards in several teardown paths
to prevent unpinning or mapping a buffer object that was already purged
by VRAM page offlining.

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
Does xe_bo_unpin_external() also need this xe_bo_is_purged() check?

If a user BO is exported via DMA-buf, the VRAM page offline mechanism
can queue it for offlining. If the DMA-buf importer pins the BO, the
pin count increments. When the VRAM offline worker processes the queue,
it forcefully unpins and purges the BO, leaving the pin count at 0.

When the importer later unpins the BO, it triggers xe_dma_buf_unpin()
which calls xe_bo_unpin_external():

static void xe_dma_buf_unpin(struct dma_buf_attachment *attach)
{
	struct drm_gem_object *obj =3D attach->dmabuf->priv;
	struct xe_bo *bo =3D gem_to_xe_bo(obj);

	xe_bo_unpin_external(bo);
}

Since xe_bo_unpin_external() lacks the xe_bo_is_purged() guard, it
will call ttm_bo_unpin() unconditionally. Could this cause a pin count
underflow on the TTM BO and make the BO permanently un-evictable?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D6
