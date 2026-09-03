Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1230C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27A710E433;
	Thu,  3 Sep 2026 15:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f0YhYrvC";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B9210E433
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:46:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DE069601EF;
 Thu,  3 Sep 2026 15:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687761F000E9;
 Thu,  3 Sep 2026 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788450406;
 bh=sqc2Qzck/aux5Gb45ZRLLd8BaHzD55QlfDlsYzGjrBI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=f0YhYrvCCRwTyyhX1sEWxMKbj0PXImYs+mUikWFDkGe5Bmfx8n4BFwKATLEsWgj0/
 lY3xrHEJW3DrBHeHggr77+b4mEs6FX0Q9bs/BSe8WgfYrqKowRQLStMwtO7RzrESIF
 B8RBY2RnnZFFFHz07csnFi5itiHIARoCHwd23gkPNPA/pbKpweP2a48tLSuhHuPOB3
 eAJ7wUyj5OT1SIiFiZfnpjQv3Ul7Idr0t5SvYbCq1mCyAqfBCgMscAVX6KCCjMgwO5
 amEz1foJikxLjxGM0JUpiCM1e2KnfB01jeO/A6u4L1Q2h1gtYOElGyB+kE9HuTqawY
 DUoNfuFvCFMew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 27/27] drm/xe/eudebug: Enable EU pagefault handling
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-28-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-28-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:46:45 +0000
Message-Id: <20260903154646.687761F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Temporary NULL VMAs for subsequent eudebug pagefaults are destroye=
d immediately after ACKing the fault, creating a race condition that leads =
to livelock.
- [High] Successful SVM pagefaults bypass private tagging, which permanentl=
y stalls the finalization of the active eudebug session.
- [High] Pagefault cache hits bypass eudebug tagging, permanently hanging t=
he debugger session.
- [High] `xe_vm_svm_vma_subtract()` is called with unaligned address bounda=
ries, corrupting the VM layout.
--

commit bd171058301961cced31067feb0527d9f0b38c87
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

drm/xe/eudebug: Enable EU pagefault handling

This commit enables EU pagefault handling for XE2/PVC hardware, allowing
the driver to unhalt pagefaulted EU threads via SIP mode and a temporary
null page.

> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/x=
e_guc_pagefault.c
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -59,13 +60,14 @@ static void guc_ack_fault(struct xe_pagefault *pf, in=
t err)
>  			      write_only);
>  }
> =20
> -static void guc_ack_fault_end(void *private)
> +static void guc_ack_fault_end(void *private, int err)
>  {
> -	struct xe_guc *guc =3D private;
> +	struct xe_guc *guc =3D xe_eudebug_pagefault_get_private(private);
> =20
>  	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) =
!=3D 1)
>  		xe_guc_ct_send_flush(&guc->ct);
>  	xe_guc_ct_unlock(&guc->ct);
> +	xe_eudebug_pagefault_end(private, err);

[Severity: High]
Does this create a race condition that leads to a livelock?=20

When this calls xe_eudebug_pagefault_end(), temporary null VMAs for
subsequent pagefaults are destroyed immediately (destroy_pf =3D 1) after
ACKing the fault and signaling the hardware to resume.=20

Since there is no synchronization to guarantee the EU thread has re-execute=
d=20
the faulting instruction before the KMD unbinds the VMA, if the VMA is
unbound before the EU thread accesses the address, won't the thread
pagefault again on the same instruction and loop infinitely?

>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
[ ... ]
> @@ -227,8 +228,56 @@ static int xe_pagefault_service(struct xe_pagefault =
*pf)
> =20
>  	vma =3D xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
>  	if (!vma) {
[ ... ]
> +	} else {
> +		/*
> +		 * For non-SVM case:
> +		 * Eudebug with active pagefault always needs to be attached
> +		 * to pagefault since it waits for all pagefaults with matching
> +		 * asid to be resolved.
> +		 */
> +		if (!xe_vma_is_cpu_addr_mirror(vma))
> +			xe_eudebug_pagefault_set_private(pf, vm);

[Severity: High]
Does skipping the private tagging for SVM (cpu_addr_mirror) VMAs cause the=
=20
eudebug session to hang permanently?=20

If an active eudebug session exists for the same ASID and its finalization=
=20
was postponed because this SVM fault was still in the queue,=20
xe_eudebug_pagefault_end() will see no eudebug tag and return immediately=20
without triggering eudebug_pagefault_finalize(). This seems like it would=20
leave the EU threads permanently stuck in SIP mode.

> +	}
> =20
>  	if (xe_vma_read_only(vma) &&
> @@ -239,11 +288,52 @@ static int xe_pagefault_service(struct xe_pagefault=
 *pf)
> =20
>  	atomic =3D xe_pagefault_access_is_atomic(pf->consumer.access_type);
> =20
> -	if (xe_vma_is_cpu_addr_mirror(vma))
> +	if (xe_vma_is_cpu_addr_mirror(vma)) {
>  		err =3D xe_svm_handle_pagefault(vm, vma, pf, gt,
>  					      pf->consumer.page_addr, atomic);
> -	else
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +		/*
> +		 * If err is -ENOENT, it means that the cpu-address-space-mirrored
> +		 * xe vma exists, but there is no mm vma allocated in
> +		 * the CPU address space. This indicates that no memory has been
> +		 * allocated in the CPU address space.
> +		 */
> +		if (err =3D=3D -ENOENT &&
> +		    !xe_vm_is_closed_or_banned(vm) &&
> +		    xe_eudebug_pagefault_creatable(gt, vm)) {
> +			u32 page_size =3D vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
[ ... ]
> +			vma =3D xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
> +			if (vma && xe_vma_is_cpu_addr_mirror(vma))
> +				vma =3D xe_vm_svm_vma_subtract(vm, vma,
> +							     pf->consumer.page_addr,
> +							     pf->consumer.page_addr + page_size);

[Severity: High]
Is it safe to pass pf->consumer.page_addr directly as the subtraction
boundaries?=20

The hardware fault address is not guaranteed to be aligned to page_size.=20
Passing unaligned boundaries to xe_vm_svm_vma_subtract() will create
unaligned head/tail VMAs via xe_vma_create().=20

Inserting unaligned VMAs into the interval tree and page tables violates
core memory management invariants and could lead to page table corruption or
kernel panics.

> +			else
> +				vma =3D ERR_PTR(-EINVAL);
[ ... ]
> @@ -598,6 +688,12 @@ static void xe_pagefault_queue_work(struct work_stru=
ct *w)
>  		}
> =20
>  ack_fault:
> +		/*
> +		 * set private after xe_pagefault_service() since eudebug could swap
> +		 * the pf->producer.private field. Also needed when cache was hit.
> +		 */
> +		private =3D pf->producer.private;

[Severity: High]
Does a pagefault cache hit permanently hang the eudebug session?=20

When a pagefault matches the cache, the code jumps directly to ack_fault,=20
skipping xe_pagefault_service(). Since the service routine is bypassed,=20
xe_eudebug_pagefault_set_private() is never called, leaving the fault=20
untagged.=20

Similar to the SVM bypass above, if the session postponed finalization for=
=20
this queued fault, it will never trigger eudebug_pagefault_finalize() upon=
=20
completion.

> +
>  		xe_assert(xe, pf->consumer.alloc_state =3D=3D
>  			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>  		xe_assert(xe, pf =3D=3D pf_work->cache.pf);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D27
