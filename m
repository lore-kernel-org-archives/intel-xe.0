Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAE7C5AC67
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 08:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DDE10E449;
	Thu, 13 Aug 2026 08:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DEjaV+sD";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iiBT25hf";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD61910E449
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786609875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=mOaM89HDkhz0YSMPBacVagDnalThEgWQpZeX3ZxGlSw=;
 b=DEjaV+sDa8IZJ5OzZIVmNuRVpatyzHteI601bJJFnQAqGhkomLwUw6FoGlrghOCgcUkQS/
 hbvEKu3WPGskgMLnhlgqKCmm62WGl3r9W8oHCykyZqkNiIrw8A4G/evyz/JFYD9qEEqvdI
 NpnTcMDonpZHrxGRdaa9m6vGJAjOJz8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-49sizyUlP1aqiIg0ahMtYQ-1; Thu, 13 Aug 2026 04:31:14 -0400
X-MC-Unique: 49sizyUlP1aqiIg0ahMtYQ-1
X-Mimecast-MFC-AGG-ID: 49sizyUlP1aqiIg0ahMtYQ_1786609873
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47f2de3ba47so1241483f8f.1
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1786609873; x=1787214673; darn=lists.freedesktop.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mOaM89HDkhz0YSMPBacVagDnalThEgWQpZeX3ZxGlSw=;
 b=iiBT25hf/G5XoRlXBwRUBu7um3l9ZvvabxE3mh3EQd8hdNS4NCgvlX1gLKbKy3EMOL
 mqPISAt7LtHqiIRUxN9MlL7brdca/gzFcx0sytk8j+nZ518nBgRY0fc7RsbGDRkXecZX
 cPCDvsN37Z/PRD/LEn8Hlz25ZTxagS3W0CdDr1kjO7AXdSjnqCkWtLrMRh+BDXpv02mt
 P6OF5uVOAPQms0f7QNIOors/uqZi+7czHtP11azl2GVlgRlyk66b5Qtwf7jS3lzVT4ZY
 Ae4bwVAuVPpNdBBD3ZhU8rOQHvWDR2ayhO1MeN/lXlQ6iZveuSAYH7anb0O0Lm6Fuqgj
 dQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786609873; x=1787214673;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mOaM89HDkhz0YSMPBacVagDnalThEgWQpZeX3ZxGlSw=;
 b=PmCYRUmeXr5P+e6mgw3ki8UshFOuXLMTGyvYTdnqEqvaoymiNoAIydvoSg8E69zfqY
 5ED0ITQSyoanRFzl7RfEeIznNAg8+C5MnI0Uq6jzeCpOQ6vJUvKWM7dFs8MZSJppTUOj
 k3QchxSY3iUuZhRnIxcAzFyMHUs9bAoBGmSH9sblucnVHV0GQ//sV0Nxnw5hLbgWa8Vy
 HJNX16t64nELVlHmJLrhLN18TbUN2vSh3FephC9xIWOfYe1ixLqU9JVzi7t1RxOgh7A3
 vuZ5tDLNN6TXL50TYz6PheBI/BVQL4Ge+0glFPchcSluJBKCVAI6zl8hsKy/kW6w2EeL
 HABg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXq5wTG5/g52zjKlKsmNdXRkKzLWVDY1G5Av2gAGdLeNAt/L6FW1jzbAV8YZktZZQ2jIsigwKVPA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAzMiz49awvccHfkzFWN54JGKaQrE26J+dgKH2zB90pIKCnW2v
 48NLzt/w99doXcleTSoP5BdHTQvkhAysGZAZpRJEQUtCP+S4AGia92hMnfNeeXQsBYpiY6Pez/l
 Zj9Z16x6xK7Nf2Kqc+opKSRvQtbDfWBj4Dpy/27ssovUKVp/CSPHkzuu/7qFbnwd051Dx
X-Gm-Gg: AR+sD12i6SP5TWwLPYI3xEsKPyWoDhDe9isfxn5aJweAv+ABxlhAibtMXPcEwi7E7Z3
 TQy08KFmuyGoDDF2QRPHOK4BpiLbOhgVKPV7is6LxhTUn8NADKWZPmlNr14awPUbI3M87L/JN7L
 S4ZmjMzXrCdLSFxBjnzU39VJ1oR1/fi69PXbhJwt3BKR5Ib96E51P2WtwGCEhdABJWJGF+W3fnw
 KMksXBWRO/NXiZlAOxbZJTiX2H/PgaBCpeAi90R2cgE/0JsHiCa2gTTZH1vADTlg+JLwRPfDbMT
 icaeRAU5KwXgakmU/UqzmV6nBItlOIQ8zGBdUIg/WEP29oRKo0qC1VOVCF+R2knrD4lYejNB
X-Received: by 2002:a5d:5e0f:0:b0:47f:f002:3652 with SMTP id
 ffacd0b85a97d-48159ec134bmr3757716f8f.12.1786609872452; 
 Thu, 13 Aug 2026 01:31:12 -0700 (PDT)
X-Received: by 2002:a5d:5e0f:0:b0:47f:f002:3652 with SMTP id
 ffacd0b85a97d-48159ec134bmr3757608f8f.12.1786609871940; 
 Thu, 13 Aug 2026 01:31:11 -0700 (PDT)
Received: from localhost ([193.32.126.230]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a569c2bsm4834411f8f.12.2026.08.13.01.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 01:31:11 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:31:10 +0200
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
Message-ID: <20260813-shrewd-ocelot-of-research-aa3caa@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="suhigkbeilmgqoi7"
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


--suhigkbeilmgqoi7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next-fixes PR

Maxime

drm-misc-next-fixes-2026-08-13:
A single patch to remove a .orig file introduced by accident.
The following changes since commit bd4f284df04d76fd65e57141cb1e6e7a49e4c3cb:

  drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager (2026-08-06 23:38:04 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2026-08-13

for you to fetch changes up to 651b0bd0922b265c6c58d9dc84ef3fd00782a0cd:

  drm/panel: remove accidentally committed .orig file (2026-08-11 09:52:43 +0200)

----------------------------------------------------------------
A single patch to remove a .orig file introduced by accident.

----------------------------------------------------------------
Jani Nikula (1):
      drm/panel: remove accidentally committed .orig file

 drivers/gpu/drm/drm_panel.c.orig | 722 ---------------------------------------
 1 file changed, 722 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_panel.c.orig

--suhigkbeilmgqoi7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCan2AzgAKCRAnX84Zoj2+
dia+AYCP0BltvwyQ7/SqoocphlEHhiDyAjvq+dDu9CFmXSdQOB1lRjFEwC47joGA
25uFrlwBgLiZ39Yp78hmd7fnOHuL+iLCnGHba969jDwOPPbYHXPJSaiCOdVOWJS+
NkdPK3EBBQ==
=Y1KQ
-----END PGP SIGNATURE-----

--suhigkbeilmgqoi7--

