Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A245CC6B1D
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 07:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00510F132;
	Thu,  2 Apr 2026 07:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IKiVop3z";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WynND31R";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2E010F14C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775116331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=FvsWPlqmbOTslEl+opiYN/LrLejN3naTFWYzUkcHCYw=;
 b=IKiVop3zZ1bdjDsgorGSeiumpWPPGSe20M+MsqjwbLCdWdG+AvGni/6hcCiBg5knaMB7VL
 GT+5iM8fSgUoatEWLem6sGDVBiMx4okZI+UeNvz9CnKiuH/Xh1rsMpmubA3ztsyLAFEcS4
 7QueTgUjZGsfyNWdBF14LARFYFyiqL8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-4wpz58w8OmCNErxzskn0dg-1; Thu, 02 Apr 2026 03:52:07 -0400
X-MC-Unique: 4wpz58w8OmCNErxzskn0dg-1
X-Mimecast-MFC-AGG-ID: 4wpz58w8OmCNErxzskn0dg_1775116326
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43d02fa5860so605152f8f.0
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Apr 2026 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1775116326; x=1775721126; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FvsWPlqmbOTslEl+opiYN/LrLejN3naTFWYzUkcHCYw=;
 b=WynND31RCCyyikLYjl98lr2p3hdX0011GvZwsl8AlGyfKwGvrxwySYObol+o8/f11l
 wvcF/i7YVEBYeWfKceDRtsDbKAA0qfBctaz2apY3RrpEXJSqPqCDi4xClI0CuoRnztLF
 A8fDgTGLi0YWXZSmZqYQdbrXYCx/YspfnoqA3CzwPKdXFT+FuIq7ewH6Hs6PzHGAixS3
 qZUOhOGJlSdSXeE3kgjcXLKMP/g1zZxlYyQ/8p3D0TjdNGUyfNAkgq7FxCtYHYf8k7PD
 kKx7g/zjprON24leDJ8zixLwFLHg8FiNWHYeJBq933n35iPK0tc5Jz13TZK13mPRBzDr
 pXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775116326; x=1775721126;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FvsWPlqmbOTslEl+opiYN/LrLejN3naTFWYzUkcHCYw=;
 b=YLQZV65+QSX1Ndp1VtaDIgwp8wNMUCZfCreWYfZ/1eWYlei8Eab5ozG4ERveW8PsFO
 7dZkhHGNSfNCSD7Bjte17D/6eTdpm83V2fYyFTpjL/7SfLH6g6kslWymx4rJhiRZ5t16
 2cd5xFj9hrQztGdTW3DA+eHN8UTyHZ1yeR/fK/oFd069pKsnFcYnyHRaKkh9pc8A0LPs
 lxdKOcgbfdy6Lbtf2dxA3WRyB2q3g01w32pdSPwB9VbS+6aXCBN0uTD57u8jurfS92gp
 GL9cFqYjXVlDsPOiYWU2S4EVb73PsyoJr2IaQg+DJOdAbhR2PpdF7KJCCWZ7fbd5yv9B
 7cyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNCotYrOkR0EgD5llGV87IrzEP1qonuwirUkvo+sLdJ+1Io1Qu9U4fnWNX/a0T4lWtLxjNWbHQmw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy05kLH42XXn9CvzqfJvc2eh01Rw6+rXdclg5YMIb4biHmPFVe
 He66CcgCiIj1/Ww2lGXPtWuO4/PNtkd/+zHObee+S+tjAiwnsKoyB8GZKTg01aeXIlxZSkmH5eO
 MYpWYIeO9aKjele3H0YjOj0lMPoOvejiqllE+IpXUhwJImQQbRETiLBH2wzUaTGwydxvf
