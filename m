Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14332CAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 11:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77E910E8CE;
	Thu, 25 Sep 2025 11:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c6+H2knA";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7714210E8DA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758799962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kFv74pBfRMr2qCPt0l0SB2V204hWIgxWND1WkuVXrJU=;
 b=c6+H2knAa4E+oMPcoaLtJsMBlz8G26Hfc174PQ/OOng0maxGPLfHx9JrlpEOru5dMerlre
 6OlzLZBiC/KXMkYH1U43BoNnifKtqOn5B4ytL86c377oOYp3uCmnAmQ8UGGeNAppW0AOvQ
 rvsCKrIDVs7CimeYZDpAZs52iChc1a0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-UyF7aoyIOfa-4NRj4RuWug-1; Thu, 25 Sep 2025 07:32:40 -0400
X-MC-Unique: UyF7aoyIOfa-4NRj4RuWug-1
X-Mimecast-MFC-AGG-ID: UyF7aoyIOfa-4NRj4RuWug_1758799960
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-afcb78d5c35so99113666b.1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 04:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758799959; x=1759404759;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFv74pBfRMr2qCPt0l0SB2V204hWIgxWND1WkuVXrJU=;
 b=ZXXamxQQz2Voqs0p+j7VDVAOGkA7nEz3QeqnXhBwtifUu4jOMrUdrKQkH1g+BmoiCn
 tWgCwg3QTnWZjwNfntCBlXKfFrgzlquVr4cucgwyBekSSwY4E1c9Nts2r1T0eCE5URa9
 0ywaXfw4/dvoXC0ZlCvGdcRPysmPiF7ElRfLVhb+YO+snvMW4LJp59Iy6/IRSgsNUoPL
 mUXIFBOFxP5gKIqQXxJrE0NxyxMJBk4rM2x0mU2c6UURj8oowQQNGoeoZTb77dLi4y+3
 zRHswyNr3G+dt0zBkM3SxOkESTNkEb8arz6YgffsAJGueaQASdJjAMB+QWOxpVj/RMaY
 F0aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRZariOLQ3EHuN6ZH5WOTPrcNE7kA3Ym6fDc8FlYAhlqcIf904RWfuqHyPQ10D89B0kw/hzeRGbg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl7oo8awSCRaEeDwbZghHMyfZ9U0ACkTKa9a8ti3vb89OPfCjI
 VatT7qJbAt9CVOqJ7A0U9vzYLKeGS2DXcPWiQwaYfysZtTznMn1OugpMoBGNIIuSFJFUnc9dcqG
 ZhqgZ/5aM49PklHpol5gna5iQkCrv9P7miAgHdForfkSqs3QGKzgtzW9nNbyKtNZIb3UI
X-Gm-Gg: ASbGncsXVrTtPUF/EHqUM8iuSriBGS/OF1x12dphAjKJp9jWd3ZUiMbUrPva6npGdvd
 KjhjRELzIgNktYae0SZyJkZIIC7k2RFvNwUWdnWJkcphQVVcwrfdQvWIoLicRqMicdLubz8Z+8x
 pxDJxvcsq15PHr9vwed6F76Zw/SLiBNqF6kGKRXEvbMyvHyaInQEC0w/I4XnTy7AT/wIXbN7deF
 D4xbGddqxaJEVMeiFwoe+HQEpfzEpWYw76/M4EcD2/T+8AWPeB5DFZBfgOiGKxqwTjt9/WVW4Av
 r0M1cy3GcF/SV56AsPIExVveA8GIUtDkkg==
X-Received: by 2002:a17:906:d551:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b34b79c4ae3mr386841466b.20.1758799959472; 
 Thu, 25 Sep 2025 04:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZgWMmzy6juhvrotqBZlm+9jnOTs4oG8dGNxI5H/X2CKmcxlyf+PhKOIk8QUuIAXoQrwrY9Q==
X-Received: by 2002:a17:906:d551:b0:afe:d590:b6af with SMTP id
 a640c23a62f3a-b34b79c4ae3mr386837866b.20.1758799958975; 
 Thu, 25 Sep 2025 04:32:38 -0700 (PDT)
Received: from localhost ([212.133.41.95]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d2f92sm145962966b.18.2025.09.25.04.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 04:32:38 -0700 (PDT)
Date: Thu, 25 Sep 2025 13:32:37 +0200
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
Message-ID: <20250925-smilodon-of-luxurious-genius-4ebee7@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sxaqkjm62xtemvdl"
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


--sxaqkjm62xtemvdl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-09-25:
A CPU stall fix for ast, a NULL pointer dereference fix for gma500, an
OOB and overflow fixes for fbcon, and a race condition fix for panthor.
The following changes since commit 288dac9fb6084330d968459c750c838fd06e10e6:

  drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path (2025-=
09-16 15:42:35 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
25-09-25

for you to fetch changes up to 7d9c3442b02ab7dd3c44e20095a178fd57d2eccb:

  drm/panthor: Defer scheduler entitiy destruction to queue release (2025-0=
9-25 09:52:03 +0100)

----------------------------------------------------------------
A CPU stall fix for ast, a NULL pointer dereference fix for gma500, an
OOB and overflow fixes for fbcon, and a race condition fix for panthor.

----------------------------------------------------------------
Adri=E1n Larumbe (1):
      drm/panthor: Defer scheduler entitiy destruction to queue release

Nirmoy Das (1):
      drm/ast: Use msleep instead of mdelay for edid read

Samasth Norway Ananda (1):
      fbcon: fix integer overflow in fbcon_do_set_font

Thomas Zimmermann (1):
      fbcon: Fix OOB access in font allocation

Zabelin Nikita (1):
      drm/gma500: Fix null dereference in hdmi teardown

 drivers/gpu/drm/ast/ast_dp.c            |  2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c  |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c |  8 +-------
 drivers/video/fbdev/core/fbcon.c        | 13 ++++++++++---
 4 files changed, 13 insertions(+), 12 deletions(-)

--sxaqkjm62xtemvdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNUoVAAKCRAnX84Zoj2+
dumUAX9lV0ZT9PhBCt/7HbuFDGWz1GjdcASrjCUA7dFCAYXuwg4xGMx2T7156qRU
5iaFvpgBgJ5QP8EjpZ6dm4gdwF8s/WFxmoPw4QAeua/rrkYQi394ZqAs72kVLYc0
RKUq27yqMg==
=N1yG
-----END PGP SIGNATURE-----

--sxaqkjm62xtemvdl--

