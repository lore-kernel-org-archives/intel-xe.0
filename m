Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84459C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 21:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F8210E609;
	Thu, 20 Aug 2026 21:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AhwMhVS3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC6710F1A6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 21:24:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 93C7660A61;
 Thu, 20 Aug 2026 21:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C671F000E9;
 Thu, 20 Aug 2026 21:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787261081;
 bh=bnn8wLbDUHj8TL4/t6JeO9xOfW1szE2y0AoBXn94+nU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AhwMhVS3QwSVmW5XbnB+tf6mRYi9Eay5IEq8Wou3IxSWqWvnYvCoyM+KjnbxbrUcS
 ctu9VRxOzqYcFNdQGdo3xWHnaemmDB4DZ+rrIdGAIazeyQWKiXVeZi/9w8TEV2S0+R
 YbfrjLIobD+2F+py5CqHD9GdWO3uJF96l4Hme/qxtMf9WX97ZkefiR1zd+snqBUfHD
 IxTCUH848ZdbpG7Sh207gsRDpyrAzTotSPniUPKb8PWvGTBN2i3fUgiN4K9X6YE+LL
 e5z51YtHG0LOXKXdQ/VyltN96UIGAkfjutohCFzcjbaV16fhumS1ep0zBLhp3YFrhg
 3DPA+SOqooO0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] drm/xe: Guard configfs attribute reads in getters
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820210639.107524-13-stuart.summers@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-13-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 21:24:40 +0000
Message-Id: <20260820212441.20C671F000E9@smtp.kernel.org>
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
- [High] The getters for ctx_restore batch buffers return pointers to confi=
gfs-managed memory (`cs`), but drop the configfs reference via `config_grou=
p_put` before returning to the caller. This creates a race condition where =
a concurrent `rmdir` on the configfs directory can free the device configur=
ation memory before the caller finishes using the pointer, leading to a Use=
-After-Free.
--

--- Patch [1]: [PATCH 01/10] drm/xe: Guard configfs attribute reads in gett=
ers ---
commit 8e7623fc58ac40897d93827d5632245e67750e49
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Guard configfs attribute reads in getters

The commit wraps reads of dev->config in configfs getters with a
scoped_guard() to prevent torn reads caused by concurrent stores.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 052cce9621611..0a85043a9dd01 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
[ ... ]
> @@ -1308,10 +1313,12 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci=
_dev *pdev,
>  	if (!dev)
>  		return 0;
> =20
> -	if (cs)
> -		*cs =3D dev->config.ctx_restore_mid_bb[class].cs;
> +	scoped_guard(mutex, &dev->lock) {
> +		if (cs)
> +			*cs =3D dev->config.ctx_restore_mid_bb[class].cs;
> =20
> -	len =3D dev->config.ctx_restore_mid_bb[class].len;
> +		len =3D dev->config.ctx_restore_mid_bb[class].len;
> +	}
>  	config_group_put(&dev->group);
> =20
>  	return len;

[Severity: High]
This is a pre-existing issue, but does dropping the configfs reference here
allow the memory backing the returned pointer to be freed before the caller
finishes using it?

If a concurrent rmdir on the configfs directory drops the group's reference
count to 0, xe_config_device_release() could free the `cs` buffer via kfree=
().
The caller could then execute a memcpy() using the now-freed pointer,
resulting in a use-after-free.

> @@ -1335,8 +1342,10 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci=
_dev *pdev,
>  	if (!dev)
>  		return 0;
> =20
> -	*cs =3D dev->config.ctx_restore_post_bb[class].cs;
> -	len =3D dev->config.ctx_restore_post_bb[class].len;
> +	scoped_guard(mutex, &dev->lock) {
> +		*cs =3D dev->config.ctx_restore_post_bb[class].cs;
> +		len =3D dev->config.ctx_restore_post_bb[class].len;
> +	}
>  	config_group_put(&dev->group);
> =20
>  	return len;

[Severity: High]
This is also a pre-existing issue, but does the same use-after-free risk
apply here in xe_configfs_get_ctx_restore_post_bb()? The memory backing `cs`
could similarly be freed when config_group_put() drops the reference to the
configfs group before returning the pointer to the caller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820210639.1075=
24-12-stuart.summers@intel.com?part=3D1
