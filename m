Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B1C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 15:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061A710E268;
	Mon,  8 Jan 2024 15:43:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B031910E268
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704728613; x=1736264613;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=alnaiWIwoNfoj06jG4zM7e49gZvhFhHXM3r2gtPMa/M=;
 b=V5RikXyFbCMT+VDaTFvvV1T7fnR6b+hp59IDZQPE5IegGMJj2RqO5HaM
 ro5A7hgZ8/bA4kG1UepGMNBR8eAaBXYLhNPXBgHGylTXqWZRURZFU1S0L
 OCsX6xxyYoNEYbj81b+MsxtTbPOhKFKOL+wsbA2+d+93KPkec5sTraNi4
 1JWNNS/PrwdvaxSSU+TWwRERQYkdib/WZcUtjRMWkNsY3v72Rp0ghzBWi
 hGHTAgiF7rAZynXPYfgfpuRG3+Pelrmqbvve1O2w7ln8ogoR9FjP6tv2i
 gQTzR3rUyIsJT7YfuaxONDjS9gS3+ABPLszcqLjNtEhswwKnseAUJExFq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4677161"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="4677161"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 07:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="924906435"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="924906435"
Received: from jlnunez-mobl.amr.corp.intel.com (HELO [10.249.254.143])
 ([10.249.254.143])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 07:43:30 -0800
Message-ID: <beb1c5e0b197a6315d20c19ff70bcf9108eaac0b.camel@linux.intel.com>
Subject: Re: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org, 
 zbigniew.kempczynski@intel.com, oak.zeng@intel.com, brian.welty@intel.com, 
 matthew.brost@intel.com
Date: Mon, 08 Jan 2024 16:43:28 +0100
In-Reply-To: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
References: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
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

On Fri, 2024-01-05 at 10:54 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Enhanced xe_bo_move trace to be more readable.
> It will help to show the migration details.
> Src and dst details.
>=20
> v2: Modify trace_xe_bo_move(), it takes the integer mem_type
> rather than a string.
> Make mem_type_to_name() extern, it will be used by trace.(Thomas)
>=20
> v3: Move mem_type_to_name() to xe_bo.[ch] (Thomas, Matt)
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 11 +++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_drm_client.c |=C2=A0 8 --------
> =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++=
+++++++++++++++++++---
> =C2=A04 files changed, 31 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8e4a3b1f6b93..1154d8f7b3b1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -28,6 +28,14 @@
> =C2=A0#include "xe_ttm_stolen_mgr.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0
> +const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]=C2=A0 =3D {
> +	[XE_PL_SYSTEM] =3D "system",
> +	[XE_PL_TT] =3D "gtt",
> +	[XE_PL_VRAM0] =3D "vram0",
> +	[XE_PL_VRAM1] =3D "vram1",
> +	[XE_PL_STOLEN] =3D "stolen"
> +};
> +
> =C2=A0static const struct ttm_place sys_placement_flags =3D {
> =C2=A0	.fpfn =3D 0,
> =C2=A0	.lpfn =3D 0,
> @@ -713,8 +721,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		migrate =3D xe->tiles[0].migrate;
> =C2=A0
> =C2=A0	xe_assert(xe, migrate);
> -
> -	trace_xe_bo_move(bo);
> +	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
> =C2=A0	xe_device_mem_access_get(xe);
> =C2=A0
> =C2=A0	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 97b32528c600..bf77bf17e519 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -244,6 +244,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo);
> =C2=A0int xe_bo_restore_pinned(struct xe_bo *bo);
> =C2=A0
> =C2=A0extern struct ttm_device_funcs xe_ttm_funcs;
> +extern const char *const mem_type_to_name[];

NIT: We should name this xe_mem_type_to_name[] now that it's extern.

With that,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> =C2=A0
> =C2=A0int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> =C2=A0			struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
> b/drivers/gpu/drm/xe/xe_drm_client.c
> index 82d1305e831f..1ac14c910491 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -131,14 +131,6 @@ static void bo_meminfo(struct xe_bo *bo,
> =C2=A0
> =C2=A0static void show_meminfo(struct drm_printer *p, struct drm_file
> *file)
> =C2=A0{
> -	static const char *const
> mem_type_to_name[TTM_NUM_MEM_TYPES]=C2=A0 =3D {
> -		[XE_PL_SYSTEM] =3D "system",
> -		[XE_PL_TT] =3D "gtt",
> -		[XE_PL_VRAM0] =3D "vram0",
> -		[XE_PL_VRAM1] =3D "vram1",
> -		[4 ... 6] =3D NULL,
> -		[XE_PL_STOLEN] =3D "stolen"
> -	};
> =C2=A0	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] =3D {};
> =C2=A0	struct xe_file *xef =3D file->driver_priv;
> =C2=A0	struct ttm_device *bdev =3D &xef->xe->ttm;
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index 95163c303f3e..c66a91df7d8b 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/tracepoint.h>
> =C2=A0#include <linux/types.h>
> =C2=A0
> +#include "xe_bo.h"
> =C2=A0#include "xe_bo_types.h"
> =C2=A0#include "xe_exec_queue_types.h"
> =C2=A0#include "xe_gpu_scheduler_types.h"
> @@ -100,9 +101,26 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(bo)
> =C2=A0);
> =C2=A0
> -DEFINE_EVENT(xe_bo, xe_bo_move,
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo),
> -	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(bo)
> +TRACE_EVENT(xe_bo_move,
> +	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_bo *bo, uint32_t new_placement,
> uint32_t old_placement),
> +	=C2=A0=C2=A0=C2=A0 TP_ARGS(bo, new_placement, old_placement),
> +	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct xe_bo *, bo)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __field(size_t, size)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, new_placement)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, old_placement)
> +			),
> +
> +	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> +		=C2=A0=C2=A0 __entry->bo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D bo;
> +		=C2=A0=C2=A0 __entry->size =3D bo->size;
> +		=C2=A0=C2=A0 __entry->new_placement =3D new_placement;
> +		=C2=A0=C2=A0 __entry->old_placement =3D old_placement;
> +
> +		=C2=A0=C2=A0 ),
> +	=C2=A0=C2=A0=C2=A0 TP_printk("migrate object %p [size %zu] from %s to %=
s",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->bo, __entry->size,
> mem_type_to_name[__entry->old_placement],
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mem_type_to_name[__entry->new_placement=
])
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(xe_exec_queue,

