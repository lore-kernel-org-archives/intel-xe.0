Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FC4C19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 14:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25F10EAFB;
	Thu, 27 Feb 2025 14:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wgw+xfFv";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9110EAFB
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740665406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=9VIuQIUD2G9HmHUMYzEJUEoqvlwDhuWKeNCxaXLu2E8=;
 b=Wgw+xfFvF7DVhepEfFcbOaMmie5bu6/P3U3diYN+rYYjqevsLxwK9yLD5VRHnzHVJt++8K
 a9ynz43TP9NYAS/ScTESZyIWGwltHlmGAcqMG28CV5HmiruqyzqZN0wX/XHIkExFB1i1X7
 yX8rLZZ0BdvTMqKwXRHmCNUOBYCNKvQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-4pV7Y7ksPhmP46AtC0rY2w-1; Thu, 27 Feb 2025 09:10:04 -0500
X-MC-Unique: 4pV7Y7ksPhmP46AtC0rY2w-1
X-Mimecast-MFC-AGG-ID: 4pV7Y7ksPhmP46AtC0rY2w_1740665402
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so9169875e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 06:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740665402; x=1741270202;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9VIuQIUD2G9HmHUMYzEJUEoqvlwDhuWKeNCxaXLu2E8=;
 b=VdWEQF1GBPX319VpteD0fx02x59VX+ovtxkxrPBAZzZrwVGcw/Kmhxe0F7XZ9fXy2Z
 dMfJUVsi2yjrByzN9sqGyBSIz6k7BKiSu9yBXFxaxBqHsVU/qfdZh3oDCX1cFnrDRono
 v7Rku04RjZgfFPhjhzqja3Ge30/ln0dQbKnOjRW5oAajPOWXAw3PZYZSXGjgk763EofY
 RiDTE/SPclrldy6T28AlEHQ+2I6uMeEm1bEAzPbaTFWb3QbjGK/fWeQlMJrxcyutPksV
 RvNYqOZiJSsxjGCBTnhbacVz8ZDCICb6HRYupw0+S3JBs2pjTQeUZeDH2MIKiCcCtRWK
 Q6jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpfzFbdEy2TFU6kE9HR5h7HQlAfgqS/3lfPjc+uhgXNnFsr/YVE1FOTSjeigBfTZOhKw9WE+VyhA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv5fFnVfWitZ9WLk93GXXZxirXB/wGY1y7j+gI1UCrEwd9Bqr8
 SsnHcRa5HBDSRiZ6yp/OLKVVgzWmw826Tera6u0Ar7n+vvh6xFU0STWUoBSowfjFqChRM4OC//C
 Oo3RfM89z393mB/58+B9kIWTdwzuwqQ9qGa5mIDwU5zso8PQSQ7cAP3SapS2Dh5wf
X-Gm-Gg: ASbGncuM/snjZAN4ZazwDYfaBYVhos6J/crlJEaLQ6W2WfanFp78MxUlifJVALgXDZK
 8/qZJxLa4tmVqpzwf7oCdrBBqyPKjb60DEcLgjpoUMO1NiA2yajznni89lxwNPVNndn7tp8CIoe
 kIXvIebYXLzSHlObruM8sWlBQX+59ZYCMDaOSnKjorgVgNq95sBeJZqy+BZlahXD7RDCT9akllF
 F+DiqDJBH6X5+7Xehtk+LlY6Z7DBcQ0ObcsmyIUADz8LbZdtWOtF5saI42WxHAKOfM=
X-Received: by 2002:a05:600c:4f51:b0:43b:4829:8067 with SMTP id
 5b1f17b1804b1-43b4829817amr22148155e9.6.1740665401614; 
 Thu, 27 Feb 2025 06:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEifNsznLyokR5GKTVl0D+NUMfkGyQdP0bwlykOiIadUJSZ50u1EKnGJVxmAoCSEpoxyBBIDw==
X-Received: by 2002:a05:600c:4f51:b0:43b:4829:8067 with SMTP id
 5b1f17b1804b1-43b4829817amr22147685e9.6.1740665401111; 
 Thu, 27 Feb 2025 06:10:01 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b73718e2asm25044075e9.21.2025.02.27.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:10:00 -0800 (PST)
Date: Thu, 27 Feb 2025 15:10:00 +0100
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
Message-ID: <20250227-antique-robust-earthworm-09dfd1@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nbfo27jsootlcyjj"
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


--nbfo27jsootlcyjj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-02-27:
Fix a rounding error in vkms, a header fix for img, a connector status
fix for nouveau, and a NULL pointer dereference fix for deferred IO
drivers.
The following changes since commit 838c17fd077e611b12c78feb0feee1b30ed09b63:

  accel/amdxdna: Add missing include linux/slab.h (2025-02-19 09:42:17 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-02-27

for you to fetch changes up to 3603996432997f7c88da37a97062a46cda01ac9d:

  drm/fbdev-dma: Add shadow buffering for deferred I/O (2025-02-27 09:37:55 +0100)

----------------------------------------------------------------
Fix a rounding error in vkms, a header fix for img, a connector status
fix for nouveau, and a NULL pointer dereference fix for deferred IO
drivers.

----------------------------------------------------------------
Harry Wentland (1):
      drm/vkms: Round fixp2int conversion in lerp_u16

Maarten Lankhorst (1):
      MAINTAINERS: Add entry for DMEM cgroup controller

Masahiro Yamada (1):
      drm/imagination: remove unnecessary header include path

Thomas Zimmermann (2):
      drm/nouveau: Do not override forced connector status
      drm/fbdev-dma: Add shadow buffering for deferred I/O

 .mailmap                                    |   1 +
 MAINTAINERS                                 |  11 ++
 drivers/gpu/drm/drm_fbdev_dma.c             | 217 ++++++++++++++++++++--------
 drivers/gpu/drm/imagination/Makefile        |   2 -
 drivers/gpu/drm/nouveau/nouveau_connector.c |   1 -
 drivers/gpu/drm/vkms/vkms_composer.c        |   2 +-
 6 files changed, 168 insertions(+), 66 deletions(-)

--nbfo27jsootlcyjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8ByNwAKCRAnX84Zoj2+
dh30AX9cPkDzSECkxLqFCPUqLKQPGY1xantooz1/dk13BE+MQEF238u/PfZ49qLG
d8TOpQ8BgLMqrS6Cmucrtx8WVJS61QoMjxU6nBLwStysFIlPwu6LDuLB/Ap+1KMC
jCruuBzYEg==
=3kPG
-----END PGP SIGNATURE-----

--nbfo27jsootlcyjj--

