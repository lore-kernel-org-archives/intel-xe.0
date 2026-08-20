Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23286C5DF86
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D949F10E3B5;
	Thu, 20 Aug 2026 20:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gF9FcUon";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A826510E246
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:20:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D8FF60A58;
 Thu, 20 Aug 2026 20:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF841F000E9;
 Thu, 20 Aug 2026 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787257246;
 bh=iZYnKcHZ7DQFujfhg/Gy5J8mM3vYeEk7Ri+GyHEU+y4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gF9FcUon7qufZ7mayjBSh8bG0/NgTFla1cAEqUtGsEvsI5NuQJP17n1GL0i6ysDoR
 oDrhbz7F4WNwYLqFzfZ3U/IWJzPKRaVPykNGwHFoyOEhcfHumUhngey0ZllRrlUnaN
 KgK/QQ6ULBQ7Yiz6kr6rmW5pXIiuhriwq6Pdhly3nH4O+Tkhd8Tf6/xhIXfxqGojei
 iDBehIrzt8QV0rduYZkyUhm/wS/uR8nC/xPdBUqQsW1rO/czLWKkeMTHZhUt8Tn69g
 52gzUTy7iLL0wXrwXDvHtIWzBnJucecqTwI7HqdSdglDs7fTczYEsvupm/TTOeE7DY
 0SL6vk7Xfwv2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] drm/xe: Sort xe_config_device fields
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820200719.84681-14-stuart.summers@intel.com>
References: <20260820200719.84681-12-stuart.summers@intel.com>
 <20260820200719.84681-14-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 20:20:46 +0000
Message-Id: <20260820202046.AFF841F000E9@smtp.kernel.org>
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
- [High] Returning pointers to dynamically allocated memory without holding=
 a reference or lock leads to Use-After-Free during concurrent configfs rmd=
ir.
--

--- Patch [2]: [PATCH 02/10] drm/xe: Sort xe_config_device fields ---
commit d57e5535d41e0295d705b408cd4efb54e4709623
Author: Stuart Summers <stuart.summers@intel.com>
Subject: drm/xe: Sort xe_config_device fields

This patch sorts the xe_config_device fields and configfs entries to keep
them clean and easy to manage, ordering them first by type and then by name
for readability.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 0a85043a9dd01..cb6ab1fcb8c18 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c

[ ... ]

> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					enum xe_engine_class class,
> +					const u32 **cs)
> +{
> +	struct xe_config_group_device *dev =3D find_xe_config_group_device(pdev=
);
> +	u32 len;
> +
> +	if (!dev)
> +		return 0;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		*cs =3D dev->config.ctx_restore_post_bb[class].cs;
> +		len =3D dev->config.ctx_restore_post_bb[class].len;
> +	}
> +	config_group_put(&dev->group);
> +
> +	return len;
> +}

[Severity: High]
This is a pre-existing issue, but does this pattern expose the returned
*cs pointer to a use-after-free if the configfs item is concurrently remove=
d?

The internal pointer dev->config.ctx_restore_post_bb[class].cs is extracted
and assigned to *cs, but the lock is released and the config_group reference
is dropped via config_group_put(&dev->group) before returning.

If a user removes the configfs directory (rmdir) concurrently, could the
memory be freed while a caller like setup_configfs_post_ctx_restore_bb()
is still trying to use it?

drivers/gpu/drm/xe/xe_lrc.c:setup_configfs_post_ctx_restore_bb() {
        count =3D xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.de=
v),
                                                    hwe->class, &user_batch=
);
        if (!count)
                return 0;

        /* ... */
        memcpy(cmd, user_batch, count * sizeof(u32));
}

This exact same lifecycle synchronization pattern also appears in
xe_configfs_get_ctx_restore_mid_bb().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820200719.8468=
1-12-stuart.summers@intel.com?part=3D2
