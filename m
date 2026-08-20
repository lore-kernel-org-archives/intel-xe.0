Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA994C5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 06:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8951110EF1E;
	Thu, 20 Aug 2026 06:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VrNsfAM6";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GjM+KCXM";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F4310EF1D
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787208729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Ig9PtQUJTBDe//rfjqJRCwlEdyzXe6Qwqvd8zWFMm+o=;
 b=VrNsfAM6nxSJS4r3z0Ed0jh2cYK7znQhyiSNJiYvAWss69Ivmperl5PyM5ju1Z9vucThbS
 jqbSRTdqg/zqHCiardszAus3bj6Ml0L7Tl6q8twwoWbbzpDbP46rOHoGHKCQ8LazYTuZFJ
 vDj0E9/AFiCc0lpeoFyvPvxnTXGTsIU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-TBsX1HuJMUeYsP0oA5mkhQ-1; Thu, 20 Aug 2026 02:51:56 -0400
X-MC-Unique: TBsX1HuJMUeYsP0oA5mkhQ-1
X-Mimecast-MFC-AGG-ID: TBsX1HuJMUeYsP0oA5mkhQ_1787208715
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49991beee7aso20189015e9.2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 23:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1787208715; x=1787813515; darn=lists.freedesktop.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ig9PtQUJTBDe//rfjqJRCwlEdyzXe6Qwqvd8zWFMm+o=;
 b=GjM+KCXMO4q/YbLCsBnwFaHEMZ3zIOKAtOxir6woBtc9eT0vNWYdva5IbVXdPBux8y
 nDwiw3aDZFBZcDmuZ7vBJ75npB8hCZgvBtT29Fw47SQeryYekS5alQR4L5zQorNCO+BS
 sdkYlra1AzgijmFDUBUgHHncJshJ4UPxuef9SboSI7pdhpeCZyfhbGgQTndb3ujrT73g
 g38p+OeQ4DyjmvSY5jDmCjQM8LN0XbO76xTzfnJ090HyxL+B6arPES6VeHVjvy1posfu
 61wbKQ/VcBuDnQX9ePKjCr7/ftfgvCLaSouXrHe3X8BvNj/JcHz+HsmpTKFPO0VyLtPx
 LKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787208715; x=1787813515;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ig9PtQUJTBDe//rfjqJRCwlEdyzXe6Qwqvd8zWFMm+o=;
 b=sTi7ooqf/4PQ7NhKlE4b1U8qJ3bYbY+rSB67KZ+F30q7Ncq1s/ivYSrgkJmsVoHTS2
 JMKOf/YVbISkZQxwAbKY7bSD9CtUDsTDUyK1b02uumbzFygvCiKxYLE43mOQXQoOfPRb
 GPjJQ9PDx+iuZtTxd3pGyCmW9/w+WcaLuwylDV2ZKfUcW6gERgYzTNhjkaMV3PnpnSMY
 bLSLw5fWe3qI8R85rzLis8rl3wtLanWsm0unyqpcey0JFeXgoTv4k01YbPokQ5DbDaLY
 T+WD/0cQT1DLLT8IfxizxV60k84dcRXwhWWvB1hwLWz8X8SS5/NvjaSA8UfT85gtv5E2
 S0zw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrPSSxGnCAsO4XkQNdY9OIQHZF6TmB8HL+1vABbocgd3J36/KyHmNQ1SjNci//KDiXedAcIu3NGRw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+c8QcLaNkkZBxM6AhSrf0EaaAx+rCb/PgiVnP6o6L6zcNSjwj
 JwQhv37rXfJQFxcF5OEN0vR7G+zXmx658/yJYFni4X3fsKW4kgp5FpvPNrSKQ70Z07Xr/y2riS8
 u2ePDFIhHuHj4aGFiB8LE2SBhI/JJpb5PFdXNr7C6nJ+it5w8EaUHwntUG/P12pKAdPmB
X-Gm-Gg: AR+sD1201UCbHUWDdJyGgRSNnEPnsiHWHt5K8L3+/ygqQ5/Ls9/ibMYW7Sv4tUCNBsK
 SJvUOwqANumv7HnAQkzTYIjTkMJlKhzXF1um4NijRFTnIpQukdQ3wLvFIKMrtudWJiJlgYU5tBQ
 h2Ijux00jSRfmrTOr0I74WT9bWsboXrOy+tiBr4o5tegPW9M95sLS97DUKI7G6CjINgK7drgqCc
 kJRIHXWvo1N3Vg4XnXDp+rt6J4i+uA0oR8o5Ibg3Z1g3k8oYlctDTWhNTvMzshjE1/AeGG9ayZZ
 cbT93WpXdpjD5MuhCeMFdWLQbU4UIyHY/fE7FcvsqfIVhRL87XTw3tmppKJPuo7K1QCbnTjl3Q=
 =
X-Received: by 2002:a05:600c:5291:b0:495:4fd4:619b with SMTP id
 5b1f17b1804b1-499aa189357mr189153485e9.1.1787208714811; 
 Wed, 19 Aug 2026 23:51:54 -0700 (PDT)
X-Received: by 2002:a05:600c:5291:b0:495:4fd4:619b with SMTP id
 5b1f17b1804b1-499aa189357mr189152795e9.1.1787208714345; 
 Wed, 19 Aug 2026 23:51:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:ca7f:54ff:fe01:374c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499affa25acsm57805055e9.4.2026.08.19.23.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 23:51:53 -0700 (PDT)
Date: Thu, 20 Aug 2026 08:51:52 +0200
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20260820-fabulous-nimble-woodpecker-ffa695@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="un3bfnjzayikx764"
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


--un3bfnjzayikx764
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next-fixes PR

Maxime

drm-misc-next-fixes-2026-08-20:
One patch to remove a WARN in favour of drm_warn.
The following changes since commit 651b0bd0922b265c6c58d9dc84ef3fd00782a0cd:

  drm/panel: remove accidentally committed .orig file (2026-08-11 09:52:43 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2026-08-20

for you to fetch changes up to 271e90eb5f9ff34951647e5ed33c1775eebcca50:

  drm: use drm_warn() in validate_blend_mode_for_alpha_formats() (2026-08-14 14:43:23 +0100)

----------------------------------------------------------------
One patch to remove a WARN in favour of drm_warn.

----------------------------------------------------------------
Leandro Ribeiro (1):
      drm: use drm_warn() in validate_blend_mode_for_alpha_formats()

 drivers/gpu/drm/drm_mode_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--un3bfnjzayikx764
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaoakCAAKCRAnX84Zoj2+
dnuUAYCkSDWlQeFu51mDKuUD9WokDbCcf7CFD62DxVJVMlGaFnc2jWxMdlG28vlJ
SXX80ikBeQFcCZBAYdfiK0iOqdxnwppxb7KekYtNHLKdyzUPLb69cr6jat49bcON
AjI7NUfQTw==
=fa/g
-----END PGP SIGNATURE-----

--un3bfnjzayikx764--

