Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4831ACA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 16:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B3710EA56;
	Fri,  9 Oct 2026 16:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J8UsROkA";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA63D10EA56
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 16:47:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BC1716053E;
 Fri,  9 Oct 2026 16:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB9D1F000FF;
 Fri,  9 Oct 2026 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791564450;
 bh=8DSZ6qTTCIT2vtVYVbB4VDAfPbR1H1VJzXzIi+TOAKQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=J8UsROkA+ocCWE2ato6a0PvLwjIGTXS7RkU4fImJ9yxQUFQ1l1Zb8bc5CuedDmRUG
 fTScluhohqAHsZONc/Tx+7lzv95+XTNGyvQlBe3vAIP0x8/PJNONDuZ+v6jIw0umoR
 93oqlMPKronoB7mK02S2ersphaG+hF8vuCNqY2oAeCC28Ip2o8kOgsWBX7yhZjiW5+
 49ytzV7wViv/3mWSJflIOCaVX2ITeK7Qw+/6LvvtDDlFIBFcnjqfmxOUt1KFE7oxqv
 9nOzNYgN6zhf1fn6XJCV/i0VAEN0Gk3KpdbR5p+1K7AR4g7PTHaBqRivpGMEqWDzTl
 7lFAJpmzjgpFw==
Message-ID: <sashiko-outbox-165849@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 16:47:29 +0000
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
- [High] drm/xe/i2c: UAF on client devices when i2c_designware is unbound
--

commit acaaddc70630047a3af20f747eb4eed375a715a1
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

drm/xe/i2c: Fix use-after-free on driver unload

This patch fixes a use-after-free during driver unload by replacing the man=
aged
software node with a static struct software_node. It also modifies
xe_i2c_notifier() to match against the parent device instead of using i2c->=
dev,
removing a dependency in the two-step platform device creation sequence.

> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index f4f3819882897..f0566129b7e70 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
[ ... ]
> @@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, =
unsigned long action, void
>  	struct device *dev =3D data;
> =20
>  	if (action =3D=3D BUS_NOTIFY_ADD_DEVICE &&
> -	    adapter && dev->parent =3D=3D &i2c->pdev->dev) {
> +	    adapter && dev->parent && dev->parent->parent =3D=3D i2c->drm_dev) {
>  		i2c->adapter =3D adapter;
>  		schedule_work(&i2c->work);
>  		return NOTIFY_OK;
>  	}
> =20
>  	return NOTIFY_DONE;
>  }

[Severity: High]
Does this missing BUS_NOTIFY_DEL_DEVICE handler leave dangling pointers if =
the
i2c-designware driver is manually unbound?=20

If the adapter is unbound (e.g. via sysfs), the I2C core will unregister and
free all connected I2C client devices. Because this notifier doesn't handle
device removal, i2c->adapter and i2c->client[i] are never cleared and become
dangling pointers.

Later during module teardown, the xe_i2c_remove() devm action executes:

drivers/gpu/drm/xe/xe_i2c.c:xe_i2c_remove() {
	...
	for (i =3D 0; i < XE_I2C_MAX_CLIENTS; i++) {
		i2c_unregister_device(i2c->client[i]);
		i2c->client[i] =3D NULL;
	}
	...
}

Will this explicitly call i2c_unregister_device() on already freed client
pointers, causing a use-after-free crash? Additionally, if the unbind occurs
before xe_i2c_client_work() executes, could the workqueue dereference the f=
reed
i2c->adapter pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009164241.9237=
56-2-balasubramani.vivekanandan@intel.com?part=3D1
