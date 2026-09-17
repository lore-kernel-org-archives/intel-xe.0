Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CCCC982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 22:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A585110E4BF;
	Thu, 17 Sep 2026 22:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bp3mLXOW";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D50C10E4BF
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 22:40:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D84D040F89;
 Thu, 17 Sep 2026 22:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B59B1F000FF;
 Thu, 17 Sep 2026 22:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789684816;
 bh=Q7iSyHWxmrLpneoY5cPT/ZxsTfqXtwN6IfPP4qeOCnY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Bp3mLXOWS1qj5I7D3a25xCab11GQId7f/y7B37rb1VGXgbmzx0WJmOL1PPdGdVZQ0
 rMxPC9BtVXC6LvZlVp5i+BcqmZIGylEtG+6IsUUfFxnjakPjzO5vJVzVIqXu2d94NH
 C6hLtl5ZRae4I55ByazakRgRCobi/S0/Lm7tUS8dNEzw4Y/hmqxc4D5dB7KCSlR45x
 75EvjlZLckkSSj+m3gywYUO9zAPFPYq/jhvwWhvrhM1b3NaEiSVeyqMy5n4NkuU0pN
 vUcGOh+GN4rYoHZwC2J4m1QyNypHVeKqe3dhtEnDJc5F76LpBPCyZaksZ97Dd5pgUB
 z7Iib3k/qR5LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe/gsc: Define GSC for NVL-P
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917223042.715286-5-alan.previn.teres.alexis@intel.com>
References: <20260917223042.715286-4-alan.previn.teres.alexis@intel.com>
 <20260917223042.715286-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:40:16 +0000
Message-Id: <20260917224016.9B59B1F000FF@smtp.kernel.org>
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
- [High] xe: GSC firmware loading fails for NOVALAKE_P due to array ordering
--

commit 55a4dc15ed4d02aed4f0f84954a6722b7a2f2ace
Author: Alan Previn <alan.previn.teres.alexis@intel.com>

drm/xe/gsc: Define GSC for NVL-P

This commit defines the GSC firmware compatibility version for the
NOVALAKE_P platform, matching major version 108 and compatibility
version 0.0.

> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a8e6f18cc9b4a..fdffd6707e4d2 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -142,6 +142,7 @@ struct fw_blobs_by_type {
>  /* for the GSC FW we match the compatibility version and not the release=
 one */
>  #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
>  	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
> +	fw_def(NOVALAKE_P,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 0, 0))	\

[Severity: High]
Will inserting NOVALAKE_P here cause the firmware selection loop to fail?

Looking at uc_fw_auto_select() in drivers/gpu/drm/xe/xe_uc_fw.c, the loop
termination condition expects the entries array to be sorted strictly
descending by platform enum:

	for (i =3D 0; i < count && p <=3D entries[i].platform; i++) {
		...
	}

Since XE_NOVALAKE_P (enum value 15) is greater than the first entry
XE_PANTHERLAKE (enum value 12), the condition (15 <=3D 12) evaluates to fal=
se
on the very first iteration when trying to load firmware for NOVALAKE_P.

This aborts the search immediately, leaving uc_fw->path as NULL and failing
to load the GSC firmware.

>  	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
>  	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917223042.7152=
86-4-alan.previn.teres.alexis@intel.com?part=3D1
