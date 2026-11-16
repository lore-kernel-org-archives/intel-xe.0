Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AF606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihQj22I8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F287F10EE25;
	Mon, 16 Nov 2026 09:25:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963E010EE25
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:25:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6663F40469;
 Mon, 16 Nov 2026 09:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5951F000C4;
 Mon, 16 Nov 2026 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794821153;
 bh=yCowEz54AtxHAcDeSbjBeoWrBJNUXkuReAaO5riNqkY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ihQj22I8UTsud/dG4d29K0iFxjnZwk4TS8VKL87B4vjcZRAzZojF9P08xJVJL4GKR
 /ebKh9CVAjmG/fLIZvqbkdl7Fz1VuciYQKRVPJmTPC1z7OHsxzryz6bzwz6pFSqw6F
 WI1xWH4tUEYi1zDc40lg5CqCa0pYgKNYZY185mBhJbYTPuYdEETsFj89rkCqtVEwyQ
 OPJUAWc1dBIc+7CxjvsJLIaIkgKMRsIF9ruQOXcRSwAon52OHF7gMVv3qegb3kOwCG
 MNfMm5OhJMkglAYwkA6jph9fG0bak2cp5RF/hTRV8Ko5jcq8OI3vbn4TkPva3bUH/F
 WJj4C3KeXZkrQ==
Message-ID: <sashiko-outbox-216610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/5] drm/xe/ggtt: Split GGTT into usable and
 shareable pools
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116090053.2466938-4-piotr.piorkowski@intel.com>
References: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
 <20261116090053.2466938-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 09:25:52 +0000
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
- [Medium] drm/xe/ggtt: u32 size truncation in
  xe_ggtt_insert_node_shareable()
--

commit 77f9ae0aec9ac84bb1acae228f0f6fa5525c45d5
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/ggtt: Split GGTT into usable and shareable pools

This commit splits the GGTT into a usable pool for driver-owned allocations
and a shareable pool for SR-IOV VF provisioning, adding
xe_ggtt_insert_node_shareable() for the shareable range.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 73c45eecae2be..8bc888f6274cc 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -652,24 +687,65 @@ static void xe_ggtt_invalidate_engine(struct xe_ggt=
t *ggtt)

[ ... ]

> -static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
> -				      u32 size, u32 align, u32 mm_flags)
> +static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u=
32 size,
> +					    u32 align, u64 range_start,
> +					    u64 range_size, u32 mm_flags)
>  {
> -	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, a=
lign, 0,
> -					  mm_flags);
> +	struct xe_ggtt *ggtt =3D node->ggtt;
> +	u64 range_end =3D range_start + range_size;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if (!range_size || range_end <=3D range_start)
> +		return -EINVAL;
> +
> +	if (range_end > ggtt->full_size)
> +		return -ERANGE;
> +
> +	if (size > range_size)
> +		return -ENOSPC;
> +
> +	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align,=
 0,
> +					  range_start, range_end, mm_flags);
> +}

[ ... ]

> @@ -703,8 +779,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_g=
gtt *ggtt, u32 size, u32 ali

[ ... ]

> +#ifdef CONFIG_PCI_IOV
> +/**
> + * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable =
GGTT range
> + * @ggtt: the &xe_ggtt into which the node should be inserted.
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + *
> + * Allocations always start from the top (DRM_MM_INSERT_HIGH).
> + *
> + * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
> + */
> +struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt,=
 u32 size, u32 align)
> +{
> +	struct xe_ggtt_node *node;
> +	int ret;
> +
> +	if (!ggtt->shareable_size)
> +		return ERR_PTR(-ENOSPC);
> +
> +	node =3D ggtt_node_init(ggtt);
> +	if (IS_ERR(node))
> +		return node;
> +
> +	guard(mutex)(&ggtt->lock);
> +
> +	ret =3D ggtt_insert_node_in_range_locked(node, size, align,
> +					       ggtt_shareable_offset(ggtt),
> +					       ggtt->shareable_size,
> +					       DRM_MM_INSERT_HIGH);
>  	if (ret) {
>  		ggtt_node_fini(node);
>  		return ERR_PTR(ret);
>  	}
> =20
>  	return node;
>  }
> +#endif

[Severity: Medium]
Should size and align in xe_ggtt_insert_node_shareable(),
xe_ggtt_insert_node_locked() and ggtt_insert_node_in_range_locked() be u64
instead of u32?

pf_provision_vf_ggtt() takes a u64 size (for example from the u64
ggtt_quota debugfs attribute) and passes it to
xe_ggtt_insert_node_shareable().  A 64-bit size >=3D 4 GiB with non-zero
lower 32 bits (such as SZ_4G + SZ_64M) is truncated to u32 before the
size > range_size check in ggtt_insert_node_in_range_locked(), so instead
of returning -ENOSPC, pf_provision_vf_ggtt() allocates a node for the
truncated 32-bit size and then passes the untruncated 64-bit size to GuC
via pf_distribute_config_ggtt().  Similarly, xe_ggtt_insert_node_transform()
accepts a u64 size and passes it to xe_ggtt_insert_node_locked().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116090053.2466=
938-1-piotr.piorkowski@intel.com?part=3D3
