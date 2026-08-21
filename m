Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23BDC5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A593310E2BF;
	Fri, 21 Aug 2026 11:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q4jBFvYJ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428510E27E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:39:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 02D6342B1B;
 Fri, 21 Aug 2026 11:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8D61F000E9;
 Fri, 21 Aug 2026 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787312343;
 bh=PCutjbFHPr3JP0D+E/36F37stZS93SoDHkr/A42zNzU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Q4jBFvYJ96nl0lLMUFG77w9B4/RHM2CCOOUh+UI/6K4lCv3REFFaDjCtjpKZqaiyT
 19aUtFe8jjFDpc4P54TrMzU2r4e1dsSsPJpz92fQhB9I8r7TmXjJQtX2w4+5ZJaPmb
 xjEFbTogmsq2E6+Wq/pd3t6SjwdcvEPaiqWYFevXXKFAycbMJ3tLYbK9tIktXzMocr
 SVGhCs9HqtmRR0Q+SCEqtBbvLWBEQto6LxhZYViSY/TVaGkim3zZoOcRtlEf504/Iu
 1HXoAIo5d5BOIM1szrxlpuJ9nU6KyQwlxaXx2cwmys5BgTaE8ZrAna7H43Tcwytg6S
 VI1L8MzB5KeBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821112436.545405-10-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-10-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:39:03 +0000
Message-Id: <20260821113903.AF8D61F000E9@smtp.kernel.org>
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
- [High] Missing hardware quiescence before PCI reset leads to potential sy=
stem panics.
--

--- Patch [9]: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level =
Reset ---
commit f3c8299b36fc1f6ea55ecfbcd781c310e60e62ab
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci: Introduce PCIe Function Level Reset

This commit introduces PCIe Function Level Reset (FLR) support which=20
re-initializes hardware state without the need for reloading the driver=20
from userspace.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 48466d726eae6..81c4e55fae8f0 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c

> [ ... ]

> @@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	int err;
> +
> +	err =3D xe_pci_reset_skip(xe);
> +	if (err) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		goto wedge;
> +	}
> +
> +	err =3D xe_device_wedged(xe);
> +	if (err)
> +		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
> +
> +wedge:
> +	/* Wedge the device to prevent userspace access but don't send the even=
t yet */
> +	xe_device_wedged_get(xe);
> +	if (err)
> +		return;

[Severity: High]
Since xe_pci_reset_prepare() is a void callback, the PCI core will proceed
with the physical reset unconditionally even if we return early here.=20

If xe_pci_reset_skip(xe) returns true, we jump to the wedge label with err
evaluating to true. This causes the function to return immediately after
xe_device_wedged_get(xe).

Does this skip the hardware quiescence (xe_device_suspend) while the PCI
core still performs the physical reset?=20

If a user triggers a sysfs reset on a device that skips FLR, could this
leave VRAM mapped and DMA active during the reset, resulting in PCIe
Unsupported Requests and fatal AER faults that panic the system?

> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but =
we try to
> +	 * update data structures and cleanup any pending work to avoid side ef=
fects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without ev=
iction.
> +	 */
> +	err =3D xe_device_suspend(xe, true);
> +	if (err) {
> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared =3D true;
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821112436.5454=
05-1-raag.jadav@intel.com?part=3D9
