Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71F6C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 07:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE0110E17E;
	Tue, 20 Feb 2024 07:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGu1DWWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6658C10E17E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708415370; x=1739951370;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=nPCfi+Mxgzp+I27mjEqTtY+p61Y4zDR2n5TZGNW/LFc=;
 b=EGu1DWWo1LHCDKPUxi0MxWVCS1TN7HTTHu4dIpAoufPItIJ/G08qRTU4
 eXO0h8izOh5IrE+0xuV511ie/gOaoVy6GqYEB6gkP5Itkve4hi6mbioug
 NjwxFxidhzS++j9slsTiHK3myAUBJzhm3u82WGdoDk+EYzInrxUwLXSDi
 QG6uC2QOh8y4QcoUoZhLKhn7epzjolzRvTkrzCKXu7GLtUWhEA9qu2bdO
 r8SRxzKpQG6vFSrVngI0mwemWO2NmCZEq1eVINByaQ8zR8BiMCBRsNbu2
 vl83GDMikdnBBQPjUBWAZFEol0Ebn5DZ6eKjhUGkQllCrx3zuWmysgPFK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2647406"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2647406"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 23:49:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="827120741"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="827120741"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.16])
 ([10.249.254.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 23:49:28 -0800
Message-ID: <0e9d3e4cf399c7384c6cfea5a8de33ad5d69d5f7.camel@linux.intel.com>
Subject: Re: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 08:49:26 +0100
In-Reply-To: <20240220044748.948496-1-priyanka.dandamudi@intel.com>
References: <20240220044748.948496-1-priyanka.dandamudi@intel.com>
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

Hi

On Tue, 2024-02-20 at 10:17 +0530, priyanka.dandamudi@intel.com wrote:
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
> v4: Add device details to reduce ambiquity related to vram0/vram1.
> (Oak)
>=20
> v5: Rename mem_type_to_name to xe_mem_type_to_name. (Thomas)
>=20
> v6: Optimised code to use xe_bo_device(__entry->bo). (Thomas)
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Reviewed-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

I pushed this to drm-xe-next now, changing the title from
xe/xe_bo_move: ... to drm/xe/xe_bo_move:

Thanks,
Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 11 +++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_drm_client.c | 12 ++----------
> =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27 ++=
+++++++++++++++++++++----
> =C2=A04 files changed, 35 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 686d716c5581..d59b67d43c25 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -28,6 +28,14 @@
> =C2=A0#include "xe_ttm_stolen_mgr.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0
> +const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]=C2=A0 =3D {
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
> @@ -727,8 +735,7 @@ static int xe_bo_move(struct ttm_buffer_object
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
> index db4b2db6b073..7e49e670d91e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -244,6 +244,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo);
> =C2=A0int xe_bo_restore_pinned(struct xe_bo *bo);
> =C2=A0
> =C2=A0extern const struct ttm_device_funcs xe_ttm_funcs;
> +extern const char *const xe_mem_type_to_name[];
> =C2=A0
> =C2=A0int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> =C2=A0			struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
> b/drivers/gpu/drm/xe/xe_drm_client.c
> index 82d1305e831f..6040e4d22b28 100644
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
> @@ -171,7 +163,7 @@ static void show_meminfo(struct drm_printer *p,
> struct drm_file *file)
> =C2=A0	spin_unlock(&client->bos_lock);
> =C2=A0
> =C2=A0	for (mem_type =3D XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES;
> ++mem_type) {
> -		if (!mem_type_to_name[mem_type])
> +		if (!xe_mem_type_to_name[mem_type])
> =C2=A0			continue;
> =C2=A0
> =C2=A0		man =3D ttm_manager_type(bdev, mem_type);
> @@ -182,7 +174,7 @@ static void show_meminfo(struct drm_printer *p,
> struct drm_file *file)
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_GEM_OBJECT_RESIDENT |
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (mem_type !=3D
> XE_PL_SYSTEM ? 0 :
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_GEM_OBJECT_PURGEABLE),
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> mem_type_to_name[mem_type]);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> xe_mem_type_to_name[mem_type]);
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index e4e7262191ad..0cce98a6b14b 100644
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
> @@ -31,7 +32,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -			=C2=A0=C2=A0 __entry->fence =3D (unsigned long)fence;
> +			=C2=A0=C2=A0 __entry->fence =3D (u64)fence;
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0
> @@ -100,9 +101,27 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
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
> +		=C2=A0=C2=A0=C2=A0=C2=A0 __array(char, device_id, 12)
> +			),
> +
> +	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> +		=C2=A0=C2=A0 __entry->bo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D bo;
> +		=C2=A0=C2=A0 __entry->size =3D bo->size;
> +		=C2=A0=C2=A0 __entry->new_placement =3D new_placement;
> +		=C2=A0=C2=A0 __entry->old_placement =3D old_placement;
> +		=C2=A0=C2=A0 strscpy(__entry->device_id,
> dev_name(xe_bo_device(__entry->bo)->drm.dev), 12);
> +		=C2=A0=C2=A0 ),
> +	=C2=A0=C2=A0=C2=A0 TP_printk("migrate object %p [size %zu] from %s to %=
s
> device_id:%s",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->bo, __entry->size,
> xe_mem_type_to_name[__entry->old_placement],
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_mem_type_to_name[__entry->new_placem=
ent],
> __entry->device_id)
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(xe_exec_queue,

