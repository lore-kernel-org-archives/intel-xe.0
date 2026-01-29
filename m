Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA91D358E0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0810E838;
	Thu, 29 Jan 2026 08:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UxBW1H/d";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OEwC98oI";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787AD10E837
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769677121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=tXPLi5MPleV0XT1GzNz4vZO6yU1p82vu1eMa85GiDrc=;
 b=UxBW1H/dac+jT5u1zkJ6RvZGXQMjEbbZ/CjDQtk5HsjLVIh7z26GKH4uaeT5BhA3OeAR1F
 TO0n1AfN0wYFx/97IDR0zT9stDphz8D1bVmuejIaIHnkshR32oPxZOKQD3NBzvUFwdCjN9
 fjyZcay30Sg/xTm3kCYAHYK4MFfCLkI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-87SRfBntO-ur5QvXtFWvVw-1; Thu, 29 Jan 2026 03:58:39 -0500
X-MC-Unique: 87SRfBntO-ur5QvXtFWvVw-1
X-Mimecast-MFC-AGG-ID: 87SRfBntO-ur5QvXtFWvVw_1769677119
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so9978935e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 00:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1769677118; x=1770281918; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tXPLi5MPleV0XT1GzNz4vZO6yU1p82vu1eMa85GiDrc=;
 b=OEwC98oIE/gmRH6G5Yz5N4/xmW52WArLT00m9oHfAMDPUrinRCQDO7tUIjEvxlUG4C
 Yb0NwD6CuA5PnL2MSg86xVlLTsQYK9a4wFwZh9sPF4foetv4+W7DBBBzavy8gsobNoa4
 LPJJ/Ob47kSP5kVEMa14SXiWa8EpTJITyda+G891Gz7eq/GNo/pvmRiS2SYqrfQwXlOm
 W9JkSMmuZlCdkupYqly6kmQzJam/bvGCz9Trzy2kOl3f6WRBS6EViuGuj//AxPNj6QlK
 Q5Hc8hJvI4DNjfnjz6B7MRCsIEYTva4pLpeiZ2l+U/VWJPFN8dS2sJkODs6Yn0jew9Yg
 q6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769677118; x=1770281918;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXPLi5MPleV0XT1GzNz4vZO6yU1p82vu1eMa85GiDrc=;
 b=rqhLjeTSDILqq+SpsPPrEv9+GjFUwGNldrFozV+GOPDV/1927I+TI6ZyV6/nZrs61z
 /VBGBcRsleIKmrZ577A2LJ+U+217H01BW4tQeOgYA4iDsm/O/MGwY+kf+cMOz+bfe4pW
 w5Mx/YQDyTRDahkh+YS8qmihBotHBYs1yL9gqWUn2PeAOqsDsLhBF3XOdiSLiwdmxOA+
 QtG9LZAhA51qjhYFKN9RwJX1PSBRn7YYWnmDqN8afzeSqSJGkgy8UaJycKOjt4BO2+wd
 OAZh/YxxwBi1iXnr2abZZFJVzAPGpLALgzzAC4oo4nertPkmJQEPTBlhI+UXSWVWy93I
 4exA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFzcvNCCkprq47Co3LiI/OfI7T4cC+rhSBtMKhFkJWa0+wFA3uB+zdP9yuMW7AA2d5ziGXvCb0Gw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkWvLAFScrMGAePeOYQ+MSZP+RYYksxbGB/c/u3PtafLtTMZh0
 Rgf0GoL4HBJrasTjvS1WFRRCMegZit9kRFDryTiT7alu15rpfhZBcYDyyx6YbFKY5hlzGLersRn
 OAF08txHtXvcoHDGabqECJlSrkBWOy0JvMQPZgrVySJ3m/EY70txEJwCQE4NfSKU84mNS
X-Gm-Gg: AZuq6aL63K2blwCQ3J5NpKCgnOXApoJC0R+sHTTr4hWpgr2f6TwEnrt0p4eAxCsWoYy
 bAfjkbwTDBEc/s8p8uEKaMU8Np1Uh4ZScty11YlGyswmmarDU2bVD0bs6YzcdpY/uQjIORsRrm4
 TDRirjesRDc+f7LyXqFxzfW07SmpctehMbhs7yyCqbdlyrMVdGfAcuVEhA71SNXyysn3GwmyOve
 +6QUmaHbVTj8yEoh4TdyoZGXXZBIQXYFJ5WwcHfPRwguS+lrEslg5e1XaOUy6etzvUlVkD5gYuT
 axacM6UuYXOYco7CZHWwypLDRmqeevnDpx69OheDvbp6Vuk5AdxpEIck+d3JSw==
X-Received: by 2002:a05:600c:820c:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-48069c0e172mr100786555e9.2.1769677118615; 
 Thu, 29 Jan 2026 00:58:38 -0800 (PST)
X-Received: by 2002:a05:600c:820c:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-48069c0e172mr100786155e9.2.1769677118181; 
 Thu, 29 Jan 2026 00:58:38 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5d31650sm5802175e9.4.2026.01.29.00.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 00:58:37 -0800 (PST)
Date: Thu, 29 Jan 2026 09:58:37 +0100
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
Message-ID: <20260129-efficient-jerboa-of-ecstasy-822832@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qzorfjkesxyen2l3"
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


--qzorfjkesxyen2l3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next-fixes PR.

Maxime

drm-misc-next-fixes-2026-01-29:
Two fixes for NULL pointer dereference in imx8 following the bridge
refcounting conversions, and one for the bridge connector following the
HDMI audio reworks.
The following changes since commit b2c6627e406d00bc53903ff6204aabb0c6a22b1a:

  Merge tag 'drm-misc-next-2026-01-22' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2026-01-23 12:45:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2026-01-29

for you to fetch changes up to db7e7ea838c916ee4cdf26bee126fd36f58295dc:

  drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy() (2026-01-27 12:22:22 +0100)

----------------------------------------------------------------
Two fixes for NULL pointer dereference in imx8 following the bridge
refcounting conversions, and one for the bridge connector following the
HDMI audio reworks.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/display: bridge_connector: move audio_infoframe checks to OP_HDMI

Liu Ying (2):
      drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()

 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c       | 7 +++++--
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c   | 3 +++
 drivers/gpu/drm/display/drm_bridge_connector.c | 9 ++++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

--qzorfjkesxyen2l3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXshPAAKCRAnX84Zoj2+
dt5gAX9pLQKJqPi71NBJ0MlwXV8Fw2qlSyadbcBKrNT6zVmvePwu1VujKc72vdbK
PGa8m1UBfihH1CZO4n4ggv7HJw2uTr/I6jE1EJKhPaEFh8p56JbOMM/9ySGzgoHY
9jcd7C9RUg==
=5QvF
-----END PGP SIGNATURE-----

--qzorfjkesxyen2l3--

