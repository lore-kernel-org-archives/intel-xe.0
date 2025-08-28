Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1CDCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 06:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4812510E194;
	Thu, 28 Aug 2025 06:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P3Dh0KkN";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1F410E194
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756362758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7AoG9YHih5iXChLTsxRiuXwiWs4qQNPsTE1cJiG9KLo=;
 b=P3Dh0KkNWqYsgGdVNqVdvP5ZxGC8p/GcUzMeaYMeCk8+Bq2YTFVM/DtngDu8PbIhpRJRJK
 LLPSrG7ToqV51jPk9mmIovrdSZyslN+Q+1WRIWR0Qn8ttn6WYJZUBkBuIbnl0kLuthgE5n
 WV3acxrSme5rWkbiu8zfvTtvn/i+9q4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-k46oOIc4Pna1IU4MKSx8sw-1; Thu, 28 Aug 2025 02:32:36 -0400
X-MC-Unique: k46oOIc4Pna1IU4MKSx8sw-1
X-Mimecast-MFC-AGG-ID: k46oOIc4Pna1IU4MKSx8sw_1756362755
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1ad21752so2698215e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 23:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756362755; x=1756967555;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AoG9YHih5iXChLTsxRiuXwiWs4qQNPsTE1cJiG9KLo=;
 b=Yk80TB8eZruUrnBSTrNjlM9iS7J6PMJ0Os48dpjZnM3/nKKErU7/H7d7L204E/e3Lh
 wir64EFA1gSQBFwHhmn32X76giKr1VTRIUTeNFh9oDXSzWlFJyvS4/HImKS4DAkyEyu9
 YRJK90WVVavctLFLLkNsx1smzvV+NVgbq/XTmmbpSTke7tYTZn4e+Q63A0z18Wi3PTym
 HJlv/JyTVAIkV94p7TPL/jrh1N9TFcOS9z3yONUGYknIB21WGhK50LqYlWGsFeuQJvvw
 ctoRwknTOJldIQJHPjo1RxlJ4gXVUmtgahtUr5PCQxB45trn7ttml35IyMU225EXRWgQ
 l++w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWenjslTrShho0AxfMKU9j9f6IjaHQCssQJyprsXIWF9OFC5RbCgRFdyh9CTagd+vXI0yzMNk/SuQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSq1Bgz3JrNV89sxt88jnvtQZ7G5Yv741lKoriHvxl2jfzMoZs
 EUVweKRoq+6X8yvRZhN+YQPHTuRhF+Z+m6cR0YPR8kF2ypdgEsozE8ZaXM6mRfVVyDFS36Ut8uR
 f9IWWvXG9o6GLnKWXVGEYLnlt18GziDi2IPEplylDBOwgyYsuv14blUZry5I4G2kbq/ST
X-Gm-Gg: ASbGncu97EtVLZ3G2O0CAQwGFwzH9NSP///vCec1bNzNv7x4/dECprELoR/PLO8vxib
 Ln0xsxok409VD5avp+IXPilMTFo5mGulSl+Qu3GSDaqiADxuNuAskngTd1b7FoWJCa83POwIe/3
 1szO2uin4uefpd/2QRuyYg9hsN0L5Nrh+b/+vuDB7y27shcH3iMNHehX/Tf65mMBR09aYzLdcnk
 1AwapJ/sxHGAI2WJfCnxne5HknA1MBlbRjG19YUdfyH1tfh0Ix58cs6RcQK6xnxbqA0WghU17P7
 BP2fgUdhvlSgYZ8=
X-Received: by 2002:a05:600c:c493:b0:45b:7bba:c79f with SMTP id
 5b1f17b1804b1-45b7bbaca16mr4471345e9.13.1756362754956; 
 Wed, 27 Aug 2025 23:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfmgTsZg/VX13PXkOipuoNoPe3imAyCZvKudh2VGqkUeTRG4jj92qcBhtntnqYiRsxLL3FQg==
X-Received: by 2002:a05:600c:c493:b0:45b:7bba:c79f with SMTP id
 5b1f17b1804b1-45b7bbaca16mr4471145e9.13.1756362754535; 
 Wed, 27 Aug 2025 23:32:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70e4ba046sm25390318f8f.1.2025.08.27.23.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 23:32:33 -0700 (PDT)
Date: Thu, 28 Aug 2025 08:32:33 +0200
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
Message-ID: <20250828-hypersonic-colorful-squirrel-64f04b@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xhzf22kj3z7coqpl"
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


--xhzf22kj3z7coqpl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-08-28:
Several nouveau fixes to remove unused code, fix an error path and be
less restrictive with the formats it accepts. A fix for amdgpu to pin
vmapped dma-buf, and a revert for tegra for a regression in the dma-buf
/ GEM code.
The following changes since commit 1a2cf179e2973f6801c67397ecc987391b084bcf:

  Merge drm/drm-fixes into drm-misc-fixes (2025-08-20 16:08:49 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-08-28

for you to fetch changes up to 16fdb3cc6af8460f23a706512c6f5e7dfdd4f338:

  Revert "drm/tegra: Use dma_buf from GEM object instance" (2025-08-26 10:41:27 +0200)

----------------------------------------------------------------
Several nouveau fixes to remove unused code, fix an error path and be
less restrictive with the formats it accepts. A fix for amdgpu to pin
vmapped dma-buf, and a revert for tegra for a regression in the dma-buf
/ GEM code.

----------------------------------------------------------------
Alice Ryhl (1):
      drm/gpuvm: fix various typos in .c and .h gpuvm file

James Jones (1):
      drm/nouveau/disp: Always accept linear modifier

Thomas Zimmermann (2):
      drm/amdgpu: Pin buffers while vmap'ing exported dma-buf objects
      Revert "drm/tegra: Use dma_buf from GEM object instance"

Timur Tabi (3):
      drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
      drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
      drm/nouveau: remove unused memory target test

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c     | 34 ++++++++++-
 drivers/gpu/drm/drm_gpuvm.c                     | 78 ++++++++++++-------------
 drivers/gpu/drm/nouveau/dispnv50/wndw.c         |  4 ++
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c     | 15 ++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c |  5 +-
 drivers/gpu/drm/tegra/gem.c                     |  2 +-
 include/drm/drm_gpuvm.h                         | 10 ++--
 7 files changed, 88 insertions(+), 60 deletions(-)

--xhzf22kj3z7coqpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK/4AQAKCRAnX84Zoj2+
dkEEAYDpd0YqFdGm9BGLBX+ExSDguR4FXLpIfdqxzG6EJoktzNXweJcV9HXhC2AT
waiATMUBfR2v2dsmPYo2/ACCLvLsmbz+Suzjg42Wau45mht7nnKgJaNO+SsDm0AL
2rWgo3t/4A==
=TtXz
-----END PGP SIGNATURE-----

--xhzf22kj3z7coqpl--

