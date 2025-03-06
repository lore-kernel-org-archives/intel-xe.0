Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7ADC28B22
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 10:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA3610E93B;
	Thu,  6 Mar 2025 10:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DsTBXlKK";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94E10E93A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741257136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=+UOQWLNHD36avSTa9JquHqKO4u+iQSMwvjaDPAD9G44=;
 b=DsTBXlKKSrmPg9SJk7XemqrAAZXBUhex2xVsVY9wVVOWu54vPAZSULo4hm56DyWTTRdRy9
 SGq7VOKeF0hAkQiq+0tfJVPAaAgL12pIxFb65QCp4Zjnle3j27qAMidpHlhcRq0VDPMuuB
 g71aIUTp04TV5iK8o3CrDysy/NPXQTA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-_RZJAYt9OkugeQz2gN-iaQ-1; Thu, 06 Mar 2025 05:32:09 -0500
X-MC-Unique: _RZJAYt9OkugeQz2gN-iaQ-1
X-Mimecast-MFC-AGG-ID: _RZJAYt9OkugeQz2gN-iaQ_1741257128
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3910b93cb1eso237862f8f.1
 for <intel-xe@lists.freedesktop.org>; Thu, 06 Mar 2025 02:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741257128; x=1741861928;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+UOQWLNHD36avSTa9JquHqKO4u+iQSMwvjaDPAD9G44=;
 b=kHP0jQ/ueWRJfPdKsfRbX8wjK6Hjm/Bcrves0LDApavk9VY+YxJvKsjtcZAt5rzYpQ
 BDqlsRseA9EA8HmfbBf2bY//t3Tp2npfScytlsPYuWw87b+VzNFXMvXh0xItGmNPezZE
 rxOg00v9Pii/jeFueuCLQ7EEdGxfbpp/K3zFFRkBkUXTs+zsthj8DSmkr8PC3Jsi1MPr
 ZT7auOzcgNVG5lLlucZxDcZ5EkAzzyYGiB+kPZ4dZxsocD6D9JiETK19fO54MGijc16t
 s2Bo4z0Kdp5qIsJEDoKPmaQnhUXdI2Uyq0iZf9531W378UUSjuYTs/hZ7z3EOltKs+nv
 lazQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUxdgDoHybgAO4ozuhfyEb2RIeiHavwlhoT1Ye14XuC4zHWY7xHciCXLyM8uIFLAHH+InpuR5wMg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrB0eM20Bf7/heEUz3AR9P+bJuEOR0Mi4spAuYMNpoLCR/PYoC
 VTPdeGWnCKMmbGOLDXcEK94wlk5UECfroCOsy/ihmrA1m4eQrpees/M336TrLDOaxEhfSIs32T0
 17s50yjkvDC7xNpk6jZDpmD09RsCUxFBFqj0atAKV2xCd6bwtaHF3Hm+T3+6y/rr3
X-Gm-Gg: ASbGnctn7oJ6TK1r4Tv8AgZL5/JsYGiRNNSmwA9LvntLs8fST77gEhAbIj/PEnkwiSd
 3bOqBj+kxwy8+9U7MVkWbgPlQZlkg5xjEu5pY7fwTlANwIEw1V1VLMkd1y7O/9t3a+6GNybOhNs
 eQpoQY2VT7oIKjezeMJ42w7uBKftKcqV9oAuUwgELf1VDvDq32XzBP44y1Dt8FV4Qay/J4QqMur
 LK6X0nZKgQsNI2s5KIBAKMoZPP4hTS1sTc8Dh+jC/21xbmJfcXAh5aHHFWBuhfb2iI=
X-Received: by 2002:a5d:6489:0:b0:391:13ef:1b27 with SMTP id
 ffacd0b85a97d-3911f7ce4b6mr6328163f8f.51.1741257128288; 
 Thu, 06 Mar 2025 02:32:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+Tgv35AjEidAtwDd/7uDt9U9WK08/b/Hy7ngRGH/XCMkog1BQwQ1QPGrK1xSOjh46+jQw3Q==
X-Received: by 2002:a5d:6489:0:b0:391:13ef:1b27 with SMTP id
 ffacd0b85a97d-3911f7ce4b6mr6328134f8f.51.1741257127917; 
 Thu, 06 Mar 2025 02:32:07 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c5880sm45356665e9.19.2025.03.06.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 02:32:07 -0800 (PST)
Date: Thu, 6 Mar 2025 11:32:06 +0100
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
Message-ID: <20250306-antelope-of-imminent-anger-bca19e@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="367poxrw3iccmrnk"
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


--367poxrw3iccmrnk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2025-03-06:
A Kconfig fix for nouveau, locking and timestamp fixes for imagination,
a header guard fix for sched and a DPMS regression fix for bochs.
The following changes since commit 3603996432997f7c88da37a97062a46cda01ac9d:

  drm/fbdev-dma: Add shadow buffering for deferred I/O (2025-02-27 09:37:55 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-03-06

for you to fetch changes up to 80da96d735094ea22985ced98bc57fe3a4422921:

  drm/bochs: Fix DPMS regression (2025-03-06 08:54:42 +0100)

----------------------------------------------------------------
A Kconfig fix for nouveau, locking and timestamp fixes for imagination,
a header guard fix for sched and a DPMS regression fix for bochs.

----------------------------------------------------------------
Alessio Belle (1):
      drm/imagination: Fix timestamps in firmware traces

Brendan King (3):
      drm/imagination: avoid deadlock on fence release
      drm/imagination: Hold drm_gem_gpuva lock for unmap
      drm/imagination: only init job done fences once

Dave Airlie (1):
      drm/nouveau: select FW caching

Philipp Stanner (1):
      drm/sched: Fix preprocessor guard

Takashi Iwai (1):
      drm/bochs: Fix DPMS regression

 drivers/gpu/drm/imagination/pvr_fw_meta.c       |   6 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.c      |   4 +-
 drivers/gpu/drm/imagination/pvr_queue.c         |  18 +++-
 drivers/gpu/drm/imagination/pvr_queue.h         |   4 +
 drivers/gpu/drm/imagination/pvr_vm.c            | 134 +++++++++++++++++++-----
 drivers/gpu/drm/imagination/pvr_vm.h            |   3 +
 drivers/gpu/drm/nouveau/Kconfig                 |   1 +
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h |   4 +-
 drivers/gpu/drm/tiny/bochs.c                    |   5 +-
 9 files changed, 141 insertions(+), 38 deletions(-)

--367poxrw3iccmrnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8l5pgAKCRAnX84Zoj2+
dvnpAX49PGgUPS/QzfI3bxYFe1E0JsdlQYzZYEURMktAULCGVDlw89fVBiyN3213
U6nviXQBf2DLLDtOet6R6d8nWlI8tI91U7R5evYVl6i5pVqBqINXCCfhIZkgv7xX
thHLmpOAsw==
=ug7S
-----END PGP SIGNATURE-----

--367poxrw3iccmrnk--

