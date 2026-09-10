Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E40FC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4229C10F4C4;
	Thu, 10 Sep 2026 14:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SZfR6Lhj";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337A110F4D4
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 14:39:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EB3AF40465;
 Thu, 10 Sep 2026 14:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49391F000FF;
 Thu, 10 Sep 2026 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789051152;
 bh=OsmbRj1PI6F4MsB+r/JIwgFuU55o77Kx43KrghU1mvU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SZfR6LhjPuggw7ah4EMQhC8mDIT0DlKlFNCDIBRNvHs/YfyJDv9zn7BxyLQTbQdSs
 /VEZOlGiaFP0UHVQvou84NTycHpnX2bpQsMRENlctB6q72859ynLEtKT694SQpdzfQ
 b+1/J5q3zyp+A2W/KPHYC4Wkk2TCMEp+m6Uc3CTmy/b8vuzffFdvODMPqoc4RKSTBo
 D8yWlFuknMMRa7lJB+DM3/vaLy00D1CxxVWuJJgFm6d9H1PZ07YYTBuOcMGX1FuppT
 itPE8pvWRAGKr1I2fQzIO5xr0nkuijiBeCVInM79nTg6bBMqKFwFWnTWPTjapWtb7u
 o+HPhKr7TUiAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/ras: Fix sysctrl and drm-ras discrepancy
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910142550.2373557-1-raag.jadav@intel.com>
References: <20260910142550.2373557-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:39:12 +0000
Message-Id: <20260910143912.A49391F000FF@smtp.kernel.org>
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

Pre-existing issues:
- [High] Out-of-bounds array read leads to undefined behavior and potential=
 compiler elision of the bounds check, causing a kernel panic.
--

commit 94038693bb6905d1ad4adc4ff5a47f0c15f8cf43
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Fix sysctrl and drm-ras discrepancy

This commit adds a validity check to prevent redundant error-event logging
when an error is valid for sysctrl but not exposed as a valid uapi through
drm-ras.

> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_=
ras.c
> index 7f3695707611c..5e6d4926d08e9 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
[ ... ]
> @@ -239,6 +250,9 @@ void xe_drm_ras_event(struct xe_device *xe, u32 compo=
nent, u32 severity, u32 val
>  	if (!xe->info.has_drm_ras)
>  		return;
> =20
> +	if (!drm_ras_counter_is_valid(severity, component))
> +		return;
> +

[Severity: High]
This is a pre-existing issue, but does evaluating the array access before
this bounds check introduce a risk of compiler elision?

When hardware reports an informational error, the severity can be mapped to
DRM_XE_RAS_ERR_SEV_MAX. If xe_drm_ras_event() is called with
severity =3D=3D DRM_XE_RAS_ERR_SEV_MAX, an out-of-bounds read occurs during
variable initialization at the top of the function:

void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, ..=
.)
{
        struct xe_drm_ras *ras =3D &xe->ras;
        struct xe_drm_ras_counter *info =3D ras->info[severity];

Because out-of-bounds reads are undefined behavior, modern compilers can use
Value Range Propagation to assume severity is always within bounds. Could
this cause the compiler to optimize away the newly added
drm_ras_counter_is_valid() check entirely?

If the check is elided, execution would proceed with info holding a garbage
pointer, potentially leading to a wild pointer dereference when
info[component].name is accessed later.

Should the initialization of info be deferred until after the bounds check?

>  	node =3D &ras->node[severity];
> =20
>  	if (!info || !info[component].name)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910142550.2373=
557-1-raag.jadav@intel.com?part=3D1
