Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F076C28B2E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 07:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CCC10E7FF;
	Thu, 13 Mar 2025 07:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GDn0zR2b";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9489510E801
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741851394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=uycxbi4TCRK/IaVbkaHC23MSCbbrir2qS6Cwo9hdLFk=;
 b=GDn0zR2bkztqWSAUP1rj7l3rndiDGCXVEn572aiky5DpPz0t1jecta6XA0GeNh3QG7T5N/
 EoG4iUPG96SbA8uv2h/khe3FKyHjvWeGN0a9KKG28FU/oKlfu2ecqqIN6hgNACTSwaQF8Z
 LEK8VJYWhIGyfS+0NnoeQjXe58gAmKQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-Bx0aV8VxO7yNvJ3r6heXBg-1; Thu, 13 Mar 2025 03:36:32 -0400
X-MC-Unique: Bx0aV8VxO7yNvJ3r6heXBg-1
X-Mimecast-MFC-AGG-ID: Bx0aV8VxO7yNvJ3r6heXBg_1741851391
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39141ffa913so329239f8f.2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 00:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741851391; x=1742456191;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uycxbi4TCRK/IaVbkaHC23MSCbbrir2qS6Cwo9hdLFk=;
 b=Pd0sbPtCkSsY2DbU30z+pOzUHOyaT4HuBeDgxarGwi2SE0GPS5gf2MZ7GhByvOHznv
 QeVVW9sTdqMKtaCLJmY5YM3o/zH+aw/mMSwJbcCGuPcsPefGdukl6x4m04nGZ660a7/+
 mQlyOJ7IpsIXxqKFMGjGfdNPqGKyCBI1o2Obf8MgQHIc8ITIlpvJAmF9+eSXSlqzVuN9
 p9GdQ8oHmF+e1kxMiQKtH6DvkhI5zmyJB1U+6gZNkd9kTbyBflcBF19PceMeOgFWLvn8
 oGns1Z9n+sci0l+/xKOqlPh935Dn0cKj/5e6z8n5/6kbUX1GITzmtO2WUfReHO0Sxz0f
 lHLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTq4+aB/s0R1c9Z11yvH+PPW8/v0tPibzFs4H5Le4C39Wn8402bZtmUNcXAV6Zr7O6PlyBOSqRiQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/230uuMwWeRCY9iIKBc/BtPG0Zg6kB3EMGsYx3zPPlOfT6p5t
 WOvGpPMrAyRXjA6gHnFBdq27WpKF2NxjI1Ad54agw8dzKv93+um1WDjuLqshydum5Q6yLr6x4Mc
 UvNU5LvatMLRJHK/6sIdvHwws+lW1CMAMY2z05rXLnZUA6kvrXH3W91ES/im5lP9B
X-Gm-Gg: ASbGncuPg2MhM0hXKI1HuU9zADbQBpKciwarNHl7JG90DQTez0eXlobtJc40QWjUY7D
 w5gCPuvyaSwRud66UK820B55bX+lGg6QhDI+syo6/cVuHR0uzGYL3aHUOEw5K+zJ3oYdF0SKThf
 jJxdKQmrdzejNaBw+bWB+Z6IWI34XZ7eltOnGK34kTdZaNBHZ+zm2kNRLpBQAVtXQQ+vUbWD83i
 SUfU10uWKqhHG00jaukGmy7v7kwRaVDtP5AS1aQ+bRugWzqzEvg1IdJG862BP/2oN4=
X-Received: by 2002:a5d:6c66:0:b0:391:4835:d8a8 with SMTP id
 ffacd0b85a97d-3914835d9e2mr11564614f8f.1.1741851390952; 
 Thu, 13 Mar 2025 00:36:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQBTHN7HToqEsIEVgOs3DY0TO0fyncqzeN+fnZxWcJCLq9jxb30i16kQMXPX6J8VqOTgFD3g==
X-Received: by 2002:a5d:6c66:0:b0:391:4835:d8a8 with SMTP id
 ffacd0b85a97d-3914835d9e2mr11564594f8f.1.1741851390504; 
 Thu, 13 Mar 2025 00:36:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a75b290sm44363505e9.23.2025.03.13.00.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 00:36:29 -0700 (PDT)
Date: Thu, 13 Mar 2025 08:36:29 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20250313-holistic-clay-moose-fead28@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yd3tboou6p7k4fgc"
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


--yd3tboou6p7k4fgc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-03-13:
A null pointer check for gma500, two clippy fixes for panic, a fix for
an interaction between DPMS and atomic leading to dropped frames, and
a locking fix  for dp_mst
The following changes since commit 80da96d735094ea22985ced98bc57fe3a4422921:

  drm/bochs: Fix DPMS regression (2025-03-06 08:54:42 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
25-03-13

for you to fetch changes up to 12d8f318347b1d4feac48e8ac351d3786af39599:

  drm/dp_mst: Fix locking when skipping CSN before topology probing (2025-0=
3-11 11:29:18 +0200)

----------------------------------------------------------------
A null pointer check for gma500, two clippy fixes for panic, a fix for
an interaction between DPMS and atomic leading to dropped frames, and
a locking fix  for dp_mst

----------------------------------------------------------------
Imre Deak (1):
      drm/dp_mst: Fix locking when skipping CSN before topology probing

Ivan Abramov (1):
      drm/gma500: Add NULL check for pci_gfx_root in mid_get_vbt_data()

Miguel Ojeda (2):
      drm/panic: use `div_ceil` to clean Clippy warning
      drm/panic: fix overindented list items in documentation

Ville Syrj=E4l=E4 (1):
      drm/atomic: Filter out redundant DPMS calls

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 40 ++++++++++++++++-------=
----
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 +++
 drivers/gpu/drm/drm_connector.c               |  4 +++
 drivers/gpu/drm/drm_panic_qr.rs               | 16 +++++------
 drivers/gpu/drm/gma500/mid_bios.c             |  5 ++++
 5 files changed, 45 insertions(+), 24 deletions(-)

--yd3tboou6p7k4fgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9KK/AAKCRDj7w1vZxhR
xc5sAP4zPHPxFCE/OasImZapRLUTIlhRPIVFkkyapO0g0idSCAD/eEihejwWeuN6
6Dv6A3dF9xf7nQGBAxdJRxcO6hD0kgw=
=dLWt
-----END PGP SIGNATURE-----

--yd3tboou6p7k4fgc--

