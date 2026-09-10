Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EBEC79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD41110E8BE;
	Thu, 10 Sep 2026 21:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="anOU5MI3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF6110E8BE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:41:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A8D1601F0;
 Thu, 10 Sep 2026 21:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA2A1F000FF;
 Thu, 10 Sep 2026 21:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789076490;
 bh=sLkg3FfsjYEKzfwsa7czxuItHplA+5Oz04/MchALGOw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=anOU5MI3I28g+pNuNVu+Ufj02eO8Q0MMKfFtk8JT+bSJV70YtCCo81LbhVh6LF4Ba
 g6Zh4d3bkA1i06bLAWURvVwcT+Wa4Sug7z23GBcNqkt4QVeNm1ZeR9U6F8oh0gMwmD
 q9qEwUkQe0Ju/DJ95l0Gu7wOoBqN5ZLLdWg7jA4Pb7UOfBofbI/+LbPL83ecCDjyO5
 cFnsjJuQwrM43Y3IcqiikVEunJK17RZHSW7ED7bMAjhdx0No2JAqERMW6sJLy5md4S
 n34iLuXAMZD4CXjsmfI8uzKgycSAg7TZJ/LX3OxDHhV2c85A2kuBKF5TFf+qC3XwOM
 q+g3f5rHyY5YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe: Poll GT for C6 before D3
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910212823.2358362-2-vinay.belgaumkar@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
 <20260910212823.2358362-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:41:30 +0000
Message-Id: <20260910214130.BAA2A1F000FF@smtp.kernel.org>
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
- [High] System suspend cancellation fails to abort the suspend process, ov=
erwrites the error code, and incorrectly uses a runtime PM resume function =
for recovery, leaving the device in an inconsistent state.
--

commit f28ea72e47f788fbd5be4572ca0cce1ab88bfb3f
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Poll GT for C6 before D3

This commit adds a check to ensure GTs are in C6 before transitioning
to D3 during suspend. If the GTs are not in C6, it attempts to resume
the device and abort the suspend.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 278cfd390364c..04f0884f21c1b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1342,6 +1342,15 @@ static int xe_pci_suspend(struct device *dev)
>  	 */
>  	d3cold_toggle(pdev, D3COLD_ENABLE);
> =20
> +	err =3D xe_pm_check_runtime_idle(xe);
> +	if (err) {
> +		err =3D xe_pm_runtime_resume(xe);
> +		if (err) {
> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> +			return err;
> +		}
> +	}

[Severity: High]
If xe_pm_check_runtime_idle() returns an error to abort the suspend, this
block assigns the result of xe_pm_runtime_resume() to the same 'err'
variable.=20

If the resume succeeds and returns 0, the function will continue executing
and return 0. Doesn't this overwrite the abort error code and allow the
system suspend to proceed instead of successfully cancelling it?

Additionally, xe_pci_suspend() is a system PM suspend path. Calling
xe_pm_runtime_resume() here invokes runtime PM semantics which skip certain
initializations based on the xe->d3cold.allowed flag.=20

Since system PM paths require full hardware reinitialization unconditionall=
y,
does this unwinding path need to use xe_pm_resume() or an equivalent system
PM recovery function to ensure the device is left in a consistent state?

> +
>  	pci_save_state(pdev);
>  	pci_disable_device(pdev);
>  	pci_set_power_state(pdev, PCI_D3cold);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910212823.2358=
362-1-vinay.belgaumkar@intel.com?part=3D2
