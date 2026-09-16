Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2ECC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBC910E011;
	Wed, 16 Sep 2026 11:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hJD/3yjo";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0500B10E011
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:36:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 47A23602CB;
 Wed, 16 Sep 2026 11:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C791F000FF;
 Wed, 16 Sep 2026 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789558599;
 bh=vRBTdDsMM/4+GOchd/644bzFeJUC/AJRUuSX3VEr/iw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hJD/3yjohkxUxo4nhdl0JyvZ2+riiOeRWmuohHrZwRElBT/9k9XpZYyHr4K47y44t
 NfPxBovfvHUYGZdjLuBbsDKx8f9kxwrcUEnz4gy9rnizBU9ESXaE5izvGQmCYSPW3A
 T6ZYxxUbBwcIpWp3SaIH91Nh0NmN6TEaBBTrO2qDv8YJ71xcwSJxuyqkxM1TTZDSwN
 I3VSyJthgwfSbGdCnuTOSoBwuo8RioNnD4URf/Q2OnKJIl6qU89VuIlCAK2mKfkKMF
 OGqXEBtywSVwvAGCvOKI3uZ6g099f/3aNBXJKFDUdjcWaZP9bgjxfldua1/wTU0Y9A
 gpbcb67+K3BkQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC 2/4] drm/gpusvm: Add devmem callback to get_pages
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916112828.2528881-8-himal.prasad.ghimiray@intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:36:38 +0000
Message-Id: <20260916113638.C7C791F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/gpusvm: Type confusion and memory corruption on foreign device=
 coherent pages
- [Low] drm/gpusvm: Non-contiguous device memory runs merged when separated=
 by system pages
--

commit 26edb821373f785b22418001719e2435aed329fe
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/gpusvm: Add devmem callback to get_pages

This patch adds an optional drm_gpusvm_ctx.devmem_fn callback to get_pages.
The callback is invoked for each contiguous run of pages backed by the same
device-memory allocation when processing faulted pages under the notifier
lock.

> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index b6c9d3a07dc81..6cec70d6f1859 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
[ ... ]
> +static void drm_gpusvm_walk_devmem(struct drm_gpusvm *gpusvm,
> +				   unsigned long *pfns,
> +				   unsigned long npages,
> +				   const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_pagemap_devmem *last =3D NULL;
> +	unsigned int order =3D 0;
> +	unsigned long i;
> +
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	for (i =3D 0; i < npages; i +=3D 1 << order) {
> +		struct page *page =3D hmm_pfn_to_page(pfns[i]);
> +		struct drm_pagemap_devmem *devmem;
> +
> +		order =3D drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> +
> +		if (!is_device_private_page(page) &&
> +		    !is_device_coherent_page(page))
> +			continue;

[Severity: Low]
Does this continue statement incorrectly skip resetting the 'last' tracking
pointer for system pages?

If a virtual memory range contains a device memory run, followed by system
memory, and then the same device memory run again, 'last' will retain its
previous value during the system memory iteration. When the second run of
device memory is reached, the subsequent 'devmem =3D=3D last' check will
evaluate to true, incorrectly skipping the callback for the second run and
violating the API contract that non-contiguous allocations are reported more
than once.

> +
> +		devmem =3D drm_pagemap_page_to_devmem(page);

[Severity: High]
Can this cause type confusion and memory corruption if the page is a foreign
device coherent page?

HMM's hmm_range_fault() does not filter device coherent pages by
dev_private_owner, so an unprivileged user mapping a device coherent page
from a foreign driver (e.g., AMDGPU) will pass the
is_device_coherent_page(page) check above.

The call to drm_pagemap_page_to_devmem(page) will then blindly cast the
foreign driver's zone_device_data to a struct drm_pagemap_zdd * and
dereference it, leading to invalid memory access.

> +		if (devmem =3D=3D last)
> +			continue;
> +
> +		last =3D devmem;
> +		ctx->devmem_fn(devmem);
> +	}
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916112828.2528=
881-6-himal.prasad.ghimiray@intel.com?part=3D2
