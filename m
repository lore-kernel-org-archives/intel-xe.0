Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5399C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5DF10E159;
	Fri,  4 Sep 2026 12:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HTn7M899";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D867F10E13D;
 Fri,  4 Sep 2026 12:46:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EBA96600C8;
 Fri,  4 Sep 2026 12:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEDD1F00A3E;
 Fri,  4 Sep 2026 12:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788525995;
 bh=VsTyuv4OMceezZJ/7Ejj7FU/Qts0Xja/7Wr/sG8fY+c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HTn7M899un3fKBSHHKUuYJX4v9u+y4xlK85Qz9xQbO/KlS5UEJo3iLvBjL3a0JheU
 zP395896EBOqJdXdlEytb0GT5mUMmDn6P9MokKdQ6xfpWNPWqnzsb/18YXjlhp8kl6
 iY5fVQ9ecqlIjFOQCgp0xEDgV5q8EQEMVpOkPCRq8WgT2sOGA7FbKcAX/Xs/knngEo
 JI/ZcAj1ylt6QZIOPnpJn9Ze7JqtrLsUbKIFJBWCTROfvJtPkxRVoZ+llYYdezbetb
 NQVWMy+FcOjCcFnFrWmMCfmolxN2fYqhZ/rVsOtzfmkC5iMzABOFvgU1oiKxJgYotd
 aA4p1e/pEqCNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/8] drm/i915/bios: de/allocate VS/PE-O buffers for
 each port
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260904123148.2165596-5-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
 <20260904123148.2165596-5-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:46:34 +0000
Message-Id: <20260904124635.6CEDD1F00A3E@smtp.kernel.org>
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
- [High] Missing validation for `num_rows` allows allocation of a zero-leng=
th override buffer, leading to ZERO_SIZE_PTR bypass and potential out-of-bo=
unds array access.
--

commit 8e0ea30f286f43a0a8c7581e1d9abc3a9fc3887e
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915/bios: de/allocate VS/PE-O buffers for each port

Every devdata needs VS/PE-O dedicated buffers since each port can
request an override. Add intel_ddi_buf_trans{,_entry} pointers into
intel_bios_encoder_data and allocate/free them for the port if requested.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 9610b794bc147..1a09f7933e491 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
[ ... ]
> @@ -2648,6 +2651,30 @@ static void sanitize_device_type(struct intel_bios=
_encoder_data *devdata,
>  	devdata->child.device_type |=3D DEVICE_TYPE_NOT_HDMI_OUTPUT;
>  }
> =20
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

[Severity: High]
If a system provides a malformed VBT where use_vbt_vswing is true but the
BDB_VSWING_PREEMPH block is missing, could num_rows be 0 here?

When num_rows is 0, kzalloc_objs() returns ZERO_SIZE_PTR. Because
ZERO_SIZE_PTR is not NULL, it bypasses this !entries check.

This results in the creation of a zero-entry table that signals to
downstream code that override data is present. Later, when this table is
fetched by intel_ddi_buf_trans_get() and passed to intel_ddi_level(),
the index is clamped to n_entries - 1 (yielding -1).

Could this lead to an out-of-bounds memory read relative to ZERO_SIZE_PTR
when the caller accesses trans->entries[-1]?

> +		kfree(vspeo);
> +		return;
> +	}
> +
> +	devdata->entries =3D entries;
> +	devdata->vspeo =3D vspeo;
> +	devdata->vspeo->num_entries =3D num_rows;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904123148.2165=
596-1-michal.grzelak@intel.com?part=3D4
