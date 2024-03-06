Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B2EC54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 14:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD4C11322B;
	Wed,  6 Mar 2024 14:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Dqm2iWsy";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C9E113225
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709735188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o4kkP5r2PBYf/fnYnhIrx+d5n31dlIZRsiDpDETazPk=;
 b=Dqm2iWsyWOqUqpN/+FXtBN9zGfvugkoiS0ANIRMu2AU3wwJeREXV2O3U01Hu4+AqitsIBv
 dwWvYFxk5M3sRGaGweBdC7lR5Tu4m8/a46uef6UWnlkM1V0BtdMw4aEIcfDJwyGja3/zYl
 cnnS31L7MbTwjW+zO+kvBfS75iIKd3I=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-T9F8A-34Mm-pfxRfJhnN8Q-1; Wed, 06 Mar 2024 09:26:26 -0500
X-MC-Unique: T9F8A-34Mm-pfxRfJhnN8Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d298d601adso54631301fa.2
 for <intel-xe@lists.freedesktop.org>; Wed, 06 Mar 2024 06:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709735185; x=1710339985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4kkP5r2PBYf/fnYnhIrx+d5n31dlIZRsiDpDETazPk=;
 b=IH0lI2D6DHalp/i+A2iE090+oPn3Shapglv7j5+9Ta4ms+MH90FcEzLAG6N9n0qIsY
 B8AXBSE/u/VB9AVtXtCb6DRTyMO0vLIGNP/LiJT4TcBO0xpcM/U8/Aovq6P6hsKAOo+F
 UHYO01ScHjyByNJgIslfGgkMLjrGcjXfxAW4NQLsWdC0/d6DG5+Og9PUD+C4slXgAQC9
 qq3vevZaUXC8y2uyFENEjOzUoNLb+GFP0VLU9KWia1TDZY/cFSw4yTnSv62JZUsGjuge
 6KWErDgP9x2+SJ7Xzw3eYRpyFBGblj1f7d8NZv8SF5W6Qke2rot4Ey4Be+hNBxZze1UL
 7AKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSL9zSlNcb9wFD3QHW+q8PZDu1j8W9xjz2Er2yqcKcXWtVsq0eWkqAuZV8K3To3xdKJ6GPRuzZFnu9pz8JGxfRQA0tjBId2ouY6wz/G7s=
X-Gm-Message-State: AOJu0Yzb0KmsblHbRcka18RErMB3nMfqGQgfG3bc47tqm4p/EnyAutBv
 YWr+S/0wxEx8OeYWMAZJLmiIcVISWK+1C9OYXesw6EfQPQpz9H2DPKcUvTzJpf9JWN0yzVbXwSQ
 ukGgPLQhhAfZ9eXdqjIHFi6MpCy4By71pdaV1Tj0cInlq+W4rIhhdi6LQ5EeC8NTN
X-Received: by 2002:a2e:87c3:0:b0:2d3:4fc9:bc2 with SMTP id
 v3-20020a2e87c3000000b002d34fc90bc2mr3878875ljj.9.1709735184966; 
 Wed, 06 Mar 2024 06:26:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/r/msA7cwcZyzuDyq2sK0O4GCaCIs8G28sxIPXHJn5aWGxMlOpR/z/B19FoDutA2t1Tr7zw==
X-Received: by 2002:a2e:87c3:0:b0:2d3:4fc9:bc2 with SMTP id
 v3-20020a2e87c3000000b002d34fc90bc2mr3878856ljj.9.1709735184305; 
 Wed, 06 Mar 2024 06:26:24 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 cl5-20020a5d5f05000000b0033ce727e728sm5288152wrb.94.2024.03.06.06.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 06:26:23 -0800 (PST)
Date: Wed, 6 Mar 2024 15:26:23 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <20240306-daft-debonair-petrel-e7aa2e@houat>
References: <20240229-angelic-adorable-teal-fbfabb@houat>
 <455d1cf5-e885-42bf-9bda-4cf6d51b2de0@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vwfckqr3gf2pxlqv"
Content-Disposition: inline
In-Reply-To: <455d1cf5-e885-42bf-9bda-4cf6d51b2de0@intel.com>
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


--vwfckqr3gf2pxlqv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 29, 2024 at 01:54:30PM +0000, Matthew Auld wrote:
> On 29/02/2024 13:37, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's this week drm-misc fixes PR.
> >=20
> > There's two commits for files unders drivers/soc/qcom that don't have a
> > maintainer Acked-by. Bjorn's Acked-by was provided on IRC, and Konrad
> > provided it by mail after the facts so we're covered.
> >=20
> > Maxime
> >=20
> > drm-misc-fixes-2024-02-29:
> > A reset fix for host1x, a resource leak fix and a probe fix for aux-hpd,
> > a use-after-free fix and a boot fix for a pmic_glink qcom driver in
> > drivers/soc, a fix for the simpledrm/tegra transition, a kunit fix for
> > the TTM tests, a font handling fix for fbcon, two allocation fixes and a
> > kunit test to cover them for drm/buddy
> > The following changes since commit 72fa02fdf83306c52bc1eede28359e3fa32a=
151a:
> >=20
> >    nouveau: add an ioctl to report vram usage (2024-02-23 10:20:07 +100=
0)
> >=20
> > are available in the Git repository at:
> >=20
> >    https://anongit.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes=
-2024-02-29
> >=20
> > for you to fetch changes up to c70703320e557ff30847915e6a7631a9abdda16b:
> >=20
> >    drm/tests/drm_buddy: add alloc_range_bias test (2024-02-28 08:03:29 =
+0100)
> >=20
> > ----------------------------------------------------------------
> > A reset fix for host1x, a resource leak fix and a probe fix for aux-hpd,
> > a use-after-free fix and a boot fix for a pmic_glink qcom driver in
> > drivers/soc, a fix for the simpledrm/tegra transition, a kunit fix for
> > the TTM tests, a font handling fix for fbcon, two allocation fixes and a
> > kunit test to cover them for drm/buddy
> >=20
> > ----------------------------------------------------------------
> > Christian K=F6nig (1):
> >        drm/ttm/tests: depend on UML || COMPILE_TEST
> >=20
> > Jiri Slaby (SUSE) (1):
> >        fbcon: always restore the old font data in fbcon_do_set_font()
> >=20
> > Johan Hovold (3):
> >        drm/bridge: aux-hpd: fix OF node leaks
> >        drm/bridge: aux-hpd: separate allocation and registration
> >        soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
> >=20
> > Matthew Auld (3):
> >        drm/buddy: fix range bias
> >        drm/buddy: check range allocation matches alignment
> >        drm/tests/drm_buddy: add alloc_range_bias test
>=20
> Note that there is a build fix needed for this one:
> https://patchwork.freedesktop.org/patch/580568/?series=3D130552&rev=3D1

It looks like that patch still hasn't been applied. What's going on?

Maxime

--vwfckqr3gf2pxlqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeh9DwAKCRDj7w1vZxhR
xfmkAQDkqYMseYdLfpLuIDxvKiyyMTatoeSLxErPyO7hUx/faQEA+nH2QJVOttri
UuHaoohMDorjUZVxPY8vbbOE5Ta4Bws=
=UEgE
-----END PGP SIGNATURE-----

--vwfckqr3gf2pxlqv--

