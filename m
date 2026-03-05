Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E6EEF31A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 08:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3B710EB5B;
	Thu,  5 Mar 2026 08:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gsVlAbZx";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dVXICtCK";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDC110EB5B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 08:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772698174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=m2qyIYKFUP0m9wA/UEgSZpALpRru5dabPxt8eU3MBlw=;
 b=gsVlAbZxIEtEXJxnE2kGOtg601gN10/fIR81nTgujtrzRQN1QOpmUXRK4DvBvdsZPq2O4T
 ybVletFVWCAQtNHG9C5Mgh15lCDR08o9eAA4r6GdyHyls5JGrfY+3zfiYWFwT1vWEpBBN1
 Ta6doxgezvz9PUCQFqO0tcO1EkT82FQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-VMULnJZtO6exp25w5ukF6A-1; Thu, 05 Mar 2026 03:09:30 -0500
X-MC-Unique: VMULnJZtO6exp25w5ukF6A-1
X-Mimecast-MFC-AGG-ID: VMULnJZtO6exp25w5ukF6A_1772698169
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4836bf1a920so83473185e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 00:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772698169; x=1773302969; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m2qyIYKFUP0m9wA/UEgSZpALpRru5dabPxt8eU3MBlw=;
 b=dVXICtCK0aUMOoFCEogBSHGu0NUEkGWi5r0LPJKWvcDNoDPS26mUHqLsbaJ1igH2q1
 eSPQtAjNNT9UqUEPTqJI5DZxAYU7dN3BasvASjTcfpgg7Xkv/mbza6GdwBFJmWSizK7s
 7vT9hZZm0OVmI8jqkCLfYsW6oNCrOB0HCELTvvuyeDVbqbNr4asJggnx544WDzM5ILge
 caccZyAckV5uoIreBnJurwUZNn6kXmuhlJq3AiavHfaOIx7W8U8ZMWfeoNfCdlrNF8O7
 x82JRDqIXDT2ozg455lSJg+U8oTqMcuOpbMnih5sAO2IqeYKJpgkfLQ5qcgfSwFxMwRX
 BTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772698169; x=1773302969;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2qyIYKFUP0m9wA/UEgSZpALpRru5dabPxt8eU3MBlw=;
 b=UreTVPPJrFOt+5ud8kETXmkFtWupLKWp5cw99vK4W/E3N+7RBj4eofJJj80FYWgrIP
 tEwee1lLmZ5N41zTkMc4TjW+VNQ97S0d/LU9VM2miiiHZ5NkYTu8WG4Q8eVWKU9WM4hI
 bn/4LMims6+Q2s7wQla0N0l882xX+mFWDbomUfAmDMz3x8NqqZ6Hn/t6L7atfhzVVxfc
 2aprNgYSzts2+foYFAj4jdrwb966+sTmYvRaGthDNE8lBfBSWQB5O2j7vwoAGRbUk+1Y
 8sg33VEe1sdaRvgrTjDJg8OvjOKRLpvswJ88UTRU++LdmgztCXh0x/a+wI5IrqWberzS
 ubSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSiA3om4ymk3piosyDUBvKC4PRX5yFMQz0Oxhe2uy7UDkoY2aUjO1uItA0Pu9mrPRthF2slGRiYg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeDiBOF7kHGNMSkaXBhBKjDlyKpN12z+4iP2tjGtXTSUAgfebj
 75N1pTpOVUpLA4ehhCQ3joUZodMm0IO9oWA+D4oHQs4QDC5DTQWHgNmtbLU77IBwXMbJd3zMMva
 MYZB9ElKIWsL21WTHEQOYTjyX9gW8qHpH1qnKUeMLUJgog7NnLpCpSLFxm1S2VIPlUMm8
X-Gm-Gg: ATEYQzwfZeoZt+AO69Tv+yc9eUmtBBvg+oJzTmrmZWn37lyIeavBaEekjc9Q3gnPEdN
 AS2Ca8tXfmpNh+5B4e12yQB3sd5PPFRgYIHbafsZOmiTgXKWTIjp9z6R+Dy0rVrK9f8UrUNS3oj
 Ap3OK+NWkiFUzkXWaMEcUiq8uCOqWNkoDKnOL0ST2Xg2UyaP4hun6OJprfugiutkIoU6zpQqVeK
 8e9ygaTzPY1h9SFzHRND9j/Du7F5d1EtZqS2Xpwkj9jtpxVoofdr6xwHUHtEh7ZWfQBFt6NWbmF
 kEuXz5jReIbK/URlHlX9KW5bjsadBOje9SJhFxIYrUN4dceSNcLhASuiX7peScJYZrHczLtwpw=
 =
