Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122D3103A9A0
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 07:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D002910E9A9;
	Thu, 26 Mar 2026 07:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Za0X7p2B";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bt2ATxO7";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCF210E9E8
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774509471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=jiAy5WF94udF9XSc7HvqXP/pL3x/y3FMYCC0P8YcHII=;
 b=Za0X7p2Bc2dN+4dpnfVxQPrkXNFNd27B6+DnoV2ZlEPmxA3aQ8IkhjR8CbVu58XXAdWK7R
 dG6enBJylusYvbbPeM6RGWQxPLY6BlkDnbb4720MGK6ipAsni9QMA8TkDrRtqodsyWmNxB
 upZuL6yW2I8nP1MqA9FIv9I6bzoGvBM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-SMOL0j8OMYO5s5OM9drqtQ-1; Thu, 26 Mar 2026 03:17:49 -0400
X-MC-Unique: SMOL0j8OMYO5s5OM9drqtQ-1
X-Mimecast-MFC-AGG-ID: SMOL0j8OMYO5s5OM9drqtQ_1774509469
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48542d5aa9eso4898975e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 00:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1774509468; x=1775114268; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jiAy5WF94udF9XSc7HvqXP/pL3x/y3FMYCC0P8YcHII=;
 b=Bt2ATxO7yi2Nj/xv/aPRSCc71GbVgoEwQy/1s2kXU4gN78Ce87gVqjhpHW06VMS6QT
 EgxTUuOSb6lBR5mEHQ/ujkG6DXVpnr45Rn63tHQQHBHlfW1FdirxTFuhUGDZlBF+GtBa
 URj0iEsOY8NFREhEx9Jy53MTvbp+AkbsaNxA71Fqd+iNOvDS/+lq2NkVHPv0ORHfWhLF
 ZosDByXDcjfWexyILBrVDvwaAerB9ok85lEz0fCXbQbJ5E+Yh9ZLEdTLKEJSljxPU4Zx
 YwLyar+0vJc27nLDDyQd0ZQDLs/1tyiXRz0PdNJ5eLTTHq5C3484ZAGhSj7rXSsHT9bP
 NkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774509468; x=1775114268;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiAy5WF94udF9XSc7HvqXP/pL3x/y3FMYCC0P8YcHII=;
 b=egO4kn1lmYTvAo9eVSYW5fN3B+MzBsZlvkbt+q0UiE7RYYBEyrFOUdr9PeBXbi/dn8
 74tH6w1cd/MrjY9ycZD+qQ83rKdEPuePX+kK7tu+E+pDVGzEbRsjxD+nfLcNy8wIE+Yp
 K9DGRJkGfRqtJ5ouGjiUFXqmIYg+fGHH2Rh7PthgNdbon8F4rSaftJbDLL2lvvm7v+ao
 KNlcvRZxxyd1AnEuwAsEF9lm4GZJbv7ZRDBuJv1QAraNwh/KpenWEuf+7URVj2r9mnn0
 RhlQXNJ7k55wA+HHMcj7YyzL3+CqTtrScj73iyL2uMy7C4Xzpz3SCM1o2z8B8G9dG+dG
 CntA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh7t+ECoZCHE9wIhLpDBKag7I/KthTCnrqNTOIqg+RmJSh2W0tq6T6l6W6y2eOZeB6EU1BhIG41w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCDUTnry5YsFZhrQCl103ATD6jIlIrPEFTY9wzFwWqP4nWnzwA
 4nvCeEkghys8HOO0q9JJkN5eFA5tkDN4uqpFSHHqSvtQlSdT5cEtksWMmbf9VL9rHX1tjvNNmgB
 R8ahV5FRbKdS+ZEfcpuzc/hbCC6u6tMGOOAITY+KeRUwYIGoWE3W7KAASk4vPU14L3YC/
X-Gm-Gg: ATEYQzxoCHBJZLAIKv86AJLeGOwszXkj3Qy3aBs6hlCpEJeFB66wjvpKuCGngC3gtpQ
 uuINkt4KHGxrZi8+5DIukL12OMsbc0Zwj/+NSKKZxM7qWyBpPRzpx/HNTD3GqI3UNAVFp6CUakB
 NcW693eHsPuPi1+PaISUIiIwyQyAhlxYwDzLfXJgNcMsO/rRGvC+UDGWz4LlwwwRtmlpHdu0Q0S
 3Twd8Zk0RVXfc6rJMDTwtmNFM+54hvNzTyRUGggmM7EpAYX7Vga1mWuehqBS1Bto9axcRuI2Jd+
 xHlfXnTUXKbTD/ozoi+hEvk/2S80hlqzcMkRq1ZSRew2/cOMkrjJ/+eP+FYqaxZy9jnUiZucIg=
 =
X-Received: by 2002:a05:600c:1f13:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-48715f03a9dmr96582355e9.0.1774509468592; 
 Thu, 26 Mar 2026 00:17:48 -0700 (PDT)
X-Received: by 2002:a05:600c:1f13:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-48715f03a9dmr96581895e9.0.1774509468078; 
 Thu, 26 Mar 2026 00:17:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722cb10fcsm11225905e9.14.2026.03.26.00.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 00:17:47 -0700 (PDT)
Date: Thu, 26 Mar 2026 08:17:46 +0100
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
Message-ID: <20260326-lush-cuddly-limpet-ab2aa9@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cwnmwkle24ojkev6"
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


--cwnmwkle24ojkev6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's the drm-misc-fixes PR for this week.

Maxime

drm-misc-fixes-2026-03-26:
A page mapping fix for shmem fault handler, a power-off fix for ivpu, a
GFP_* flag fix for syncobj, and a MAINTAINERS update.
The following changes since commit cffcb42c57686e9a801dfcf37a3d0c62e51c1c3e:

  drm/bridge: dw-hdmi-qp: fix multi-channel audio output (2026-03-17 18:15:16 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-26

for you to fetch changes up to 87a70013be7d1b96e7e160aea6dad4564b459868:

  MAINTAINERS: Update GPU driver maintainer information (2026-03-25 15:10:30 +0100)

----------------------------------------------------------------
A page mapping fix for shmem fault handler, a power-off fix for ivpu, a
GFP_* flag fix for syncobj, and a MAINTAINERS update.

----------------------------------------------------------------
Jianmin Lv (1):
      MAINTAINERS: Update GPU driver maintainer information

Karol Wachowski (1):
      accel/ivpu: Add disable clock relinquish workaround for NVL-A0

Pedro Demarchi Gomes (1):
      drm/shmem-helper: Fix huge page mapping in fault handler

Tvrtko Ursulin (1):
      drm/syncobj: Fix xa_alloc allocation flags

 MAINTAINERS                            |  8 +++++-
 drivers/accel/ivpu/ivpu_drv.h          |  1 +
 drivers/accel/ivpu/ivpu_hw.c           |  6 +++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 48 +++++++++++++++++++---------------
 drivers/gpu/drm/drm_syncobj.c          |  4 +--
 5 files changed, 41 insertions(+), 26 deletions(-)

--cwnmwkle24ojkev6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacTdmgAKCRAnX84Zoj2+
dg+wAX9OxIUCGifj+s86KPwDPO7VokI6o4YIxsIq4FaVEYDG06aP28ONJvOY16cE
S0H32/QBf2hW02MSDiCy3kCfkMqK7JklR835I6AxFwArcH9ET57QPYCbbbx3QxSz
hJCioCi4Cw==
=7e8m
-----END PGP SIGNATURE-----

--cwnmwkle24ojkev6--

