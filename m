Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717DFC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AED10F6D9;
	Fri, 14 Aug 2026 17:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F0yLWlN7";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955610E193
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:31:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9886C41B66;
 Fri, 14 Aug 2026 17:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE1B1F000E9;
 Fri, 14 Aug 2026 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786728700;
 bh=nR4cClQTW87+HL7aOscAO/Om0/UzqsyPNOy7Z0r4mjE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=F0yLWlN7ThI3XvjfUf4Sml/SX9Wnq7BnVov+gyRYi6L18IesktJfQpe1jFwzml7J9
 rMNvb8CQ82DuIIXy2ipnL6HsLuEEDDSciS/VD30+A+RHRaFRi60+Ir4+idQOnHVDb9
 gjq6+gMuwQk5QA4m93iEzpplTzzQlf7dttB6xtkBkV/ThaFfRSJzdJfZeSbpI0d/ja
 C64sSw4tqzpDmqZ34qmPFbBk5EdG4YZ6a1QHCisH+H85ftIo88mFfpT87KjJlOjzsL
 TIXpIusMsMPPIEnRWUWqyYfjd28kkKWDVPRqIB5AXk+Iui6qsvnoK+/2/LEVZqZm+l
 N8r++9Z1c0MHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 19/33] drm/xe: Report all probe errors using SIGID
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814171801.13347-20-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-20-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 17:31:39 +0000
Message-Id: <20260814173140.5BE1B1F000E9@smtp.kernel.org>
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
- [Medium] Unconditionally logging all probe failures as fatal errors cause=
s normal probe deferrals (-EPROBE_DEFER) to be incorrectly logged as fatal =
hardware errors.
--

--- Patch [19]: [PATCH v5 19/33] drm/xe: Report all probe errors using SIGI=
D ---
commit c6ce1e9226a28ea2318a390f9b11cf4044410b13
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe: Report all probe errors using SIGID

This commit catches and reports all probe errors by splitting xe_pci_probe()
and using xe_log_err_fatal() on the errors returned from __xe_pci_probe().

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4068b6bf9eaa7..1e04e8ef2611f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -1180,6 +1175,26 @@ static int xe_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *ent)
>  	if (xe_display_driver_probe_defer(pdev))
>  		return -EPROBE_DEFER;
> =20
> +	err =3D __xe_pci_probe(pdev, desc);
> +	if (err) {
> +		xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for device '=
%04x'\n",
> +				 pdev->device);

[Severity: Medium]
Could __xe_pci_probe() still return -EPROBE_DEFER from other initialization
steps?

While the explicit xe_display_driver_probe_defer() check was kept outside to
avoid logging -EPROBE_DEFER as a fatal error, __xe_pci_probe() calls into
several other subsystems (such as xe_display_probe() or xe_pm_probe()) which
might also legitimately return -EPROBE_DEFER.

If they do, wouldn't this unconditionally log normal probe deferrals as
fatal errors?

> +		return err;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814171801.1334=
7-1-michal.wajdeczko@intel.com?part=3D19
