Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951D4FAD40B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 05:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D8A10E2F2;
	Thu, 23 Apr 2026 05:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W4M7UY0n";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T7R5wMKI";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E3C10E2F2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776922916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=im1Mdl348sFe/nlHqsRdHrLzuKk+QKDCsvoUlJwx48Q=;
 b=W4M7UY0n3jJpsbahTo7ExBYE1K4A5E/pAAilydXsyI0ET/d3jv8XIBaTwS4P76POijLlQV
 45cENkme0WFx63C3qbB6oN02ycG0o6dLiE0PZOXp8pQN8tKXVQBcMH5AEBNOHJBl0DP2Tk
 VlxT+VmBLUVH03xwDgmvECvsRrZMmSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-fjMVmnFrMCqcTzL9es-xWg-1; Thu, 23 Apr 2026 01:41:53 -0400
X-MC-Unique: fjMVmnFrMCqcTzL9es-xWg-1
X-Mimecast-MFC-AGG-ID: fjMVmnFrMCqcTzL9es-xWg_1776922912
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48a55d82e0eso19229735e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 22:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1776922912; x=1777527712; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=im1Mdl348sFe/nlHqsRdHrLzuKk+QKDCsvoUlJwx48Q=;
 b=T7R5wMKIV6vAD8aFxSf2wLunoOjq9PvSy2vUd6Jzpq1bxvGRQL/OkGavt89Jb3D5fk
 2tm8GFvr1WR94wX7/kb5oHnTP5TgNBOd/7I5SO4AwFi47nJhOu0LOy1qehGAUUNHHTQG
 RJjo1QvNwjKBP8YFeT9krOzByxDg4/LvNlltEDJZOi6HQeBK/480/6RTFN+GPhc7tZId
 3KYuMLkExaxctd66ekFbNo6N6CrQ3JPIT+XsvNmvbxE3u827gd4Mr7P4QxYTdRNJX9bC
 ngf7B8I6cqMHfcXpfK/8RWxn7elCICNj38AD/JyIA2A8jk2R1RTbUhifgTb17ZRkiaz0
 zhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776922912; x=1777527712;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=im1Mdl348sFe/nlHqsRdHrLzuKk+QKDCsvoUlJwx48Q=;
 b=FlfS0wLRe7GDBJ/uasB5lluG0L/EoxgABsaRtGStkBmSM1DfPTkYkRDyNe6BzZknGi
 gKi3u7jZBqv8c0AuzcfXO+MAwpvxWhicOE9dPvqLKPSQrRSiVSBI9TB8+Mmu1Ix2DYnW
 GN+xiK/XcLwDw9k07E6SaaIB4HxnHcq54p6V8R2Ku+SCTFMu1Ywio7wNNONVlW6q2YYX
 TOS9SI695z0taRsqJILHIJfP7hDFOPuhluqg0ORunYw0EOhS9H/MythU2BQrhJX7Xuoc
 j9wxG4os9q1xg7YOOmTPryxn+Sb/zs9LgpDTbThkamJlb7IVAKQ4T8feYjr2oH+cAHTZ
 wPnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5GvH/uY8fYOWylYqnUPhG1G464qBCOe4se+7VFGeN2TScbag4ej176vQbSIePSJPd/KoK/NyVIQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu8uHL4o1TbvvUmh/Q7fTELu/HH/JQQCUUW5N2sopVlKQkIq41
 LsmODPs47C4E25tXwXwOBgrnxQBhELHBq+t8IkuCv8ZBkSz9tEKorK/iY3MI4wyh3nJUS9J44ya
 NsidXSLMqnzWYyyMJyBkQvRVc1FG6Y++OGMtJtXaI+LW1BDACMLrWr4rchG40PfTp/a5g
X-Gm-Gg: AeBDietXnGT4lm/xJJD/MlxIJBcqRPeVeUHDeRQO63E9HFFl/fC+Bm1jYU0IX55Akpz
 BlaHGD804zMrrhYrkzKnZHVdWf8bUKV8d9zXQlIOU18dsEE+9b5jiP2+64XmeLMsT0g5XZIKW/i
 nn4j6/lt6wmwfyuo7vTTOC6VezA9L1E8Mb9eWzsG94+7VDOjU4yIjDYnGQ/bkf8ADewqmEPolA4
 zb96J0QE+443h8spsAiIhMB5tJIsCGI8zoH/Y9mZnaXBnRQR+XoUvkTKk3XjOUvMDdpp3Dl8hBh
 Wkve5ajEWDTj0woJOT7EzrS4zKyAquv6Z9xmWwVn4rTtfDZfL4L206oHsjC9e6PfGqxOiV2jH3E
 tZ/kuLayI
X-Received: by 2002:a05:600c:c106:b0:489:1ba8:5be9 with SMTP id
 5b1f17b1804b1-4891ba85d07mr162132785e9.29.1776922912395; 
 Wed, 22 Apr 2026 22:41:52 -0700 (PDT)
X-Received: by 2002:a05:600c:c106:b0:489:1ba8:5be9 with SMTP id
 5b1f17b1804b1-4891ba85d07mr162132555e9.29.1776922911860; 
 Wed, 22 Apr 2026 22:41:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb767961sm148312475e9.16.2026.04.22.22.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 22:41:51 -0700 (PDT)
