Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E815CAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 08:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E3910E66F;
	Thu, 18 Sep 2025 08:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ah4hikur";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA0910E66F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758183872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=m4QsnAy0CzPIurKifptNo9f10B6Yy9sbvMq/EE+hd9g=;
 b=ah4hikurJf0T/v2cQlzIck1QP3BWYUrEFQu0nitws174f+EGanmD4ehI0/BdwPrXn4EH+x
 CpHA7h++uhp2UyWI77HpCqOkMTizYdNU0J5Mdp9QFteldJ5Vc3xodSRWD3Rhv3bw/qJi+E
 6YCyf4MatN7+unqeS5KRDYihmteleb8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-lnyAe70WNDiChXoTaqM9sA-1; Thu, 18 Sep 2025 04:24:28 -0400
X-MC-Unique: lnyAe70WNDiChXoTaqM9sA-1
X-Mimecast-MFC-AGG-ID: lnyAe70WNDiChXoTaqM9sA_1758183867
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3e40057d90aso329595f8f.0
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 01:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758183867; x=1758788667;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m4QsnAy0CzPIurKifptNo9f10B6Yy9sbvMq/EE+hd9g=;
 b=BoDYsQfDpKCi77YVODSsK4Sa9av6iXsm5vrKXpz+ZVkLrGnVvb3hAouT8HoDtM8/7a
 WI1H8YxBdo2Y5tHr+7bVM0W7gy/tJxjHfcA3gnxrJe2cKBj4eMrWac5XIZdK2YraKc6C
 4y/kB2r2hZWEktJm2fPjNiw99Woe0zkBfB8wdQTCWybwK2b33uCfvSoqnC3B6GcMx77l
 3puZJusV358N03kuHJPVPEMEbeRqTqGErIcZc/WcT2WOZXIkRRowjW0Wbu0uKaKbukL1
 HLu7AS/iVSGEvqGkk66eX1xCOgQVQ/BvnCUKB1FyCsLpNuw415vrONisd6E5tF7SfzYj
 F5ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6GGOlEqf9ZgCkQiBKlzD6+9HP1XQAsr+pv13ryZx4q5TXRIojz0A6BEpFrtvWU+Pep+Oo4+MCtg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSj9v1xS2oepYTBnNvznrw8LwVoLRiW6mVA55TBGU+aPMBaUZh
 kXwTEq+vL8kyIDzEoDB4CMD6fD1Z4vSnIsdvL7S7JWVlbaEf7zflq3fHRxiBtx/itklPH8yDK4v
 uUKwKZyo4wWpfK1xzG7t9oRm6vB7bvKuYywSP/iH5zqGy0V/0RbqXv6MTK8U9qKmQ1xLZ
X-Gm-Gg: ASbGncuoFBoeLz/WexgfY/GT8C3IbmjoLovaOdBxfFrrt3kDZafyGKzzWID3voFQXex
 xzcI+5DhS/uaBojRtTnAaVT7PrBtc2kNCcWjgUpXdTnT0lTYE+4DCWF69xFGZLJJoayNrAtGAhs
 319SuaSPWPYBYzET1k0lLiAY7ENGfp0GBnw3M/Ifu/ZB5JrbrqzOQlhj+vao0euNx3U0XBObgwS
 hPWr6nftLiaFEiBbsfEWlt8lDYtmy41Fad6Rmin0ikImkVCHsaFFeHdsNLm467/mUaZZjGvwujz
 72bSqO1q2Z7HFt8=
X-Received: by 2002:a05:6000:2082:b0:3e7:492f:72b4 with SMTP id
 ffacd0b85a97d-3ecdfa32db4mr4244282f8f.42.1758183867149; 
 Thu, 18 Sep 2025 01:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYe2Jq3iqw8F9GXKxw65z82I8UIpwQPICcX60KJ6ApCZS9tT/esEJmwGmUgclQPs2SSFJotw==
X-Received: by 2002:a05:6000:2082:b0:3e7:492f:72b4 with SMTP id
 ffacd0b85a97d-3ecdfa32db4mr4244253f8f.42.1758183866726; 
 Thu, 18 Sep 2025 01:24:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf0a4fsm2508947f8f.52.2025.09.18.01.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 01:24:26 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:24:25 +0200
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
Message-ID: <20250918-orthodox-pretty-puma-1ddeea@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wdhgzu7qjyuhxmnh"
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


--wdhgzu7qjyuhxmnh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2025-09-18:
One fix for a documentation warning, a null pointer dereference fix for
anx7625, and a mutex unlock fix for cdns-mhdp8546
The following changes since commit 87b90cee22d8658a69c0fbd43633839b75f8f05f:

  MAINTAINERS: drm-misc: fix X: entries for nova/nouveau (2025-09-10 15:52:25 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-09-18

for you to fetch changes up to 288dac9fb6084330d968459c750c838fd06e10e6:

  drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path (2025-09-16 15:42:35 +0200)

----------------------------------------------------------------
One fix for a documentation warning, a null pointer dereference fix for
anx7625, and a mutex unlock fix for cdns-mhdp8546

----------------------------------------------------------------
Bagas Sanjaya (1):
      Revert "drm: Add directive to format code in comment"

Loic Poulain (1):
      drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ

Qi Xi (1):
      drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path

 drivers/gpu/drm/bridge/analogix/anx7625.c           | 6 ++++--
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
 drivers/gpu/drm/drm_gpuvm.c                         | 2 --
 3 files changed, 8 insertions(+), 6 deletions(-)

--wdhgzu7qjyuhxmnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMvBuQAKCRAnX84Zoj2+
dl7eAXsHsMz9cZz0PGMyw6QlgzVO7Yax29AChzX2IlpQFbnleD08azc4XzRpHJGN
G96LxRwBf3Qq2QQ5ALZIKO6rrrUtUIDNihWGQGPLxGScCZbsr0WSXS55Btu/7yHq
32HKoYFHkQ==
=0j7j
-----END PGP SIGNATURE-----

--wdhgzu7qjyuhxmnh--

