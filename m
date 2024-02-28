Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF9C54E41
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 10:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376E010E2B3;
	Wed, 28 Feb 2024 10:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhxmmG23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2089710E2B3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709116717; x=1740652717;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=vuI2YMJUE0y9+i6Gc/f7/RS8ZuSfl8U0PfRmhRNpVcU=;
 b=nhxmmG23dkqSt7HvkIjcUiWoD6X2b5BaU5ByzAVBrlXmK+/BGAbfGchc
 QlewEOyl4CRnqmPQ1KHEaWTSRlB6XUMM6/K23HuYs2FCglrCXp+kRTmQs
 wGyXtaGWkO4aqwBwultCY7jjkVmYbbaXY0Nu5ev+1iq5rjxCB4b4PkYHi
 jCps3fcMrnHWP5Ur/9+/Ep38TcpjerVGUpOyLMG0WJD3JijMuKOqviSkG
 Xv/+GJvEJanBoyRGKU5VoSzN/YjqLFjUoYlYp/90cPg8ZO3ZBEhw1qM/0
 5OxTJJCr4WPE5+asSJMBwod0B1locljAZ4r02OHk5BfLuT/RZST1yFRIy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="28940899"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="28940899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 02:38:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="44913034"
Received: from badunne-mobl1.ger.corp.intel.com (HELO [10.252.3.58])
 ([10.252.3.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 02:38:32 -0800
Message-ID: <c337e6be46ec5004733575e5954d4c8dec144583.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_trace: Add move_lacks_source detail to
 xe_bo_move trace
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 11:38:28 +0100
In-Reply-To: <20240221101950.1019312-1-priyanka.dandamudi@intel.com>
References: <20240221101950.1019312-1-priyanka.dandamudi@intel.com>
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

On Wed, 2024-02-21 at 15:49 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Add move_lacks_source detail to xe_bo_move trace to make it readable
> that is to check if it is migrate clear or migrate copy.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_trace.h | 12 ++++++++----
> =C2=A02 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 76dfaf1cd200..6603a0ea79c5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -736,7 +736,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		migrate =3D xe->tiles[0].migrate;
> =C2=A0
> =C2=A0	xe_assert(xe, migrate);
> -	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
> +	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type,
> move_lacks_source);
> =C2=A0	xe_device_mem_access_get(xe);
> =C2=A0
> =C2=A0	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index 0cce98a6b14b..485d1ecacc36 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -102,14 +102,16 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
> =C2=A0);
> =C2=A0
> =C2=A0TRACE_EVENT(xe_bo_move,
> -	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo, uint32_t new_placement,
> uint32_t old_placement),
> -	=C2=A0=C2=A0=C2=A0 TP_ARGS(bo, new_placement, old_placement),
> +	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo, uint32_t new_placement,
> uint32_t old_placement,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 bool move_lacks_source),
> +	=C2=A0=C2=A0=C2=A0 TP_ARGS(bo, new_placement, old_placement,
> move_lacks_source),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct xe_bo *, bo)
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 __field(size_t, size)
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, new_placement)
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, old_placement)
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 __array(char, device_id, 12)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __field(bool, move_lacks_source)
> =C2=A0			),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> @@ -118,9 +120,11 @@ TRACE_EVENT(xe_bo_move,
> =C2=A0		=C2=A0=C2=A0 __entry->new_placement =3D new_placement;
> =C2=A0		=C2=A0=C2=A0 __entry->old_placement =3D old_placement;
> =C2=A0		=C2=A0=C2=A0 strscpy(__entry->device_id,
> dev_name(xe_bo_device(__entry->bo)->drm.dev), 12);
> +		=C2=A0=C2=A0 __entry->move_lacks_source =3D move_lacks_source;
> =C2=A0		=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("migrate object %p [size %zu] from %s to %=
s
> device_id:%s",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->bo, __entry->size,
> xe_mem_type_to_name[__entry->old_placement],
> +	=C2=A0=C2=A0=C2=A0 TP_printk("move_lacks_source:%s, migrate object %p [=
size
> %zu] from %s to %s device_id:%s",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->move_lacks_source ? "yes" : "n=
o",
> __entry->bo, __entry->size,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_mem_type_to_name[__entry->old_placem=
ent],
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_mem_type_to_name[__entry->new_p=
lacement],
> __entry->device_id)
> =C2=A0);
> =C2=A0

