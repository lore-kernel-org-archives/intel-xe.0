Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF12F5140A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 06:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A675D10E387;
	Fri,  6 Mar 2026 06:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h3NmPB5a";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LcSe5VFQ";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F84B10E37F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 06:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772779277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MBTMJTT82PS0Pu/z8VlhrxomReyPLpqBl+fqlhabERY=;
 b=h3NmPB5arai41p0qfJxT6fnF0S5sn81BnEgSWoUWu46OBTsGRj/iYshr9kaLHN4UovXep6
 S2vbhYuTDCoaXqPhHG0z/7mP/FShoYNQN+vaJhKplZeB/fjT8105cSsTfgQhCaqPenagw/
 6Hz/6F4Zb/5aulKGi71007cLrpJ2Nmk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-Nt4qrQ-bMbGjPxde7PzxzQ-1; Fri, 06 Mar 2026 01:41:14 -0500
X-MC-Unique: Nt4qrQ-bMbGjPxde7PzxzQ-1
X-Mimecast-MFC-AGG-ID: Nt4qrQ-bMbGjPxde7PzxzQ_1772779273
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4837907ec88so98284215e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 22:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772779273; x=1773384073; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBTMJTT82PS0Pu/z8VlhrxomReyPLpqBl+fqlhabERY=;
 b=LcSe5VFQLk58/RzrOg/fPe3zRaieLQoS1DaWsCjRC9CoAc7cVPdAftdmwn4V7YR3um
 ikj4KQy3mj/oU/byOujYl/8oDQPrMjP0aq1INAxxq+G04D1xV0mq8AJ1zfvDkU15nVyx
 A67ET8I7NdeH4tzk0bNIdsOseY6NPQPSDOMIqFP8sHpD0igqjLtgyYJkR4EV8ehun8H+
 a2FBFbO4gAsz2vIPaqww+djF2AB2SY8NSk6FiFYGrbTCgZfb+Zdg8Sx0MnTYU3jO1s6p
 FsoiWRO48dRvu+qsX499XL7QhhDk6HYg1Hfjde+SZejHjSk8ppRvh/K3zNI0+z2rqNr7
 QlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772779273; x=1773384073;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MBTMJTT82PS0Pu/z8VlhrxomReyPLpqBl+fqlhabERY=;
 b=EZ4Co92CaBsA9SNdMo9DcMq19tLQZV5j2q2NPvEXBusT98JS+zgBYlSHGg7crCtKiV
 7+5lboiNUPoM1u0Wd1ROVXUOyW2RCDiw9DKXO2/Z6okfD509Jmvm8OUPhSXxHZiKg4O+
 q7JHPzdjIZsLspSHxJnlBfYZ1MhRPUYQMt/PIH7gQdHkyWMeyp5ba7aC5GkEXIwIrEzc
 z/rXswX/L/qrisH0CgZLt9ASqbS5nbDG9TBdzb/17ui5WQiZss0AwHURw+3dnypFUw3b
 vn6KnSqPGMnKpfgviXLL+YN62N5FpCBnmwYdcGmYyHHFLGSFL8Rrtk7XmTMelD9guk6D
 K5QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiMcKuQGFaw07Q6xumnBOAYYF0X7C7j2OjiUv6VhNxeK5PfO1XGngiSvrFqVOPt16KC7IUlprJQA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc4g5Un9pzQJJV0sqPH9SGoTeYu2yvi+cnb/DGQaMmk8dDgeVF
 lYqQzkwAfaEpR0ZsfboeNS7GjN+nueH55JrYEH+/cWI9ImP6vFGIu+hf+nmixZv6kkZRKn9pDwr
 1Ze+p0mTpyylvWwG/cU6ptakIKBTWby3fRI+YHGjWQWnT1FqFnounI3gPBwDgpu1nfchJ
X-Gm-Gg: ATEYQzwfSsmBCJF0SLnKfZcNyE3tgHnQLCeSUCJYbyvImdeShhGIJ1zF3P8+aIWVZ02
 Q6auG/OHos/GGSDrG+njEKzW88HnE4vcD1Say1xBdXxcE+okHqhVIxvcihZB5BpdVxemcA2tCnL
 hdR8zzlIKKFXhIIGFMkxpp9S2sRkRW/1jvCAd3EREbWZ/O2N+JwSG53dKA3yZjd9GlY1QA1urvy
 70pyV+wqMaJ10zKNZeN9A3DCwfGKYUxSMkvg1hBC8/D/7FgyifPbtL6odT7yWLC9PzkTRegF7U5
 1JpPL80ioeYK4LWm2L6yP++g/9i/PwgSJaIJradbqvnqiAPxi9f58+ZkJiwJnVQyPWd8rUlDOw=
 =
X-Received: by 2002:a05:600c:3b0c:b0:477:7b16:5fb1 with SMTP id
 5b1f17b1804b1-48526918939mr14036675e9.7.1772779272516; 
 Thu, 05 Mar 2026 22:41:12 -0800 (PST)
