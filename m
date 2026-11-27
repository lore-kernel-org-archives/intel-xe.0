Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE8606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYqeghHN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F17010E00E;
	Fri, 27 Nov 2026 03:54:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9F10E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 03:54:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7E64C605F1;
 Fri, 27 Nov 2026 03:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CD01F000C1;
 Fri, 27 Nov 2026 03:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795751690;
 bh=z1fHzkHPy49Zbtp4cbtypM8wa5I1XixIZ4Eh9GfckVw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=oYqeghHNiI1JYiXBlRX0eH2aLtsRNs7dj4m/QS9gUc/J01juhkXXpD020gvgy8dXd
 dp3B12cgnjMIP7vRs2URpaqVObhscJZrB6d0i4TnKvOHZ1XI/XmJ+suqe7wO3USuza
 X1hzPBHSgSt/IWmxqHidoFfM2dtsfPeaiq9dviH8g4yYSy8Ywed5DleT1zOERFVj/U
 Z4d5pXAXkya0zIpBolvQngC42bZuxttioR8mn6GcEKWFb8n8MxcU3yE0PyemXt7gvm
 9mKOMVFpfAC/oNJ3OhWJpxriHmxwoFyagW9XnX8HmbrgQcy6jx3YCq5feLlBIj4/5Z
 0qESXkII95zXg==
Message-ID: <sashiko-outbox-236565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Exclude imported dma-buf BOs from the TT budget
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261127035202.2792551-2-himal.prasad.ghimiray@intel.com>
References: <20261127035202.2792551-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 03:54:49 +0000
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
- [Medium] drm/xe: useless eviction of uncharged imported dma-buf BOs
  from XE_PL_TT
--

commit 5f653edd2f2a196f3a1339336b2ead9630d79884
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Exclude imported dma-buf BOs from the TT budget

This commit tracks system memory usage excluding imported dma-buf BOs in
mem.sys_mgr_charged, enforcing the TT budget and reporting memory region
usage against this counter.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_=
ttm_sys_mgr.c
> index 9d77ba605aecf..24e2c690d9926 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -16,9 +16,15 @@
> =20
>  struct xe_ttm_sys_node {
>  	struct ttm_buffer_object *tbo;
> +	bool charged;
>  	struct ttm_range_mgr_node base;
>  };
> =20
> +static atomic64_t *to_charged_usage(struct ttm_resource_manager *man)
> +{
> +	return &container_of(man, struct xe_device, mem.sys_mgr)->mem.sys_mgr_c=
harged;
> +}
> +
>  static inline struct xe_ttm_sys_node *
>  to_xe_ttm_sys_node(struct ttm_resource *res)
>  {
> @@ -40,10 +46,21 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_man=
ager *man,
>  	node->tbo =3D tbo;
>  	ttm_resource_init(tbo, place, &node->base.base);
> =20
> -	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> -	    ttm_resource_manager_usage(man) > (man->size << PAGE_SHIFT)) {
> -		r =3D -ENOSPC;
> -		goto err_fini;
> +	/*
> +	 * Imported dma-bufs are backed by the exporter (possibly peer VRAM),
> +	 * so don't charge them against the local system memory budget.
> +	 */
> +	if (tbo->type !=3D ttm_bo_type_sg) {
> +		u64 size =3D node->base.base.size;
> +		u64 usage =3D atomic64_add_return(size, to_charged_usage(man));
> +
> +		if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> +		    usage > (man->size << PAGE_SHIFT)) {
> +			atomic64_sub(size, to_charged_usage(man));
> +			r =3D -ENOSPC;
> +			goto err_fini;
> +		}
> +		node->charged =3D true;
>  	}
> =20
>  	node->base.mm_nodes[0].start =3D 0;
> @@ -65,6 +82,8 @@ static void xe_ttm_sys_mgr_del(struct ttm_resource_mana=
ger *man,
>  {
>  	struct xe_ttm_sys_node *node =3D to_xe_ttm_sys_node(res);
> =20
> +	if (node->charged)
> +		atomic64_sub(res->size, to_charged_usage(man));
>  	ttm_resource_fini(man, res);
>  	kfree(node);
>  }

[Severity: Medium]
When a normal XE_PL_TT allocation exceeds the budget and returns -ENOSPC,
can TTM's eviction walk still evict unpinned ttm_bo_type_sg BOs from
XE_PL_TT without freeing any charged budget?

ttm_resource_init() places unpinned ttm_bo_type_sg resources onto
sys_mgr's LRU list, and neither xe_bo_eviction_valuable() nor
xe_ttm_sys_mgr_func.intersects rejects them.  During ttm_bo_evict_alloc(),
TTM will evict those imported dma-buf BOs to XE_PL_SYSTEM and invalidate
their VMA bindings via xe_bo_move_notify(), even though
xe_ttm_sys_mgr_del() skips atomic64_sub() when node->charged is false, so
the retried allocation still fails with -ENOSPC and the walk continues
evicting remaining imported BOs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127035202.2792=
551-2-himal.prasad.ghimiray@intel.com?part=3D1
