Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E59CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79F10E3F4;
	Tue, 12 Sep 2023 11:15:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF34910E3F4
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694517311; x=1726053311;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=CI2nMVKgncyM47v00iar8I9L87coGmQhaqxosL3Myt4=;
 b=NDKUW56MsYcTl0NIZMZkSrN1JWg37U1NjKUzuj/c2k0IOWEz0v/M/3nH
 hj+sEWZqIZHVpBqZHxSQWxNKfo69TObuJ2Llt3PTaOCr3GKdKjZTcUUCI
 GMGchlePcgywfdFEGM81RAIZpbwVeVX/lrloBfVB1YnJhZ3faDzrmq7c8
 ScOEcqA+GyhBug6zKlusLzV8mRdDz3xdO6juefaOXWJo0OALg8FF2YOVd
 CUI7YFzTi7kxrDQ5KwR7oONiqjSc55oAD5tuIZV6kKbV17VtNHbswVXIj
 ssn4Y15A4+JMeRvai9h6Y8f1TaCS/paIMJPXfE4EXOeo/vcwrWmYG8VoS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464713535"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="464713535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="990469776"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="990469776"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:14:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Tejas
 Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <c6509d5f-cc5c-4017-abfe-b9b6d194caa9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-8-tejas.upadhyay@intel.com>
 <c6509d5f-cc5c-4017-abfe-b9b6d194caa9@intel.com>
Date: Tue, 12 Sep 2023 14:14:45 +0300
Message-ID: <87sf7jd4nu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe: Implement fdinfo memory stats
 printing
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

