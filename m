Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18B4C61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8844989FA7;
	Tue, 25 Aug 2026 06:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NKDz6dry";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8221889FA7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:51:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C8A026011F;
 Tue, 25 Aug 2026 06:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5608C1F000E9;
 Tue, 25 Aug 2026 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787640660;
 bh=3oCOWa4ViqBa70sj0qyZPsYgqSezyg6T+sTM+GCyzIk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NKDz6dryVWqjMJVZENnMWJO3e8pdiX2V3evlKrnqPhG4Pqzy6gEK1ih0ce/HUiEGj
 D0+05acxIzVUStUBl6p1UiuoAH96UOBx9d5IR2yMZ8P2+GrSOl6msDx74ih1rv+bKF
 +AYCsdd8oY3K3Gr/CuuWvStho2WuN00dcAssbZAnuG7RtJD8cLtmOgnFoCClzjc0VZ
 pcaTzyENKGU9KWzb4ah1Wya7u7dP0cLynTHBAxBCR6zP5ndXYyEJ5wIu/WPujYd1Ur
 yTMpZVhndlusnUWo2grqyY+5THGyVP1u2NA7fnR457ZcICCf54CkcdkcowGxX4bccS
 2SJxVtTiwe/wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825063615.3697317-10-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-10-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:50:59 +0000
Message-Id: <20260825065100.5608C1F000E9@smtp.kernel.org>
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
- [High] Comparing cumulatively increasing `count` against a decreasing que=
ue size (`total_pages`) causes spurious failures and prevents fully drainin=
g the offline queue.
- [Medium] Un-clamped increment of pagination counter `count` causes silent=
 skipping of offlined pages if firmware returns a large `pages_returned` va=
lue.
--

--- Patch [3]: [PATCH 3/5] drm/xe/xe_ras: Add support to query page offline=
 queue and list ---
commit e8cc2bc6a8f50a7f0975b37b113c85a2c4043858
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Add support to query page offline queue and list

This commit adds support to query the page offline list and queue from the
firmware during module load. The page offline list retrieves pages already
offlined, and the queue retrieves pages pending to be offlined.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index a6fa755ffebf7..b320ba6d1d735 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -328,6 +328,102 @@ static bool ras_counter_is_valid(struct xe_device *=
xe, struct xe_ras_error_class
>  	return true;
>  }
> =20
> +static void get_queued_pages(struct xe_device *xe)
> +{

[ ... ]

> +		for (i =3D 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i], true);
> +
> +		count +=3D response.pages_returned;

[Severity: Medium]
If the firmware returns a response.pages_returned value greater than
XE_RAS_NUM_PAGES (25), we cap the processing loop at 25 but still add the f=
ull
un-clamped response.pages_returned to count. Does this mean we might silent=
ly
skip processing some pages?

> +		if (!response.pages_returned)
> +			break;
> +
> +		if (count > response.total_pages) {

[Severity: High]
When handle_page_offline() processes a queued page (with send_cmd=3Dtrue), =
it
sends a PAGE_OFFLINE command to the firmware to consume the page. Does this
cause the firmware's remaining queue size (response.total_pages) to decrease
on subsequent loop iterations?=20

If count accumulates monotonically while response.total_pages shrinks, will
this check spuriously fail and abort midway through processing a queue that
requires multiple fetches?

> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned from queue exceed total pages %u, returned %u\n",
> +				   response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe)
> +{

[ ... ]

> +		for (i =3D 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i], false);
> +
> +		count +=3D response.pages_returned;

[Severity: Medium]
Similar to the issue in get_queued_pages(), if response.pages_returned exce=
eds
XE_RAS_NUM_PAGES, count increments by the full un-clamped amount.

Since count is subsequently used to set request.index for the next sequence,
will this cause unprocessed entries to be permanently skipped?

> +		if (!response.pages_returned)
> +			break;
> +
> +		if (count > response.total_pages) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825063615.3697=
317-7-riana.tauro@intel.com?part=3D3
