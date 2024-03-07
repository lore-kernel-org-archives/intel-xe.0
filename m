Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F99C48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 08:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A25112806;
	Thu,  7 Mar 2024 08:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HCWrfhI3";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF2A10F289
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709801092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=fLP6ceN1F2SyA5GtcZy36wAftn4c2iaCrgw/MFXJWTs=;
 b=HCWrfhI3Qvhy9Ilx1AoP3GvhLoA7Tfko9gqbNehmNu8FVUUf16ex2Vtd1dHaOnmitklaYy
 0hiLmouE8Yz+uN40X4zt25/l+xDxbg2O8eT0pfwmiSGSYuGX5/s5slKgAf2IrPFm0Rs7CU
 S3n8gM/Knl+0w0biUJHUSWHK4pDegaI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-7vuoKzVRNL6EUibFuxjTPQ-1; Thu, 07 Mar 2024 03:44:50 -0500
X-MC-Unique: 7vuoKzVRNL6EUibFuxjTPQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-51325ba078dso558588e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 07 Mar 2024 00:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709801089; x=1710405889;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLP6ceN1F2SyA5GtcZy36wAftn4c2iaCrgw/MFXJWTs=;
 b=uHwUnE6lEw1H5WNP/TRXKPKxaJZ2A0W7dzAx2R3R1AvQsCjzOvMKPOSdgzG5FDdM37
 tn7VSFBtxi0ybnTJlnfKOu5y0/l803gFGjNgomoSt2Hmr24+AibTkYzihtHZUgdK3rsh
 e9CmvKO6VhCF5jVonFMzP6UKxCHiKUm0FA75npXbxtxVE3B0Y1wsk698eJS2p9f5BnbR
 xH5aCEUbCAMFo+p2V97/GyYm8VcrdH5IO0jaGz5Gr+Cp/n9+6rL/dfdoT3HczqYZTGL1
 kIGDjTW7pqnPuSjq6fVlnCZfhYEcBPp3V5gmqGEsEQlg0IlZO0hBQzj/1ZUZqTEw2AKY
 B5EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbhyPLxhMkY7D5byHnVp6sQvjbk9JwCmZJ/P8LQxk+zv2jBXT6QTzEVxTjAVMuX/swmUcKim6RXiX3CF7VaJwVZH7uPx80zIit6W45rUU=
X-Gm-Message-State: AOJu0YxD4vM2JlDPMXmZSP+J0s6WbpJmaOwyk2tAzOgNqrA7MZlTYLBc
 S2klvng4OpUJSChmd/T87FB0BxJfClM0UfvFw9h1/VhtRovK+uBtIcZPDBRVnfyIkEdHtUspATh
 MH1J3RtdKoOYS4fl7N3vspMovSaZKu2rh9f1iuewCbSWRR32yaF+MPiwZxzNL/LSy
X-Received: by 2002:a05:6512:1094:b0:513:30fb:d64 with SMTP id
 j20-20020a056512109400b0051330fb0d64mr1180228lfg.44.1709801089251; 
 Thu, 07 Mar 2024 00:44:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpv4voRj54WBHwxzKpSWs2OSTl5esk+TWvuSwsvPvxTS4x0KVGxvdbWMY1r/dmx87pzb2Pbw==
X-Received: by 2002:a05:6512:1094:b0:513:30fb:d64 with SMTP id
 j20-20020a056512109400b0051330fb0d64mr1180200lfg.44.1709801088675; 
 Thu, 07 Mar 2024 00:44:48 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c180800b00413011933e6sm1842810wmp.39.2024.03.07.00.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 00:44:48 -0800 (PST)
Date: Thu, 7 Mar 2024 09:44:48 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20240307-quizzical-auburn-starling-0ade8f@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="76xqnbxdilc4pxio"
Content-Disposition: inline
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


--76xqnbxdilc4pxio
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-03-07:
A connector status polling fix, a timings fix for the Himax83102-j02
panel, a deadlock fix for nouveau, A controversial format fix for udl
that got reverted to allow further discussion, and a build fix for the
drm/buddy kunit tests.
The following changes since commit c70703320e557ff30847915e6a7631a9abdda16b:

  drm/tests/drm_buddy: add alloc_range_bias test (2024-02-28 08:03:29 +0100)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes-2024-03-07

for you to fetch changes up to 4ece8fc439c370b1aec26a44b9f94fb214068d42:

  drm/tests/buddy: fix print format (2024-03-07 09:28:06 +0100)

----------------------------------------------------------------
A connector status polling fix, a timings fix for the Himax83102-j02
panel, a deadlock fix for nouveau, A controversial format fix for udl
that got reverted to allow further discussion, and a build fix for the
drm/buddy kunit tests.

----------------------------------------------------------------
Cong Yang (1):
      drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel HFP and HBP (again)

Douglas Anderson (2):
      drm/udl: Add ARGB8888 as a format
      Revert "drm/udl: Add ARGB8888 as a format"

Imre Deak (1):
      drm: Fix output poll work for drm_kms_helper_poll=n

Karol Herbst (1):
      drm/nouveau: fix stale locked mutex in nouveau_gem_ioctl_pushbuf

Matthew Auld (1):
      drm/tests/buddy: fix print format

 drivers/gpu/drm/drm_probe_helper.c             | 8 +++++---
 drivers/gpu/drm/nouveau/nouveau_gem.c          | 2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
 drivers/gpu/drm/tests/drm_buddy_test.c         | 2 +-
 4 files changed, 11 insertions(+), 9 deletions(-)

--76xqnbxdilc4pxio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZel+fgAKCRDj7w1vZxhR
xSukAP4kKvDlgY3da8dezBm0+6fw59JGWuhV0LXZPOBGaN6QbQD/UcEPU29ec3Gb
97p8AFDJCjbEyriP2DwXIllSi1wyyA0=
=h+3+
-----END PGP SIGNATURE-----

--76xqnbxdilc4pxio--

