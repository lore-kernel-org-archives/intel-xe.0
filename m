Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0679AC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 23:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9603210EE22;
	Wed, 26 Aug 2026 23:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JkI/JXT5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5757210EE1F;
 Wed, 26 Aug 2026 23:04:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F0A3F40165;
 Wed, 26 Aug 2026 23:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9415A1F000E9;
 Wed, 26 Aug 2026 23:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787785441;
 bh=UF4gjmNZaztWXHC724fbgZIC1T1xz+m6o5D8iGCINU8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JkI/JXT5td645QfnQvwN77PTVkl/Sl0ArTVrY5NfkDIggSix6+roM8sKTQFSU+GOP
 6ayocRl8rQ9eFyXqI4xfLFT0RhiqBpobdGcXVLgKv7nyYhtZZYDqvZ8wcN/9Pt/Fp1
 +szVWSzxLBOclV/bUrgVIDya36OsUd6o3TLP3ziEX82VP3wEOC6FiKR0+zSU051h3x
 Jp7OsHmSH2lFt0fuZ8P3kgcGqpi9zQlCK7JXNmR/jf8QXNChkLyS2pPIFGL8YD+4eG
 bv+JEEi2pSvqRaRh91FOQQe2qPSdx3OPy4K8aQ1sm8mo6Vu5ta+Fooh8hwSBU+VRKf
 UbTYy5WTLi8rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] drm/xe/pm: plumb PME capability to runtime suspend
 handler
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260826225338.804902-3-vinod.govindapillai@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
 <20260826225338.804902-3-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 23:04:01 +0000
Message-Id: <20260826230401.9415A1F000E9@smtp.kernel.org>
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
- [High] Missing rollback of GT suspend operations on error paths in PM sus=
pend callbacks leaves previously suspended GTs in a powered-down state.
--

commit beb79b15731f1c3df49e1a0d1e8cf997804da5af
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: drm/xe/pm: plumb PME capability to runtime suspend handler

If the device is PME capable, we don't need to start the HPD polling
during the runtime suspend. This patch plumbs the pme_capable flag
through the runtime suspend stack.

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 1488c4dfcc055..c3a53c5f8b330 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
[ ... ]
> @@ -639,9 +640,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  			goto out_resume;
                        ^^^^^^^^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but modifying this function
highlights incomplete error handling on this path.

If suspending a GT fails (e.g., due to a forcewake timeout), the out_resume
error path skips resuming the GTs that successfully suspended prior to the
failure:

out_resume:
	xe_display_pm_runtime_resume(xe);
	xe_pxp_pm_resume(xe->pxp);
out:
	xe_rpm_lockmap_release(xe);
	xe_pm_write_callback_task(xe, NULL);
	return err;

Since the PM core considers the device to be active when the suspend callba=
ck
returns an error, won't subsequent accesses to the successfully suspended G=
Ts
cause hardware hangs or kernel oops?

Also, a similar issue appears in the system suspend path in xe_pm_suspend():

	for_each_gt(gt, xe, id) {
		err =3D xe_gt_suspend(gt);
		if (err)
			goto err_display;
	}

Could we ensure previously suspended GTs are properly resumed in these error
paths?

>  	}
> =20
> -	xe_irq_suspend(xe, false);
> +	xe_irq_suspend(xe, pme_capable);
> =20
> -	xe_display_pm_runtime_suspend_late(xe);
> +	xe_display_pm_runtime_suspend_late(xe, pme_capable);
> =20
>  	xe_i2c_pm_suspend(xe);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826225338.8049=
02-1-vinod.govindapillai@intel.com?part=3D2
