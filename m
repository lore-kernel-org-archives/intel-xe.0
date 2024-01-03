Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855A5C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 13:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45B10E06D;
	Wed,  3 Jan 2024 13:21:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739B410E06D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704288110; x=1735824110;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=+qMqdJ+V0rPKaJht4neqz4xoHu/wD4DIwm/R+mi40gQ=;
 b=jK3kdX753Cvl4vhOgAg/4X33s/jCiseT+8XuBDaEdbOyMgwHtaxGnwyR
 hyiFQt+eB/Rj6+Q6KIfl5kRehUJjyxndOBIOiHPzwUyzwLHNWDX7FTZs/
 rIp6PLCl/yQf62KN5MeqQgWAa9OZJY7FPIoIq7d8tNTihGFIFrgwD3Qru
 bh+b6KemiL07yfF700lY7yZe3hZC7MqzOYaQbTONcwktZTqCuz79xSMEf
 JokXrqmEtDqKdbwjH0YXjoKYUwpE7nzaeAzdaXK+4nPsG2Y8+yA/y59Vl
 s7q/BqQVdzKTC4OgIs+XYKOg3mW5uP3E1JSTt6kvsbr11tQ9nvOG6Qb/v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4089644"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4089644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="28359827"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.243])
 ([10.249.254.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:21:48 -0800
Message-ID: <6eaf8e85e9a99ab33de51def3fde72505da75433.camel@linux.intel.com>
Subject: Re: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org, 
 zbigniew.kempczynski@intel.com, oak.zeng@intel.com, brian.welty@intel.com
Date: Wed, 03 Jan 2024 14:21:44 +0100
In-Reply-To: <20240103123826.2386219-1-priyanka.dandamudi@intel.com>
References: <20240103123826.2386219-1-priyanka.dandamudi@intel.com>
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

Hi, Priyanka,

On Wed, 2024-01-03 at 18:08 +0530, priyanka.dandamudi@intel.com wrote:
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
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +--
> =C2=A0drivers/gpu/drm/xe/xe_drm_client.c | 16 ++++++++--------
> =C2=A0drivers/gpu/drm/xe/xe_drm_client.h |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++=
+++++++++++++++++++---
> =C2=A04 files changed, 32 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8e4a3b1f6b93..f7075fd86547 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -713,8 +713,7 @@ static int xe_bo_move(struct ttm_buffer_object
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
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
> b/drivers/gpu/drm/xe/xe_drm_client.c
> index 82d1305e831f..e845b7f22e38 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -15,6 +15,14 @@
> =C2=A0#include "xe_drm_client.h"
> =C2=A0#include "xe_trace.h"
> =C2=A0
> +const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]=C2=A0 =3D {
> +	[XE_PL_SYSTEM] =3D "system",
> +	[XE_PL_TT] =3D "gtt",
> +	[XE_PL_VRAM0] =3D "vram0",
> +	[XE_PL_VRAM1] =3D "vram1",
> +	[XE_PL_STOLEN] =3D "stolen"
> +};
> +

Please use xe_bo.[ch] for this, since it is related to the buffer
object placements, and the Xe placements are defined in xe_bo.h

/Thomas


> =C2=A0/**
> =C2=A0 * xe_drm_client_alloc() - Allocate drm client
> =C2=A0 * @void: No arg
> @@ -131,14 +139,6 @@ static void bo_meminfo(struct xe_bo *bo,
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
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h
> b/drivers/gpu/drm/xe/xe_drm_client.h
> index a9649aa36011..4e33d0981b6a 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -13,6 +13,8 @@
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/spinlock.h>
> =C2=A0
> +extern const char *const mem_type_to_name[];
> +
> =C2=A0struct drm_file;
> =C2=A0struct drm_printer;
> =C2=A0struct xe_bo;
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index 95163c303f3e..196d277795a0 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/types.h>
> =C2=A0
> =C2=A0#include "xe_bo_types.h"
> +#include "xe_drm_client.h"
> =C2=A0#include "xe_exec_queue_types.h"
> =C2=A0#include "xe_gpu_scheduler_types.h"
> =C2=A0#include "xe_gt_tlb_invalidation_types.h"
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