Date: Thu, 23 Apr 2026 07:41:50 +0200
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
Message-ID: <20260423-realistic-eager-reindeer-4dacf7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="swzqgswgrxkw3gj3"
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


--swzqgswgrxkw3gj3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Sima, Dave,

Here's this week drm-misc-fixes PR.

Please not that the last commit (2fc87d37be1b) has a missing link and
creates a dim warning.

Maxime

drm-misc-fixes-2026-04-23:
This week in drm-misc-fixes, we have:
- A patch to raise the vblank timeout to avoid it on virtual drivers
- a state check fix for stm_lvds
- a use-after-free fix for dma-buf
- a mapping fix for panthor
- a device_node reference leak fix for arcgpu
- a bridge reference leak fix for dw-mipi-dsi
- a sparse warning fix for dma-fence
- a kconfig fix for hv
- a memory leak fix for nouveau
- a fix to duplicate colorop when duplicating states
- a panel initialisation order fix for visionox-rm69299
- a fix to prevent an infinite loop for v3d
- an overflow fix for nouveau
The following changes since commit 857fa8f2a5b184c206c703a3d9ce05cea683cfed:

  accel: ethosu: Add hardware dependency hint (2026-04-02 15:18:14 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
26-04-23

for you to fetch changes up to 2fc87d37be1b730a149b035f9375fdb8cc5333a5:

  drm/nouveau: fix u32 overflow in pushbuf reloc bounds check (2026-04-20 2=
1:23:14 +0200)

----------------------------------------------------------------
This week in drm-misc-fixes, we have:
- A patch to raise the vblank timeout to avoid it on virtual drivers
- a state check fix for stm_lvds
- a use-after-free fix for dma-buf
- a mapping fix for panthor
- a device_node reference leak fix for arcgpu
- a bridge reference leak fix for dw-mipi-dsi
- a sparse warning fix for dma-fence
- a kconfig fix for hv
- a memory leak fix for nouveau
- a fix to duplicate colorop when duplicating states
- a panel initialisation order fix for visionox-rm69299
- a fix to prevent an infinite loop for v3d
- an overflow fix for nouveau

----------------------------------------------------------------
Adri=E1n Larumbe (2):
      drm/panthor: Extend VM locked region for remap case to be a superset
      drm/panthor: Fix outdated function documentation

Andi Shyti (1):
      dma-buf: fix UAF in dma_buf_put() tracepoint

Ashutosh Desai (1):
      drm/v3d: Reject empty multisync extension to prevent infinite loop

David Carlier (1):
      drm/nouveau: fix nvkm_device leak on aperture removal failure

Greg Kroah-Hartman (1):
      drm/nouveau: fix u32 overflow in pushbuf reloc bounds check

Guido G=FCnther (1):
      drm/panel: visionox-rm69299: Make use of prepare_prev_first

Luca Ceresoli (1):
      drm/arcpgu: fix device node leak

Marek Vasut (1):
      drm/bridge: stm_lvds: Do not fail atomic_check on disabled connector

Melissa Wen (1):
      drm/drm_atomic: duplicate colorop states if plane color pipeline in u=
se

Osama Abdelkader (1):
      drm/bridge: dw-mipi-dsi: Fix bridge leak when host attach fails

Thomas Zimmermann (2):
      drm/atomic: Increase timeout in drm_atomic_helper_wait_for_vblanks()
      hv: Select CONFIG_SYSFB only for CONFIG_HYPERV_VMBUS

Tvrtko Ursulin (1):
      dma-fence: Silence sparse warning in dma_fence_describe

Yongbang Shi (1):
      MAINTAINERS: split hisilicon maintenance and add Yongbang Shi for hib=
mc-drm matainers

 MAINTAINERS                                    | 13 ++++++++++---
 drivers/dma-buf/dma-buf.c                      |  3 +--
 drivers/dma-buf/dma-fence.c                    |  4 ++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c  |  6 +++++-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c |  6 +++++-
 drivers/gpu/drm/drm_atomic_helper.c            | 14 +++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_drm.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c          |  2 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c |  2 ++
 drivers/gpu/drm/panthor/panthor_gem.c          |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c          | 19 +++++++++++++++++++
 drivers/gpu/drm/stm/lvds.c                     |  6 +++---
 drivers/gpu/drm/tiny/arcpgu.c                  |  3 ++-
 drivers/gpu/drm/v3d/v3d_submit.c               |  5 +++++
 drivers/hv/Kconfig                             |  2 +-
 include/drm/drm_atomic.h                       |  3 ++-
 16 files changed, 73 insertions(+), 19 deletions(-)

--swzqgswgrxkw3gj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaemxHgAKCRAnX84Zoj2+
dlsIAX9sodnjELE5YmNVL7DybjaekNLOGtKOJzfl6/eK7+uS8pRI8EbgnRAO2ljb
drSc1XsBfjyJa7q+5VqLjoptvmH3siWEekHEEhjTljt9uxlOgl/WWM11WrEtgRFH
vlvEGOO2eg==
=i8kY
-----END PGP SIGNATURE-----

--swzqgswgrxkw3gj3--

