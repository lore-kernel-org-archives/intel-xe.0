Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E436CC5DF67
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF010E4E6;
	Thu, 13 Aug 2026 16:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FCpENnSt";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC1110E4E6;
 Thu, 13 Aug 2026 16:17:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 29966600B0;
 Thu, 13 Aug 2026 16:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10EE1F000E9;
 Thu, 13 Aug 2026 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786637866;
 bh=TNdXDJAzjwmo3hfBsxkSgijRFTF3ayLU7qeNn9TkkGA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FCpENnStheX84D4VFTs7kpE17qUFfl54KBtRc8gB27wiZ13YhgMEdmB0jrqdM3lwV
 b+PKaIYbL+YimoMUTKj9sMx9dYBwykmdxLlAkhurozgiG8vyRKgjBfo4Rqxib1iyZA
 FuEmZY+9L6avgE3n3/Jwqf1XKn1z6fJd5IWGnzdwqI5liX7RKARRxnon1MA/mo4lxc
 dIYacbZ0iaeloiB3f8UGUl8ySzA/6Chs1mIM1ZvW7EbpdcTiB0R9/0Nne1JyITRekt
 z7iMfwPLBhl5D/ghrifAWY5WR/BEGlZq5vG7336HfnO6I68+McDgGaNErMADGNbCym
 6ZbJZ+6rJAxPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/8] drm/i915/bios: de/allocate VS/PE-O buffers for
 each port
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260813160918.918857-5-michal.grzelak@intel.com>
References: <20260813160918.918857-1-michal.grzelak@intel.com>
 <20260813160918.918857-5-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:17:45 +0000
Message-Id: <20260813161746.A10EE1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Memory leak of devdata->entries during driver removal.
- [Low] Missing initialization of `num_entries` in `devdata->vspeo`.
--

--- Patch [4]: [PATCH v11 4/8] drm/i915/bios: de/allocate VS/PE-O buffers f=
or each port ---
commit f4e52d6386e66ed2695365f0776e18c426ae4237
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915/bios: de/allocate VS/PE-O buffers for each port
   =20
This patch allocates dedicated VS/PE-O buffers for each port if an
override is requested and supported. It adds intel_ddi_buf_trans and
entries fields to intel_bios_encoder_data and handles their allocation
and deallocation.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 9610b794bc147..a491b85006117 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
[ ... ]
> @@ -2648,6 +2651,29 @@ static void sanitize_device_type(struct intel_bios=
_encoder_data *devdata,
> +static void allocate_vswing_preemph_override(struct intel_bios_encoder_d=
ata *devdata)
> +{
> +	int num_rows =3D devdata->display->vbt.vspeo.num_rows;
> +	union intel_ddi_buf_trans_entry *entries;
> +	struct intel_ddi_buf_trans *vspeo;
> +
> +	if (!intel_bios_encoder_requests_vspeo(devdata))
> +		return;
> +
> +	vspeo =3D kzalloc_obj(*vspeo);
> +	if (!vspeo)
> +		return;
> +
> +	entries =3D kzalloc_objs(*entries, num_rows);
> +	if (!entries) {
> +		kfree(vspeo);
> +		return;
> +	}
> +
> +	devdata->vspeo =3D vspeo;
> +	devdata->entries =3D entries;

[Severity: Low]
Is this code missing the initialization of devdata->vspeo->num_entries?

The commit message notes for v4->v5 say "- set devdata->vspeo->num_entries =
in
intel_bios.c", but this doesn't seem to be happening here. Leaving this at 0
would make the table appear empty.

> +}
[ ... ]
> @@ -3403,6 +3430,11 @@ void intel_bios_driver_remove(struct intel_display=
 *display)
>  	list_for_each_entry_safe(devdata, nd, &display->vbt.display_devices,
>  				 node) {
>  		list_del(&devdata->node);
> +
> +		if (devdata->vspeo)
> +			kfree(devdata->vspeo->entries);

[Severity: Medium]
Will this leak the entries buffer allocated in
allocate_vswing_preemph_override()?

Because devdata->vspeo->entries is never initialized in this patch, it rema=
ins
NULL, and kfree(NULL) is a no-op. Should this be kfree(devdata->entries)
instead?

> +
> +		kfree(devdata->vspeo);
>  		kfree(devdata->dsc);
>  		kfree(devdata);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813160918.9188=
57-1-michal.grzelak@intel.com?part=3D4
