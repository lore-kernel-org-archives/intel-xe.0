Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89B5D6EBEE
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 08:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4E010E198;
	Fri, 29 Nov 2024 08:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4T8zIZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500E010E198
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732869923; x=1764405923;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=saXi9UfbrRq8NCOf4qJzDleFd+85M6pt14cBDQH0R1A=;
 b=E4T8zIZCuKgQHTIMbIxFy/v7ckHMACBoKptP58cNRIVdxdIsIa98sOJj
 xYisD/TnAA70teodNHY75cVUYXDPuzyHqn9O/vQ+hIQsWssDC2AnfRwni
 IcukITu4DfwJLsqeeOAg/cTgzvsXI9DhzRTeR1BXZwq3bTiSbyfRg3Uim
 rKKPnF/QkwTT16PoTbe8c56tOKARgdPhD/82moHTsWvPxEb8klqmhldh7
 P+gg0R6Ld7FkQ2QyYFKUZgG9krLElebPupzTApSxH6tIXjbtRQ1Bsyqzn
 G9NJ+9B5iLI2qXM8uYqvGVqFi9SvrTR4HyUwBkDC9/xlkfJkHdjfYWDaP w==;
X-CSE-ConnectionGUID: h4NgyJVLTTST3mUnYil8oA==
X-CSE-MsgGUID: dmY4GMXcR0Gn/jJ3AxUJqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20698782"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="20698782"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:45:23 -0800
X-CSE-ConnectionGUID: y2pBe48bTTS3mbnSoT4Csg==
X-CSE-MsgGUID: s7jdpH8YQo6mUa+zt4mQkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97475855"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.229])
 ([10.245.246.229])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:45:22 -0800
Message-ID: <8ea908b670aaa2bf7d094f989967ad095b06e883.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Avoid evicting object of the same vm in none
 fault mode
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 09:45:18 +0100
In-Reply-To: <20241128210103.1820743-1-oak.zeng@intel.com>
References: <20241128210103.1820743-1-oak.zeng@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Thu, 2024-11-28 at 16:01 -0500, Oak Zeng wrote:
> BO validation during vm_bind could trigger memory eviction when
> system runs under memory pressure. Right now we blindly evict
> BOs of all VMs. This scheme has a problem when system runs in
> none recoverable page fault mode: even though the vm_bind could
> be successful by evicting BOs, the later the rebinding of the
> evicted BOs would fail. So it is better to report an out-of-
> memory failure at vm_bind time than at time of rebinding where
> xekmd currently doesn't have a good mechanism to report error
> to user space.
>=20
> This patch implemented a scheme to only evict objects of other
> VMs during vm_bind time. Object of the same VM will skip eviction.
> If we failed to find enough memory for vm_bind, we report error
> to user space at vm_bind time.
>=20
> This scheme is not needed for recoverable page fault mode under
> what we can dynamically fault-in pages on demand.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2492750505d69..c005c96b88167 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2359,13 +2359,15 @@ static int vma_lock_and_validate(struct
> drm_exec *exec, struct xe_vma *vma,
> =C2=A0				 bool validate)
> =C2=A0{
> =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> +	struct xe_vm *vm =3D xe_vma_vm(vma);
> +	bool preempt_mode =3D xe_vm_in_preempt_fence_mode(vm);

I'd skip the stack variable here and use the function call directly
below.

> =C2=A0	int err =3D 0;
> =C2=A0
> =C2=A0	if (bo) {
> =C2=A0		if (!bo->vm)
> =C2=A0			err =3D drm_exec_lock_obj(exec, &bo-
> >ttm.base);
> =C2=A0		if (!err && validate)
> -			err =3D xe_bo_validate(bo, xe_vma_vm(vma),
> true);
> +			err =3D xe_bo_validate(bo, vm, !preempt_mode);
> =C2=A0	}
> =C2=A0
> =C2=A0	return err;

Anyway,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Note that this is not fully sufficient to avoid OOM errors in the
rebind worker. Another process may have already evicted this vm's
memory and then pinned a lot of VRAM. But it should probably be
sufficient in single-client cases.

Thanks,
Thomas



