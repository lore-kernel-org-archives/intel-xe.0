Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867BAC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 11:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5E510EA2A;
	Thu, 11 Jul 2024 11:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fa8a+LOZ";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC0810EA2C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720698206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MofSZeDyVzWkqGzbXdelFG68l2ucBKWV0CSSC6YMCJU=;
 b=fa8a+LOZAKIO0UNOqbyCtH36v8c6lu8llHALMn1lWv71aDOlLJWWrHI9+7DnzDj6mMMbUb
 hRxDY9jDNv9hLAaIAyS6NHqyly/Xhgi4MhcgrSB4PaYkuUsgCqThjesEw/L5rqfCHXJvXK
 Jb4tmcVJ8TQe9Teq2uquD8Z+L/QuF4Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-NWFI0_vhNGGRND5_Wvia7Q-1; Thu, 11 Jul 2024 07:43:24 -0400
X-MC-Unique: NWFI0_vhNGGRND5_Wvia7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3678e549a1eso434141f8f.0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 04:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720698202; x=1721303002;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MofSZeDyVzWkqGzbXdelFG68l2ucBKWV0CSSC6YMCJU=;
 b=GFCERMBIkITt/2BgOLrrcRTCH6kZzUhsagn9Cz+sHs8H8Z7mpXnA0iD95fIBI3Fs0W
 u2sm2sj7Sf0c6r42NmtIJH1nfL8hKzAET++S9cBfYc6WXOjPE5ySDkSSE0xUR+aU3/vo
 9hxYLH6qIu4zeRfyLg+kb0nl/8WH65CV9S9QW9/wlHu3+yWTw1em8ot0+SqSYWoUqI7V
 AuLwOg21aH/Tz2hXmiNW4QO5/52Hf9us3VYGVmHsk8HBQBuZEXknuzMgs7/2MRPQNg7e
 ptSo9/FwFRjsunyVztNVtwf+Ssvd6MbLB9lxG+SbYajArUwkh+vIEwllgWd8ClsePaiv
 0lxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhNWu0KKG3qzqDSaCpOo9rvWpOzq5NeVPu8MmNqROvkXCJwcZpQ/xfpOQFdRUZDceGXQaYlPe1uh3DTf1HMglJjAng3JC2L4R3KzDY3is=
X-Gm-Message-State: AOJu0YzG84q4So4RoAodRzdS9a9I24HTMaVSHP8oFID5NJ8LkrATolhu
 rRaXWV+WjGYSUHMGzvhXlXxyc7cs9ivxkXOZ9FvDaMVzqzDy7TPF5XJKJsUqzGJNLH2m5NBcS7v
 k0wr6PRJU+wFJea2yx3EsQKtMAGhCnJONTBouYDUyOgK97QvQdAsI5MOaLfasWg0G
X-Received: by 2002:a05:6000:e86:b0:367:8e63:4da4 with SMTP id
 ffacd0b85a97d-367f04ca2d7mr1970135f8f.14.1720698202615; 
 Thu, 11 Jul 2024 04:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKWwK9mQfjAxuy6d/Q76G5tEr15S1eUj7ecFAczGH+5nB4lofGO2HqY2Y+hF94BBlR5S5EPA==
X-Received: by 2002:a05:6000:e86:b0:367:8e63:4da4 with SMTP id
 ffacd0b85a97d-367f04ca2d7mr1970113f8f.14.1720698202132; 
 Thu, 11 Jul 2024 04:43:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f737b1bsm116663935e9.32.2024.07.11.04.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:43:21 -0700 (PDT)
Date: Thu, 11 Jul 2024 13:43:21 +0200
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20240711-benign-rich-mouflon-2eeafe@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dzmsejr4sz47r6mw"
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


--dzmsejr4sz47r6mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-next-fixes PR

Thanks!
Maxime

drm-misc-next-fixes-2024-07-11:
A fix for fbdev on big endian systems, a condition fix for a sharp panel
at removal, and a fix for qxl to prevent unpinned buffer access under
certain conditions.
The following changes since commit 896868eded124059023be0af92d68cdaf9b4de70:

  drm/panthor: Record devfreq busy as soon as a job is started (2024-07-04 09:29:55 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2024-07-11

for you to fetch changes up to c537fb4e3d36e7cd1a0837dd577cd30d3d64f1bc:

  drm/qxl: Pin buffer objects for internal mappings (2024-07-10 09:12:42 +0200)

----------------------------------------------------------------
A fix for fbdev on big endian systems, a condition fix for a sharp panel
at removal, and a fix for qxl to prevent unpinned buffer access under
certain conditions.

----------------------------------------------------------------
Douglas Anderson (1):
      drm/panel: sharp-lq101r1sx01: Fixed reversed "if" in remove

Maxime Ripard (1):
      Merge drm-misc-next-2024-07-04 into drm-misc-next-fixes

Thomas Huth (1):
      drm/fbdev-dma: Fix framebuffer mode for big endian devices

Thomas Zimmermann (1):
      drm/qxl: Pin buffer objects for internal mappings

 drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c |  5 -----
 drivers/gpu/drm/drm_fbdev_dma.c                        |  3 ++-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c        |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c                      | 14 +++++++-------
 drivers/gpu/drm/qxl/qxl_object.c                       | 13 +++++++++++--
 drivers/gpu/drm/qxl/qxl_object.h                       |  4 ++--
 6 files changed, 23 insertions(+), 18 deletions(-)

--dzmsejr4sz47r6mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZo/FWAAKCRAnX84Zoj2+
ducuAYCQ2yxTQEAVBbW1pjLEqLM8ZqWbhUe30yZe+1K91x/U9fSYGnmsfeWpJYHh
VsiVNBgBgMVRP82CcCt7Cp2HFfHXl/enrvZaYvJUDetm3ZbnGwAT5TGqbefXGok6
phXB4NyL4Q==
=SiwA
-----END PGP SIGNATURE-----

--dzmsejr4sz47r6mw--

