Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543ADC021B3
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 08:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148A410E4B8;
	Thu, 20 Feb 2025 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jLzj6cau";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F6610E4A8
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740040209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=FkLw1vmgQ7dtdgPJ1UHXPdMfhD6ZeaEzB3pGWQTdiPI=;
 b=jLzj6cauumzalxR75ukZAuKBXQiKEpfLl71HmgnszL6df5e4m9kHpBYgEAAgLkyMVvDjVo
 xTnMSoJ6iUoWgK6+FQaqTLk3lvkS/pDg6tM3YAv8uqojcK5si5Fp7kqsNhkpc1kho0Ud7i
 a+bolskYN9WYV+thaQpfMIvvyMgmH1E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-IBILr3ADNbSOEDZe_Q4zEg-1; Thu, 20 Feb 2025 03:30:07 -0500
X-MC-Unique: IBILr3ADNbSOEDZe_Q4zEg-1
X-Mimecast-MFC-AGG-ID: IBILr3ADNbSOEDZe_Q4zEg_1740040206
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f36fcf4b3so363061f8f.1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 00:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740040206; x=1740645006;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FkLw1vmgQ7dtdgPJ1UHXPdMfhD6ZeaEzB3pGWQTdiPI=;
 b=D05fKK93dgIAPh/8rbMWuvf9WctNYsD1bcXrD8NwTPIqT5xsLqMHtjffj163QbUXPA
 fD0t3DTFz9yr2QjRz4tnQgm7uj4qrr6EIQm0OszU9tljD3N0PWLrxJBO6/2WThvXTG2i
 96ExaCMAwHBPYtwj8KotsAxXRUbjucFjG4GnvLWeTnnao/15mGWh5MbwohDMr0YrrtJv
 4Zd6rawMrRxcvNIppdsIRVm82cDTJhJR+ik+qzR/4zLyjuilxZYIOad85QD1cod6OfOn
 d6vGNTMx0melsVW+KfKe9kTLIhaBq7BeEYx3MgaMHJCiudGEGtn1H+tQwxZdqMjrBkus
 ktCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXXnEaiI/qn0WRHH7+BPNvscJ8usWmkx1MsnjWWlWDyo/0Z08QgIBVhUE9NaGENxlBQidKkJfF+Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0PSR3/H39dPL6uf/cO6UXt23vPh1AO/2KbXkVeiXNFFSz1Yvz
 biOJT2krL/WO5vD7dcizDvl2Z7O8do1D1VJ7mAancphARv0TYhCFmek5eXwup9Udi1ZFbpZt0RM
 O4+nMVTHHdWWiu+jJJsRUCPjcKm1uMJhniCXj3+9Mi0av6dnOBn1aFgRn97/uTKJi
X-Gm-Gg: ASbGncvMUbmuMSIxGejbnP0zOAvBvji+lir5rpNkaPVeeFslfaGA2KltKw7tvKOCKZD
 bMr3kaCWb/7mxwWHPvgBNtv6FlKyIYQq/4lFcGd8B8AqpzERA9xO0M1Ch4HWxzt7Fw2KcSHNYR0
 q0ILj2CYR69w+DDhd1hFc0sOuiywsnqi1Bg6ZbtlenNtULjw2HRu2rqhji8D2iccOKZJolo1EyP
 UREr9TKk9XevfazRdeORxqqXvsq09xhSSR1yIKJwMKIDS/ukH3FTAih
X-Received: by 2002:a05:6000:1f88:b0:38f:31fe:6d23 with SMTP id
 ffacd0b85a97d-38f650f1026mr1102930f8f.23.1740040206377; 
 Thu, 20 Feb 2025 00:30:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWe4dn/vMvUAlPK6coZSzvXwdBlz74zEXtytT7szYDy88V3WgwxDv+rQTmR53uaULnwnf4Aw==
X-Received: by 2002:a05:6000:1f88:b0:38f:31fe:6d23 with SMTP id
 ffacd0b85a97d-38f650f1026mr1102876f8f.23.1740040205927; 
 Thu, 20 Feb 2025 00:30:05 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f64b0f565sm1082572f8f.51.2025.02.20.00.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 00:30:05 -0800 (PST)
Date: Thu, 20 Feb 2025 09:30:04 +0100
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
Message-ID: <20250220-glorious-cockle-of-might-5b35f7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ej76au2ish3ar7gs"
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


--ej76au2ish3ar7gs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-02-20:
An reset signal polarity fix for the jd9365da-h3 panel, a folio handling
fix and config fix in nouveau, a dmem cgroup descendant pool handling
fix, and a missing header for amdxdna.
The following changes since commit e00a2e5d485faf53c7a24b9d1b575a642227947f:

  drm: Fix DSC BPP increment decoding (2025-02-13 10:20:30 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-02-20

for you to fetch changes up to 838c17fd077e611b12c78feb0feee1b30ed09b63:

  accel/amdxdna: Add missing include linux/slab.h (2025-02-19 09:42:17 -0800)

----------------------------------------------------------------
An reset signal polarity fix for the jd9365da-h3 panel, a folio handling
fix and config fix in nouveau, a dmem cgroup descendant pool handling
fix, and a missing header for amdxdna.

----------------------------------------------------------------
Aaron Kling (1):
      drm/nouveau/pmu: Fix gp10b firmware guard

David Hildenbrand (1):
      nouveau/svm: fix missing folio unlock + put after make_device_exclusive_range()

Friedrich Vock (1):
      cgroup/dmem: Don't open-code css_for_each_descendant_pre

Hugo Villeneuve (1):
      drm: panel: jd9365da-h3: fix reset signal polarity

Karol Herbst (1):
      MAINTAINERS: Remove myself

Su Hui (1):
      accel/amdxdna: Add missing include linux/slab.h

 MAINTAINERS                                      |  2 -
 drivers/accel/amdxdna/amdxdna_mailbox.c          |  1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c            |  9 ++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c  |  2 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c |  8 ++--
 kernel/cgroup/dmem.c                             | 50 ++++++------------------
 6 files changed, 24 insertions(+), 48 deletions(-)

--ej76au2ish3ar7gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7boDAAKCRAnX84Zoj2+
djlZAYDRWB/eU3jG1AGXcUwRjWNjXcdBLXybwk5Iln3U8cxwsE9vCR8cE0Iy4wWh
Wktc2T8BgLD8z8DWsOo4V72o6jSQdZXQl8uO4MxpEjctfXILwPUDLvIhEn6d6Emg
k+Pb72oimA==
=AiuH
-----END PGP SIGNATURE-----

--ej76au2ish3ar7gs--

