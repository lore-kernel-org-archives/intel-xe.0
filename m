Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30243606A333
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WkMFeWQW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68D510E04E;
	Fri, 13 Nov 2026 19:19:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B3210E04E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:19:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 281D360623;
 Fri, 13 Nov 2026 19:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66641F000C4;
 Fri, 13 Nov 2026 19:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794597570;
 bh=3ebX2m9KeuCV5J1WO/saEL76nMse3ixRs1JSF/joas0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WkMFeWQWgm/CHJcmtGhb0saLEErUQDzhWIhjDPwOgHAzx48r8XdVpgoc8PWYjKwpt
 I8mPUE8HaxVPck1940E9/RPKtaPuQPTMZp9vPRqNP6C73jFuuhhQdn11hLzhtUiSXa
 OTln4suvIAQ08aRpFWEBw+1VJSU6VFlNfL6wBKit/kImChYksKneqZF6U681dpmnWt
 bUpD7Fk/eYqI3yBu+bhu19VGDFYRODehn51roupisnFj3j415tmFXMs1ETwlRwrc33
 3K7q8oyz7Ub/1hmPtKmg4mVgZm5cMVNp7yaTHERF9UUC4qgof8Nw6S2wosyrGUryU/
 fTikyPqkZWYcg==
Message-ID: <sashiko-outbox-213540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] drm/gpusvm: Add a DMA-mapping accounting callback
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113190128.2118723-1-matthew.brost@intel.com>
References: <20261113190128.2118723-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:19:30 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] drm/gpusvm: incomplete full-SVM ops check and doc in
  drm_gpusvm_init()
- [Low] drm/gpusvm: document locking context for
  drm_gpusvm_ops.dma_map_account
--

commit 8cdf85308b0a5f01cbf31357b5001cfa11f7973f
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/gpusvm: Add a DMA-mapping accounting callback

This commit adds an optional dma_map_account callback to struct
drm_gpusvm_ops for symmetric DMA-mapping accounting and allows a restricted
ops table with page-level hooks when initializing drm_gpusvm without an mm.

> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 45169eb6de619..18b51be7d6df3 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -503,8 +503,16 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>  			return -EINVAL;
>  		mmgrab(mm);
>  	} else {
> -		/* No full SVM mode, only core drm_gpusvm_pages API. */
> -		if (ops || num_chunks || mm_range || notifier_size)
> +		/*
> +		 * No full SVM mode, only core drm_gpusvm_pages API. A
> +		 * restricted @ops that only implements the page-level hooks
> +		 * (e.g. @dma_map_account) is allowed; the full-SVM hooks must
> +		 * not be set.
> +		 */
> +		if (num_chunks || mm_range || notifier_size)
> +			return -EINVAL;
> +		if (ops && (ops->invalidate || ops->range_alloc ||
> +			    ops->range_free))
>  			return -EINVAL;
>  	}

[Severity: Low]
Should this check also reject ops->notifier_alloc and ops->notifier_free
when mm is NULL, as those are full-SVM hooks on struct drm_gpusvm_ops as
well?

Also, the kernel-doc above drm_gpusvm_init() still says that only @gpusvm
and @name are expected when using the simple drm_gpusvm_pages API.

[ ... ]

> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 4d31c6bba7455..637c19f7169f1 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -75,6 +75,25 @@ struct drm_gpusvm_ops {
>  	void (*invalidate)(struct drm_gpusvm *gpusvm,
>  			   struct drm_gpusvm_notifier *notifier,
>  			   const struct mmu_notifier_range *mmu_range);
> +
> +	/**
> +	 * @dma_map_account: Account a DMA-mapping change (optional)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @addr: The address descriptor of the chunk being (un)mapped
> +	 * @sign: +1 when @addr has just been DMA-mapped, -1 when it is being
> +	 *        unmapped
> +	 *
> +	 * Called once per &drm_pagemap_addr entry, when the entry is
> +	 * DMA-mapped by drm_gpusvm_get_pages() (@sign =3D=3D +1) and when it is
> +	 * unmapped (@sign =3D=3D -1), so the driver can keep symmetric account=
ing
> +	 * of the pages it has mapped for GPU access. The @addr->proto field
> +	 * can be used to distinguish system-memory mappings from device
> +	 * interconnect mappings. May be provided in both full SVM mode and the
> +	 * core drm_gpusvm_pages-only mode.
> +	 */
> +	void (*dma_map_account)(struct drm_gpusvm *gpusvm,
> +				const struct drm_pagemap_addr *addr,
> +				int sign);
>  };

[Severity: Low]
Could the kernel-doc for @dma_map_account document its locking and
execution context, similar to @invalidate and @devmem_fn?

It is called under gpusvm->notifier_lock in read mode during
drm_gpusvm_dma_map_pages() and non-notifier unmaps (allowing concurrent
calls), and in write mode from MMU notifier invalidation context when
ctx->in_notifier is set in drm_gpusvm_unmap_pages().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113190128.2118=
723-1-matthew.brost@intel.com?part=3D1
