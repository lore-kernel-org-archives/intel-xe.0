Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0301C88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 22:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C3810EBD0;
	Thu, 10 Sep 2026 22:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iZFe+lqh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DFA10EBD0
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 22:11:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B0B7601F0;
 Thu, 10 Sep 2026 22:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9970E1F000FF;
 Thu, 10 Sep 2026 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789078272;
 bh=yQr9/eB1PlRh97cIAPncwvIYSV6Kps8CMdKDH46amLI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=iZFe+lqhD6zcpvjfrJIiw2fqqcDFVMA8MPaoYuUtNxUrvN8HMTAyBjFB6XI3AbC5H
 o6TuG9XYoVpFpbBj7R+qu8FEDjK6NNyPv9ugYAq2s6BdA8UMNmZ5jqW8AXiJm/95/w
 qcsSxC1X2pLMf+v7NN8I1BQUut90HCtlhxZauuA6OxyRrAGEtGTF7zw8GmX/EqREMa
 FV0yjtNnetLnBln/iKJNLEIEadNZ69ut7USDy6kCkhTUgIf0YHG0hmYLkmleAJmP2J
 BL1uGo/dBcgqeEIHgyCw3PrapB9e0ByfsdiwtxSxX01NuR2xNf+mT+YxSsgqL45Z6g
 aHP/Y457VjOzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/xe: Poll GT for C6 before D3
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910215756.2393137-2-vinay.belgaumkar@intel.com>
References: <20260910215756.2393137-1-vinay.belgaumkar@intel.com>
 <20260910215756.2393137-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 22:11:12 +0000
Message-Id: <20260910221112.9970E1F000FF@smtp.kernel.org>
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
- [High] The system PM suspend abort path incorrectly uses runtime PM resum=
e (`xe_pm_runtime_resume`), leaving the device hardware uninitialized, leak=
ing PCI D3Cold configuration, and violating power management context separa=
tion rules.
--

commit 30b6702ddd1d3cfed0a5d047a525e3df63d91571
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Poll GT for C6 before D3

Check if GTs are in C6 before transitioning to D3. PM subsystem can
retry if this is not the case. This ensures some component is not
accessing the GT when D3 state is forced. This check can be added
to the runtime idle check since it helps to check for pending
forcewakes as well before we poll for GT C6.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 278cfd390364c..e663cddcb9946 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1326,7 +1326,7 @@ static int xe_pci_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> -	int err;
> +	int err, ret;
> =20
>  	if (xe_survivability_mode_is_boot_enabled(xe))
>  		return -EBUSY;
> @@ -1342,6 +1342,17 @@ static int xe_pci_suspend(struct device *dev)
>  	 */
>  	d3cold_toggle(pdev, D3COLD_ENABLE);
> =20
> +	ret =3D xe_pm_check_runtime_idle(xe);
> +	if (ret) {
> +		err =3D xe_pm_runtime_resume(xe);

[Severity: High]
Does this error path leave the hardware in a broken, partially-suspended
state?

When xe_pm_check_runtime_idle() fails and aborts the system suspend, it cal=
ls
xe_pm_runtime_resume() to recover. However, xe_pm_runtime_resume() uses the
runtime PM flag xe->d3cold.allowed to conditionally skip critical
reinitialization steps:

drivers/gpu/drm/xe/xe_pm.c:xe_pm_runtime_resume() {
    ...
	if (xe->d3cold.allowed) {
		for_each_gt(gt, xe, id)
			xe_gt_idle_disable_c6(gt);
    ...
		err =3D xe_bo_restore_early(xe);
    ...
}

Because the device was fully suspended via xe_pm_suspend() earlier in
xe_pci_suspend(), bypassing these steps if xe->d3cold.allowed is false leav=
es
memory unrestored and the GT incorrectly suspended. Should system PM recove=
ry
instead use system PM resume functions that do not rely on runtime PM flags?

> +		if (err) {
> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> +			return err;
> +		}
> +
> +		return ret;

[Severity: High]
Could this exit path be leaving the device with incorrect D3Cold
configuration?=20

The suspend function calls d3cold_toggle(pdev, D3COLD_ENABLE) just before t=
he
idle check, but returns here without calling d3cold_toggle(pdev, D3COLD_DIS=
ABLE)
to revert the toggle when the suspend is aborted.

> +	}
> +
>  	pci_save_state(pdev);
>  	pci_disable_device(pdev);
>  	pci_set_power_state(pdev, PCI_D3cold);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910215756.2393=
137-1-vinay.belgaumkar@intel.com?part=3D2
