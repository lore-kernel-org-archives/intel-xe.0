Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AF3CA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0970112109;
	Fri,  9 Oct 2026 12:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L6E+xHpx";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD763112109
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:39:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 64BF340281;
 Fri,  9 Oct 2026 12:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8171F000FF;
 Fri,  9 Oct 2026 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791549594;
 bh=BYeMCQbwZFakqyGC+6Pbhfxh+3cBSXLorKJldu7s5j8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=L6E+xHpxM6rBCvUWz5Z8Om322jplSGx+WaaaU+xrINErKIAYkWw6zTZMMpbhbIDhS
 ZC07sOZgEnCiqWfBazKtMb7GAys+QWyvvCD2VzXxlSSVPYogG3cKUlPjQdXi+z1zdg
 jQj8TzvR9vv8mIjv8U9PcjLkenroeL3nDAU6XLQhq549nq0Q4VyoP0ouHDWq05ynLN
 D2fCv0SNGKeI69ve/NJbrTahVi05SKIF82TDz/YJ8YWGvhSwjd4Y9DLHOieG2zZ176
 xyFpcAvtPvwQAv6GZzTu3gWXT3Jk1l9aG5u1K+DU7ogC7F6DpbcYV/rlO8foHK1Kpw
 KA/vZrChg3DaQ==
Message-ID: <sashiko-outbox-165551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] drm/xe/gt: Disable GT reset worker before engine
 teardown
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009121921.818671-8-satyanarayana.k.v.p@intel.com>
References: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
 <20261009121921.818671-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:39:53 +0000
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
- [High] drm/xe/gt: UAF in reset worker racing with GuC/GSC devres teardown
--

commit b50233919776c7d521074ae26d515654e814d647
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: drm/xe/gt: Disable GT reset worker before engine teardown

This commit registers a GT-level devres action to disable and drain the=20
reset worker right after xe_hw_engines_init(). This aims to ensure the=20
worker is halted before any engine is torn down.

> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -656,6 +668,11 @@ static int gt_init_with_all_forcewake(struct xe_gt *=
gt)
>  	if (err)
>  		return err;
> =20
> +	/* Disable worker before releasing HW engines */
> +	err =3D devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_reset_worker=
_disable, gt);

[Severity: High]
Does this cause a use-after-free or NULL pointer dereference during teardow=
n?

Because devres actions are executed in LIFO order, registering
gt_reset_worker_disable here means it will execute AFTER any devres actions
registered by subsequent initialization steps, such as
xe_uc_init_post_hwconfig().

Specifically, during GSC teardown, free_resources() destroys the workqueue:

drivers/gpu/drm/xe/xe_gsc.c:free_resources() {
    ...
    if (gsc->wq) {
        destroy_workqueue(gsc->wq);
        gsc->wq =3D NULL;
    }
}

Because this teardown happens before the reset worker is disabled, a
concurrently running reset worker can reach this point:

drivers/gpu/drm/xe/xe_gsc.c:xe_gsc_load_start() {
    ...
    queue_work(gsc->wq, &gsc->work);
}

If the reset worker calls queue_work() while gsc->wq is freed or NULL, it
will cause a crash.

> +	if (err)
> +		return err;
> +
>  	err =3D xe_uc_init_post_hwconfig(&gt->uc);
>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009121921.8186=
71-5-satyanarayana.k.v.p@intel.com?part=3D3
