Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12158C49EA1
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 09:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE08A10E8C4;
	Thu,  1 Aug 2024 09:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MRRbYz6o";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0545210E8C4
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722502868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=VVy04qlicabYGwO9E78vZLpSrWOCtQ9jEqVfKoqcSf8=;
 b=MRRbYz6oC/vEEOOmxGeIo/UpRK/cJQlgObOkQ129FUNDKU357xM/8bHJQBiOGTUdX6dn8e
 5rqcJOiBsYvmuYFOl+7rsSIj0Qy3bLFe6MLcKBP61V/7e6gkps7NDyBTdAG541Gh1jpYFX
 gpvje3QalkA+QXYU1SLhtx8yJzsddN4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-A9LT87ToMvSSFO0C_OAmxg-1; Thu, 01 Aug 2024 05:01:02 -0400
X-MC-Unique: A9LT87ToMvSSFO0C_OAmxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42816aacabcso39933495e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Aug 2024 02:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722502861; x=1723107661;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VVy04qlicabYGwO9E78vZLpSrWOCtQ9jEqVfKoqcSf8=;
 b=hHraqnknL+zXVLz/3xvL1g2W3x8PWxXFvhmY8rmB5ZGY9SvHSpR55k2UVFiHi0Gh7D
 hdYQNUrUtKg8plFdtGvLiXdvMOZFi1qBM0qAdDsQzSxDolLiT9jWwgwyqhZYhoVtnVW0
 Ow9Lt2WjbVsxCgoz/9Oj1QC5HKtcqq0Fi9OKqAOYAhY+aybkHBSihFZtAYtUiNYuE5wY
 tYqRnZvPd9pFVAtsKNjF2elzXi0s0NzYssda4jQXvpFs7WTe2IzK5seLJLrvflj9xzuq
 DoCdMS8YqkHJbI9/pbhpDImljijClw5+1kyI2SBK8yzH1hOkOMuDBaFB+VACGsLUwLoU
 rAXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/XtR3tgBIQ9hP+6MOW+YF/3lXBlo5n0NEkYkHdf4YJE2DKmD6Ba1hk8TxB9N3MASIaF9FYewCdag9QoPXhMNmuwAdaKM/BM8I84gx4fQ=
X-Gm-Message-State: AOJu0Yw5G/++6JxtvT81JC6sJXxzL1YfqvSOk50qEiTmddFbTc26c7sG
 0chqBCWOa+UNkyIAyzAkyRl3e1f6zqjp2kdqnRSYqeXbRLS1e33B8SjN0zb7sdjZF7kHJcT/tW2
 1lIssxAh7qheKA6EjVPX41QpuG8FEhEsR8HpMqMTDPDWWb811mEqAVUK2mpv3Q8A2
X-Received: by 2002:a05:600c:4514:b0:428:1c91:bddd with SMTP id
 5b1f17b1804b1-428a9bdce8dmr10882255e9.12.1722502861302; 
 Thu, 01 Aug 2024 02:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOF+RQH/Yfx80fHFFG578G7SW7PC5bILIQjj9sqIa5NcOIdEEPqygjeh3rBRIU/UHPSL0POw==
X-Received: by 2002:a05:600c:4514:b0:428:1c91:bddd with SMTP id
 5b1f17b1804b1-428a9bdce8dmr10882035e9.12.1722502860699; 
 Thu, 01 Aug 2024 02:01:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282baa9071sm49287965e9.13.2024.08.01.02.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 02:01:00 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:00:59 +0200
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
Message-ID: <20240801-interesting-antique-bat-2fe4c0@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4x23wimwhbqfwbel"
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


--4x23wimwhbqfwbel
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-08-01:
A couple drm_panic fixes, several v3d fixes to increase the new timestamp A=
PI
safety, several fixes for vmwgfx for various modesetting issues, PM fixes
for ast, async flips improvements and two fixes for nouveau to fix
resource refcounting and buffer placement.
The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
24-08-01

