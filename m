Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0926606A323
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkCk9frU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9647610E292;
	Wed, 25 Nov 2026 09:02:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC9210E292
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 09:02:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F1DE3612B7;
 Wed, 25 Nov 2026 09:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB571F000C6;
 Wed, 25 Nov 2026 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795597355;
 bh=up1liq4eObuou/qjKPtYyy9c/FGdHpm49/DF2YzJs2Y=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=AkCk9frUoNSrKk8dSGfx7U/N5UkhxkQAA55uxiSa9KcdQeyft+WMOPEfhc46obhr5
 MeDaXl3OoE1jrYt8ZsPp5b/iuH3KwbISf2gtO41weAKW64WrMxx6by/KsmO3YKbXAT
 Pr/rKcRdwFYFys8aRTXIgshcXGgK4co1dayViAdykX56Q4SDnv1a5OgqcYvTtSE81O
 r47gfMiCLPbqNt6/YQn+F5fwyWUON49OJe40HbO4ms/nXBedo5fWYqkKZUWjVEf9xZ
 EXsBJ7Z51Ncr3AbnDScQFLXrXQMD1QwZF++8Zw0K6Qxzgxng98+ARPfz48jg+UYuQS
 jR86qm7QJXceQ==
Message-ID: <sashiko-outbox-232969@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] drm/xe/xe_ras: Skip gpu_health sysfs commands when
 wedged
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261125085610.2002508-1-ravi.kishore.koppuravuri@intel.com>
References: <20261125085610.2002508-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 09:02:35 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe: undeclared xe_wedge_mode_is_no_reset() breaks build in
  xe_ras.c
--

commit 593bff9b6fb627a48823e128d475aba74563f22e
Author: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

drm/xe/xe_ras: Skip gpu_health sysfs commands when wedged

This commit skips system controller mailbox commands in gpu_health_show()
and gpu_health_store() when the device is wedged and not in no-reset wedge
mode.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36a..978dbaa82fe2c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1134,6 +1134,9 @@ static ssize_t gpu_health_show(struct device *dev, =
struct device_attribute *attr
>  	size_t rlen;
>  	int ret;
> =20
> +	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
> +		return -ECANCELED;
> +
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_C=
MD_GET_HEALTH,
>  				  &request, sizeof(request), &response, sizeof(response));
>  	guard(xe_pm_runtime)(xe);
> @@ -1177,6 +1180,9 @@ static ssize_t gpu_health_store(struct device *dev,=
 struct device_attribute *att
>  	if (state < 0)
>  		return -EINVAL;
> =20
> +	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
> +		return -ECANCELED;
> +
>  	request.health =3D state;
> =20
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_C=
MD_SET_HEALTH,

[Severity: High]
Does this break the build because xe_wedge_mode_is_no_reset() is not
declared or defined anywhere in the tree?  Is a prerequisite patch adding
xe_wedge_mode_is_no_reset() to drivers/gpu/drm/xe/xe_wedge.h missing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125085610.2002=
508-1-ravi.kishore.koppuravuri@intel.com?part=3D1
