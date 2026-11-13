Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D02F606A335
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsUngzzZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F7110EC84;
	Fri, 13 Nov 2026 20:10:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A17E10E826
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 20:10:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AB9A42BA1;
 Fri, 13 Nov 2026 20:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C2B1F000C4;
 Fri, 13 Nov 2026 20:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794600644;
 bh=+1NHTdUIPjqyfBH8ca24Pgwv0Iohyf9NvM27dic6g+o=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WsUngzzZExCcoFVK/bm2ZbBtkRTBbQ0z55jf42NJkTmpWik2JygnkiG/MgaTmdFnS
 m0ypt4ibmkQLEYCcmSDUCvg51DCXDrOjcm5odBxoriIZngLUwaqonltgfrh92lhaq9
 J3a/s0O1EKLOO/psOMscDEzxR2ta5ZqZYbSTG9AzPhkDgI2oi/7HAIxnPQWlRFVUoI
 IFBhqOfasfHlY017jZO8BBu5WpvGCW6E3gNM41g+5F9sKQLavfXGBh1k1+pMNkv3Ds
 SHZBLQSwS0Wb9VcZc3yl598qY4w9wMVCR1VUiap3FGe7req1AoPGTqtLrYZp50T5pe
 6tXfJsalA7+sg==
Message-ID: <sashiko-outbox-213619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] drm/gpusvm: Add a DMA-mapping accounting callback
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113195212.2124791-1-matthew.brost@intel.com>
References: <20261113195212.2124791-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:10:43 +0000
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
- [Low] drm/gpusvm: missing locking and concurrency kernel-doc for
  dma_map_account()
--

commit 21732d5b49daa03b298f4befee97b908a74029e5
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/gpusvm: Add a DMA-mapping accounting callback

This commit adds an optional dma_map_account callback to struct
drm_gpusvm_ops so drivers can track DMA-mapped pages symmetrically across
map and unmap paths, and allows restricted ops in drm_gpusvm_pages-only
mode.

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
Should the kernel-doc for @dma_map_account document its locking and
concurrency rules, like @invalidate above it does?

Both drm_gpusvm_dma_map_pages() and __drm_gpusvm_unmap_pages() invoke
dma_map_account() under gpusvm->notifier_lock, which is annotated with
fs_reclaim_acquire(GFP_KERNEL) in drm_gpusvm_init() and is held only in
read mode during drm_gpusvm_get_pages(), drm_gpusvm_free_pages(), and
non-notifier drm_gpusvm_unmap_pages() calls.  Without noting that the
callback runs under notifier_lock (in read or write mode) and can be
invoked concurrently on the same struct drm_gpusvm, a driver could use
non-atomic counters or take reclaim-unsafe locks inside the callback.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113195212.2124=
791-1-matthew.brost@intel.com?part=3D1
