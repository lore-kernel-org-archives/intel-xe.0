Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111AFCA9ED6
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04EF10ECCA;
	Mon, 12 Oct 2026 05:50:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A9C10ECCA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:50:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A2C4640172;
 Mon, 12 Oct 2026 05:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649141F0089B;
 Mon, 12 Oct 2026 05:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791784230;
 bh=jT/VEXzFXYJhjtk4ZUENtIQ82SZ7ZzFSr0PjMP220lI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=X851gS1+FX5+Ti9jS9xEyBveOyVd1l1P+Nvd0/dFKMxFzDh6mlhKIXvmqMERAY3Ya
 Zo0U3uKqfT2suoUMjQQcj3mPFeoGN8YgLeUam/roMFjV0J8gSrGXyxt/4nevn3EsVK
 Q0cl3CYOvSLUx8oCXxoNK0+mrziIanEX7nG8sbdAfv+bxWMNn86zq1UVwLeNclbmay
 Fo8WFIJX4CaWi6+IpMZnhduY5/CRPtlJEDHaCkJ9vaf7XznEyN0pFlL+Tq48ktEYEA
 HKiGyDqmLKOJZu3ODfvemr8c0ysyj8QvmEfw/V2WBROt5xZey++btR4uezmLF1ZYNH
 FnsB3IeZ1yxHw==
Message-ID: <sashiko-outbox-167689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] drm/xe/xe_ras: Track offlined pages by firmware
 to avoid duplicates
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012054056.2272869-14-riana.tauro@intel.com>
References: <20261012054056.2272869-8-riana.tauro@intel.com>
 <20261012054056.2272869-14-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 05:50:29 +0000
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
- [Medium] xe: ignored error return from xe_drm_ras_init()
--

commit 7ebbe76ad5759ef208c6c4acec5e508c52920687
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates

A memory scrubber can report multiple errors at the same address. Track
pages already successfully offlined by the firmware so that subsequent
reports for the same address are removed from the firmware queue instead
of issuing redundant page offline requests.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -1147,15 +1183,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>   * @xe: xe device instance
>   *
>   * Initialize Xe RAS
> + *
> + * Return: 0 on success, negative error code otherwise
>   */
> -void xe_ras_init(struct xe_device *xe)
> +int xe_ras_init(struct xe_device *xe)
>  {
> +	struct xe_ras_state *state =3D &xe->ras.state;
>  	int ret;
> =20
>  	xe_drm_ras_init(xe);

[Severity: Medium]
Should the return value of xe_drm_ras_init() be checked and propagated
here?=20

If xe_drm_ras_init() fails to allocate memory or register the DRM RAS
nodes, it returns an error code like -ENOMEM. Because this patch updates
xe_ras_init() to return an int and propagate errors, missing this check
could allow the driver to continue initialization with partially set up
RAS nodes instead of properly failing the probe.

> =20
>  	if (!xe->info.has_sysctrl)
> -		return;
> +		return 0;
> =20
>  	/*
>  	 * TODO: Replace with xe->info.has_disable_vram_page_offline once the f=
eature flag is

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012054056.2272=
869-8-riana.tauro@intel.com?part=3D6
