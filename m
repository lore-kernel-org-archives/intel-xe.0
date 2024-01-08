Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FAFC3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 10:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26CD10E22E;
	Mon,  8 Jan 2024 10:45:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD1810E203;
 Mon,  8 Jan 2024 10:45:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 104ECB80D23;
 Mon,  8 Jan 2024 10:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AFDC433C8;
 Mon,  8 Jan 2024 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704710755;
 bh=/8w4vROXmW0/3v/ZTMz/G2a/IUmTbhMJq4VGl/To7Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lUcKlsH/SdHBtzI4vy0A2Qqm35XwzGuihd4efUl5q23f+fmPWhTqPUxAsFT9sFh2L
 qY9e6sgVaivOOC6OP5miQTTk7CjX3y+/Rc3CM7M5Ot5kaY468yaK5bl2qIYA1KkRlv
 U2ZrRCBzKjNg3uCHRhg9XfP54Q7NnBMgEWEHu1TOsTevWQ/uRZdmF57jUr0dMxtRid
 jdsWFOHAetoZXEM035kJhLQdv7L1UzaUTMEAGsJ3MiRYkrirWLpY7PXuCQQxEPpxHi
 lYau/fwzX/vG+VkN+wImDsU3lJ3JBQBF610qbJ4QCThDc+3I9gOIbHoTMNMrO3/vZA
 P8MOEjhgdiqJQ==
Date: Mon, 8 Jan 2024 11:45:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v4 3/6] drm/tests: managed: Remove the waitqueue usage
Message-ID: <bu62aukq2iw36k52tvrimatph3hn6ec3a4c5gaf4orkak6igoz@do6v344l7g43>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
 <20240105101324.26811-4-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iu3intlqu5kvvetm"
Content-Disposition: inline
In-Reply-To: <20240105101324.26811-4-michal.winiarski@intel.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


--iu3intlqu5kvvetm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 11:13:21AM +0100, Micha=C5=82 Winiarski wrote:
> DRM managed release (drm_managed_release) is called as part of devres
> release (devres_release_all), which is not async.
> The release action should have already been executed once
> drm_kunit_helper_free_device exits, meaning that there's no need to use
> a waitqueue - we can just inspect the "action_done" state directly.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>

I disagree, nothing guarantees in the API that it will be executed right
away. Since it might be asynchronous (if something else holds a
reference for example), we need the workqueue.

Fortunately, it turns out that it's actually done right away, which also
means we'll never hit the timeout and thus never stall the test run.

Maxime

--iu3intlqu5kvvetm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZvSXwAKCRDj7w1vZxhR
xUy9AP9z4a9PtD1LHH9YlF2EJRnFrx0g0iY1U0rxHWhnZXFVPgD4iX4Hm1zoLjXz
0BccGN772xsxXdWGatm/UjMXqVaxBQ==
=mn+1
-----END PGP SIGNATURE-----

--iu3intlqu5kvvetm--
