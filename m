Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7314C47074
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 11:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B7210E255;
	Wed,  3 Jan 2024 11:08:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACDB10E255
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 11:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704280138; x=1735816138;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=hsXHjcGbTeWs//hIzI3Srvdustpp23WxfvNr8RzR78I=;
 b=PWbKjEvsI2AQSp92faSuuBWsM1p0UiuTHDnlzyS1OWHruw/R+KKP3BSm
 bOIC5hcglYmEPJmpwxn9OkcMA5oQJK5XewgqIbasboQ4hla/eyDakCKBK
 Qp/B6LEKLXDDD/QD7Q4yGUaYVMXrOIChZ9me9zkcG3MNOdjgbg+Q1B27v
 C+lYKEWtm81kt1vvZm+oFOSWy970vV09nBA5jRz10BXvTOM9a4XTEQPmy
 2aZ6wLZ+DIhx2xc35dzhPOF5NPISehuGT0ZglgMucoc0HFn08R7sU14jZ
 EClIW16PrB51j+iq8+T7gg2CS2qEiLBhwHMlObhcOlZ26xek2zd0z785g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3797183"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3797183"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 03:08:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756184891"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="756184891"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO [10.249.254.107])
 ([10.249.254.107])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 03:08:54 -0800
Message-ID: <8b332e586699bc5eee1a99207019a67a9bb8dba6.camel@linux.intel.com>
Subject: Re: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org, 
 janga.rahul.kumar@intel.com, oak.zeng@intel.com, brian.welty@intel.com, 
 matthew.brost@intel.com, Zbigniew.Kempczynski@intel.com
Date: Wed, 03 Jan 2024 12:08:51 +0100
In-Reply-To: <20240103102959.2385010-1-priyanka.dandamudi@intel.com>
References: <20240103102959.2385010-1-priyanka.dandamudi@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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

Hi,

On Wed, 2024-01-03 at 15:59 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Enhanced xe_bo_move trace to be more readable.
> It will help to show the migration details.
> Src and dst details.
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0 | 12 ++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_trace.h | 22 +++++++++++++++++++---
> =C2=A02 files changed, 29 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8e4a3b1f6b93..3fa7ca99e85b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -613,6 +613,14 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_place *hop)
> =C2=A0{
> +	static const char *const
> mem_type_to_name[TTM_NUM_MEM_TYPES]=C2=A0 =3D {
> +		[XE_PL_SYSTEM] =3D "system",
> +		[XE_PL_TT] =3D "gtt",
> +		[XE_PL_VRAM0] =3D "vram0",
> +		[XE_PL_VRAM1] =3D "vram1",
> +		[4 ... 6] =3D NULL,

Can we avoid this line ^^^ and have these entries automatically
initialized to zero.

> +		[XE_PL_STOLEN] =3D "stolen"
> +	};

Also perhaps make this extern and use it from the tracing code? That
would mean trace_xe_bo_move() taking the integer mem_type rather than a
string?=20

Thanks,
Thomas


> =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> =C2=A0	struct ttm_resource *old_mem =3D ttm_bo->resource;
> @@ -713,8 +721,8 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		migrate =3D xe->tiles[0].migrate;
> =C2=A0
> =C2=A0	xe_assert(xe, migrate);
> -
> -	trace_xe_bo_move(bo);
> +	trace_xe_bo_move(bo, mem_type_to_name[new_mem->mem_type],
> +			 mem_type_to_name[old_mem_type]);
> =C2=A0	xe_device_mem_access_get(xe);
> =C2=A0
> =C2=A0	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index 95163c303f3e..bfa7b2391378 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -100,9 +100,25 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(bo)
> =C2=A0);
> =C2=A0
> -DEFINE_EVENT(xe_bo, xe_bo_move,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo),
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(bo)
> +TRACE_EVENT(xe_bo_move,
> +	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo, const char *new_placement=
,
> const char *old_placement),
> +	=C2=A0=C2=A0=C2=A0 TP_ARGS(bo, new_placement, old_placement),
> +	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct xe_bo *, bo)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __field(size_t, size)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __array(char, new_placement, 16)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __array(char, old_placement, 16)
> +			),
> +
> +	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> +		=C2=A0=C2=A0 __entry->bo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D bo;
> +		=C2=A0=C2=A0 __entry->size =3D bo->size;
> +		=C2=A0=C2=A0 strscpy(__entry->new_placement, new_placement,
> 16);
> +		=C2=A0=C2=A0 strscpy(__entry->old_placement, old_placement,
> 16)
> +		=C2=A0=C2=A0 ),
> +	=C2=A0=C2=A0=C2=A0 TP_printk("migrate object %p [size %zu] from %s to %=
s",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->bo, __entry->size, __entry-
> >old_placement,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->new_placement)
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(xe_exec_queue,

