Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58639C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F6410E7DC;
	Mon, 24 Aug 2026 16:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gAPQVwk4";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441510E7DC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:48:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 62823410CF;
 Mon, 24 Aug 2026 16:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263961F000E9;
 Mon, 24 Aug 2026 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787590085;
 bh=pLp0xno9qjk+VIM9Nf5Jq/4pDg2dTGYRT5zpoEDJtb4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gAPQVwk4zMVO+rImP6XqGN0GiAXg65Y2Tua5X5fTg6lU0oNb+MGhQgaJsKDGwwu7j
 U7Oo+wkReFJzhgCH4a7U2i+Z6A8QeRSrSWABL44Kp/mRuzzP+8NFC98KOm76zWIW+H
 sTs6m2Aq40vrZsfAp2VUYgl2RwN019kQp3Bf8dMqdaMKwDcf/luuwspNT1hYLfmLLY
 PxkKHIl1oVHAAjiL2z2QZXYtbjrufiTLYfdJc98SYwDjFqHbP1UtPcsDQzPlsrpuzl
 gleq6q23BFDuWLFW1IOLb/N4eWVEMCW011Tbmw87K0ViCRpFhU7z3voEqMK3VFmNJE
 VjpLvm7mGPn5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for
 multi-queue GTs
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824163458.3129935-4-tilak.tirumalesh.tangudu@intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:48:04 +0000
Message-Id: <20260824164805.263961F000E9@smtp.kernel.org>
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
- [Medium] The newly introduced `xe_ggtt_invalidate_engine()` function hard=
codes the primary GT for TLB invalidation, ignoring the media GT, which sha=
res the same GGTT.
--

--- Patch [3]: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for mul=
ti-queue GTs ---
commit 167c9e87bd932fe22844ce91a7963cf6e1898546
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue GTs

This commit adds engine-side GGTT TLB invalidation during GGTT unmap
operations to ensure engines don't hit stale translations. The invalidation
is only issued if the GT has multi-queue engine classes.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 4cddd69f0e992..0f8946fddbaad 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -612,6 +616,23 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
> =20
> +/*
> + * Drain engine-side GGTT TLBs on teardown so a recycled range's next
> + * occupant can't hit a predecessor's cached translation.
> + */
> +static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
> +{
> +	struct xe_gt *gt =3D ggtt->tile->primary_gt;

[Severity: Medium]
Will this miss invalidating the engine TLBs on the media GT?=20

If the media GT has multi-queue engine classes, hardcoding primary_gt here
seems like it would skip the media engines entirely, even though the GGTT
is shared across the entire tile. For comparison, xe_ggtt_invalidate() just
above invalidates both the primary and media GTs.

> +	int err;
> +
> +	if (!xe_gt_has_multi_queue(gt))
> +		return;
> +
> +	err =3D xe_tlb_inval_ggtt_full(&gt->tlb_inval);
> +	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
> +		   ERR_PTR(err));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824163458.3129=
935-1-tilak.tirumalesh.tangudu@intel.com?part=3D3
