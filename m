Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA19CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 15:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A1C10E420;
	Mon,  3 Nov 2025 15:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8RWMuKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D4F10E420
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762183283; x=1793719283;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=8vsNIrHu6UABVNupfPi+BTnJXQ55vqnuhqAZhQ2pm00=;
 b=n8RWMuKPtDOwAqMOeKFRveGhgA+Lcp8cl7G1F2s9bp1OmTu2CHmi3srx
 3IdtJW/NNWyd9ndj2W5/81MbqLhEx+hr/WBXmGFY+h1uoiOOe5Jo5RP59
 XEVzqhigcDg1m1KnClnbA0nhI3VodBp9ti1vuHB6rN38AguFLbqDu9QDv
 HSz9qi0q4qIWdXuq5c5iCQYEjWXiJQ+iVAx3P4N+8jyUs9TzJRjIqI7oN
 oOaUPYVUBh+mdFoZu6Q7Nuew/TxaBEJ/dm5TYmzSfAEDeOkC0uF8DN9UR
 K9QirinbtvJe8BFLSuASxihbX+YRJ591Wl5xtwW2oUaXYJraYk+XRk/V3 A==;
X-CSE-ConnectionGUID: gYFjLdYsSpe0+d8HDo3PQA==
X-CSE-MsgGUID: YgTIbEhfQ4ekReccSJTuZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63956800"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="63956800"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:21:22 -0800
X-CSE-ConnectionGUID: 7WUftEpRTLmZieCWsbfOPQ==
X-CSE-MsgGUID: DkQIdKtmSraR8m10m3Z0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186574969"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.36])
 ([10.245.245.36])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:21:21 -0800
Message-ID: <8e6f759a4c430bc88eb2982ebddde4fc695f003c.camel@linux.intel.com>
Subject: Re: [PATCH v5 5/6] drm/xe: Disallow input fences on zero batch
 execs and zero binds
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 16:21:19 +0100
In-Reply-To: <20251029205719.2746501-6-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
 <20251029205719.2746501-6-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-10-29 at 13:57 -0700, Matthew Brost wrote:
