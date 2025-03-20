Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179DEC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 08:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E110E5A3;
	Thu, 20 Mar 2025 08:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ItUG6bBP";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD94C10E5A4
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742459912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eVSYC2akOgiwP6yKLJOSHan3aNOI03QHvfAehHGVWcE=;
 b=ItUG6bBPn8/WcTIZjgeLY46VM0bQqpmhMHAoK33vfKr98vhP5BjgA62bmpJk8J5Mad9Ypm
 CUcq3lkOxRi5Fy0HjkcB2I9xewunZ3EFgfGRWRY7OgHk5wurtfI7JeCYeK8+rWoNmMNmjn
 I0tPaVfGoydX17cL1+bE8XFkkt7LEYA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-r3c_f5G3Mt-Hveas7NWizQ-1; Thu, 20 Mar 2025 04:38:30 -0400
X-MC-Unique: r3c_f5G3Mt-Hveas7NWizQ-1
X-Mimecast-MFC-AGG-ID: r3c_f5G3Mt-Hveas7NWizQ_1742459909
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so2493365e9.2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 01:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742459909; x=1743064709;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eVSYC2akOgiwP6yKLJOSHan3aNOI03QHvfAehHGVWcE=;
 b=r6wfsWO6CB6mQkOFyZf+tz1YZ8ot4Gs8IcWAA4RbCZDLDaHW8pyonSi9gvwQGHTECm
 fZyH16BPQdwKq6JBY4ope6yqHLGOP7RwhlGYPFVkNauQqeHnF2gw5rg8gOVbzmkwoOVG
 LQmP3dQWN+aRyAlDvrEXTDlrj1uNBCLSdOtfVIE1HO/9D3ffhVcijHYKVoUdvnU4Scye
 I5sILuguB1dnyEPsVBc/eb+UtLgyHoyAIk8MPL7f45TbWmnn+/RQRuU3H7Tiokq4+qG3
 mv3RiQO8Cpzhw9o+//D31uIlD6fGibrJDOCmTvZpRjaR0yYQgJMQ0U/jKaoipfBSfbqb
 tgoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW41eAF58L7aWDfEIJTfURj95GkC2Omk1ok6wXrzaVpmW0aj1sKuY/Imv7W3IHch3puQ1ilQQw7Bw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD5C69/WWuW8WR+M/uED3gBsFTXSTD+ksu8v1+Mka80oy/enEf
 MSwCSYDNxyEy33iiXxSk4XJPP/4i4NzU3hV3CWi/29tQVJ6wuHoWIDJfgB8jG68OoTST8qJz1I6
 IiuikAGJtUQ6ysyTdrCrl2HIfePZbYrnnGtDfdLm1S9xB1f1JAEe/niAUwriRcLWp
X-Gm-Gg: ASbGnctnrcE7NrGzYrVnoWNTBRD2NqVX4T6sl1rqccAcOkk6Z6aHzRGYEyuyAGbycXz
 RnkiB27BiLfahxkINYcROgUSe8cpuXGi7cZnRaT9SDPp9/95vBmLie4asCcu9tfetnYN2qUtFi/
 hKCm4EtbXnZft+Z9Uwae2jXKIEu3TzxmFVrPArnE92PhZRghiMxwCuA1a7q3UsmYyuG+NWeAr+g
 fDiKJnGKfuIXN8fEi7hu90KZwSmMqwmeWs3kER/Z871eEQfztWmRDvUPB2r2/bRTw0=
X-Received: by 2002:a05:600c:3d88:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-43d4379b544mr46799175e9.12.1742459908610; 
 Thu, 20 Mar 2025 01:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2ABTv2JwL/AM+EzDkblJ4THEXWcPirEf3A6Ijee80hlkhSxHLu9VwR1gZbn6IcOhuJRlh2A==
X-Received: by 2002:a05:600c:3d88:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-43d4379b544mr46798935e9.12.1742459908115; 
 Thu, 20 Mar 2025 01:38:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d46edba08sm32428835e9.18.2025.03.20.01.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 01:38:27 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:38:27 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20250320-valiant-outstanding-nightingale-e9acae@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="47mp7vgniqed6naw"
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


--47mp7vgniqed6naw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

The following changes since commit 12d8f318347b1d4feac48e8ac351d3786af39599:

  drm/dp_mst: Fix locking when skipping CSN before topology probing (2025-0=
3-11 11:29:18 +0200)

are available in the Git repository at:

  ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-=
2025-03-20

for you to fetch changes up to cb83f4b965a66d85e9a03621ef3b22c044f4a033:

  gpu: host1x: Do not assume that a NULL domain means no DMA IOMMU (2025-03=
-19 19:05:40 +0100)

----------------------------------------------------------------
A sched fence reference leak fix, two fence fixes for v3d, two overflow
fixes for quaic, and a iommu handling fix for host1x.

----------------------------------------------------------------
Dan Carpenter (1):
      accel/qaic: Fix integer overflow in qaic_validate_req()

Jason Gunthorpe (1):
      gpu: host1x: Do not assume that a NULL domain means no DMA IOMMU

Jeffrey Hugo (1):
      accel/qaic: Fix possible data corruption in BOs > 2G

Ma=EDra Canal (2):
      drm/v3d: Don't run jobs that have errors flagged in its fence
      drm/v3d: Set job pointer to NULL when the job's fence has an error

qianyi liu (1):
      drm/sched: Fix fence reference count leak

 drivers/accel/qaic/qaic_data.c           |  9 +++++++--
 drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
 drivers/gpu/drm/v3d/v3d_sched.c          | 23 ++++++++++++++++++++---
 drivers/gpu/host1x/dev.c                 |  6 ++++++
 4 files changed, 42 insertions(+), 7 deletions(-)

--47mp7vgniqed6naw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9vUAgAKCRAnX84Zoj2+
dlATAYCtuSibllvUw0LRAksLq+2dw95GaaHpe/yqHUhj4mnrYaVwskUMuN05Z3Je
g1M6vV8Bf1WI7AiXgRyaUghC6Ne0vSW5D7eStRbqifJMMydRqkEMPaCELL+X5Fpk
f0edh7S3FQ==
=2eWI
-----END PGP SIGNATURE-----

--47mp7vgniqed6naw--

