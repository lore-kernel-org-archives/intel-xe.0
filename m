Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D3BC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 08:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A05F10E202;
	Fri, 13 Jun 2025 08:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+Ge7JN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DB410E202
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749803077; x=1781339077;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=x1yTImDVLq8HHNUPUPxH+R679PSoEJXv4o4U2yV2oYI=;
 b=T+Ge7JN+a2muBbDjzi1YxL9KXfO7ZQY7F11YPlpB6l0qIyPwz05RjKtY
 3xXflYtWN5GuzQBsIJ5Ec0iqbqE7sgZl7+0wafpXGNQBv65NI64Ng3/xF
 vCWGNK0b/dzb8U3uNlf5yC1j6bOY1YO2oNJBby4R6qxsd5+aJO3lM4OYx
 jye2wIk6jvCYlyXLakL+2SUQAs0DTDuBGxfEwVYSWDlBwZGtFvXUo6aFr
 F1Ue7Ew82iJWN/cM40LVqx0WsSSoelT1SjypSh92RdIk8/IN02rCsz1cn
 hV7PcD0WYYtbyB5ujqCGyFtwjjQ1mdcivWV+TMvSCylpUR+a9uVgqY5Mf A==;
X-CSE-ConnectionGUID: 639+Wj2ESgWQ1hAhdhZWcA==
X-CSE-MsgGUID: BPIUoU/uThK77FV77fuTsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69455831"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69455831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:24:36 -0700
X-CSE-ConnectionGUID: WDf1ZGWqTPiXvM69I31kDA==
X-CSE-MsgGUID: BNY4LmddRciASNVVBRA54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="153057168"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.83])
 ([10.245.245.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:24:34 -0700
Message-ID: <136f645b70f1c0bfd646830d6cef2b60a0c3a22e.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Opportunistically skip TLB invalidaion on unbind
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, himal.prasad.ghimiray@intel.com
Date: Fri, 13 Jun 2025 10:24:32 +0200
In-Reply-To: <20250613043645.255351-1-matthew.brost@intel.com>
References: <20250613043645.255351-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-06-12 at 21:36 -0700, Matthew Brost wrote:
> If a range or VMA is invalidated and scratched page is disabled,
> there
> is no reason to issue a TLB invalidation on unbind, skip TLB
> innvalidation is this condition is true. This is an opportunistic
> check
> as it is done without the notifier lock, thus it possible for the
> range
> or VMA to be invalidated after this check is performed.
>=20
> This should improve performance of the SVM garbage collector, for
> example, xe_exec_system_allocator --r many-stride-new-prefetch, went
> ~20s to ~9.5s on a BMG.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0 | 18 ++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_svm.c |=C2=A0 5 ++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0 |=C2=A0 5 ++++-
> =C2=A03 files changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f39d5cc9f411..09c3ccc81cca 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1988,7 +1988,14 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0					 xe_vma_end(vma));
> =C2=A0	++pt_update_ops->current_op;
> =C2=A0	pt_update_ops->needs_userptr_lock |=3D xe_vma_is_userptr(vma);
> -	pt_update_ops->needs_invalidation =3D true;
> +
> +	/*
> +	 * Opportunistically supressing invalidation, READ_ONCE
> pairs with
> +	 * WRITE_ONCE in MMU notifier or BO move
> +	 */
> +	pt_update_ops->needs_invalidation |=3D
> xe_vm_has_scratch(xe_vma_vm(vma)) ||
> +		((vma->tile_present & BIT(tile->id)) &
> +		 ~READ_ONCE(vma->tile_invalidated));
> =C2=A0
> =C2=A0	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op-
> >num_entries);
> =C2=A0
> @@ -2023,7 +2030,14 @@ static int unbind_range_prepare(struct xe_vm
> *vm,
> =C2=A0					 range->base.itree.last +
> 1);
> =C2=A0	++pt_update_ops->current_op;
> =C2=A0	pt_update_ops->needs_svm_lock =3D true;
> -	pt_update_ops->needs_invalidation =3D true;
> +
> +	/*
> +	 * Opportunistically supressing invalidation, READ_ONCE
> pairs with
> +	 * WRITE_ONCE in SVM MMU notifier

To avoid having to document the pairing for all use, perhaps some
tile_invalidated accessors?


> +	 */
> +	pt_update_ops->needs_invalidation |=3D xe_vm_has_scratch(vm)
> ||
> +		((range->tile_present & BIT(tile->id)) &
> +		 ~READ_ONCE(range->tile_invalidated));

Would it be possible to code this repeated pattern as a function?

xe_vm_needs_invalidaion(vm, tile, tile_present, tile_invalidated);

Perhaps doesn't improve much on readability. Up to you.

Otherwise LGTM.
Thomas



> =C2=A0
> =C2=A0	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
> =C2=A0				=C2=A0=C2=A0=C2=A0 pt_op->num_entries);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 13abc6049041..5e5bf47293ad 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm
> *vm, struct drm_gpusvm_range *r,
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> =C2=A0			tile_mask |=3D BIT(id);
> -			/* Pairs with READ_ONCE in
> xe_svm_range_is_valid */
> +			/*
> +			 * Pairs with READ_ONCE in
> xe_svm_range_is_valid or PT
> +			 * code to suppress invalidation on unbind
> +			 */
> =C2=A0			WRITE_ONCE(range->tile_invalidated,
> =C2=A0				=C2=A0=C2=A0 range->tile_invalidated |
> BIT(id));
> =C2=A0		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d18807b92b18..b296ac37347b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3924,7 +3924,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	for (id =3D 0; id < fence_id; ++id)
> =C2=A0		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> =C2=A0
> -	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> +	/*
> +	 * WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c or PT
> code to
> +	 * suppress invalidation on unbind
> +	 */
> =C2=A0	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> =C2=A0
> =C2=A0	return ret;

