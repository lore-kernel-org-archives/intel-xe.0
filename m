Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1D9C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF4410EEAA;
	Wed, 19 Aug 2026 19:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Eivw9VJo";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5324010EEA9
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:27:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1FAF543B8E;
 Wed, 19 Aug 2026 19:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D853D1F000E9;
 Wed, 19 Aug 2026 19:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167642;
 bh=C9oh9HqdLraCE3zzXWnZbPfa4NcKkDlrej5NmG/25a4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Eivw9VJo87TYKJc58EfcYEK5AzbqeYHHKq20/Vi0IOai0L7mmjwQB4HJjqjBKc0/K
 PaUr3iJANB+EXkU5fJG1RMHeGXcdXJp9AD8SzkDXDm3gxP4F66QhnqMqVxmHY1fLkk
 MGNYVK/Np4aUJMS0NUNoDLlcn6kRJtY5A4MUUCKF2pw6/YnILlrOdElGVvqq1o9R+e
 mZliLtX9pheZknP01g0L4Tt6axjDLKLNnyLtIHbzR6EKoOeAHMf6z8ixrFbNiahY1B
 MSSK4Y1YSD6/+PSWJj3FPRdziqwKL6HUla0R2NTsUdyFT8wciZOaXAjO+YgcdCvAvW
 gM8zS8mgAN5NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/12] drm/xe/pci: Report unknown GMDID versions using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-11-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-11-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:27:21 +0000
Message-Id: <20260819192721.D853D1F000E9@smtp.kernel.org>
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
- [Medium] The `xe_log_err()` macro is called with the `GT` component tag, =
which incorrectly evaluates to the `XE_SIGID_GT_TDR` (Engine hang / timeout=
 recovery) signature identifier. A probe-time failure due to an unknown har=
dware IP version will be wrongly logged as a GPU engine hang, breaking tele=
metry categorization.
--

--- Patch [10]: [PATCH 10/12] drm/xe/pci: Report unknown GMDID versions usi=
ng structured xe_log API ---
commit 77b6855242b927765ae4947e2d18fd4b7082f834
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/pci: Report unknown GMDID versions using structured xe_log API

This commit replaces drm_err() with xe_log_err() using the GT component tag
when hardware reports unrecognized graphics or media IP versions during GMD=
ID
handling.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1e04e8ef2611f..392c9e12e6535 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -718,8 +718,9 @@ static int handle_gmdid(struct xe_device *xe,
> =20
>  	*graphics_ip =3D find_graphics_ip(ver);
>  	if (!*graphics_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n=
",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, GT, -EINVAL,
> +			   "Hardware reports unknown graphics version %u.%02u\n",

[Severity: Medium]
Does the GT component tag in xe_log_err() evaluate to the XE_SIGID_GT_TDR
(Engine hang / timeout recovery) signature identifier?

If so, an early initialization failure in handle_gmdid() due to an unknown
graphics IP version will be wrongly logged as a GPU engine hang, breaking
telemetry categorization.

> +			   ver / 100, ver % 100);
>  	}
> =20
>  	ret =3D read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> @@ -732,8 +733,9 @@ static int handle_gmdid(struct xe_device *xe,
> =20
>  	*media_ip =3D find_media_ip(ver);
>  	if (!*media_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, GT, -EINVAL,
> +			   "Hardware reports unknown media version %u.%02u\n",

[Severity: Medium]
Like the graphics IP check above, will using the GT tag here also wrongly l=
og
an unknown media IP version as an engine hang?

> +			   ver / 100, ver % 100);
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D10
