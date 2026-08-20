Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3020C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A8F10E220;
	Thu, 20 Aug 2026 20:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DgyQs1Lo";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DE610E030
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:19:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A291E40AA8;
 Thu, 20 Aug 2026 20:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB791F000E9;
 Thu, 20 Aug 2026 20:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787257195;
 bh=1/sF3uIWs73VZrTGYowzRPbDAZ/bpjEhibirdZC83RA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DgyQs1LoC+oYrn2OE7oIqLd+q9MFFMUs3lYiF2c/LOQlqhm7qLvosL5toRlkn4HgQ
 kxZDHkoif3uhwl/uNrPn00v9sMQM8nf2He1IJzF/JPV7cwKS0Z03inaeik91kkMxKa
 kq3iJJMiLH3fgCSHMjQQFMgL9Wfkf9JF8/LEtRHL+DMuDTHYuw59950rs1GewiE603
 JO0BY6R8dklz/MVpsi/9YFU/e5oq8g0IFLkTZghOm3g3P0TB4wRxg6zw6hYGvDzrK7
 xbikRv0PdPU8fNIRDytdDhvghskLCYJMXANLjhHpE1jqlAGIsteMckJ2Q/2rK9rit3
 bUTso8LShZGmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] drm/xe: Guard configfs attribute reads in getters
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820200719.84681-13-stuart.summers@intel.com>
References: <20260820200719.84681-12-stuart.summers@intel.com>
 <20260820200719.84681-13-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 20:19:54 +0000
Message-Id: <20260820201955.5AB791F000E9@smtp.kernel.org>
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
- [High] The getters for ctx_restore batch buffers return a pointer to conf=
igfs-managed dynamically allocated memory that escapes the lock scope, lead=
ing to a Use-After-Free when the caller dereferences it.
--

--- Patch [1]: [PATCH 01/10] drm/xe: Guard configfs attribute reads in gett=
ers ---
commit 21ea5e4421c0b8eb92457fd7f08188c0ab0550d1
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Guard configfs attribute reads in getters

The configfs getters read dev->config members without holding dev->lock,
so a concurrent store can tear the value being returned. The store paths
and a few of the getters already take the lock; make it consistent by
wrapping every read of dev->config in the getters with a scoped_guard(),
covering the surrounding checks that consume those values as well.

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
This isn't a bug introduced by this patch, but does returning this pointer
to the caller introduce a use-after-free risk?

The caller receives a pointer to configfs-managed memory, but the lock is
released and config_group_put() drops the reference before the caller uses
the pointer.

For example, in drivers/gpu/drm/xe/xe_lrc.c:setup_configfs_mid_ctx_restore_=
bb():

    count =3D xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev), h=
we->class, &user_batch);
    if (!count)
        return 0;
    ...
    memcpy(cmd, user_batch, count * sizeof(u32));

If a user concurrently removes the configfs directory, could config_group_p=
ut()
drop the final reference and free the batch buffer memory before the memcpy=
()
executes?

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
This is a pre-existing issue, but similar to the mid_bb function above,
can this cause a use-after-free?

The pointer escapes the lock scope and the caller uses it after the final
reference might have been dropped:

drivers/gpu/drm/xe/xe_lrc.c:setup_configfs_post_ctx_restore_bb():

    count =3D xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev), =
hwe->class, &user_batch);
    if (!count)
        return 0;
    ...
    memcpy(cmd, user_batch, count * sizeof(u32));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820200719.8468=
1-12-stuart.summers@intel.com?part=3D1
