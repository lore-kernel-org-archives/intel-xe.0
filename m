Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1E4C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 14:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEA210E6E9;
	Tue, 25 Feb 2025 14:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3sG/MPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9E310E6E9
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740493858; x=1772029858;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=f61BsmBvy94rvV8kw23WEV0+d9jDUE+GNKGggYZArAI=;
 b=d3sG/MPJgN7pPEOZSTFijHjUjOWgbk4wKEJx9EHZ+XA2/LTIlSn43pV/
 SQ1KxCe7CrrsazqKrbcM2kMRgGQUQ+XpsL072NuHMzzEb1yRh24RliyDm
 f1ig+qhtUxROWil5gM6iGPJFpSsa1troUKCYyZisokT+JE7r/WyeIsK3x
 v/6cfXQlsfEzEWrZKOB7KrDd8mjnleXzDxIsvf41sKCp8gbt9tryPUaGh
 VEUEaIjyzwwYUcbNJAI2IxYqeD1DYaSw6AwEo7kdesmTz8vwM3mLe3Y6x
 ixD6wIdmYuVWkIHCNNlrIn8De4/bMvzNC9sukT9r3U0Ho2+YGaiG3VBLY g==;
X-CSE-ConnectionGUID: 3yLP9YM+T62TGgikNrk7bQ==
X-CSE-MsgGUID: MGMgexi5RKu0UK+xMq+Ljg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41146638"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41146638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:30:58 -0800
X-CSE-ConnectionGUID: BKEpg4ufSnmthSKFUtgZaQ==
X-CSE-MsgGUID: AacpQnV0T3iYyKu+mQ8UKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116891831"
Received: from monicael-mobl3 (HELO [10.245.246.31]) ([10.245.246.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:30:57 -0800
Message-ID: <7c58c04c73e217e5cdcb473876b368c47b60bc6f.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Userptr invalidation race with binds fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Date: Tue, 25 Feb 2025 15:30:54 +0100
In-Reply-To: <20250224170109.3078314-2-matthew.brost@intel.com>
References: <20250224170109.3078314-1-matthew.brost@intel.com>
 <20250224170109.3078314-2-matthew.brost@intel.com>
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

Hi, Matt,

On Mon, 2025-02-24 at 09:01 -0800, Matthew Brost wrote:
> Always wait on dma-resv bookkeep slots if userptr invalidation has
> raced
> with a bind ensuring PTEs temporally setup to invalidated pages are
> never accessed.
>=20
> Fixup initial bind handling always add VMAs to invalidation list and
> wait dma-resv bookkeep slots.
>=20
> Always hold notifier across TLB invalidation in notifier to prevent a
> UAF if an unbind races.
>=20
> Including all of the above changes for Fixes patch in hopes of an
> easier
> backport which fix a single patch.
>=20
> v2:
> =C2=A0- Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> =C2=A0- Support scratch page on invalidation (Thomas)
> v3:
> =C2=A0- Drop clear of PTEs (Thomas)

This was what I actually meant.

https://patchwork.freedesktop.org/patch/639489/?series=3D145409&rev=3D1

/Thomas

> v4:
> =C2=A0- Remove double dma-resv wait
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single
> job")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c | 21 ++++++++++++---------
> =C2=A0drivers/gpu/drm/xe/xe_vm.c |=C2=A0 4 ++--
> =C2=A02 files changed, 14 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..ffd23c3564c5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1215,9 +1215,6 @@ static int vma_check_userptr(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	uvma =3D to_userptr_vma(vma);
> =C2=A0	notifier_seq =3D uvma->userptr.notifier_seq;
> =C2=A0
> -	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
> -		return 0;
> -
> =C2=A0	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 notifier_seq) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 !xe_pt_userptr_inject_eagain(uvma))
> @@ -1226,6 +1223,8 @@ static int vma_check_userptr(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (xe_vm_in_fault_mode(vm)) {
> =C2=A0		return -EAGAIN;
> =C2=A0	} else {
> +		long err;
> +
> =C2=A0		spin_lock(&vm->userptr.invalidated_lock);
> =C2=A0		list_move_tail(&uvma->userptr.invalidate_link,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->userptr.invalidated);
> @@ -1234,19 +1233,23 @@ static int vma_check_userptr(struct xe_vm
> *vm, struct xe_vma *vma,
> =C2=A0		if (xe_vm_in_preempt_fence_mode(vm)) {
> =C2=A0			struct dma_resv_iter cursor;
> =C2=A0			struct dma_fence *fence;
> -			long err;
> =C2=A0
> =C2=A0			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> =C2=A0					=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP);
> =C2=A0			dma_resv_for_each_fence_unlocked(&cursor,
> fence)
> =C2=A0				dma_fence_enable_sw_signaling(fence)
> ;
> =C2=A0			dma_resv_iter_end(&cursor);
> -
> -			err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> -						=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP,
> -						=C2=A0=C2=A0=C2=A0 false,
> MAX_SCHEDULE_TIMEOUT);
> -			XE_WARN_ON(err <=3D 0);
> =C2=A0		}
> +
> +		/*
> +		 * We are temporally installing PTEs pointing to
> invalidated
> +		 * pages, ensure VM is idle to avoid data
> corruption. PTEs fixed
> +		 * up upon next exec or in rebind worker.
> +		 */
> +		err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> +					=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP,
> +					=C2=A0=C2=A0=C2=A0 false,
> MAX_SCHEDULE_TIMEOUT);
> +		XE_WARN_ON(err <=3D 0);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 996000f2424e..9b2acb069a77 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
> =C2=A0		spin_unlock(&vm->userptr.invalidated_lock);
> =C2=A0	}
> =C2=A0
> -	up_write(&vm->userptr.notifier_lock);
> -
> =C2=A0	/*
> =C2=A0	 * Preempt fences turn into schedule disables, pipeline
> these.
> =C2=A0	 * Note that even in fault mode, we need to wait for binds
> and
> @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
> =C2=A0		XE_WARN_ON(err);
> =C2=A0	}
> =C2=A0
> +	up_write(&vm->userptr.notifier_lock);
> +
> =C2=A0	trace_xe_vma_userptr_invalidate_complete(vma);
> =C2=A0
> =C2=A0	return true;

