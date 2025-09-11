Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F335DCAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 16:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ED310EB8B;
	Thu, 11 Sep 2025 16:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GfvTWbxS";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97C010EB83
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757606681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=jtZEVi1bBiJckYAxa3sEu/hHpNe6eKx7VTDTRhqbfkU=;
 b=GfvTWbxSRmsXGbpsZnxM2I9gZfMjNY3IVFPQpF3lv0V0kxFCmAqR6o7SSmv8VaVTCSXrTG
 BW9ZdeipuIwZ5fPse4TnlCGj6bqN47JCIrlOLRuseUjur3boDMDEUd6o/IN8y1oj2089RU
 RMTPYuFkKjsDIjC8Uf52Dlo53JrarGQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-uFf3k2l8NMaryI-aAjc8fg-1; Thu, 11 Sep 2025 12:04:40 -0400
X-MC-Unique: uFf3k2l8NMaryI-aAjc8fg-1
X-Mimecast-MFC-AGG-ID: uFf3k2l8NMaryI-aAjc8fg_1757606679
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45df609b181so7267845e9.2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 09:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757606679; x=1758211479;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jtZEVi1bBiJckYAxa3sEu/hHpNe6eKx7VTDTRhqbfkU=;
 b=E1T+++GvxZbRPkHZDrJKE1d9Ql9zlSlQo9+4kH9izfpq010oypusbGDStV6Zi5Mdsn
 gvV7J5vmhvPAFK0UXiJB8LklnrSQ198xM6YnbLJkFHpaasD4v8zRIFEmWIIQzigopFa1
 LuOFMNnAEOJE+Uu2yelPacPaZF4nEAiwfpHmdg94OOytNITrt7K28dbB+JjV6b7KlWbl
 8KlFMVY+PIdWMPfEBTEbOgPl7k3nGFt6QEHVU15+LiaGMcSVnG36IVWJJOZDmWIK+Sry
 zXuGGjURkLg4ucnIOm8kgGCXseWqOpN7o52ONCxxlST34yTBSKIXhfDGb1UEbDcCtPL4
 QdOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp7Om4k1kWesaKuILzUqg6G/GxTVdUdQsFhVbHkNg5RuDzqE7wT65GLMUXe3Mr8g+KDkEdkrtd1g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOHFS94bXzdJ0/KQHOZsEbEUuhSPUIyBGhiWatTRptHNkkae4l
 r4WN1eT6ulaOfnOSucAEzzYwHXplZ9MdGAfk17Rgc5zB0acL+Uob3gJAGfvK0ToIAjvlSNCKg96
 ju/qkcXZHzTBT/4ciDgdBL4xxVpZJRlS3iAntBCo5AHjkTD8KxqAj/lKsXlSgplyiw7VP
X-Gm-Gg: ASbGncuvEMMKRryIRmRvmvEp2av1IHfKVhiaZqHJ6ctU6Ixi/0Jsf/xGxDrKD167M2v
 x15FdwEDWhM1JzhAL8kwvH+YySaMnzSQhgIH0yqgTf8/Lo03e7D6Pr+Ok6vWNMKiyh+9HScqvU6
 ErjUuoRInToQP09lYUC7kuHWx6bDMKi14ln/CFQmaJOUSXREHsjugcOnHpZLAGeys5r733kVga8
 qpqwWGRa6J4jY6hdHxuonpNTXlYtGl3BRqG6+ThAV/uSnpA31wF6whEr/HyNL5XLOkMP9m/9Jot
 4mpXfWqLmTkijD4=
X-Received: by 2002:a5d:588c:0:b0:3e2:9a5a:1f38 with SMTP id
 ffacd0b85a97d-3e64c692464mr14106112f8f.50.1757606678748; 
 Thu, 11 Sep 2025 09:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYGKzZTNFxaumU0lwQa1TM2uyRQUhmekKodD8ASxi5wTwWwSFpdAUhSe/UMfM4+ltbXkHQkA==
X-Received: by 2002:a5d:588c:0:b0:3e2:9a5a:1f38 with SMTP id
 ffacd0b85a97d-3e64c692464mr14106068f8f.50.1757606678233; 
 Thu, 11 Sep 2025 09:04:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037c3ee8sm30016945e9.18.2025.09.11.09.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:04:37 -0700 (PDT)
Date: Thu, 11 Sep 2025 18:04:37 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <20250911-glistening-uakari-of-serendipity-06ceb1@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yzr6tslhgdx3cftq"
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


--yzr6tslhgdx3cftq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2025-09-11:
A maintainer update, an out-of-bound check for panthor and a revert for
nouveau to fix a race.
The following changes since commit bdd5a14e660062114bdebaef9ad52adf04970a89:

  drm/bridge: ti-sn65dsi86: fix REFCLK setting (2025-09-02 09:56:05 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-09-11

for you to fetch changes up to 87b90cee22d8658a69c0fbd43633839b75f8f05f:

  MAINTAINERS: drm-misc: fix X: entries for nova/nouveau (2025-09-10 15:52:25 +0200)

----------------------------------------------------------------
A maintainer update, an out-of-bound check for panthor and a revert for
nouveau to fix a race.

----------------------------------------------------------------
Chia-I Wu (1):
      drm/panthor: validate group queue count

Danilo Krummrich (1):
      MAINTAINERS: drm-misc: fix X: entries for nova/nouveau

Philipp Stanner (1):
      Revert "drm/nouveau: Remove waitque for sched teardown"

 MAINTAINERS                             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c | 15 --------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 -
 drivers/gpu/drm/nouveau/nouveau_sched.c | 35 +++++++++++++--------------------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 ++++----
 drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
 7 files changed, 26 insertions(+), 46 deletions(-)

--yzr6tslhgdx3cftq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMLzFAAKCRAnX84Zoj2+
dunuAXwJbxHdjpqURM+YYUhZ8Y2JJ9gZVZ07Qpeptun8xjpUpCLOJ3pcOn+dK2zG
GHtRZXgBgPxDxn/QnaDW66mHK5uqRRcNCUHf7jq8pXDg4g9LIOJFqlp0CfZJ7iJu
WupqGIyy/Q==
=F5qC
-----END PGP SIGNATURE-----

--yzr6tslhgdx3cftq--

