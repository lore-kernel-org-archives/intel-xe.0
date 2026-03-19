Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A81107526C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 07:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF22B10E8BE;
	Thu, 19 Mar 2026 07:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Np9CA8Bt";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dQ6gu9Oe";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7751F10E8BA
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773904839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=fe51MXVKNtt97IK2v9bXGEUIRb61ACw33tyTc00UOXY=;
 b=Np9CA8Bts4voxUMPfBYje1wJSAOb9Vr6cq0vBBBlueOLSGolxbufjpqTeU5+Ur9K60c6/q
 i+umlHc26Oniki+MxL5IbC6juGFfGUBtk6WJyi5xp6c9+ZJ3EZjnVVWQ1ygjZaUfXxKpuS
 RSfwxffaVn7UYbfXyGSB2LywXEBCayw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-Tb7GB5-uPmKggagpvodrlQ-1; Thu, 19 Mar 2026 03:20:35 -0400
X-MC-Unique: Tb7GB5-uPmKggagpvodrlQ-1
X-Mimecast-MFC-AGG-ID: Tb7GB5-uPmKggagpvodrlQ_1773904835
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4837b6f6b93so10166045e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1773904835; x=1774509635; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fe51MXVKNtt97IK2v9bXGEUIRb61ACw33tyTc00UOXY=;
 b=dQ6gu9Oe500G8z3ctIHRh1xTkOjsUXWCQIMtntY/iaLveSdrjQzHAlfmST4qP3wwRu
 NU04PWBaBOJUHNl4tspy1bRf0GoPYRb4ZVdT6ZyMUr+rdVxClsAgj5RyMKNU2/ULGjig
 V2cgw4pGBehrJkiLfBAPZpxZ5C96PG1TZCKVpDvrij6AxfBzQEHgPwZUuUKsou/JbtRa
 ED5GVg+L820detKiIUhhOCrwe1jQ6mzNKsf/u0CDV0dyNkrq7f/ZIY7vQTGbzV7QMcPX
 hUBCoYvXs98wGZ8C/mWdKK3pY91zJIE/0Dg9sZK11kx9eLKZbtDQ8qkDyvJFE+ZJQSQp
 wy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773904835; x=1774509635;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fe51MXVKNtt97IK2v9bXGEUIRb61ACw33tyTc00UOXY=;
 b=ol9GNhV6WqpFqmiRZ5bw02aMJ7eybJH7+XRAAdchQ3I70yTQ9tkPq9lOTHK6rT1LGD
 7gWdT39QmBa17vICZj3oH27dD6jXteTJtGa5qWJU5DW3oNT16XjP8aCHvoYw7l0m7Kfu
 Fzs1HEf871jDHDfx7GavWT1U1YUuL+Jussg/Img+2pPYQVUhyvVnNZqJkgJ2Z0WS/nN+
 HJ+aEJYXJKtKVn0tlfc6ErTqGHMnsLh1ObtqzOscN9KVt4pg8jpFsO7+FQBZuSiwh+PR
 n1PoXzTG/HnV7hB38qkeSx0G9d8loj2XvdDXp0Haz9fJgLdLS9zPNi3zDkjlxgVq84Wt
 D8mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwmta4DCyfck57eZ/elpBhGZIzwO4qXM5byGXLKLWBjwTyL7CdHsCOyS2aqXBDIqCdYp5m4N0vVA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywke01KOsD2Oc7vP0+CiUN6n0VTROQmJ3BkZZ9au5Z4kbr0xVOn
 dX1BeN0nbMtFRiVPRInJLO1s86caLOBTOHfyr49dkK7DXP6HO8ISDttRQB6NT5EvdJ1K05gBB4s
 JTSj9DDqd35t/TP+EA/LGjURy+GmSl2GbtSmvlcehdSgVXqjwDhUzol3PUzqRpHTWLUCp