> Prevent input fences from being installed on zero batch execs or zero
> binds, which were originally added to support queue idling in Mesa
> via
> output fences. Although input fence support was introduced for
> interface
> consistency, it leads to incorrect behavior due to chained composite
> fences, which are disallowed.
>=20
> Avoid the complexity of fixing this by removing support, as input
> fences
> for these cases are not used in practice.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_sync.c | 101 +++++++++++++-------------------=
-
> --
> =C2=A01 file changed, 36 insertions(+), 65 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> index df7ca349398b..ff74528ca0c6 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -301,84 +301,55 @@ xe_sync_in_fence_get(struct xe_sync_entry
> *sync, int num_sync,
> =C2=A0
> =C2=A0	lockdep_assert_held(&vm->lock);
> =C2=A0
> -	/* Count in-fences */
> -	for (i =3D 0; i < num_sync; ++i) {
> -		if (sync[i].fence) {
> -			++num_fence;
> -			fence =3D sync[i].fence;
> -		}
> -	}
> -
> -	/* Easy case... */
> -	if (!num_fence) {
> -		if (q->flags & EXEC_QUEUE_FLAG_VM) {
> -			struct xe_exec_queue *__q;
> -			struct xe_tile *tile;
> -			u8 id;
> -
> -			for_each_tile(tile, vm->xe, id)
> -				num_fence +=3D (1 +
> XE_MAX_GT_PER_TILE);
> -
> -			fences =3D kmalloc_array(num_fence,
> sizeof(*fences),
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> -			if (!fences)
> -				return ERR_PTR(-ENOMEM);
> -
> +	/* Reject in fences */
> +	for (i =3D 0; i < num_sync; ++i)
> +		if (sync[i].fence)
> +			return ERR_PTR(-EOPNOTSUPP);
> +
> +	if (q->flags & EXEC_QUEUE_FLAG_VM) {
> +		struct xe_exec_queue *__q;
> +		struct xe_tile *tile;
> +		u8 id;
> +
> +		for_each_tile(tile, vm->xe, id)
> +			num_fence +=3D (1 + XE_MAX_GT_PER_TILE);
> +
> +		fences =3D kmalloc_array(num_fence, sizeof(*fences),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> +		if (!fences)
> +			return ERR_PTR(-ENOMEM);
> +
> +		fences[current_fence++] =3D
> +			xe_exec_queue_last_fence_get(q, vm);
> +		for_each_tlb_inval(i)
> +			fences[current_fence++] =3D
> +				xe_exec_queue_tlb_inval_last_fence_g
> et(q, vm, i);
> +		list_for_each_entry(__q, &q->multi_gt_list,
> +				=C2=A0=C2=A0=C2=A0 multi_gt_link) {
> =C2=A0			fences[current_fence++] =3D
> -				xe_exec_queue_last_fence_get(q, vm);
> +				xe_exec_queue_last_fence_get(__q,
> vm);
> =C2=A0			for_each_tlb_inval(i)
> =C2=A0				fences[current_fence++] =3D
> -
> 					xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
> -			list_for_each_entry(__q, &q->multi_gt_list,
> -					=C2=A0=C2=A0=C2=A0 multi_gt_link) {
> -				fences[current_fence++] =3D
> -
> 					xe_exec_queue_last_fence_get(__q, vm);
> -				for_each_tlb_inval(i)
> -					fences[current_fence++] =3D
> -
> 						xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
> -			}
> -
> -			xe_assert(vm->xe, current_fence =3D=3D
> num_fence);
> -			cf =3D dma_fence_array_create(num_fence,
> fences,
> -						=C2=A0=C2=A0=C2=A0
> dma_fence_context_alloc(1),
> -						=C2=A0=C2=A0=C2=A0 1, false);
> -			if (!cf)
> -				goto err_out;
> -
> -			return &cf->base;
> +					xe_exec_queue_tlb_inval_last
> _fence_get(__q, vm, i);
> =C2=A0		}
> =C2=A0
> -		fence =3D xe_exec_queue_last_fence_get(q, vm);
> -		return fence;
> -	}
> +		xe_assert(vm->xe, current_fence =3D=3D num_fence);
> +		cf =3D dma_fence_array_create(num_fence, fences,
> +					=C2=A0=C2=A0=C2=A0
> dma_fence_context_alloc(1),
> +					=C2=A0=C2=A0=C2=A0 1, false);
> +		if (!cf)
> +			goto err_out;
> =C2=A0
> -	/*
> -	 * Create composite fence - FIXME - the below code doesn't
> work. This is
> -	 * unused in Mesa so we are ok for the moment. Perhaps we
> just disable
> -	 * this entire code path if number of in fences !=3D 0.
> -	 */
> -	fences =3D kmalloc_array(num_fence + 1, sizeof(*fences),
> GFP_KERNEL);
> -	if (!fences)
> -		return ERR_PTR(-ENOMEM);
> -	for (i =3D 0; i < num_sync; ++i) {
> -		if (sync[i].fence) {
> -			dma_fence_get(sync[i].fence);
> -			fences[current_fence++] =3D sync[i].fence;
> -		}
> +		return &cf->base;
> =C2=A0	}
> -	fences[current_fence++] =3D xe_exec_queue_last_fence_get(q,
> vm);
> -	cf =3D dma_fence_array_create(num_fence, fences,
> -				=C2=A0=C2=A0=C2=A0 dma_fence_context_alloc(1), 1,
> false);
> -	if (!cf)
> -		goto err_out;
> =C2=A0
> -	return &cf->base;
> +	fence =3D xe_exec_queue_last_fence_get(q, vm);
> +	return fence;
> =C2=A0
> =C2=A0err_out:
> =C2=A0	while (current_fence)
> =C2=A0		dma_fence_put(fences[--current_fence]);
> =C2=A0	kfree(fences);
> -	kfree(cf);
> =C2=A0
> =C2=A0	return ERR_PTR(-ENOMEM);
> =C2=A0}

