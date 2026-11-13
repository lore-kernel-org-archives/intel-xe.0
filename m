Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A43606A330
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPJQEb6A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAFF10E19D;
	Fri, 13 Nov 2026 19:39:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3608510E19D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:39:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D3156263B;
 Fri, 13 Nov 2026 19:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3CF1F000C4;
 Fri, 13 Nov 2026 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794598749;
 bh=hHu6ZFOr1uIqlVZFzpikqOhI9C+kO1CnHl8RgfsntKI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=UPJQEb6Aunmofi/Biz27EWWqmR5lbtfnH7V8L98F98YVrENuCCReLa7yL3wVgAWvI
 rFjXka3s3m7iwEtJ55jsS2LBg+w4qm7Zc+Tu/mczP3clPbZ7fTMaAi+DU4rJtKgj0w
 uuIDqd3GIKH/XuvN2ycAvkHRrYgT1Fwa3slxa/wE5GX5Zq8irEAaKpG/q9VYzb0h2V
 ncVI6exJ4BzWQX61t5zrktdz+iEmo6X1hu3vDZQQQYVOH/jo85BXyJbSWiw5yyBMMy
 P5E44brMsQSCMCsgCTMrkejtQ5FV0Y8XiUT3L8acUTKJ5sdY4Lq9Zad+jPRhz1f0Av
 +CoG0N7wPPRng==
Message-ID: <sashiko-outbox-213558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/xe: Add debugfs stats for DMA-mapped pages
 per order
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113190128.2118723-2-matthew.brost@intel.com>
References: <20261113190128.2118723-1-matthew.brost@intel.com>
 <20261113190128.2118723-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:39:09 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe: build failure in xe_userptr.c when
  CONFIG_DRM_XE_GPUSVM=3Dn
--

commit cdf22e3bf1d70b7d0f7e88b6b7825cfa6ceeb290
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Add debugfs stats for DMA-mapped pages per order

This commit adds per-order DMA-mapped system page counters for TTM buffer
objects and GPU SVM / userptr ranges, and exposes them in debugfs at
dma_mapped_pages.

> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_user=
ptr.c
> index 9c1dac0fce6f1..e657d7886a96b 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -8,9 +8,38 @@
> =20
>  #include <linux/mm.h>
> =20
> +#include <drm/drm_pagemap.h>
> +
> +#include "xe_svm.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_trace_bo.h"
> =20
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static const struct drm_gpusvm_ops xe_userptr_gpusvm_ops =3D {
> +	.dma_map_account =3D xe_svm_dma_map_account,
> +};
> +#endif

[Severity: High]
Does xe_userptr.c fail to build when CONFIG_DRM_XE_GPUSVM=3Dn,
CONFIG_DRM_GPUSVM=3Dy and CONFIG_DEBUG_FS=3Dy?

xe_userptr.o is built under CONFIG_DRM_GPUSVM, whereas
xe_svm_dma_map_account() is declared in the #if
IS_ENABLED(CONFIG_DRM_XE_GPUSVM) block of xe_svm.h and defined in xe_svm.c
(which is only built under CONFIG_DRM_XE_GPUSVM).  Moving
xe_svm_dma_map_account() to a header or into xe_userptr.c so both
configurations can use it would avoid the undeclared identifier error.

Also, xe_userptr.c already includes "xe_svm.h" at the top of the file, so
the new #include "xe_svm.h" is a duplicate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113190128.2118=
723-1-matthew.brost@intel.com?part=3D2
