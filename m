Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2121EB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 10:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3D610E5F1;
	Wed,  6 Sep 2023 10:15:05 +0000 (UTC)
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Wed, 06 Sep 2023 10:15:02 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59710E5F1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 10:15:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DD08CCE138B;
 Wed,  6 Sep 2023 10:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBBCC433C7;
 Wed,  6 Sep 2023 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693994925;
 bh=qjFhCKV3Vd970Y159+DbOYfgsWh7iAlf15yw9iYQ7oI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VWpQJO1CREjq5MAEnHghAzKfPrMd9D4nCkWVYVw7QBNXc7y8HbxHYGzqTCDqs7dI0
 rmxorV3/6yG1S7ky+Rf8vRU/6qCm0TJt9vl62EmresGRGnHdFt6gcM3KE7k8fIarG5
 DkFO12ldaN1YU9nTbag1VDxyU5ukmACWMitHzrEhUfyV83WbaR3+RpgxjY0vohGrGq
 h9jcCLQf0lEiSJfd7kRnsbBcMWq0/+2bPDC6jrQ4ixbWfV3SYUL5yEPHnNUdpx2N2J
 aL8bMdkF2GUbyXLnnhzGeZiewoPjj/OaoYettCpMiYa2qMeaza9r/0F2h8wPCwEQj9
 9IbbhPsgo3OoA==
Date: Wed, 6 Sep 2023 12:08:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <eljwhc5pcztl3r3hvhosicyvkslt3ywfjjaksp3dik4ueb56wd@gnwsivkhjtob>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-2-thomas.hellstrom@linux.intel.com>
 <efarj6smmvuqlredgy5aelgvm43xovnqo5fywsindq3bhggvul@3rqq27vmatcm>
 <0cb8a51c-a1a8-ba03-03b1-8cdabade0353@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h7r7hthsxeapywjl"
Content-Disposition: inline
In-Reply-To: <0cb8a51c-a1a8-ba03-03b1-8cdabade0353@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 1/3] drm/kunit: Avoid a driver uaf
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


--h7r7hthsxeapywjl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 02:43:00PM +0200, Thomas Hellstr=F6m wrote:
> Hi maxime,
>=20
> On 9/5/23 14:06, Maxime Ripard wrote:
> > On Tue, Sep 05, 2023 at 10:58:30AM +0200, Thomas Hellstr=F6m wrote:
> > > when using __drm_kunit_helper_alloc_drm_device() the driver may be
> > > dereferenced by device-managed resources up until the device is
> > > freed, which is typically later than the kunit-managed resource code
> > > frees it.
> > I'd like to have a bit more context on how a driver can end up in that
> > situation?
>=20
> I interpret the attached traces as follows.
>=20
> INIT:
>=20
> Code allocates a struct device as a kunit-managed resource.
> Code allocates a drm driver as a kunit-managed resource.
> Code allocates a drm device as a device-managed resource.
>=20
> EXIT:
>=20
> Kunit resource cleanup frees the drm driver
> Kunit resource cleanup frees the struct device, which starts a
> device-managed resource cleanup
> device-managed cleanup calls drm_dev_put()
> drm_dev_put() dereferences the (now freed) drm driver -> Boom.
>=20
> It should be sufficient to enable KASAN and run the drm_exec_test kunit t=
est
> to trigger this.

Ack. Can you put this into your commit log?

Thanks!
Maxime

--h7r7hthsxeapywjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPhPqgAKCRDj7w1vZxhR
xaMDAP9TsPB7cTfiqA0Wc0RDokgEJau0mbtqexPVbpIbxpdQMgEAkK1I430zDHsh
+uHpFadaMqto2FZLCM06QARZuBmAuww=
=3VCd
-----END PGP SIGNATURE-----

--h7r7hthsxeapywjl--
