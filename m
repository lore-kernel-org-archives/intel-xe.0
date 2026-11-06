Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E544606A332
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijBnGchh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F174810E3ED;
	Fri,  6 Nov 2026 10:50:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABD610E3ED
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 10:50:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EF7C6062A;
 Fri,  6 Nov 2026 10:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E761F0089F;
 Fri,  6 Nov 2026 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793962233;
 bh=8uGPrT59NRjWpDcpp5y9HPEEkPLxETK3HHhuXevQMlQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ijBnGchh77CoX+1q+rHOLFtqLPaUv4gmCybEXuYsZg4riYsZWFBrqMqX6e6Nn//Dj
 pIVVjJef7FHJZXtrAH3o0QXa5DwwV3r+gf64aDxZWvs8XmxYbq0ttd+3IAaNAbYgdH
 RK08yJHw9di6jpnJ3EkYTeqZsgoQLhxI2lZdTlTVB/w8Py1wTTZMkYb4PBPa25vX39
 kpH64BtxvvglUCJrxB+plFZ1gTwGsRlNIDg/ZVAQbaptyxforPggcBT55PqICORExu
 GvnpG7lGanH5kan6Jad8AghIonQnf0XAig//9klDpp3qTSmt8S+9tYCf6i1kf3xuUP
 029ULCNF50IyQ==
Message-ID: <sashiko-outbox-201230@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe: only evict CCS buffers from TT on iGPU
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106-s4-opti-v1-1-5edaea2c6d31@intel.com>
References: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
 <20261106-s4-opti-v1-1-5edaea2c6d31@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:50:33 +0000
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
- [High] drm/xe: missing ttm_bo_unmap_virtual() before xe_ttm_bo_purge()
  in eviction
--

commit 0a382553920cfe97389f0ff2b7a78f7419640c3e
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe: only evict CCS buffers from TT on iGPU

This commit changes xe_bo_evict_all_user() on iGPU platforms with Flat CCS
to walk the XE_PL_TT LRU and only evict or purge buffers with initialized
CCS state rather than evicting all buffers in TT.

> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_=
evict.c
> index 7661fca7f278f..1f95769c4a562 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
[ ... ]
> @@ -104,8 +106,46 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_d=
evice *xe)
>  				    xe_bo_notifier_unprepare_pinned);
>  }
> =20
> +static int xe_bo_evict_all_ccs(struct ttm_resource_manager *man)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D false,
> +		.no_wait_gpu =3D false,
> +	};
> +	struct ttm_lru_walk_arg arg =3D {
> +		.ctx =3D &ctx,
> +		.sleeping_lock =3D true,
> +	};
> +	struct ttm_bo_lru_cursor cursor;
> +	struct ttm_buffer_object *ttm_bo;
> +	int ret =3D 0;
> +
> +	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &arg, ttm_bo) {
> +		struct xe_bo *bo;
> +
> +		if (!xe_bo_is_xe_bo(ttm_bo) || ttm_bo->deleted)
> +			continue;
> +
> +		bo =3D ttm_to_xe_bo(ttm_bo);
> +		if (xe_bo_is_pinned(bo) || !xe_bo_needs_ccs_pages(bo) ||
> +		    !bo->ccs_cleared)
> +			continue;
> +
> +		if (xe_bo_madv_is_dontneed(bo))
> +			ret =3D xe_ttm_bo_purge(ttm_bo, &ctx);

[Severity: High]
Does calling xe_ttm_bo_purge() directly without ttm_bo_unmap_virtual()
leave userspace CPU mmap PTEs pointing to freed backing pages?

When a CPU-faulted BO is marked DONTNEED via xe_vm_madvise_ioctl(),
PTE invalidation is deferred until the BO is moved or purged.  Previously,
ttm_resource_manager_evict_all() went through ttm_bo_handle_move_mem(),
which calls ttm_bo_unmap_virtual() before invoking xe_bo_move() ->
xe_ttm_bo_purge().

Calling xe_ttm_bo_purge() directly here runs xe_bo_move_notify() (which
only unmaps kernel vmaps) and then calls ttm_bo_validate() with an empty
placement, which goes straight to ttm_bo_pipeline_gutting() and frees the
pages back to the TTM page pool without unmapping userspace CPU PTEs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-s4-opti-v1=
-0-5edaea2c6d31@intel.com?part=3D1
