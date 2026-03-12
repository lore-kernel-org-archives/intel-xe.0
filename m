Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C279FED2DE
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 07:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B084F10E969;
	Thu, 12 Mar 2026 07:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QSkGx/WU";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V0uaV0qF";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC0510E969
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773300637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=xlPKSryrzvi8BHSgXKZhjuzXWnH1dXyf86fgSkP5rRE=;
 b=QSkGx/WU16/ki5xQ6AcV2PaPit3tJ3tsQFjuKmKI85SfFd3KjG0EyxU34+r4yfaJVui0gB
 CHpZHuSna9lhUw704CF2QyoDqSzqLlfKvltuCRF2P3DEA0dOQRt+j+yAB5TuPhmQoYfStS
 DRFLSmDq4h2BBQdv5xip3Ql/OxxlBgc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-XI8LQx7UNwioTaD5qkvwAA-1; Thu, 12 Mar 2026 03:30:35 -0400
X-MC-Unique: XI8LQx7UNwioTaD5qkvwAA-1
X-Mimecast-MFC-AGG-ID: XI8LQx7UNwioTaD5qkvwAA_1773300634
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4853b0af42aso8330585e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1773300634; x=1773905434; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xlPKSryrzvi8BHSgXKZhjuzXWnH1dXyf86fgSkP5rRE=;
 b=V0uaV0qF13u1lbXlBeHPeibb5Cm6rGQCQeG8Bryeq/eam5m05OF9JmZxaxulnlym8I
 rgwrEfzJHnEn4NZpxM+FUjP6goE3DsvaA5CJuyEAegHaVFrPUU8XFnYFxSTFv8/we3Fo
 5n9lWS65fsXohNtvu7KDR8MQxwudSXtywjTgPGZEXhk2adVtCzYdieqbuxXL63PU2Hhs
 7AZxuHRvNxq/7lk9j6hUO6rrYXBzAxq6QqTgZl9PbflOiV76/cetCOseNN0M2TiuifEX
 5rvIkQTV5kiIEvOiDAGNnWxVDmS/OmbVTPfDjVCu7ej16AFLUNkzZ0i9DJhO6HDMjGnO
 tA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773300634; x=1773905434;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlPKSryrzvi8BHSgXKZhjuzXWnH1dXyf86fgSkP5rRE=;
 b=vJdn7Tcpr9J8m7wioSoCDd1ZeLO2ChfI/ABU9X81EEQdcYr9Qur8EfcfiQtj2BgOVg
 6K/HtLDSKF35SWv2XnACWKUc11vZ3SwiR/hMh1rN4ysVLCQ5RPo0ey/dMjZ91criW7sH
 yXb4oVOtdpM2JK0J5ADQQXWWpdVgMUZU4MBdV+1XvCIV+ME8YABWb9wUe4K5KdNZ0/d4
 BDyzHv9D5u/VSUjAn9mgmnewpTaAm74oVcNPPSSRG2HnJOVOn4qeLxQNZBZySpaK016j
 2ESUBAI3lgDsXa/jElWfsNxH8VX2FWuyAr9jNCVLfcP+VzZfFqKl2aAcK7Y9Fl0oSR6q
 wp3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEND75pb7+03+kvsLogr14MJrjhmhhzU0VJTL0aHao9ZmO1zjFv77yYIycmfnmIdrC8Y8Hj9I9yw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMfrlqWuo4+9YJ2tF664PeLaF4xkvsYrtsTQQBmSc3OpmuH5b1
 csa8LqXnvGHH+4jjmRzOLFRL3MAzliQlNRCuPGXZpEsdqu/x/gjIqkGgkWgWn0vbrlImrgNU1NG
 4G7HSqGDN/91+vjGbg8cJ2iAi85D4rCr2n3/VNPqDoL67yoNzYl8XuvyQMYV/J+1btSHu
