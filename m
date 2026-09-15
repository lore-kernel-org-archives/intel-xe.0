Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBA0C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691EC10F302;
	Tue, 15 Sep 2026 07:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n2rvA3e+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE4710F302
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:31:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B310040F4B;
 Tue, 15 Sep 2026 07:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A171F000FF;
 Tue, 15 Sep 2026 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789457490;
 bh=QX53KlwXnDJ4pGDGX5qHNwBEJoIKzwHXBd/kz8X2R7I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=n2rvA3e+JqxTrUjp+dd6aZGky8W+rkmnMfSP4Q+HHIY/OM2xDSfTkFi2mPxLHFRY2
 YOop/sp8qqpTZloqHs6r8k0DIn8YQlo1We90D2ZJ2Y6+58ZpploKSifSOTGgmZO/eC
 9l/2uR5VeCSvJBf5E8N78VnYKQJtJ5XuNZuDMIq1es3WrLuwbLHhj0K0Qf0Tht22Lx
 vkngZYPxzTaDdc2KPjgeitcA3tBquVZ3uFVkwAvHeSAQli4qzIKs6Kkk8n1FQBA63a
 nxD2vv15yJS/+pki4rcvUvLsyWztpvOuf2x3zujJxphlndONA92JNNPfb8vKhNRhpq
 DhtMCZEI+2uZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] drm/xe: Poll GT for C6 before D3
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260915071145.2866414-1-vinay.belgaumkar@intel.com>
References: <20260915071145.2866414-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 07:31:29 +0000
Message-Id: <20260915073130.67A171F000FF@smtp.kernel.org>
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
- [High] drm/xe: unconditional GT C6 polling breaks runtime PM on platforms=
 without C6
--

commit d22fb27a8cdb2d7146e1b7f558dcb233890faf71
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Poll GT for C6 before D3

This commit ensures the GT is in the C6 state before transitioning to D3
during runtime suspend. It polls the GT idle status and forces a resume
if the C6 check fails, preventing the device from being stuck in an
intermediate state.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -1394,6 +1394,17 @@ static int xe_pci_runtime_suspend(struct device *d=
ev)
>  	if (err)
>  		return err;
> =20
> +	err =3D xe_pm_check_device_idle(xe);
> +	if (err) {
> +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
> +		ret =3D xe_pm_runtime_resume(xe);
> +		if (ret) {
> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> +			return ret;
> +		}
> +		return err;
> +	}
> +

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
[ ... ]
> @@ -1030,6 +1030,27 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device =
*xe)
>  	mutex_unlock(&xe->d3cold.lock);
>  }
> =20
> +/**
> + * xe_pm_check_device_idle() - Check if all GTs are idle.
> + * @xe: xe device instance
> + *
> + * One of the ways to do this is to check for GT C6 state. This check
> + * will fail if some component is holding a forcewake, for example.
> + *
> + * Return: 0 on success, -EAGAIN on failure
> + */
> +int xe_pm_check_device_idle(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		if (xe_gt_idle_wait_for_c6(gt, 200))
> +			return -EAGAIN;

[Severity: High]
Does this unconditional polling for C6 break runtime PM on platforms
that don't support GT C6 (like PVC)?

If a platform disables or does not support C6, xe_gt_idle_wait_for_c6()
will unconditionally time out after 200ms. Since this function is called=20
by xe_pci_runtime_suspend() during the idle transition, the device will=20
repeatedly abort the suspend sequence.

Because the runtime autosuspend timer usually fires every second, would
this waste 200ms out of every second busy-waiting for a hardware state=20
that can never be reached, leading to a CPU hog and preventing the device
from ever suspending?

> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915071145.2866=
414-1-vinay.belgaumkar@intel.com?part=3D1
