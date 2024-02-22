Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4923DC48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B0710E9A8;
	Thu, 22 Feb 2024 16:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNrzYACZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AE310E2D8
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708618337; x=1740154337;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zBXTN9AHYaOPi2Ttg6TVwGW5Gb8JI0tTDuHBhvhEukA=;
 b=NNrzYACZYkFXf13KKqd1qH/ieBRwOe9UMLtaLJbeBaLAoPvoA7ox+SdF
 9AzwvblUBxED6XuFEkSVnjo8bu8wmngYpTdaua3oAaKQPsaudfgeJ6Wnm
 HurfGSNg43quCi+eixoo/NUFSQbxpOwDbS1vSPetQ821h8FACVn7RC5V/
 zrvedKYcEjEUZ6u9UakGALyDOGAS8eRkSc+HDbTeDTaSP70h/hyQ5x7FJ
 Vhp8f+C4BRX6MQrIsT3QckIRe/s45IrErNHTBcoKZqOgrfrQHTHpKCjdm
 My3nWXR9GfnI7sV218TLUK4DKqPnhO7qQHYUCD/ajIfCD1K0yLPMYMJNd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13983956"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13983956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10131266"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.168])
 ([10.249.254.168])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:12:13 -0800
Message-ID: <b27b522576d493cac238b7f68e29ee569eec9a2c.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use pointers in trace events
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Oak Zeng <oak.zeng@intel.com>
Date: Thu, 22 Feb 2024 17:12:11 +0100
In-Reply-To: <20240222144125.2862546-1-lucas.demarchi@intel.com>
References: <20240222144125.2862546-1-lucas.demarchi@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Thu, 2024-02-22 at 06:41 -0800, Lucas De Marchi wrote:
> Commit a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
> inadvertently reverted commit 8d038f49c1f3 ("drm/xe: Fix cast on
> trace
> variable"), breaking the build on 32bits.
>=20
> As noted by Ville, there's no point in converting the pointers to u64
> and add casts everywhere. In fact, it's better to just use %p and let
> the address be hashed. Convert all the cases in xe_trace.h to use
> pointers.
>=20
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_trace.h | 30 +++++++++++++++---------------
> =C2=A01 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index 0cce98a6b14b7..3b97633d81d85 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -27,16 +27,16 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_ARGS(fence),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct
> xe_gt_tlb_invalidation_fence *, fence)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(int, seqno)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -			=C2=A0=C2=A0 __entry->fence =3D (u64)fence;
> +			=C2=A0=C2=A0 __entry->fence =3D fence;
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0
> -		=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D0x%016llx, seqno=3D%d",
> +		=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%p, seqno=3D%d",
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __entry->seqno)
> =C2=A0);
> =C2=A0
> @@ -83,16 +83,16 @@ DECLARE_EVENT_CLASS(xe_bo,
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(size_t, size)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, flags)
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, vm)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct xe_vm *, vm)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> =C2=A0			=C2=A0=C2=A0 __entry->size =3D bo->size;
> =C2=A0			=C2=A0=C2=A0 __entry->flags =3D bo->flags;
> -			=C2=A0=C2=A0 __entry->vm =3D (unsigned long)bo->vm;
> +			=C2=A0=C2=A0 __entry->vm =3D bo->vm;
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0
> -		=C2=A0=C2=A0=C2=A0 TP_printk("size=3D%zu, flags=3D0x%02x,
> vm=3D0x%016llx",
> +		=C2=A0=C2=A0=C2=A0 TP_printk("size=3D%zu, flags=3D0x%02x, vm=3D%p",
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->size, __entry->flags,
> __entry->vm)
> =C2=A0);
> =C2=A0
> @@ -346,16 +346,16 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, ctx)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, seqno)
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct xe_hw_fence *, fence)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> =C2=A0			=C2=A0=C2=A0 __entry->ctx =3D fence->dma.context;
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D fence->dma.seqno;
> -			=C2=A0=C2=A0 __entry->fence =3D (unsigned long)fence;
> +			=C2=A0=C2=A0 __entry->fence =3D fence;
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0
> -		=C2=A0=C2=A0=C2=A0 TP_printk("ctx=3D0x%016llx, fence=3D0x%016llx,
> seqno=3D%u",
> +		=C2=A0=C2=A0=C2=A0 TP_printk("ctx=3D0x%016llx, fence=3D%p, seqno=3D%u"=
,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->ctx, __entry->fence, __e=
ntry-
> >seqno)
> =C2=A0);
> =C2=A0
> @@ -384,7 +384,7 @@ DECLARE_EVENT_CLASS(xe_vma,
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_ARGS(vma),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, vma)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct xe_vma *, vma)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, asid)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, start)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, end)
> @@ -392,14 +392,14 @@ DECLARE_EVENT_CLASS(xe_vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -			=C2=A0=C2=A0 __entry->vma =3D (unsigned long)vma;
> +			=C2=A0=C2=A0 __entry->vma =3D vma;
> =C2=A0			=C2=A0=C2=A0 __entry->asid =3D xe_vma_vm(vma)->usm.asid;
> =C2=A0			=C2=A0=C2=A0 __entry->start =3D xe_vma_start(vma);
> =C2=A0			=C2=A0=C2=A0 __entry->end =3D xe_vma_end(vma) - 1;
> =C2=A0			=C2=A0=C2=A0 __entry->ptr =3D xe_vma_userptr(vma);
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0
> -		=C2=A0=C2=A0=C2=A0 TP_printk("vma=3D0x%016llx, asid=3D0x%05x,
> start=3D0x%012llx, end=3D0x%012llx, ptr=3D0x%012llx,",
> +		=C2=A0=C2=A0=C2=A0 TP_printk("vma=3D%p, asid=3D0x%05x, start=3D0x%012l=
lx,
> end=3D0x%012llx, userptr=3D0x%012llx,",
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->vma, __entry->asid, __en=
try-
> >start,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->end, __entry->ptr)
> =C2=A0)
> @@ -484,16 +484,16 @@ DECLARE_EVENT_CLASS(xe_vm,
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_ARGS(vm),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, vm)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct xe_vm *, vm)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, asid)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -			=C2=A0=C2=A0 __entry->vm =3D (unsigned long)vm;
> +			=C2=A0=C2=A0 __entry->vm =3D vm;
> =C2=A0			=C2=A0=C2=A0 __entry->asid =3D vm->usm.asid;
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0
> -		=C2=A0=C2=A0=C2=A0 TP_printk("vm=3D0x%016llx, asid=3D0x%05x",=C2=A0 __=
entry-
> >vm,
> +		=C2=A0=C2=A0=C2=A0 TP_printk("vm=3D%p, asid=3D0x%05x",=C2=A0 __entry->=
vm,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->asid)
> =C2=A0);
> =C2=A0