On Tue, 12 Sep 2023, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.=
com> wrote:
> On 31-08-2023 14:35, Tejas Upadhyay wrote:
>> Use the newly added drm_print_memory_stats helper to show memory
>> utilisation of our objects in drm/driver specific fdinfo output.
>>
>> To collect the stats we walk the per memory regions object lists
>> and accumulate object size into the respective drm_memory_stats
>> categories.
>>
>> Objects with multiple possible placements are reported in multiple
>> regions for total and shared sizes, while other categories are
>> counted only for the currently active region.
>>
>> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.h         |  11 +++
>>   drivers/gpu/drm/xe/xe_drm_client.c | 103 ++++++++++++++++++++++++++++-
>>   2 files changed, 113 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 0823dda0f31b..538a9ec7f4c3 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _XE_BO_H_
>>   #define _XE_BO_H_
>>=20=20=20
>> +#include <drm/ttm/ttm_tt.h>
>> +
>>   #include "xe_bo_types.h"
>>   #include "xe_macros.h"
>>   #include "xe_vm_types.h"
>> @@ -258,6 +260,15 @@ static inline size_t xe_bo_ccs_pages_start(struct x=
e_bo *bo)
>>   	return PAGE_ALIGN(bo->ttm.base.size);
>>   }
>>=20=20=20
>> +static inline bool xe_bo_has_pages(struct xe_bo *bo)
>> +{
>> +	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
>> +	    xe_bo_is_vram(bo))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   void __xe_bo_release_dummy(struct kref *kref);
>>=20=20=20
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_=
drm_client.c
>> index 00b28a08909f..28b4c8e608f8 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -4,10 +4,12 @@
>>    */
>>=20=20=20
>>   #include <drm/drm_print.h>
>> +#include <drm/xe_drm.h>
>>   #include <linux/kernel.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>>=20=20=20
>> +#include "xe_bo.h"
>>   #include "xe_bo_types.h"
>>   #include "xe_device_types.h"
>>   #include "xe_drm_client.h"
>> @@ -110,6 +112,105 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
>>   	return true;
>>   }
>>=20=20=20
>> +static void bo_meminfo(struct xe_bo *bo,
>> +		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
>> +{
>> +	u64 sz =3D bo->size;
>> +	u32 mem_type;
>> +
>> +	if (bo->placement.placement)
>> +		mem_type =3D bo->placement.placement->mem_type;
>> +	else
>> +		mem_type =3D XE_PL_TT;
>> +
>> +	if (bo->ttm.base.handle_count > 1)
>> +		stats[mem_type].shared +=3D sz;
>> +	else
>> +		stats[mem_type].private +=3D sz;
>> +
>> +	if (xe_bo_has_pages(bo)) {
>> +		stats[mem_type].resident +=3D sz;
>> +
>> +		if (!dma_resv_test_signaled(bo->ttm.base.resv,
>> +					    dma_resv_usage_rw(true) |
>> +					    DMA_RESV_USAGE_BOOKKEEP))
>> +			stats[mem_type].active +=3D sz;
>> +		else if (mem_type =3D=3D XE_PL_SYSTEM)
>> +			stats[mem_type].purgeable +=3D sz;
>> +	}
>> +}
>> +
>> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>> +{
>> +	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] =3D {};
>> +	struct xe_file *xef =3D file->driver_priv;
>> +	struct ttm_device *bdev =3D &xef->xe->ttm;
>> +	struct ttm_resource_manager *man;
>> +	struct xe_drm_client *client;
>> +	struct list_head *pos;
>> +	struct xe_bo *bo;
>> +	unsigned int id;
>> +	char name[16];
>> +	u32 mem_type;
>> +	int ret =3D 0;
>> +
>> +	client =3D xef->client;
>> +
>> +	/* Public objects. */
>> +	spin_lock(&file->table_lock);
>> +	idr_for_each_entry(&file->object_idr, bo, id)
>> +		bo_meminfo(bo, stats);
>> +	spin_unlock(&file->table_lock);
>> +
>> +	/* Internal objects. */
>> +	rcu_read_lock();
>> +	list_for_each_rcu(pos, &client->bos_list) {
>> +		bo =3D xe_bo_get(list_entry(pos, typeof(*bo),
>> +					  client_link));
>> +		if (!bo)
>> +			continue;
>> +		bo_meminfo(bo, stats);
>> +		xe_bo_put(bo);
>> +	}
>> +	rcu_read_unlock();
>> +	for (mem_type =3D XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_ty=
pe) {
>
> can avoid this switch case with something like
>
> const char* mem_type_to_name []=C2=A0 =3D {
>
> "system",=C2=A0 /*XE_PL_STOLEN */
>
> "gtt",
>
> "vram0"
>
> "vram1"
>
> NULL,
>
> NULL,
>
> "stolen",
>
> },

Usually better to use designated initializers for this.

>
>> +
>> +		switch (mem_type) {
>> +		case XE_PL_SYSTEM:
>> +			sprintf(name, "system");
>> +			break;
>> +		case XE_PL_TT:
>> +			sprintf(name, "gtt");
>> +			break;
>> +		case XE_PL_VRAM0:
>> +			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
>> +			break;
>> +		case XE_PL_VRAM1:
>> +			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
>> +			break;
>> +		case XE_PL_STOLEN:
>> +			sprintf(name, "stolen");
>> +			break;
>> +		default:
>> +			ret =3D -EINVAL;
>> +			break;
>> +		}
>> +
>> +		if (ret =3D=3D -EINVAL)
>> +			continue;
>
> if (! mem_type_to_name[mem_type])

Usually better to add a function wrapping the access with bounds checks.

BR,
Jani.

>
> continue;
>
>> +
>> +		man =3D ttm_manager_type(bdev, mem_type);
> I assume on single tile platform man will be null for vram1 ? Please=20
> confirm.
>> +
>> +		if (man) {
>> +			drm_print_memory_stats(p,
>> +					       &stats[mem_type],
>> +					       DRM_GEM_OBJECT_RESIDENT |
>> +					       DRM_GEM_OBJECT_PURGEABLE,
>> +					       name);
>
> instead of name can use mem_type_to_name[mem_type].
>
> Will leave it up to decide whether to use switch-case or const char*.
>
> Ensure DRM_GEM_OBJECT_PURGEABLE is not reported for vram0 and vram1.
>
> BR
>
> Himal Ghimiray
>
>> +		}
>> +	}
>> +}
>> +
>>   /**
>>    * xe_drm_client_fdinfo() - Callback for fdinfo interface
>>    * @p: The drm_printer ptr
>> @@ -122,6 +223,6 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
>>    */
>>   void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>   {
>> -	/* show_meminfo() will be developed here */
>> +	show_meminfo(p, file);
>>   }
>>   #endif

--=20
Jani Nikula, Intel