X-Gm-Gg: ATEYQzzyWYWjC+06xH8eLGcINY6POGuA+MYeoX7pfXk22DROmgObv6NuoY5kjrViLKx
 xjIzO+Uojqh2233rNNWftbSupgbojbkS/MXaWrvWG9Ms2zJhCGKv8A+KQBeG+O5+/K7plQ4tCsc
 vQPa1M6PDNKI0MSawWm6v5nvokDGaswx9FtpVGF59kcA986yOG0lCCbZPVsIpyPJZHJocFlDG/J
 YTHjnUiPd178Sodu9vRqcifB/qx1xBx+I8qFY52J+OKabr06sByzIeYgJYhSZwy9M277jmJNoZb
 bGIo8DSkX4rI5F/d5Mm/r6kYUN8aNeshV71+uOsME2yHgPMd/b5CjQD5t32QpuVxvvRa09PWCg=
 =
X-Received: by 2002:a05:6000:144f:b0:43d:b0f:eb44 with SMTP id
 ffacd0b85a97d-43d15057f18mr12783653f8f.15.1775116326232; 
 Thu, 02 Apr 2026 00:52:06 -0700 (PDT)
X-Received: by 2002:a05:6000:144f:b0:43d:b0f:eb44 with SMTP id
 ffacd0b85a97d-43d15057f18mr12783605f8f.15.1775116325690; 
 Thu, 02 Apr 2026 00:52:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f1a99sm6565398f8f.32.2026.04.02.00.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 00:52:05 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:52:04 +0200
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
Message-ID: <20260402-vivid-perfect-caiman-ca055e@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mw3d5nnhrpwvh64u"
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


--mw3d5nnhrpwvh64u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2026-04-02:
A refcounting fix for bridges, revert a previous framebuffer
use-after-free fix that turned out to be causing more problems, a hang
fix for qaic, an initialization fix for ast, a error handling fix for
sysfb, and a speculation fix for drm_compat_ioctl.
The following changes since commit 87a70013be7d1b96e7e160aea6dad4564b459868:

  MAINTAINERS: Update GPU driver maintainer information (2026-03-25 15:10:30 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-04-02

for you to fetch changes up to f8995c2df519f382525ca4bc90553ad2ec611067:

  drm/ioc32: stop speculation on the drm_compat_ioctl path (2026-04-02 08:24:55 +0200)

----------------------------------------------------------------
A refcounting fix for bridges, revert a previous framebuffer
use-after-free fix that turned out to be causing more problems, a hang
fix for qaic, an initialization fix for ast, a error handling fix for
sysfb, and a speculation fix for drm_compat_ioctl.

----------------------------------------------------------------
Chen Ni (1):
      drm/sysfb: Fix efidrm error handling and memory type mismatch

Greg Kroah-Hartman (1):
      drm/ioc32: stop speculation on the drm_compat_ioctl path

Liu Ying (1):
      drm/bridge: Fix refcount shown via debugfs for encoder_bridges_show()

Maarten Lankhorst (1):
      Revert "drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug"

Thomas Zimmermann (1):
      drm/ast: dp501: Fix initialization of SCU2C

Youssef Samir (1):
      accel/qaic: Handle DBC deactivation if the owner went away

 drivers/accel/qaic/qaic_control.c | 47 +++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/ast/ast_dp501.c   |  2 +-
 drivers/gpu/drm/drm_bridge.c      | 16 ++++++++-----
 drivers/gpu/drm/drm_file.c        |  5 +----
 drivers/gpu/drm/drm_ioc32.c       |  2 ++
 drivers/gpu/drm/drm_mode_config.c |  9 +++-----
 drivers/gpu/drm/sysfb/efidrm.c    | 46 +++++++++++++++++++++++++-------------
 7 files changed, 94 insertions(+), 33 deletions(-)

--mw3d5nnhrpwvh64u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCac4gJAAKCRAnX84Zoj2+
drPOAYCqO9KtSnn4c37r7FPdKUuXVaBPscaFo4b+iSzTYSpLAaH1vnacCPeOqY7W
bdUCSqEBgJBBw1sI//uYcm35XvKjQvF4ePb1wi2bX6/+Gt9r3rj1klHnfFHKzoA0
1fmVo5SmOw==
=tHr/
-----END PGP SIGNATURE-----

--mw3d5nnhrpwvh64u--