for you to fetch changes up to 9c685f61722d30a22d55bb8a48f7a48bb2e19bcc:

  nouveau: set placement to original placement on uvmm validate. (2024-08-0=
1 01:22:12 +0200)

----------------------------------------------------------------
A couple drm_panic fixes, several v3d fixes to increase the new timestamp A=
PI
safety, several fixes for vmwgfx for various modesetting issues, PM fixes
for ast, async flips improvements and two fixes for nouveau to fix
resource refcounting and buffer placement.

----------------------------------------------------------------
Andr=E9 Almeida (2):
      drm/atomic: Allow userspace to use explicit sync with atomic async fl=
ips
      drm/atomic: Allow userspace to use damage clips with async flips

Dan Carpenter (1):
      drm/client: Fix error code in drm_client_buffer_vmap_local()

Danilo Krummrich (2):
      drm/gpuvm: fix missing dependency to DRM_EXEC
      drm/nouveau: prime: fix refcount underflow

Dave Airlie (1):
      nouveau: set placement to original placement on uvmm validate.

Dmitry Osipenko (1):
      drm/virtio: Fix type of dma-fence context variable

Ian Forbes (2):
      drm/vmwgfx: Fix overlay when using Screen Targets
      drm/vmwgfx: Trigger a modeset when the screen moves

Jammy Huang (1):
      drm/ast: Fix black screen after resume

Maxime Ripard (2):
      Merge drm/drm-fixes into drm-misc-fixes
      Merge drm-misc/drm-misc-next-fixes into drm-misc-fixes

Philip Mueller (1):
      drm: panel-orientation-quirks: Add quirk for OrangePi Neo

Qiuxu Zhuo (1):
      drm/fb-helper: Don't schedule_work() to flush frame buffer during pan=
ic()

Thomas Zimmermann (1):
      drm/ast: astdp: Wake up during connector status detection

Tvrtko Ursulin (5):
      drm/v3d: Prevent out of bounds access in performance query extensions
      drm/v3d: Fix potential memory leak in the timestamp extension
      drm/v3d: Fix potential memory leak in the performance extension
      drm/v3d: Validate passed in drm syncobj handles in the timestamp exte=
nsion
      drm/v3d: Validate passed in drm syncobj handles in the performance ex=
tension

Zack Rusin (4):
      drm/vmwgfx: Fix a deadlock in dma buf fence polling
      drm/vmwgfx: Make sure the screen surface is ref counted
      drm/vmwgfx: Fix handling of dumb buffers
      drm/vmwgfx: Add basic support for external buffers

Zenghui Yu (1):
      kselftests: dmabuf-heaps: Ensure the driver name is null-terminated

 drivers/gpu/drm/Kconfig                            |   1 +
 drivers/gpu/drm/ast/ast_dp.c                       |   7 +
 drivers/gpu/drm/ast/ast_drv.c                      |   5 +
 drivers/gpu/drm/ast/ast_drv.h                      |   1 +
 drivers/gpu/drm/ast/ast_mode.c                     |  29 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   5 +-
 drivers/gpu/drm/drm_client.c                       |   2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  11 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   6 +
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   3 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   1 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   4 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |  44 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   | 121 +++--
 drivers/gpu/drm/virtio/virtgpu_submit.c            |   2 +-
 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h         |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 | 127 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  40 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  62 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 504 +++++++++--------=
----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c              |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               | 174 ++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            | 280 +++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |  40 +-
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c |   4 +-
 32 files changed, 1051 insertions(+), 589 deletions(-)

--4x23wimwhbqfwbel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqtOywAKCRAnX84Zoj2+
dkHiAYCxDpXhwry8GZfYbZBBrEyTlauUpCxBdpk+tJUjtnvbxUFo4LHyqcInQKqA
jaT0Bq4BfRuplso65coad1/JlMMOyu5PKL2ekOdaNPr8Cjj3E1l6j0hw+krUk0w9
Rf1rlCbNAA==
=Z73m
-----END PGP SIGNATURE-----

--4x23wimwhbqfwbel--

