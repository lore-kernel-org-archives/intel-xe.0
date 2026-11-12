Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77587606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfDn6GiH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397F711209A;
	Thu, 12 Nov 2026 12:22:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28AA1120C5
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 12:22:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C1AD44F09;
 Thu, 12 Nov 2026 12:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF721F00A05;
 Thu, 12 Nov 2026 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794486159;
 bh=EckLFECf0+8ejT1eXOz1PZttzx7K9+WOIcFj7RvDQxg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PfDn6GiHB7OggInD9ILOvdSyIjsNFV5AIl226c+qb+jwma7YErRrS5KA5nFdn1CMd
 9wX0afKCY59UojZw1gfcoV8yMey3Iu7fI/kCPxz8/6WR81EsXyMON5DudaKyqcN6PB
 x9zxNwudwYPwDUhWn522HbUE6LfZSXs6kUB3Y4x03R7FcgFawMAyp3dMnfDz3iVWgr
 3vsLXR4wqTewpSPnIP0WIycaRl2Mg0MZY8c6S1ng+TBs3H95WyjmMfFFKQON2cbIg6
 c7jzHB2wNhYZ28QjMtfagPvZchC3jchZ5gpkwYkr+uny3hANQc+J2G2lEbPYA8xSIa
 wXF3qEMDsHNuQ==
Message-ID: <sashiko-outbox-211082@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/5] drm/xe/ggtt: Split GGTT into usable and
 shareable pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261112115147.2329912-4-piotr.piorkowski@intel.com>
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
 <20261112115147.2329912-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:22:39 +0000
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
- [High] drm/xe/ggtt: top-down BO placement in __xe_ggtt_insert_bo_at()
  overflows BAR2
- [Medium] drm/xe/ggtt: VF GGTT provisioning in pf_provision_vf_ggtt()
  uses usable pool
--

commit f8827204c76aa40b1a2f516ba70dd829ec78e86b
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/ggtt: Split GGTT into usable and shareable pools

This commit splits the GGTT into usable and shareable pools for driver-owned
allocations and SR-IOV VF provisioning, adding xe_ggtt_insert_node_shareabl=
e()
and adjusting insertion direction based on whether a shareable pool is
configured.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 73c45eecae2be..607578e4080e2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -447,7 +476,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (!ggtt->wq)
>  		return -ENOMEM;
> =20
> -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> +	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
> +			 IS_SRIOV_PF(xe) ? ggtt_size : 0);

[ ... ]

> +/*
> + * When the shareable range is present, allocations start from the bottom
> + * to leave space at the top; otherwise they start from the top.
> + */
> +static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
> +{
> +#ifdef CONFIG_PCI_IOV
> +	if (ggtt->shareable_size > 0)
> +		return DRM_MM_INSERT_LOW;
> +#endif
> +	return DRM_MM_INSERT_HIGH;
> +}
> +
> +static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 siz=
e, u32 align)
> +{
> +	struct xe_ggtt *ggtt =3D node->ggtt;
> +
> +	return ggtt_insert_node_in_range_locked(node, size, align, 0,
> +						ggtt->size, ggtt_usable_insert_flags(ggtt));
> +}

[ ... ]

> @@ -703,8 +777,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_g=
gtt *ggtt, u32 size, u32 ali
>  		return node;
> =20
>  	guard(mutex)(&ggtt->lock);
> -	ret =3D xe_ggtt_insert_node_locked(node, size, align,
> -					 DRM_MM_INSERT_HIGH);
> +
> +	ret =3D xe_ggtt_insert_node_locked(node, size, align);
> +	if (ret) {
> +		ggtt_node_fini(node);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return node;
> +}

[Severity: Medium]
Does switching xe_ggtt_insert_node() to ggtt_usable_insert_flags() invert VF
GGTT allocation order on SR-IOV PF?

On SR-IOV PF, ggtt->shareable_size is non-zero, so ggtt_usable_insert_flags=
()
returns DRM_MM_INSERT_LOW instead of DRM_MM_INSERT_HIGH.  However,
pf_provision_vf_ggtt() in drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c still
calls xe_ggtt_insert_node() rather than xe_ggtt_insert_node_shareable(),
which causes VF GGTT regions on PF to be allocated bottom-up from the usable
pool alongside PF driver BOs instead of top-down from the shareable pool.

[ ... ]

> @@ -882,10 +995,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *g=
gtt, struct xe_bo *bo,
>  	else
>  		end =3D 0;
> =20
> -	xe_tile_assert(ggtt->tile, end >=3D start + xe_bo_size(bo));
> +	end =3D min(end, ggtt->size);
> =20
> -	err =3D drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]-=
>base,
> -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> +	if (end < start + xe_bo_size(bo))
> +		err =3D -ENOSPC;
> +	else
> +		err =3D drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]=
->base,
> +						  xe_bo_size(bo), alignment, 0, start, end,
> +						  ggtt_usable_insert_flags(ggtt));

[Severity: High]
Does passing ggtt_usable_insert_flags(ggtt) here place stolen memory BOs pa=
st
the end of PCI BAR 2 on pre-12.70 integrated platforms?

When ggtt->shareable_size is 0, ggtt_usable_insert_flags() returns
DRM_MM_INSERT_HIGH, changing __xe_ggtt_insert_bo_at() from bottom-up (mode =
0)
to top-down allocation near GUC_GGTT_TOP (~4 GiB).  On integrated platforms
with graphics version < 12.70 where xe_ttm_stolen_cpu_access_needs_ggtt() is
true, CPU access to stolen BOs (such as the initial framebuffer in
initial_plane_bo()) is mapped through PCI BAR 2 (GMADR) at mgr->io_base +
xe_bo_ggtt_addr(bo):

drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:__xe_ttm_stolen_io_mem_reserve_stole=
n() {
	...
	/* GGTT is always contiguously mapped */
	mem->bus.offset =3D xe_bo_ggtt_addr(bo) + mgr->io_base;
	...
}

Because PCI BAR 2 only covers the low mappable GGTT aperture (typically
256 MiB), placing stolen BOs at the top of the 4 GiB GGTT causes
__xe_ttm_stolen_io_mem_reserve_stolen() and xe_ttm_stolen_io_offset() to
compute physical addresses gigabytes beyond BAR 2 and ioremap or mmap
unrelated host physical address space.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112115147.2329=
912-1-piotr.piorkowski@intel.com?part=3D3
