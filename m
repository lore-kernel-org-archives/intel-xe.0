Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7692C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 07:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFC310E7B4;
	Mon, 28 Sep 2026 07:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jTpL70se";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2A110E7B4
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 07:07:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EF29600E2;
 Mon, 28 Sep 2026 07:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00E91F000FF;
 Mon, 28 Sep 2026 07:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790579234;
 bh=8gj+pevPQfW/8nNIkrVAmquvLhGwbY+8yJYrVnHgcJo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jTpL70senEUcAHXN6TEROgn3r2V/rGmB+zX9nCDe1kwYFuIkOOx2+0oBJGDtAIm17
 h4VUNwuujQnIaVX0Psd0B5RpPEq8xVGByUQfpyTGUw1qZxZgMNCQQxnomGZZxxT1w7
 SF2zFN3A+/Ba2LQBHoZWMigVoc+70dpYjrhKc5B8jJ3i8nUeKZ5uky+/Xpe/nYmhX0
 zwp1hS6Pr4AVqUUmtRErjAG+lnZb8epfhBvW3efl2D8TMPF11zlhP9E1iDZcFbCPOi
 fM2FwDoceWtbjMH7IKATvKL5CPkAmhB5KjLhW04YN0SLePycTHEMKeF3cNyZlZQdKp
 n7SJhZ/Pp0QMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] drm/xe/xe_ras: Track offlined pages by firmware
 to avoid duplicates
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928061830.417395-14-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-14-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 07:07:13 +0000
Message-Id: <20260928070713.C00E91F000FF@smtp.kernel.org>
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
- [High] xe: failed page offline requests are erroneously cached as success=
ful
- [Medium] xe: page offline deduplication fails during initialization due t=
o wrong order
--

commit 9f25f9a9144c678c3a1d0b655504ad65d4f2849b
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates

A memory scrubber can report multiple errors at the same address. Track
pages already successfully offlined by the firmware so that subsequent
reports for the same address are removed from the firmware queue instead
of issuing redundant page offline requests.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 749cf25e9148a..d2bcbecd1ba66 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -249,11 +253,16 @@ static int send_page_offline_cmd(struct xe_device *=
xe, u64 page_address,
>  		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status =
%u\n",
>  			   response.status);
> =20
> +	if (action =3D=3D XE_RAS_PAGE_ACTION_OFFLINE)
> +		xa_store(&state->offlined_pages, page_address >> XE_PTE_SHIFT,
> +			 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
> +
>  	return ret;
>  }

[Severity: High]
If ras_status_to_errno(response.status) returns an error, the code logs the
failure but execution continues. Does this cause the failed page offline
request to be erroneously cached as successful in state->offlined_pages?

If so, future reports of the same error will trigger a REMOVE action instead
of attempting to OFFLINE again, permanently dropping hardware memory errors
that failed to be offlined.

[ ... ]

> @@ -1145,10 +1177,14 @@ void xe_ras_init(struct xe_device *xe)
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
> =20
> +	xa_init(&state->offlined_pages);
> +
>  	get_queued_pages(xe);
>  	get_offlined_list(xe);

[Severity: Medium]
Will page offline deduplication fail for queued pages because of the
initialization order?

During get_queued_pages(), pending errors are processed via
handle_page_offline(), which checks the xarray to detect duplicates:

handle_page_offline()
    if (xa_load(&state->offlined_pages, ...))
        action =3D XE_RAS_PAGE_ACTION_REMOVE;

Since get_offlined_list() has not yet populated the xarray with the existing
offlined pages, won't the xarray be empty at this point?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928061830.4173=
95-8-riana.tauro@intel.com?part=3D6