X-Gm-Gg: ATEYQzxA4kaUBjSHWAJCtdXbJza5QoGBUpVcuEB+y6wkiCoK+GPpO5SBFlCAyQE+NDZ
 VpAAzrHd4QfD6Z4C+15awFk3yohodfzG1yAYXJoZE9xeJnYFI4damgqRi8JKKExVTwEf341f3Qu
 Sq6OKo2TXimzJRVJCYxBJGFGytB42dPeaR1BNVGodaa4dPyYni0kzUfr3qEX0H7wRNmzP+DHRn7
 /FYcxO+K0wwkNYglJy0ov6Da/fuBevtqqha91zsEOoKT9M4PrT+6C+iZRs9a/IRPiL8jwtwLgN6
 ZV3ilGUSG3PbH2NqFaFVTbAHo5EVE53rFfrZI5SwxCplGh8hrKj23CQGdI8IA2Uc7tZRkly7ZA=
 =
X-Received: by 2002:a05:600c:3b16:b0:485:4533:9c47 with SMTP id
 5b1f17b1804b1-4854b100c42mr90613635e9.22.1773300634239; 
 Thu, 12 Mar 2026 00:30:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3b16:b0:485:4533:9c47 with SMTP id
 5b1f17b1804b1-4854b100c42mr90613255e9.22.1773300633693; 
 Thu, 12 Mar 2026 00:30:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5e912fsm279581235e9.2.2026.03.12.00.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 00:30:32 -0700 (PDT)
Date: Thu, 12 Mar 2026 08:30:32 +0100
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
Message-ID: <20260312-accurate-ambrosial-trout-bfabf8@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kaiblbioitow5veg"
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


--kaiblbioitow5veg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2026-03-12:
A pixel byte swap fix for st7586, a null pointer dereference fix for
gud, two timings fixes for ti-sn65dsi83, an initialization fix for ivpu,
and a runtime suspend deadlock fix for amdxdna.
The following changes since commit 021f1b77f70d62351bba67b050b8d784641d817f:

  accel: ethosu: Handle possible underflow in IFM size calculations (2026-03-05 15:21:17 -0600)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-12

for you to fetch changes up to 49973e2a4156a88e46ba1c1c484b7c214199a181:

  drm/loongson: Mark driver as orphaned (2026-03-11 10:15:36 +0100)

----------------------------------------------------------------
A pixel byte swap fix for st7586, a null pointer dereference fix for
gud, two timings fixes for ti-sn65dsi83, an initialization fix for ivpu,
and a runtime suspend deadlock fix for amdxdna.

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Remove boot params address setting via MMIO register

David Lechner (1):
      drm/sitronix/st7586: fix bad pixel data due to byte swap

Lizhi Hou (1):
      accel/amdxdna: Fix runtime suspend deadlock when there is pending job

Luca Ceresoli (2):
      drm/bridge: ti-sn65dsi83: fix CHA_DSI_CLK_RANGE rounding
      drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output

Shenghao Yang (1):
      drm/gud: fix NULL crtc dereference on display disable

Thomas Zimmermann (1):
      drm/loongson: Mark driver as orphaned

 MAINTAINERS                           |  3 +-
 drivers/accel/amdxdna/aie2_ctx.c      | 14 ++-------
 drivers/accel/amdxdna/amdxdna_ctx.c   | 10 +++++++
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  6 ----
 drivers/accel/ivpu/ivpu_hw_ip.c       |  1 -
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 13 +++++----
 drivers/gpu/drm/gud/gud_drv.c         |  9 +++++-
 drivers/gpu/drm/gud/gud_internal.h    |  4 +++
 drivers/gpu/drm/gud/gud_pipe.c        | 54 +++++++++++++++++++++++------------
 drivers/gpu/drm/sitronix/st7586.c     | 15 ++++------
 10 files changed, 74 insertions(+), 55 deletions(-)

--kaiblbioitow5veg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabJrlwAKCRAnX84Zoj2+
dlVcAX9JZOTRM6KU1AeZ8RDOEXJlVrBO1VgMAXBuNbLB65I8RBl85dGtmZJp7SCr
fKcEtHkBfipC/z2/0NA2byRFUKZcQkfjcqKfsy327URg8aqGCd4RTlRGJZmmasdl
MwBdHQN42g==
=XC+m
-----END PGP SIGNATURE-----

--kaiblbioitow5veg--

