Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7B0E810DA
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 12:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A0610E4F9;
	Wed, 27 Sep 2023 12:17:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7E410E4F8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695817054; x=1727353054;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=lw6AqsjfIo8Ndb29PbCFHZs836/iiXZI4z+uw5OC6Co=;
 b=iH5Q+heBlC1h7fYT9EA3mH7l0fZZW2LLBRLpC5m5UB0z4EtrN7BP9ANO
 iQAtcPw9zVG+GMNTzFBN/lJuv73KGj8IhsVLh+IDuDJ9rTmcsgQtfDQI3
 HR9Bd4vlJPwr1B4rjl6ZcVWxTXIhMv59ojEvEwF2npSPB8h+FAAE1byf8
 5z5wqwKdkBr4pM2QmuY8h0mVcBHoZDtyFQmajR1/FUJ+G/iDuocMdqEmO
 6wwQRR40EEsyp/zbJ+C/OVQSs8yB0JlfCMmBsqot723Gwen0U7hmJerMC
 NUxf7CFJqkzESgscrHTQEYaut9MPEFu0xQOtv924KhzeF4g33AM3X+KbQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="379086783"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="379086783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742692288"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="742692288"
Received: from roomensx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.40.191])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:17:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230915172606.14436-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230915172606.14436-1-thomas.hellstrom@linux.intel.com>
Date: Wed, 27 Sep 2023 15:17:19 +0300
Message-ID: <87r0mjkdyo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Reinstate pipelined fence
 enable_signaling
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

On Fri, 15 Sep 2023, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> With the GPUVA conversion, the xe_bo::vmas member became replaced with
> drm_gem_object::gpuva.list, however there was a couple of usage instances
> left using the old member. Most notably the pipelined fence
> enable_signaling.
>
> Remove the xe_bo::vmas member completely, fix usage instances and
> also enable this pipelined fence enable_signaling even for faulting
> VM:s since we actually wait for bind fences to complete.
>
> v2:
> - Rebase.
> v3:
> - Fix display code build error.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 2 +-

Commits touching i915 should be separated from the rest, regardless of
leaving a broken commit in the middle. Combining i915 and xe changes
leads to conflicts that need to be addressed when rebasing drm-xe-next
for upstream submission. Separate patches are easier to deal with, and
squash to other patches.

No core xe enabling patch can be sent upstream with i915 changes.

BR,
Jani.


>  drivers/gpu/drm/xe/xe_bo.c              | 5 ++---
>  drivers/gpu/drm/xe/xe_bo_types.h        | 2 --
>  drivers/gpu/drm/xe/xe_pt.c              | 2 +-
>  4 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index f5a96b94cfba..d5b9b0255c6a 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -2012,7 +2012,7 @@ int intel_framebuffer_init(struct intel_framebuffer=
 *intel_fb,
>  		 * mode when the object is VM_BINDed, so we can only set
>  		 * coherency with display when unbound.
>  		 */
> -		if (XE_IOCTL_DBG(dev_priv, !list_empty(&obj->vmas))) {
> +		if (XE_IOCTL_DBG(dev_priv, !list_empty(&obj->ttm.base.gpuva.list))) {
>  			ttm_bo_unreserve(&obj->ttm);
>  			goto err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 27726d4f3423..c5e4d04c4d58 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -455,7 +455,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe,=
 struct xe_bo *bo,
>=20=20
>  	dma_resv_assert_held(bo->ttm.base.resv);
>=20=20
> -	if (!xe_device_in_fault_mode(xe) && !list_empty(&bo->vmas)) {
> +	if (!list_empty(&bo->ttm.base.gpuva.list)) {
>  		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
>  				    DMA_RESV_USAGE_BOOKKEEP);
>  		dma_resv_for_each_fence_unlocked(&cursor, fence)
> @@ -1046,7 +1046,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_obj=
ect *ttm_bo)
>  		drm_prime_gem_destroy(&bo->ttm.base, NULL);
>  	drm_gem_object_release(&bo->ttm.base);
>=20=20
> -	xe_assert(xe, list_empty(&bo->vmas));
> +	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>=20=20
>  	if (bo->ggtt_node.size)
>  		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
> @@ -1229,7 +1229,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_devic=
e *xe, struct xe_bo *bo,
>  	bo->props.preferred_gt =3D XE_BO_PROPS_INVALID;
>  	bo->props.preferred_mem_type =3D XE_BO_PROPS_INVALID;
>  	bo->ttm.priority =3D DRM_XE_VMA_PRIORITY_NORMAL;
> -	INIT_LIST_HEAD(&bo->vmas);
>  	INIT_LIST_HEAD(&bo->pinned_link);
>=20=20
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_=
types.h
> index 2ea9ad423170..946427fd3fe8 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -31,8 +31,6 @@ struct xe_bo {
>  	struct xe_vm *vm;
>  	/** @tile: Tile this BO is attached to (kernel BO only) */
>  	struct xe_tile *tile;
> -	/** @vmas: List of VMAs for this BO */
> -	struct list_head vmas;
>  	/** @placements: valid placements for this BO */
>  	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
>  	/** @placement: current placement for this BO */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d1e06c913260..ce8d9e9d1b61 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -265,7 +265,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struc=
t llist_head *deferred)
>  	if (!pt)
>  		return;
>=20=20
> -	XE_WARN_ON(!list_empty(&pt->bo->vmas));
> +	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
>  	xe_bo_unpin(pt->bo);
>  	xe_bo_put_deferred(pt->bo, deferred);

--=20
Jani Nikula, Intel
