Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C4C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1763B10E7A4;
	Mon, 28 Sep 2026 06:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lsUVl7Hs";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E2310E7A4
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 06:43:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5738D601FF;
 Mon, 28 Sep 2026 06:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B291F00893;
 Mon, 28 Sep 2026 06:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790577830;
 bh=W14ucY5bdY+9UVMIhoJSzkWuaSwzwhqRRC5FQz6bkmA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lsUVl7Hsr9B52opCtCr4+bxKKIvMkpWS72j12h68WKHRKxspa8jWtSpLv5f0buCxt
 dX60MZ11ps0moRwW9bk6pkEyxaJGhUr/XMWZrHc9ylAZPvDfzff8pomjS5P0JNUbk1
 bvZ/wC4KFW8j+oXVPh+iAZAEfscjTXskcO/6bvlDm924aCqiKxU/pUyACvZWrYIWFZ
 esOCAaz7w9Q8PxFit3jhzlcg0d97M6JSXTlMHJH/6doFwvkHWMH3/QDr8ENQ/X+WhV
 +OqBvkLeNGaz4SHgY8hdWHbZ1me2DtZZIFD+MTZiB3zmG4nb5Q9SBofeHmbB2euwdb
 D6tuwNrYIkYdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928061830.417395-12-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-12-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:43:49 +0000
Message-Id: <20260928064349.E1B291F00893@smtp.kernel.org>
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
- [Medium] xe: max_entries from firmware response lost during paginated fet=
ch
--

commit 7e32ecac1950627e3285eb91a4b340622535f4c7
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Add function to get maximum pages firmware can store

Add function to get maximum number of pages that firmware can store for
offline tracking. This will be used to report max pages to userspace.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index f7232429080a8..749cf25e9148a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -401,9 +401,13 @@ static void get_offlined_list(struct xe_device *xe)
>  {
>  	struct xe_ras_offline_list_response response =3D {0};
>  	struct xe_ras_offline_list_request request =3D {0};
> +	struct xe_ras_state *state =3D &xe->ras.state;
> =20
>  	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, sizeof=
(request),
>  			  &response, sizeof(response), &response.common, false);
> +
> +	if (response.max_entries)
> +		state->max_pages =3D response.max_entries;

[Severity: Medium]
Is it possible for the max_entries value to be lost here if the offline
list requires multiple chunks to fetch?

Looking at get_offline_pages() in the same file, the response buffer is
cleared at the beginning of every iteration:

static void get_offline_pages(...)
{
	...
	do {
		memset(resp, 0, resp_size);
		...
		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
	...
	} while (common->additional_data);
}

If the firmware only populates max_entries in the first chunk of the
paginated fetch, wouldn't the memset() overwrite it with zeros in
subsequent iterations?

By the time get_offlined_list() checks response.max_entries, it only
contains data from the final chunk. Could this result in max_pages
remaining 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928061830.4173=
95-8-riana.tauro@intel.com?part=3D4
