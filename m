Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390F5C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB58610EABC;
	Tue, 18 Aug 2026 10:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SWbb3FPS";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0462C10EABC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:42:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E386E601DE;
 Tue, 18 Aug 2026 10:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7952C1F000E9;
 Tue, 18 Aug 2026 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787049741;
 bh=57v/njT7AkGhYodKQTnYEd5zUKWmVjNnCDsOCrbZVUw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SWbb3FPSXhIAumgq1a3D+FsTIaMqe0Y5xZhnanhP2BQ8vphF9pTtthxJgpRcJb1C+
 +ctKZWB8mKWTdqztf3vQjQpXjxdO9N57v6YhMr4pxZnCeb0ENe9gkGL+cnPCVXZZu1
 65HoR+os1xnv8W+JcAvZDQJ/V4n8fssHuJg4lpwmEBuIthJMYBR9YaALr/csTSVD7I
 OZkqTXMlUvnuZByN3D5T4vXZr/dy6oT8lSuLUgRgzBIA+TpYTiDI9tAis6qVLvox2j
 xxVdyheVjSkt63uVQNNrb+iaThXSgoRVYzV3m/w4ivXfjhD1cLWnZuH3/zCULksRAb
 RQlOSb1ARv/2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/pci_error: Allow debugging PCI errors
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818103050.493252-1-raag.jadav@intel.com>
References: <20260818103050.493252-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:42:21 +0000
Message-Id: <20260818104221.7952C1F000E9@smtp.kernel.org>
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
- [Medium] Unconditional device wedging and disconnection on recoverable no=
n-fatal AER errors when debugging mode is enabled.
--

--- Patch [1]: [PATCH v2] drm/xe/pci_error: Allow debugging PCI errors ---
commit 26ac63dc9350283e2a915daf342c236caf34f680
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci_error: Allow debugging PCI errors

This commit updates the PCI error handling path to disconnect the device
and prevent a bus reset when the XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
debug mode is enabled. This preserves the device state so it is available
to the user for debugging.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index e41af2ac7f23b..98aa26275ad66 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -83,6 +83,12 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(stru=
ct pci_dev *pdev)
>  	xe_info(xe, "PCI error: MMIO enabled\n");
>  	action =3D xe_ras_process_errors(xe);
> =20
> +	/* User wants to debug the error, prevent reset */
> +	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_device_declare_wedged(xe);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}

[Severity: Medium]
Does this code unnecessarily wedge the device on recoverable errors?=20

When XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is enabled, any non-fatal AER=20
that reaches xe_pci_error_mmio_enabled() will unconditionally wedge the=20
device here. This happens even if xe_ras_process_errors(xe) successfully=20
handles the error and returns XE_RAS_RECOVERY_ACTION_RECOVERED in the=20
action variable.

Since the commit message specifically mentions preventing bus resets for=20
debugging, should this disconnect and wedge logic only be triggered if=20
action =3D=3D XE_RAS_RECOVERY_ACTION_RESET?

> +
>  	return ras_action_to_pci_result(pdev, action);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818103050.4932=
52-1-raag.jadav@intel.com?part=3D1