X-Gm-Gg: ATEYQzwH/o+HKNCKtv7l0KLafnU7vDzq19I2VHU9L7/3ipvk9u0Hd0Gc3a9mgIWxgQv
 N23uMOwEwL7N4zDje5/DtVp08810cVFHuL53qk+ues+VU4Y0rglj7NsKFE7Bu8gAVo6gbIX63fg
 +/xhK4YwezeyS+DcJSaxy3a0syOH5760ZJyDJu1NUkGQ+5E8OGNUxUwOzg5IahILqs7KOcqjeq6
 8GIZDmc9cpIoxk32ulwF7Y312JODs7+001Su+pJUF8XqC58f9vbLikE9OXfDfP9SS1GMQS7O60e
 nM6PvA0R5YBnPRM/29IoQ9j2Ea95h2Gy56CBaXA3EL1Q+lVoEpaHm7ZJNjGwA1Hh+yQZQLqBOg=
 =
X-Received: by 2002:a05:600c:1d10:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-486f4422046mr101607185e9.5.1773904834535; 
 Thu, 19 Mar 2026 00:20:34 -0700 (PDT)
X-Received: by 2002:a05:600c:1d10:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-486f4422046mr101606445e9.5.1773904833968; 
 Thu, 19 Mar 2026 00:20:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c4aa85sm37232575e9.12.2026.03.19.00.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 00:20:33 -0700 (PDT)
Date: Thu, 19 Mar 2026 08:20:32 +0100
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
Message-ID: <20260319-lush-righteous-malamute-e7bb98@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="svf7amwab55hyikj"
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


--svf7amwab55hyikj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2026-03-19:
A doc warning fix and a memory leak fix for vmwgfx, a deadlock fix and
interrupt handling fixes for imagination, a locking fix for
pagemap_until, a UAF fix for drm_dev_unplug, and a multi-channel audio
handling fix for dw-hdmi-qp.
The following changes since commit 49973e2a4156a88e46ba1c1c484b7c214199a181:

  drm/loongson: Mark driver as orphaned (2026-03-11 10:15:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-19

for you to fetch changes up to cffcb42c57686e9a801dfcf37a3d0c62e51c1c3e:

  drm/bridge: dw-hdmi-qp: fix multi-channel audio output (2026-03-17 18:15:16 +0100)

----------------------------------------------------------------
A doc warning fix and a memory leak fix for vmwgfx, a deadlock fix and
interrupt handling fixes for imagination, a locking fix for
pagemap_until, a UAF fix for drm_dev_unplug, and a multi-channel audio
handling fix for dw-hdmi-qp.

----------------------------------------------------------------
Alessio Belle (3):
      drm/imagination: Fix deadlock in soft reset sequence
      drm/imagination: Synchronize interrupts before suspending the GPU
      drm/imagination: Disable interrupts before suspending the GPU

Ian Forbes (1):
      drm/vmwgfx: Don't overwrite KMS surface dirty tracker

Jonas Karlman (1):
      drm/bridge: dw-hdmi-qp: fix multi-channel audio output

Jonathan Cavitt (1):
      drm/pagemap_util: Ensure proper cache lock management on free

Maarten Lankhorst (1):
      drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug

Randy Dunlap (1):
      drm/vmwgfx: fix kernel-doc warnings in vmwgfx_drv.h

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c |  2 +-
 drivers/gpu/drm/drm_file.c                   |  5 +-
 drivers/gpu/drm/drm_mode_config.c            |  9 ++-
 drivers/gpu/drm/drm_pagemap_util.c           | 14 ++---
 drivers/gpu/drm/imagination/pvr_device.c     | 17 -----
 drivers/gpu/drm/imagination/pvr_power.c      | 51 +++++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          | 93 +++++++++++++++++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          |  3 +-
 8 files changed, 114 insertions(+), 80 deletions(-)

--svf7amwab55hyikj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabujvwAKCRAnX84Zoj2+
dt5cAXdNUS7Cy30+bodwJCDRPxeogAOQhkcxDIgdpuu4Or3t7kzK9/rIyljyU2vE
fCUqwAF/TqqwgmaI8Fj+kF8N6FhhDute9hnDVR5+4J1oEHEzIK+LFFmNOSVgF/uG
zw/BSthq
=1aoG
-----END PGP SIGNATURE-----

--svf7amwab55hyikj--

