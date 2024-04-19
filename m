Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C03C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 09:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6269010E3C9;
	Fri, 19 Apr 2024 09:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EEqXyXka";
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E88010E2DC;
 Fri, 19 Apr 2024 09:11:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C8D78CE14A0;
 Fri, 19 Apr 2024 09:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2F1C116B1;
 Fri, 19 Apr 2024 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713517874;
 bh=VKtJdk5KIVygp2MmtQR3HyL+P1TFz1OOtq7Q9lsHz98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEqXyXkaLgAMH7nxpoP3IcRTqqpOaj6FeeEo1YzSqhFjaPGuzO4qu/dQETdgSB07k
 2pdYIpnTRtB5xKsqPQdxGxTiKfhVIpDICOrkj5LnEXYoYdja1MgG7vtRcnqcG0+sCa
 YM0ssZDp4CS+mYFAR+LCdc0q0Q+t08VxWzzVQC8Cr2LnW/izKoYZopb8glWzBIUWt2
 dXUahhIV5lZwhm6auvu4x1wBqIfyVCTmYy7zfMfK4MBcLyKdEtnnzeNdfUTjh8X/Cl
 D1tngSvvxwMUqrsQVIS/Kn8jZ8ejaxORSsmXbT4uZO+UAbJVCT3tV3X3xqqSXhw+/4
 aOIbg7Gao51Cw==
Date: Fri, 19 Apr 2024 11:11:11 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/4] drm: add devm release action
Message-ID: <20240419-stimulating-passionate-mule-bbd4b2@houat>
References: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
 <20240419085826.263743-2-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4asax4oqr7je7cwt"
Content-Disposition: inline
In-Reply-To: <20240419085826.263743-2-aravind.iddamsetty@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


--4asax4oqr7je7cwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 02:28:23PM +0530, Aravind Iddamsetty wrote:
> In scenarios where drm_dev_put is directly called by driver we want to
> release devm_drm_dev_init_release action associated with struct
> drm_device.
>=20
> v2: Directly expose the original function, instead of introducing a
> helper (Rodrigo)
>=20
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>  include/drm/drm_drv.h     | 2 ++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..ba60cbb0725f 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>  					devm_drm_dev_init_release, dev);
>  }
> =20
> +void devm_drm_dev_release_action(struct drm_device *dev)
> +{
> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
> +}
> +EXPORT_SYMBOL(devm_drm_dev_release_action);

Again, this needs to be documented.

Maxime

--4asax4oqr7je7cwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiI1KQAKCRAnX84Zoj2+
dkSXAXwMIBYJpfoIK1fg3nP8nhTfOSHOlGbPaSlYcDU2k4JWjAvmGZUYs9W0IKK/
JOESrvMBgMYXYXANbJvojCklt9Ei+qpWCbpwVsPZ10XDkIkhvTw8avrPExGyP7Kr
Vg+UCapMJg==
=zKmT
-----END PGP SIGNATURE-----

--4asax4oqr7je7cwt--
