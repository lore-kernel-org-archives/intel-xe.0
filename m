Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C9CC52D7B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 07:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1A810E67E;
	Thu,  8 Aug 2024 07:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eiMmE0tE";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE1310E67E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723103324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=1/mxFxMd80/sQ8NPhDNvpUs06idNABoVBpkyN8ZX/Cc=;
 b=eiMmE0tE+TgV0jdzbudlvZwsyXvoQK3ycX6R/lyVHuleQlEhElRzgN6vIia5dYz5nVHUbk
 P9wqYeIA1xYgdGx00xwpxzNSfX8n8q7eWuA5e3aLY3lIsLx6S3gA/HfHVjiwe33Oy4BOKR
 vzyrIuVdzecbA24l/NUmO6ewDw02tcc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-ObLEp-5vPB6JUgf9CODDlQ-1; Thu, 08 Aug 2024 03:48:40 -0400
X-MC-Unique: ObLEp-5vPB6JUgf9CODDlQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-36bb2047c21so411859f8f.2
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Aug 2024 00:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723103319; x=1723708119;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1/mxFxMd80/sQ8NPhDNvpUs06idNABoVBpkyN8ZX/Cc=;
 b=Dl7nQAyhdXwxrtPRbriLkDndj4HaYicLOTp5rRwoBpOXygqepRsCeJ6gtJVVMoQ2Mz
 Yl2Dq03lICigRzF397N1AI3uy6yhfblWw+6wEpJ9QxTgWhsTzlVYqaaRyeb1+Xe49FMT
 WLkCtJWK8HHL+a0Cnb3jB5LMZvnwPTbNOnEltHakyHa5Kd6dK1e3BAsB21/yM4xBGI8a
 k+UyzVtV0ZZCTpeCZ1iLOJOelIbLoXUmA7tw6i8tEEW3EliOSLB+5eI/dA0bdnDJKzPq
 XPhHni8/QdQFcEShL+Evum4/Znrj/nW13qX53505BDflNzekUFls2UzX7PT+4v+osdkz
 YTvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4PLCe57loIwucrexSnBTNssY9+VDTzUYo6+80RzhNY67gZS7nIOtZR3jgM4GxTExqY9x6dpW+qRg2DRxWaMad4/7MkeBrdTa6zWJDQnM=
X-Gm-Message-State: AOJu0YyN3y7qOsIKFHketHrxykK7gtEMsS5hJeTRRXhnbVIA8qGvTQ3P
 VhajmQPFmrETKQvXR+XNGMJDnoy9HlIS85Jk2Y0PtM8a+sTaKN0CleeK0FE3DCaqJpuVXkxDOis
 KcDGMqfVLzVsuXOmoDkUIZwH2RBIa/tChpEfPn46jInJt/Eer61f1+WFlT2zF1Dsl
X-Received: by 2002:a05:6000:e4b:b0:368:68d3:32b5 with SMTP id
 ffacd0b85a97d-36d273cfef9mr771591f8f.13.1723103319141; 
 Thu, 08 Aug 2024 00:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2HPaXaG5wW7kZsB+rDvqqCIdeynFkM95W7Myr807Fl35JdF57w/4MCegwuj7+A1xD1AEVog==
X-Received: by 2002:a05:6000:e4b:b0:368:68d3:32b5 with SMTP id
 ffacd0b85a97d-36d273cfef9mr771561f8f.13.1723103318539; 
 Thu, 08 Aug 2024 00:48:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d27229116sm1000905f8f.98.2024.08.08.00.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 00:48:38 -0700 (PDT)
Date: Thu, 8 Aug 2024 09:48:37 +0200
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
Subject: [PULL] drm-misc-fixes
Message-ID: <20240808-debonair-smoky-mustang-8b6b3f@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ppxfsvitnxaptq4g"
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


--ppxfsvitnxaptq4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2024-08-08:
A fix for drm/client to prevent a null pointer dereference, a fix for a
double-free in drm/bridge-connector, a fix for a gem shmem test, and a
fix for async flips updates.
The following changes since commit 9c685f61722d30a22d55bb8a48f7a48bb2e19bcc:

  nouveau: set placement to original placement on uvmm validate. (2024-08-01 01:22:12 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-08-08

for you to fetch changes up to 929725bd7eb4eea1f75197d9847f3f1ea5afdad1:

  drm/atomic: allow no-op FB_ID updates for async flips (2024-08-06 20:16:31 +0200)

----------------------------------------------------------------
A fix for drm/client to prevent a null pointer dereference, a fix for a
double-free in drm/bridge-connector, a fix for a gem shmem test, and a
fix for async flips updates.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/omap: add CONFIG_MMU dependency

Cristian Ciocaltea (1):
      drm/bridge-connector: Fix double free in error handling paths

Dave Airlie (1):
      drm/test: fix the gem shmem test to map the sg table.

Ma Ke (1):
      drm/client: fix null pointer dereference in drm_client_modeset_probe

Rob Clark (1):
      dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02

Simon Ser (1):
      drm/atomic: allow no-op FB_ID updates for async flips

 .../bindings/display/panel/samsung,atna33xc20.yaml        |  9 ++++++---
 drivers/gpu/drm/drm_atomic_uapi.c                         | 15 ++++-----------
 drivers/gpu/drm/drm_bridge_connector.c                    |  8 ++------
 drivers/gpu/drm/drm_client_modeset.c                      |  5 +++++
 drivers/gpu/drm/omapdrm/Kconfig                           |  1 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c                | 11 +++++++++++
 6 files changed, 29 insertions(+), 20 deletions(-)

--ppxfsvitnxaptq4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZrR4VQAKCRDj7w1vZxhR
xVemAQCnUuNAzoMJhskbmhGYTFKnExg7HyCqRBG5QuYF31PTXAD/e0KezrDZg8aw
BWuFf0D9iu2WlV5Qm6sphURp84guyQw=
=62bK
-----END PGP SIGNATURE-----

--ppxfsvitnxaptq4g--

