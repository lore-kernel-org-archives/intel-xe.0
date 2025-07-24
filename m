Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A2FC83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 06:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680B810E1D2;
	Thu, 24 Jul 2025 06:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CmAAEt7U";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF1410E1D2
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753339980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=/0pKL5NP73eax0XQWW/ID5+A1+auXnZadTj2E/9ig0w=;
 b=CmAAEt7UyR0QfdAnUnB+oyPlctTcYi5CnJKUwiUM/iyhQJzl2z57loIU5/2lIf9FmCvJhS
 jUDR9h4g5/dwnDrp3yoxuNHSo8NtKU8Iel0TLC9hfQ5vWueJw9of/K7fGqCFgVSov9GnN8
 c5WyqmxvBMCUEb0dADXMlIFOvSzJO20=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-41HiPlGLMtaNLChsl4hooA-1; Thu, 24 Jul 2025 02:52:55 -0400
X-MC-Unique: 41HiPlGLMtaNLChsl4hooA-1
X-Mimecast-MFC-AGG-ID: 41HiPlGLMtaNLChsl4hooA_1753339974
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b5fe97af5fso220435f8f.2
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 23:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753339974; x=1753944774;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/0pKL5NP73eax0XQWW/ID5+A1+auXnZadTj2E/9ig0w=;
 b=avghAQ9tnzRKZBu1iWmXwUiMrUwpT9+Vc1R7+e4GLx1E4mV3a1SLdpZ88rIApifr/F
 pAUnCMXAB4HRi912D1TiFR6AlwfrpBzJTN77vcQeSM+T/Zd8AF7IWFEGX3cRG2xLRfRN
 CJhaZYgYU4r+rO2AJxDqWWxhTkQuARmQaZ/KoIjTwGe3XM+Gg7Fh4AJvkkz45EMqo3u8
 n43/zVTYTsdjpiMOwWhN1kesiVcCi8pGfQa3jg5AbA5V4M0fD+yXftesGUTGXVJslB9/
 UlONZxua8v1q91mes7Op2KdmLmUiFGxVNbLamtyNGcq1zA5PlSi/VLPHi76gARw6lguU
 VOBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1klUJJSKMSvU7cSewjoos1orjEH3sYkuu8MsLUMrgEpYcWeOuQasHXttdLJZz7eJSEeNJG/CZNw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcqwuUoNufKe1wSYjkfr57Gzw40rS88+d8zI3/4KOoWZXTY+km
 ccDr/oW/4bKWilVuaaejy+Un71BjwiP84+A2nVUpQ5gAPd/0NfpypcctXQek+GHSlA8ehhgXUcb
 dDAjrCTaKqIclRG3jhs3G4wkPnJmWAo87+vMtijclIwnBA6x52g6kgIrLb7cO4qcOnv42
X-Gm-Gg: ASbGncuTjmlWnT3b5GhhvDND1DHJmux7kE70+6lm7tU6Gu2/qdEJwBypd6CJfyPUXcc
 j7r8DSEo2lWTV/s5VCWOREfm626gHSzzV6rhulBduwcNaEjh5aA5JOQKoGifz5/27dqXv08f1Xd
 fS7JASRtGUv7JZ0HZoFprHFx9PVFL3mRlRMcnOiygTh0Ss/dJgvLwxS3SLnBjkrBZ/LP1AzGgXt
 1FYSdQ5cpJ7atQ3lzKrloNWRgUQZn9j1eSKyH6LBwAZi1L6AVBz8nUetvm/NCYhFV/Kkjn+VCmP
 5QIgTMmrbeAa3ak=
X-Received: by 2002:a05:6000:4383:b0:3a5:276b:1ec0 with SMTP id
 ffacd0b85a97d-3b768f052d6mr4670301f8f.45.1753339973850; 
 Wed, 23 Jul 2025 23:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcYzg5OUAe89hjtqRlx0qYuu+mbOBARXyBviyMZaliNHGqf9RslbHjHpMGF9JubuJmhYGZEQ==
X-Received: by 2002:a05:6000:4383:b0:3a5:276b:1ec0 with SMTP id
 ffacd0b85a97d-3b768f052d6mr4670276f8f.45.1753339973357; 
 Wed, 23 Jul 2025 23:52:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc6eaf3sm1158249f8f.27.2025.07.23.23.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 23:52:52 -0700 (PDT)
Date: Thu, 24 Jul 2025 08:52:52 +0200
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20250724-petite-gray-foxhound-b4fbb8@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2r6awe2hfysrj2zu"
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


--2r6awe2hfysrj2zu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next-fixes PR.

Maxime

drm-misc-next-fixes-2025-07-24:
Two more bridge conversions to devm_drm_bridge_alloc that address a
warning now reported by the bridge core code.
The following changes since commit fe69a391808404977b1f002a6e7447de3de7a88e:

  drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code (2025-07-10 10:16:50 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-07-24

for you to fetch changes up to b213eb34f857c45bdd769c9e9191a386accc9e8f:

  drm/tidss: oldi: convert to devm_drm_bridge_alloc() API (2025-07-18 14:55:57 +0300)

----------------------------------------------------------------
Two more bridge conversions to devm_drm_bridge_alloc that address a
warning now reported by the bridge core code.

----------------------------------------------------------------
Jayesh Choudhary (1):
      drm/tidss: oldi: convert to devm_drm_bridge_alloc() API

Michael Walle (1):
      drm/tidss: encoder: convert to devm_drm_bridge_alloc()

 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 drivers/gpu/drm/tidss/tidss_oldi.c    |  8 ++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

--2r6awe2hfysrj2zu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIHYQwAKCRAnX84Zoj2+
dhvfAX4v4BIKZTk3mlaSfj2442uwg5JNUf+zyRRmGuF/yDCVGN1ZzRpMOOko3glS
cVDmvaMBgOxtrUG2gt6m0eXzRFOUEiugrs2CmmXznEvLlOZ9Nz/A9pc2G7sncM02
Cwfqg1aF5Q==
=f1YM
-----END PGP SIGNATURE-----

--2r6awe2hfysrj2zu--