X-Received: by 2002:a05:600c:3b9e:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-4851984f5bemr88508665e9.11.1772698168795; 
 Thu, 05 Mar 2026 00:09:28 -0800 (PST)
X-Received: by 2002:a05:600c:3b9e:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-4851984f5bemr88508245e9.11.1772698168337; 
 Thu, 05 Mar 2026 00:09:28 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fad01d2sm25418255e9.3.2026.03.05.00.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 00:09:27 -0800 (PST)
Date: Thu, 5 Mar 2026 09:09:27 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20260305-ludicrous-quirky-raven-7cdafd@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ylij2qs72s7ecmod"
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


--ylij2qs72s7ecmod
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2026-03-05:
A return type fix for ttm, a display fix for solomon, several misc fixes
for amdxdna, a DSI clock rate fix for rz-du, a uapi fix for syncobj, a
possible build failure fix for dma-buf, a doc warning fix for sched, a
build failure fix for ttm tests, and a crash fix when suspended for
nouveau.
The following changes since commit 75c151ceaacf5ca8f2f34ebf863d88002fb12587:

  accel/amdxdna: Use a different name for latest firmware (2026-02-25 13:51:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-05

for you to fetch changes up to 8f3c6f08ababad2e3bdd239728cf66a9949446b4:

  nouveau/dpcd: return EBUSY for aux xfer if the device is asleep (2026-03-04 22:08:01 +0100)

----------------------------------------------------------------
A return type fix for ttm, a display fix for solomon, several misc fixes
for amdxdna, a DSI clock rate fix for rz-du, a uapi fix for syncobj, a
possible build failure fix for dma-buf, a doc warning fix for sched, a
build failure fix for ttm tests, and a crash fix when suspended for
nouveau.

----------------------------------------------------------------
Chris Brandt (1):
      drm: renesas: rz-du: mipi_dsi: Set DSI divider

Dave Airlie (1):
      nouveau/dpcd: return EBUSY for aux xfer if the device is asleep

Francesco Lavra (1):
      drm/solomon: Fix page start when updating rectangle in page addressing mode

Isaac J. Manjarres (1):
      dma-buf: Include ioctl.h in UAPI header

Julian Orth (1):
      drm/syncobj: Fix handle <-> fd ioctls with dirty stack

Lizhi Hou (3):
      accel/amdxdna: Fill invalid payload for failed command
      accel/amdxdna: Fix NULL pointer dereference of mgmt_chann
      accel/amdxdna: Fix major version check on NPU1 platform

Maarten Lankhorst (1):
      drm/ttm/tests: Fix build failure on PREEMPT_RT

Tvrtko Ursulin (1):
      drm/ttm: Fix ttm_pool_beneficial_order() return type

Yujie Liu (1):
      drm/sched: Fix kernel-doc warning for drm_sched_job_done()

 drivers/accel/amdxdna/aie2_ctx.c               | 23 ++++++++--------------
 drivers/accel/amdxdna/aie2_message.c           | 21 +++++++++++++++-----
 drivers/accel/amdxdna/aie2_pci.c               |  7 ++-----
 drivers/accel/amdxdna/aie2_pci.h               |  1 +
 drivers/accel/amdxdna/amdxdna_ctx.c            | 27 ++++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h            |  3 +++
 drivers/accel/amdxdna/npu1_regs.c              |  2 +-
 drivers/gpu/drm/drm_syncobj.c                  |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_connector.c    |  3 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 ++++++++++++++-
 drivers/gpu/drm/scheduler/sched_main.c         |  1 +
 drivers/gpu/drm/solomon/ssd130x.c              |  6 ++----
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c        |  4 ++--
 drivers/gpu/drm/ttm/ttm_pool_internal.h        |  2 +-
 include/uapi/linux/dma-buf.h                   |  1 +
 15 files changed, 85 insertions(+), 36 deletions(-)

--ylij2qs72s7ecmod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaak6NgAKCRAnX84Zoj2+
dhbSAYDiK+Tlgc4M1b78/SsyoMZnUj9Ar7Ng0Xl9zLTTzyeb6ppi2/x1Tos5HxSG
xAjONRYBgJO8bjLZzhy+E0A12Jl84j8jchkWzfP8dtTxmSxFaDNO/WduyyqBIR/t
HjKu7W6gMQ==
=5wx3
-----END PGP SIGNATURE-----

--ylij2qs72s7ecmod--

