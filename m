Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0023C88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29110F560;
	Fri, 11 Sep 2026 08:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="id+wUx0L";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE8510F560;
 Fri, 11 Sep 2026 08:20:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BF554074C;
 Fri, 11 Sep 2026 08:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB88E1F00893;
 Fri, 11 Sep 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789114822;
 bh=Rvzb0twGzjQRe/dWMozr9tgLyrBZ3ezHD4MhDKtvecQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=id+wUx0LWyXLhxt8Hh5LUv0ljdTSGB2z+Lq6pmydVd1z7TCkIZSosbL1G2jmssaaT
 jQptfdu06160kXYCPeauLkZoWOAlgc+4Sd+xH2KA/rvx+GGTHiUpPCxacMtKufK7V1
 MW0GQ5HjxKMgytDFJ/572gC7j8KutrRj4UOiMU32vZZw7eBNA+REhhwmTzTPwihTGu
 YHjak6wchB60bpvcynjW8rXmJAcNg6tNKqbdyBu+1F4IPuEjwnoPb4I108NMsU0kzP
 o9b7RGoI4WwnS0yL2Jgqbzu6V/RBPv9AoKJW1KX/WdHyRu0a8n/U90ujs5NS65D8gP
 9aXeNJAq/bYPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/10] drm/xe/pm: clear PME HPD flag on runtime
 suspend error handler
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260911080448.778316-9-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
 <20260911080448.778316-9-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:20:21 +0000
Message-Id: <20260911082021.BB88E1F00893@smtp.kernel.org>
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
- [High] Missing rollback of suspended GTs and evicted BOs in PM suspend er=
ror paths.
--

commit 05e729a00eec5c74e7d63026c111b70a9b537da1
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/xe/pm: clear PME HPD flag on runtime suspend error handler

This commit explicitly clears the PME HPD flag in the error path of
xe_pm_runtime_suspend(). The flag is normally set during early runtime
suspend and cleared during early runtime resume, but was previously left
uncleared if an error occurred in the suspend sequence.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c79f55b66a419..5e7263316683a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -663,6 +663,13 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	return 0;
> =20
>  out_resume:
> +	/*
> +	 * We need to explicitly clear the PME HPD flag in this error handler.
> +	 * Normally this is set during early runtime suspend and cleared during
> +	 * early runtime resume call.
> +	 */
> +	xe_display_clear_pme_hpd(xe);
> +
>  	xe_display_pm_runtime_resume(xe);
>  	xe_pxp_pm_resume(xe->pxp);

[Severity: High]
This isn't a bug introduced by this patch, but on this error path, do we
leave previously suspended GTs in a suspended state?

If xe_gt_suspend() or xe_gt_runtime_suspend() fails during the for_each_gt()
iteration in xe_pm_runtime_suspend(), we jump to out_resume. It appears we
do not resume the GTs that were already successfully suspended in earlier
loop iterations, nor do we restore the BOs that were evicted before the loo=
p:

    for_each_gt(gt, xe, id) {
        err =3D xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_susp=
end(gt);
        if (err)
            goto out_resume;
    }

A similar pattern seems to exist in the system suspend path in xe_pm_suspen=
d():

    for_each_gt(gt, xe, id) {
        err =3D xe_gt_suspend(gt);
        if (err)
            goto err_display;
    }

Can this leave the device in a corrupted state where some components are
suspended while the PM core considers the device active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911080448.7783=
16-1-vinod.govindapillai@intel.com?part=3D8
