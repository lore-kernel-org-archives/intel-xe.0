Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71185606A32D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IkUuzi8d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ED910EA75;
	Fri,  6 Nov 2026 15:07:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE15010F881
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793977661; x=1825513661;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fDerkf7N7dtOOaxfxQYfblp+cYOXzsL4Lw0wPnKey6U=;
 b=IkUuzi8dhC/xCWaivchwxWUIqIbE8rzru6kYY/DUAiADhfGAEaq7+EHY
 R5PgZfjBsBvxdEgn/KsNbndsT+xGo6b4mztOh5Hhjy2/QtUwGyO4/CvEw
 GDlMXfRVfHPHKsjMsz3nqrdpzpf8mah4QZMiPa9sggFNGw6RR8cxVRJEy
 K4Z7IC9m/7kGiUjQ+9iT6f4ASWth8aJ1omm2nq4nldEKVoFbCd59oPcAm
 6gIp4tw5HEaQt6ma/2MqNjNW1dZ7vnmgHZuGv22xb9EBeU2MzjnWiiCKD
 kJZZLdMQJhmI6e75e5mVYtoSHeRSS1aT7vrw5QIs9Dufpz3Ft2N+UR90o w==;
X-CSE-ConnectionGUID: ol6YusK3TGaaV4AVtWCl1Q==
X-CSE-MsgGUID: eMUY+iyZRcuxiftETDi/9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2832377"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2832377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:07:41 -0800
X-CSE-ConnectionGUID: kq5eYLPpTUm/vcItPq1RMA==
X-CSE-MsgGUID: R7BXh7OVQeeXd3seYCRrJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7351010"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:07:39 -0800
Message-ID: <7b51c037b22a812b18fb920952fcba303c2d0d9b.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe: only evict CCS buffers from TT on iGPU
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Carlos Santa
 <carlos.santa@intel.com>
Date: Fri, 06 Nov 2026 16:07:37 +0100
In-Reply-To: <20261106-s4-opti-v1-1-5edaea2c6d31@intel.com>
References: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
 <20261106-s4-opti-v1-1-5edaea2c6d31@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-11-06 at 10:16 +0000, Matthew Auld wrote:
> On iGPU platforms with Flat CCS, xe_bo_evict_all_user() currently
> calls
> ttm_resource_manager_evict_all() on XE_PL_TT, evicting every buffer
> in
> TT even if it does not use Flat CCS compression.
>=20
> Walk the XE_PL_TT LRU using ttm_bo_lru_for_each_reserved_guarded()
> and
> only evict buffers with initialised CCS state (or purge them if
> marked
> DONTNEED), leaving non-CCS buffers in place.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Carlos Santa <carlos.santa@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo_evict.c | 64
> +++++++++++++++++++++++++++++++++-------
> =C2=A01 file changed, 54 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 7661fca7f278..1f95769c4a56 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -5,6 +5,8 @@
> =C2=A0
> =C2=A0#include "xe_bo_evict.h"
> =C2=A0
> +#include <drm/ttm/ttm_bo.h>
> +
> =C2=A0#include "xe_bo.h"
> =C2=A0#include "xe_device.h"
> =C2=A0#include "xe_ggtt.h"
> @@ -104,8 +106,46 @@ void xe_bo_notifier_unprepare_all_pinned(struct
> xe_device *xe)
> =C2=A0				=C2=A0=C2=A0=C2=A0
> xe_bo_notifier_unprepare_pinned);
> =C2=A0}
> =C2=A0
> +static int xe_bo_evict_all_ccs(struct ttm_resource_manager *man)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D false,
> +		.no_wait_gpu =3D false,
> +	};
> +	struct ttm_lru_walk_arg arg =3D {
> +		.ctx =3D &ctx,
> +		.sleeping_lock =3D true,
> +	};
> +	struct ttm_bo_lru_cursor cursor;
> +	struct ttm_buffer_object *ttm_bo;
> +	int ret =3D 0;
> +
> +	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &arg,
> ttm_bo) {
> +		struct xe_bo *bo;
> +
> +		if (!xe_bo_is_xe_bo(ttm_bo) || ttm_bo->deleted)
> +			continue;
> +
> +		bo =3D ttm_to_xe_bo(ttm_bo);
> +		if (xe_bo_is_pinned(bo) ||
> !xe_bo_needs_ccs_pages(bo) ||
> +		=C2=A0=C2=A0=C2=A0 !bo->ccs_cleared)
> +			continue;
> +
> +		if (xe_bo_madv_is_dontneed(bo))
> +			ret =3D xe_ttm_bo_purge(ttm_bo, &ctx);
> +		else
> +			ret =3D xe_bo_evict(bo, NULL);
> +		if (ret)
> +			break;
> +	}
> +	if (IS_ERR(ttm_bo))
> +		return PTR_ERR(ttm_bo);
> +
> +	return ret;
> +}
> +
> =C2=A0/**
> - * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM
> + * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM
> (and CCS in TT)
> =C2=A0 * @xe: xe device
> =C2=A0 *
> =C2=A0 * Evict non-pinned user BOs (via GPU).
> @@ -123,22 +163,26 @@ int xe_bo_evict_all_user(struct xe_device *xe)
> =C2=A0		struct ttm_resource_manager *man =3D
> =C2=A0			ttm_manager_type(bdev, mem_type);
> =C2=A0
> +		if (!man)
> +			continue;
> +
> =C2=A0		/*
> =C2=A0		 * On igpu platforms with flat CCS we need to ensure
> we save and restore any CCS
> =C2=A0		 * state since this state lives inside graphics
> stolen memory which doesn't survive
> =C2=A0		 * hibernation.
> -		 *
> -		 * This can be further improved by only evicting
> objects that we know have actually
> -		 * used a compression enabled PAT index.
> =C2=A0		 */
> -		if (mem_type =3D=3D XE_PL_TT && (IS_DGFX(xe) ||
> !xe_device_has_flat_ccs(xe)))
> +		if (mem_type =3D=3D XE_PL_TT) {
> +			if (!IS_DGFX(xe) &&
> xe_device_has_flat_ccs(xe)) {
> +				ret =3D xe_bo_evict_all_ccs(man);
> +				if (ret)
> +					return ret;
> +			}
> =C2=A0			continue;
> -
> -		if (man) {
> -			ret =3D ttm_resource_manager_evict_all(bdev,
> man);
> -			if (ret)
> -				return ret;
> =C2=A0		}
> +
> +		ret =3D ttm_resource_manager_evict_all(bdev, man);
> +		if (ret)
> +			return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
