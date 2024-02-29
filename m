Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B807C54E49
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 13:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113F410E168;
	Thu, 29 Feb 2024 13:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LDRmYOpX";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9329610E145
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709213847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vDUSEAJwQ4YGsrivsXMVw4pvN15mO+5wYFypQLio1vw=;
 b=LDRmYOpXK3VuN6KNsYsliNoCT+/ssJ7bR/BqRHl9Vw0YNNjD3l5amovV3sE4J7O9XAZ2n2
 SIWQ5JQjvqY7RN4lVtIn1QINw1zf8onqKrCTFb0/yow4XJ2hNsOTTiBEG+XPPWCJoWlong
 X2p1GqaRBnZHgovJ+b9wlV1zWHhUFFs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-y_1dFmXoP-meFmdEI3_ECA-1; Thu, 29 Feb 2024 08:37:25 -0500
X-MC-Unique: y_1dFmXoP-meFmdEI3_ECA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33d9f425eaaso421652f8f.3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 05:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709213844; x=1709818644;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDUSEAJwQ4YGsrivsXMVw4pvN15mO+5wYFypQLio1vw=;
 b=UYjD1rNK+DihwjPOZ6zwVXkPRjG1jwh/8Xw7oVgXyYLUp6N0cNL7BMgew2aHqaPCox
 YGRlJTCwPYBheFxapfDfa7bpLodaww42ERHk5mna7CEh+DTMQvbS4En4Z8C1CjjIg0fp
 gAnEec2FLvxLu/zWUZ43PzFbLI81W16yos6LE2KTzkWayO+wvxEP0YZyeYIPijoBv7Re
 KKQr3IciZ4Q7Uz7vsFA3jG7dxWGQFo06Q9PjlJ/Fp8bdNnaVkaNv9qtRY9JXRPTK83Nl
 2h1LAX8OfC6qWQTdBry4Ds9faiOsUpQZRlf/UprVJXa5kDHEhCrCl23+wIjQi8xcM5cz
 ro/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3yMGjma3Jgg6C5ezGBnbkKHnxSOr975viQzzyK6g2RHReqAdYGYm8Mym7OF8vFObbOeuU1sbLHQ7HArpUFraOg0uypc3Qrkyq+d9q8DY=
X-Gm-Message-State: AOJu0Yz2iIU3qjSw0gnL3z6CRQRfgpwHPnbkfrm52KBVpu0FoVML21y5
 0M8TEoTmNd119UgcpAORojep5U9bo0TZqdikj6BmRRP3p+qnjUSsjsa3se9UYExBiZXyCQndHmh
 DYlNr/O8Zgd7VBVXMlhCmQ45ne3nXvhJ3mxYLNj5jUYz92VABAVDDRfUmR/SX1gjr
X-Received: by 2002:adf:cd10:0:b0:33d:9d21:ea8f with SMTP id
 w16-20020adfcd10000000b0033d9d21ea8fmr1297596wrm.3.1709213844247; 
 Thu, 29 Feb 2024 05:37:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbHkP82IIB7bdvKg7ovelrCBgb68WwrAqg7dUtfNpmvupJWrHzhm5EJTHcXysxLHIRKqnagg==
X-Received: by 2002:adf:cd10:0:b0:33d:9d21:ea8f with SMTP id
 w16-20020adfcd10000000b0033d9d21ea8fmr1297581wrm.3.1709213843797; 
 Thu, 29 Feb 2024 05:37:23 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a056000181300b0033d3b8820f8sm1781552wrh.109.2024.02.29.05.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 05:37:23 -0800 (PST)
Date: Thu, 29 Feb 2024 14:37:23 +0100
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
Message-ID: <20240229-angelic-adorable-teal-fbfabb@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ht65tpmkjawo5wje"
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


--ht65tpmkjawo5wje
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc fixes PR.

There's two commits for files unders drivers/soc/qcom that don't have a
maintainer Acked-by. Bjorn's Acked-by was provided on IRC, and Konrad
provided it by mail after the facts so we're covered.

Maxime

drm-misc-fixes-2024-02-29:
A reset fix for host1x, a resource leak fix and a probe fix for aux-hpd,
a use-after-free fix and a boot fix for a pmic_glink qcom driver in
drivers/soc, a fix for the simpledrm/tegra transition, a kunit fix for
the TTM tests, a font handling fix for fbcon, two allocation fixes and a
kunit test to cover them for drm/buddy
The following changes since commit 72fa02fdf83306c52bc1eede28359e3fa32a151a:

  nouveau: add an ioctl to report vram usage (2024-02-23 10:20:07 +1000)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes-2024=
-02-29

for you to fetch changes up to c70703320e557ff30847915e6a7631a9abdda16b:

  drm/tests/drm_buddy: add alloc_range_bias test (2024-02-28 08:03:29 +0100)

----------------------------------------------------------------
A reset fix for host1x, a resource leak fix and a probe fix for aux-hpd,
a use-after-free fix and a boot fix for a pmic_glink qcom driver in
drivers/soc, a fix for the simpledrm/tegra transition, a kunit fix for
the TTM tests, a font handling fix for fbcon, two allocation fixes and a
kunit test to cover them for drm/buddy

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/ttm/tests: depend on UML || COMPILE_TEST

Jiri Slaby (SUSE) (1):
      fbcon: always restore the old font data in fbcon_do_set_font()

Johan Hovold (3):
      drm/bridge: aux-hpd: fix OF node leaks
      drm/bridge: aux-hpd: separate allocation and registration
      soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free

Matthew Auld (3):
      drm/buddy: fix range bias
      drm/buddy: check range allocation matches alignment
      drm/tests/drm_buddy: add alloc_range_bias test

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Mikko Perttunen (1):
      gpu: host1x: Skip reset assert on Tegra186

Rob Clark (1):
      soc: qcom: pmic_glink: Fix boot when QRTR=3Dm

Thierry Reding (1):
      drm/tegra: Remove existing framebuffer only if we support display

 drivers/gpu/drm/Kconfig                 |   5 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c |  70 +++++++---
 drivers/gpu/drm/drm_buddy.c             |  16 ++-
 drivers/gpu/drm/tegra/drm.c             |  23 +++-
 drivers/gpu/drm/tests/drm_buddy_test.c  | 218 ++++++++++++++++++++++++++++=
++++
 drivers/gpu/host1x/dev.c                |  15 ++-
 drivers/gpu/host1x/dev.h                |   6 +
 drivers/soc/qcom/pmic_glink.c           |  21 +--
 drivers/soc/qcom/pmic_glink_altmode.c   |  16 ++-
 drivers/video/fbdev/core/fbcon.c        |   8 +-
 include/drm/bridge/aux-bridge.h         |  15 +++
 11 files changed, 368 insertions(+), 45 deletions(-)

--ht65tpmkjawo5wje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeCIkgAKCRDj7w1vZxhR
xXBcAP4g73FPfLU2Ntqt4YBg2PBEajW7xQXJS64S3PbnsGdiyAD/Tf7iMZ4wzpLK
sK2PdMNxsuyskzI9/iGgLFnJLhuaAwI=
=AjLi
-----END PGP SIGNATURE-----

--ht65tpmkjawo5wje--

