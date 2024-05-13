Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDA5C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 13:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBE510E10F;
	Mon, 13 May 2024 13:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mjq1iQ/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1BA10E10F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715606624; x=1747142624;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CIAhBq82i6nUAHiqL/alh36b6XIX51yavUDdotyGrOU=;
 b=Mjq1iQ/IPo80OhP+eefTxxpCmabmKCT+Cq28iyK+VoqjkP/TLkV4mq2r
 rMeCcpG3kymzKqpn1krL93KHOoJGDFWt2qVOJcKXRXT69yVjUy/GDzWW+
 aqiJ7bahtxQYdElAxSUkadL9R+CpgJpNAs6sKrd2AeG5nOyOQW+erpyRl
 WEfX9JxMH3BknviJYRqL05fmLg8gFdvg46Efam6OI20h2v6o/yAp4g9K9
 splIqrgqkuMpnx1VKw1Z2zuYSmZApPwqHPyV+N+Vu39bAwACDeLt9shS8
 sncgyxfjWb9Aq7ABS+IQpyBnPD0iKaOF67Tp/EHy3YolC/q+abEuZP4rX w==;
X-CSE-ConnectionGUID: 9C0TajqFRQmiiNKD5h5Ppg==
X-CSE-MsgGUID: TwDoANKvRB2PCTtFVD0IEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22207069"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22207069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:23:43 -0700
X-CSE-ConnectionGUID: 3ECmyRcTRY+PmhxJUazD8g==
X-CSE-MsgGUID: I2lGX9xxRe6tOE8e2LWZvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="35086043"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.9])
 ([10.245.246.9])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:23:41 -0700
Message-ID: <19d7aa0852718b4ac5521c0048bacc5a11a137cc.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Francois Dugast <francois.dugast@intel.com>
Date: Mon, 13 May 2024 15:23:38 +0200
In-Reply-To: <20240509191657.504300-4-rodrigo.vivi@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
 <20240509191657.504300-4-rodrigo.vivi@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Thu, 2024-05-09 at 15:16 -0400, Rodrigo Vivi wrote:
> In the regular use case scenario, user space will create a
> VM, and keep it alive for the entire duration of its workload.
>=20
> For the regular desktop cases, it means that the VM
> is alive even on idle scenarios where display goes off. This
> is unacceptable since this would entirely block runtime PM
> indefinitely, blocking deeper Package-C state. This would be
> a waste drainage of power.
>=20
> Limit the VM protection solely for long-running workloads that
> are not protected by the scheduler references.
> By design, run_job for long-running workloads returns NULL and
> the scheduler drops all the references of it, hence protecting
> the VM for this case is necessary.

I still think we can drop the pm when we deactivate rebind and grab it
when we activate it. (vm->preeprt.rebind_deactivated) This will not
work for faulting vms though, and can be done as a follow-up if
desired.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> v2: Update commit message to a more imperative language and to
> =C2=A0=C2=A0=C2=A0 reflect why the VM protection is really needed.
> =C2=A0=C2=A0=C2=A0 Also add a comment in the code to let the reason visbi=
ble.
>=20
> v3: Remove vma_access case and the mentions to mmap. Mmap cases
> =C2=A0=C2=A0=C2=A0 are already protected by the gem page fault.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Francois Dugast <francois.dugast@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 12 +++++++++---
> =C2=A01 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c5b1694b292f..2a49dea231e7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1347,7 +1347,13 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0
> =C2=A0	vm->pt_ops =3D &xelp_pt_ops;
> =C2=A0
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	/*
> +	 * Long-running workloads are not protected by the scheduler
> references.
> +	 * By design, run_job for long-running workloads returns
> NULL and the
> +	 * scheduler drops all the references of it, hence
> protecting the VM
> +	 * for this case is necessary.
> +	 */
> +	if (flags & XE_VM_FLAG_LR_MODE)
> =C2=A0		xe_pm_runtime_get_noresume(xe);
> =C2=A0
> =C2=A0	vm_resv_obj =3D drm_gpuvm_resv_object_alloc(&xe->drm);
> @@ -1457,7 +1463,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		xe_range_fence_tree_fini(&vm->rftree[id]);
> =C2=A0	kfree(vm);
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	if (flags & XE_VM_FLAG_LR_MODE)
> =C2=A0		xe_pm_runtime_put(xe);
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> @@ -1592,7 +1598,7 @@ static void vm_destroy_work_func(struct
> work_struct *w)
> =C2=A0
> =C2=A0	mutex_destroy(&vm->snap_mutex);
> =C2=A0
> -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> +	if (vm->flags & XE_VM_FLAG_LR_MODE)
> =C2=A0		xe_pm_runtime_put(xe);
> =C2=A0
> =C2=A0	for_each_tile(tile, xe, id)

