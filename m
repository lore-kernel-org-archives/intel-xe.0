Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32999C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E415110E747;
	Mon,  7 Sep 2026 10:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmBkr4wq";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE4910E747
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:00:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F346460D83;
 Mon,  7 Sep 2026 10:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBD91F00A3A;
 Mon,  7 Sep 2026 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788775236;
 bh=YNvb+kxyZ7O0h03x1WcY8/ejjs/pWHYbwS6qlZSajo4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AmBkr4wqDJynXq5IM1+nzBAARIGoXXiqh33j08Tus8PcaydSZzfhmid6TPtUQgLMc
 Jj3GijnnhOUn4W5dLa58Fwvaw/jRGfW68O8I0WCT/MWrA6nhVqA0oQS53vXUlAAfMU
 Sr+ewKVjzjRUSOoFRq/4dhTq2VbKb1+OH6dG2CBS0x2Coi8cp4a+Jnfvl3tawBbFa0
 i3moIWHEG3P76iAKfC3b5pQCHdSd/HN2/HpCRjwYxxgcgCT1sfu/l5pxteyv7T1RiV
 wSIwtLv7BwsipSnSoVRiQXkrM0VyB1l27Z6jBxkXzcEJgRlLFlxfNfS1s6BPlADowS
 O+BxEFiJ8a7Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907094706.1407436-10-riana.tauro@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-10-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:00:36 +0000
Message-Id: <20260907100036.7FBD91F00A3A@smtp.kernel.org>
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
- [Medium] Spurious failure if firmware page offline queue or list grows du=
ring readout.
--

commit ecb51c4744892bd663ca44008b7aac2eca7280e9
Author: Riana Tauro <riana.tauro@intel.com>
Subject: drm/xe/xe_ras: Add support to query page offline queue and list

This commit adds support to query the page offline list and queue from the
firmware during module load. The command retrieves pages that are already
offlined or pending to be offlined by the firmware.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> +static void get_queued_pages(struct xe_device *xe)
> +{
[ ... ]
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
[ ... ]
> +		count +=3D response.pages_returned;
> +		if (!response.pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages =3D response.total_pages;
> +
> +		if (count > total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,

[Severity: Medium]
If a memory RAS error occurs during the window when xe_ras_init() is queryi=
ng
the offline queue, causing the firmware to append to the queue while the
driver is iterating, can this cause a spurious failure?

Since total_pages is latched on the first response and strictly enforced
against the growing count over multiple responses, it looks like an actively
growing queue could cause count to exceed total_pages, aborting the
initialization of offlined pages and leaving the RAS offline state incomple=
te.

> +				   "Pages returned from queue exceed total pages %u, returned %u\n",
> +				   total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe)
> +{
[ ... ]
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		request.index =3D count;
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
[ ... ]
> +		count +=3D response.pages_returned;
> +		if (!response.pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages =3D response.total_pages;
> +
> +		if (count > total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,

[Severity: Medium]
Does the same vulnerability apply here in get_offlined_list() if new pages =
are
offlined concurrently by the firmware?

If the list grows while reading, enforcing the originally latched total_pag=
es
against the total returned count could similarly result in a spurious error
and abort the list iteration.

> +				   "Pages returned from list exceed total pages %u, returned %u\n",
> +				   total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907094706.1407=
436-8-riana.tauro@intel.com?part=3D2
