Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ECCC61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 11:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB0D10F367;
	Fri, 28 Aug 2026 11:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lBJdtqVC";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116C810F367
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 11:41:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 65FBA601F5;
 Fri, 28 Aug 2026 11:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCE91F000E9;
 Fri, 28 Aug 2026 11:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787917315;
 bh=w50zZTJY6Lro/L32PlVpw6hNFrwFen33ZgUIFQMmQ5M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lBJdtqVCj3AA7X0CIRQhsvIl155W4RiHQ/DaIjME+9cb2yaBZrbVhhO9a8/0uervd
 TLCSjZp2eEj7LN++Y3iqJ/Wcio0661nxfnIjB26w8KdV0I8sKNuJOpP6xrijUAYmUk
 zxgBby8QxQwc7gHVUvCUYeXvpBJy1dBWgw0zz8NAGjWjA1xoIiaUtqAHcDSEtug9G0
 Mxf/aG9SElRiLGeJM0Mlh4NPiuVOR1sA7JKemG+9Sxx0tU312HiIwYEImvOnUNSghn
 +Yzr3wCOw6pR9qYaxGIRHSSC2nPWfSL0lDiVYkLNI8jVsWLvhowXpgHZpiljZftnEJ
 91MmWTHMadyWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260828113104.319843-5-riana.tauro@intel.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
 <20260828113104.319843-5-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 11:41:54 +0000
Message-Id: <20260828114154.EFCE91F000E9@smtp.kernel.org>
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
- [High] Data Race / Missing Mutual Exclusion in PCODE mailbox access durin=
g PCI error recovery
--

commit 6f04a64effec675eee1b5da08bc2d84a4196d4ed
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_pci_error: Wait for pcode init post SBR

This commit adds a wait for Pcode initialization before accessing the
device post Secondary Bus Reset (SBR) in xe_pci_error_slot_reset().

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index 79ce0c671549a..3e9c77f8483d6 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -109,6 +110,10 @@ static pci_ers_result_t xe_pci_error_slot_reset(stru=
ct pci_dev *pdev)
>  		return PCI_ERS_RESULT_DISCONNECT;
>  	}
> =20
> +	err =3D xe_pcode_probe_early(xe);
> +	if (err)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +

[Severity: High]
Does this code introduce a data race in PCODE mailbox access during PCI err=
or
recovery?

xe_pcode_probe_early() calls xe_pcode_ready() without locking:

drivers/gpu/drm/xe/xe_pcode.c:xe_pcode_probe_early() {
	return xe_pcode_ready(xe, false);
}

The false argument explicitly disables tile->pcode.lock acquisition. Howeve=
r,
at this point in xe_pci_error_slot_reset(), the userspace interfaces like
hwmon sysfs are still registered and accessible.

If a userspace process reads hwmon sysfs limits (e.g., power1_max_interval)
while PCI error recovery is executing, the sysfs read will legitimately
acquire tile->pcode.lock and access PCODE. Meanwhile, this function will
bypass the lock and execute concurrent MMIO accesses to the same PCODE
registers.

Can this lead to hardware state machine corruption and the execution of
malformed commands by the PCODE microcontroller? Hwmon read handlers do not
check the wedged.flag, and sysfs interfaces are not removed until later
when pdev->driver->remove(pdev) is called.

>  	/*
>  	 * Secondary Bus Reset causes all VRAM state to be lost along with
>  	 * hardware state. As an initial step, re-probe the device to

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828113104.3198=
43-4-riana.tauro@intel.com?part=3D1