X-Received: by 2002:a05:600c:3b0c:b0:477:7b16:5fb1 with SMTP id
 5b1f17b1804b1-48526918939mr14036375e9.7.1772779271987; 
 Thu, 05 Mar 2026 22:41:11 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485245dbf04sm10997855e9.14.2026.03.05.22.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 22:41:11 -0800 (PST)
Date: Fri, 6 Mar 2026 07:41:10 +0100
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
Message-ID: <20260306-grumpy-pegasus-of-witchcraft-6bd2db@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kz3gnqntjfip7uxz"
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


--kz3gnqntjfip7uxz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Sima, Dave,

Here's a new drm-misc-fixes to fast-track the syncobj revert.

Maxime

drm-misc-fixes-2026-03-06:
Another early drm-misc-fixes PR to revert the previous uapi fix sent in
drm-misc-fixes-2026-03-05, together with a UAF fix in TTM, an argument
order fix for panthor, a fix for the firmware getting stuck on
resource allocation error handling for amdxdna, and a few fixes for
ethosu (size calculation and reference underflows, and a validation
fix).
The following changes since commit 75c151ceaacf5ca8f2f34ebf863d88002fb12587:

  accel/amdxdna: Use a different name for latest firmware (2026-02-25 13:51:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-06

for you to fetch changes up to 021f1b77f70d62351bba67b050b8d784641d817f:

  accel: ethosu: Handle possible underflow in IFM size calculations (2026-03-05 15:21:17 -0600)

----------------------------------------------------------------
Another early drm-misc-fixes PR to revert the previous uapi fix sent in
drm-misc-fixes-2026-03-05, together with a UAF fix in TTM, an argument
order fix for panthor, a fix for the firmware getting stuck on
resource allocation error handling for amdxdna, and a few fixes for
ethosu (size calculation and reference underflows, and a validation
fix).

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Correct the order of arguments passed to gem_sync

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

Lizhi Hou (4):
      accel/amdxdna: Fill invalid payload for failed command
      accel/amdxdna: Fix NULL pointer dereference of mgmt_chann
      accel/amdxdna: Fix major version check on NPU1 platform
      accel/amdxdna: Split mailbox channel create function

Maarten Lankhorst (2):
      drm/ttm/tests: Fix build failure on PREEMPT_RT
      Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty stack"

Rob Herring (Arm) (3):
      accel: ethosu: Fix job submit error clean-up refcount underflows
      accel: ethosu: Fix NPU_OP_ELEMENTWISE validation with scalar
      accel: ethosu: Handle possible underflow in IFM size calculations

Thadeu Lima de Souza Cascardo (1):
      drm/ttm: Fix bo resource use-after-free

Tvrtko Ursulin (1):
      drm/ttm: Fix ttm_pool_beneficial_order() return type

Yujie Liu (1):
      drm/sched: Fix kernel-doc warning for drm_sched_job_done()

 drivers/accel/amdxdna/aie2_ctx.c               | 23 +++---
 drivers/accel/amdxdna/aie2_message.c           | 36 +++++++---
 drivers/accel/amdxdna/aie2_pci.c               | 66 +++++++++--------
 drivers/accel/amdxdna/aie2_pci.h               |  1 +
 drivers/accel/amdxdna/amdxdna_ctx.c            | 27 +++++++
 drivers/accel/amdxdna/amdxdna_ctx.h            |  3 +
 drivers/accel/amdxdna/amdxdna_mailbox.c        | 99 +++++++++++++-------------
 drivers/accel/amdxdna/amdxdna_mailbox.h        | 31 ++++----
 drivers/accel/amdxdna/npu1_regs.c              |  2 +-
 drivers/accel/ethosu/ethosu_gem.c              | 12 +++-
 drivers/accel/ethosu/ethosu_job.c              | 28 +++++---
 drivers/gpu/drm/nouveau/nouveau_connector.c    |  3 +
 drivers/gpu/drm/panthor/panthor_sched.c        |  9 +--
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 16 ++++-
 drivers/gpu/drm/scheduler/sched_main.c         |  1 +
 drivers/gpu/drm/solomon/ssd130x.c              |  6 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c        |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                   | 11 ++-
 drivers/gpu/drm/ttm/ttm_pool_internal.h        |  2 +-
 include/uapi/linux/dma-buf.h                   |  1 +
 20 files changed, 234 insertions(+), 147 deletions(-)

--kz3gnqntjfip7uxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaap3BgAKCRAnX84Zoj2+
dmI9AYDUmiFfUsIsj2U3URAGqZ6O3I1d+mBR/H0pOHlyfCrDWBudIsqlbnwERpWy
Q3oOMd8BgKh1s//puJCYmLkT+2L0A7g1bStPgDeThF6KTbyY70W3etZ8e/0k8284
6zHxkZJjnA==
=ozcz
-----END PGP SIGNATURE-----

--kz3gnqntjfip7uxz--

