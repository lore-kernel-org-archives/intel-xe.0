Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B9C88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBFE10E0FA;
	Mon, 14 Sep 2026 20:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ACInN6YM";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C70410E0FA;
 Mon, 14 Sep 2026 20:53:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 648D360252;
 Mon, 14 Sep 2026 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49AE1F000FF;
 Mon, 14 Sep 2026 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789419221;
 bh=qMR914bQzGHjFtaQBYO8/YHgBDF3Zc3/4c21888AcaY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ACInN6YM+siUbVvNkB92+1wCFd8xltdVo1N8VoNohF6ZGWGaWUXi+Bk1CpPdUWNgd
 JzdDxUhrGEEMpulBCiGI93YI1s+f29h/IFvU9LMImpHRVWsekWlqZlzO+iFWMDS9SI
 Fm1biL3Vk/NLyzEuf6GAKTRGzjA9JiyY9AEfOTrhWV69CM8we8zFXfQOj6oDThWWF2
 /Egs6uAaKUw0ROHe7K6tBIvv+26zd57ikuncGh1758BPkqRR7kUQn84bTywLz8Y0X3
 +4kcBk8Xo3rgIeU/wBPBCzM8MqxqNZMf3AwsNhj+fKK1dC4EYhG/tXo2VmKxuUnGx1
 GfhHxCDPXUP9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/7] drm/xe/pm: introduce PM PME support
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260914204034.309566-3-vinod.govindapillai@intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
 <20260914204034.309566-3-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:53:40 +0000
Message-Id: <20260914205340.E49AE1F000FF@smtp.kernel.org>
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
- [High] Unbalanced GT suspend in error path
--

commit 5ef22270a5fbbcf3b5f920591e425278fe8a87c6
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/xe/pm: introduce PM PME support

Introduce PME support for PME capable devices. Whether device is
PME capable is assessed during PCI probe routine. And the whether
PME is enabled for a specific context is assessed during the PM
runtime suspend call if the device is PME capable.

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f517bf453b54c..ca5665d015e98 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
[ ... ]
> @@ -650,6 +663,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	return 0;
> =20
>  out_resume:
> +	xe_pm_update_pme_enabled(xe, false);
>  	xe_display_pm_runtime_resume(xe);
>  	xe_pxp_pm_resume(xe->pxp);
>  out:

[Severity: High]
This isn't a bug introduced by this patch, but does xe_pm_runtime_suspend()
in drivers/gpu/drm/xe/xe_pm.c leave GTs in a suspended state if a failure
occurs during the suspension loop?

When xe_pm_runtime_suspend() loops over the GTs, if a suspend fails on any
GT after the first one, it jumps to out_resume:

	for_each_gt(gt, xe, id) {
		err =3D xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt=
);
		if (err)
			goto out_resume;
	}

The out_resume error path handles resuming the display and PXP, but does
not unwind the GT suspends that already succeeded before the failure.

Since the suspend function returns an error, the runtime PM core would
consider the device active, leaving it in a partially suspended state.

Could this cause hardware hangs or crashes on subsequent accesses to the
successfully suspended GTs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914204034.3095=
66-1-vinod.govindapillai@intel.com?part=3D2
