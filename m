Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A1CC83F2E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404610E6EA;
	Thu, 29 Aug 2024 14:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NNqy2/Dy";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C51A10E6EA
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724943094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=o8hizAOpY+7kJBYCq/LFUyXzMpPCymiKXp+YCyYUVXs=;
 b=NNqy2/DyARI+DvK5EaQMwzsqdESeGtjrYSKzOw5aqWcBpgX8SEGM4djQQ5J44BR0Uwo46z
 rdJGv6gp4s8nuEDHcaTj22hqLLzXmCbnMki6proGjQrGnhz1RWODHniq0NMti0ycOYhEcI
 0FxXlDqa/ZcOTHcqBIHycefcWz6xrEc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-IrmN7DYzMiyZeZe7sQTOmQ-1; Thu, 29 Aug 2024 10:51:32 -0400
X-MC-Unique: IrmN7DYzMiyZeZe7sQTOmQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-371bc601737so563712f8f.3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 07:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943091; x=1725547891;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8hizAOpY+7kJBYCq/LFUyXzMpPCymiKXp+YCyYUVXs=;
 b=VJNC2FGEAqwjNMfdCxbT7j8kLmJslcaBbXMmpe2d30QYGH5QWaJmGub5wJKokSwgT+
 IB2Qr94zQi63kdRqNzrnqOFhrym8JbbKRfebvKJz//+JYCwFPdCHOlmX1jStuPHJcvOF
 K1TAOoJZMDzShIiVhWr9OiPYYsn+ggEEo2nM3U7ts0xUYEKTiegfZ+eNJVKrUc94pyeH
 1MxTRZl8sxxq+buixqoFmOUrB7h5Y1InmPJ4bfuLrXnat0EUKhUaLZr/hA4A+X8X9MjB
 oIz0dy7w99sZdi+BoCHDH8HYs1d0dro/MDJBQ/Ogv9fmhCxQjcoRwA5G85r1x1a7QNFe
 SyVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV82PiFOeUj0dpoisP2RkkTgo+uliDhkL4QwK7gFM6JaO35wymIxIWZgrNxwjzbkqtr400QyiBDfg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiZnjssd6bCrgV5fR7rWb/PlK6oYovyMdzKb5l7/x+TZ8dgeaL
 nJStOffj8ebz++yRr6a2Y4v8QTfAtzo6Q/5LAd8U/LcDxLxmrV0bS++B1aYY1rSd6WCSr+Jv+Rv
 wZCal/gIuK5asadXwMSqGIdGPURpMCv4j5JetpJdkbphOompsNeDxgvmmdgbTx9db
X-Received: by 2002:a05:6000:1205:b0:36b:bb84:33e2 with SMTP id
 ffacd0b85a97d-3749b56157amr2160752f8f.37.1724943091338; 
 Thu, 29 Aug 2024 07:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6gzgcHYvgehEsl05HBBaQQHPASR2y09yuwyioLUAKciAMZLg1EbneAIKjRehHDFfy658nCg==
X-Received: by 2002:a05:6000:1205:b0:36b:bb84:33e2 with SMTP id
 ffacd0b85a97d-3749b56157amr2160721f8f.37.1724943090788; 
 Thu, 29 Aug 2024 07:51:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb9593c32sm5996765e9.48.2024.08.29.07.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:51:30 -0700 (PDT)
Date: Thu, 29 Aug 2024 16:51:29 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <20240829-efficient-swift-from-lemuria-f60c05@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jqxdvs5nqe3j44as"
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


--jqxdvs5nqe3j44as
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-08-29:
A revert for a previous TTM commit causing stuttering, 3 fixes for
vmwgfx related to buffer operations, a fix for video/aperture with
non-VGA primary devices, and a preemption status fix for v3d
The following changes since commit 9b340aeb26d50e9a9ec99599e2a39b035fac978e:

  nouveau/firmware: use dma non-coherent allocator (2024-08-16 03:42:24 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-08-29

for you to fetch changes up to 9d824c7fce58f59982228aa85b0376b113cdfa35:

  drm/v3d: Disable preemption while updating GPU stats (2024-08-28 11:36:53 -0300)

----------------------------------------------------------------
A revert for a previous TTM commit causing stuttering, 3 fixes for
vmwgfx related to buffer operations, a fix for video/aperture with
non-VGA primary devices, and a preemption status fix for v3d

----------------------------------------------------------------
Alex Deucher (2):
      Revert "drm/ttm: increase ttm pre-fault value to PMD size"
      video/aperture: optionally match the device in sysfb_disable()

Tvrtko Ursulin (1):
      drm/v3d: Disable preemption while updating GPU stats

Zack Rusin (3):
      drm/vmwgfx: Prevent unmapping active read buffers
      drm/vmwgfx: Fix prime with external buffers
      drm/vmwgfx: Disable coherent dumb buffers without 3d

 drivers/firmware/sysfb.c                |  19 ++++--
 drivers/gpu/drm/v3d/v3d_sched.c         |   6 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c    | 114 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      |  13 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c    |  12 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |   6 +-
 drivers/of/platform.c                   |   2 +-
 drivers/video/aperture.c                |  11 +--
 include/drm/ttm/ttm_bo.h                |   4 --
 include/linux/sysfb.h                   |   4 +-
 12 files changed, 161 insertions(+), 37 deletions(-)

--jqxdvs5nqe3j44as
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtCK8QAKCRAnX84Zoj2+
dnhVAYDWqAvgA9KfHKMUCPWGuyC3YUBQpD/vf7UZqhVUO4IT6dPeHZ7btrnkJr4D
OZDsL4YBgISWjaJ8vryzLdtyG1H8gZ9GrqMpcRda620ZXbMR2vJJ7q6uXJYIvXqK
9/HIQAO2ZQ==
=LACF
-----END PGP SIGNATURE-----

--jqxdvs5nqe3j44as--

