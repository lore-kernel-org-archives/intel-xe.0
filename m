Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BB1C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48310E20A;
	Tue, 25 Aug 2026 17:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SRBWGDfj";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B8010E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:55:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F56E40BAC;
 Tue, 25 Aug 2026 17:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DD61F000E9;
 Tue, 25 Aug 2026 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680531;
 bh=kR+2Xyktlgls/5tSenBhoeute2KtJ3PjA6vcuUHrItw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SRBWGDfjgfAx9hm4M8mvFtoLfhjv++qjI4Wwd9AsgMBPMl9ihkfW2+bcI8caJQkxW
 qFBN/CyWNQgGZAhwS3KlS2WvJuny8qugNxSmuSD9s+0KAYqMwIsMpZmhk9Tw/K1xy/
 kbSBA9FLFxDRi2O1IJwDTYwo+P+7tV9FN/zvAEq7UGm6ML31LZ+LwC5qWNBvCA35Sy
 2y7x2lpub2/ny/7CLstxUiyjL5u363Qg22Yc89onuhFlhfQksdFVJclOmo7vb8XNcu
 au4CTPgtWhfRLym26t6J3V0OmQOdPzM7YjE6RBYQZfQffwZvppevCi7rZmFQFmHcI2
 EfY2VS11B1Jog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] drm/xe/ras: Report core compute errors using
 SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-22-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-22-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:55:30 +0000
Message-Id: <20260825175530.E5DD61F000E9@smtp.kernel.org>
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
- [Medium] Correctable and Informational core compute errors are incorrectl=
y logged as Recoverable (Uncorrectable).
--

commit 784da44cd9d1ac029dd88040b479607457b9f5e1
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/ras: Report core compute errors using SIGID

This commit updates the handling of core compute errors to utilize the
xe_log_* helpers for error reporting, passing the xe_device context to
handle_core_compute_errors().

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 172653be1b829..3b43d363d5de5 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -340,13 +340,18 @@ static u8 handle_core_compute_errors(struct xe_ras_=
error_array *arr)
>  	uncorr_type =3D FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_hea=
der);
> =20
>  	/* Request a reset if error is global */
> -	if (uncorr_type =3D=3D GLOBAL_UNCORR_ERROR)
> +	if (uncorr_type =3D=3D GLOBAL_UNCORR_ERROR) {
> +		xe_log_comp_recoverable(xe, CORE_COMPUTE, &arr->counter, sizeof(arr->c=
ounter),
> +					"Global uncorrectable error detected\n");
>  		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}
> =20
>  	/*
>  	 * No action needed for other errors.
>  	 * Local errors are recovered using an engine reset by GuC.
>  	 */
> +	xe_log_comp_recoverable(xe, CORE_COMPUTE, &arr->counter, sizeof(arr->co=
unter),
> +				"Other compute errors\n");

[Severity: Medium]
Does this incorrectly classify correctable and informational errors as
recoverable?

In handle_core_compute_errors(), all non-global errors (which can include
correctable and informational hardware errors) fall through to this path. By
using xe_log_comp_recoverable(), the code unconditionally logs these errors
with CPER_SEV_RECOVERABLE severity.

This misclassifies the severity in the CPER records, making non-critical
errors appear as recoverable uncorrectable errors in telemetry.

>  	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D9
