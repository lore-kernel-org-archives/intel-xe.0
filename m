Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED72BC7EE2C
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 14:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6EA10E39A;
	Tue, 30 May 2023 14:13:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFDC10E39A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685456028; x=1716992028;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=eehoB/wj85uDE6E/3GrqbwyG1IGIk443Bh8jbtqk6Pk=;
 b=Gk1zxUsAM2w8Pog54tz2C6RtVikCtJsEQEHP/MqDUReRqsQvmwim8VDy
 GKNEX5CAtJOwdXCp/xQfdM6aF06PsiHwh/1/tpdvOyvZytoPVBh4Bm+PD
 VPdPlx621SNn+/Hv6qbDBlAebleyuFcy+1d8j4w2vxAfUWnRN8Vdx3bVh
 Jmvx1QJYjDZk/lx0vtfgmW5Yl0ZNAHTR85mqPjqHU2XwMN2du57TWVeo/
 A42TeS7Dk0G9KunkAv/8sLJkxLczzY4cPKMjPeSi0jx/IzfYdp+l1U4Ej
 O3db6IeVL1TTlhOet7RbuC4Y2+T7Zj55yWENRMG7RV5crpu5rjc8K8q+s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358175829"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="358175829"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="880766399"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="880766399"
Received: from bclindho-mobl.ger.corp.intel.com (HELO [10.252.53.6])
 ([10.252.53.6])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:13:32 -0700
Message-ID: <bb5efbaf-f063-ed33-d167-cf87672eb40a@linux.intel.com>
Date: Tue, 30 May 2023 16:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
 <20230530104713.2570554-6-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230530104713.2570554-6-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 5/9] drivers/xe: Move Xe stolen memory
 handling away form fbc code
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

00000000000000

On 2023-05-30 12:47, Jouni Högander wrote:
> More correct place for Xe stolen memory handling details is in
> xe_ttm_stolen_mgr. Move it there and add necessary defines into
> i915_gem_stolen.h to satisfy fbc code.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c      | 62 -----------------
>  .../xe/compat-i915-headers/i915_gem_stolen.h  | 66 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  8 +++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h        |  1 +
>  4 files changed, 75 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 90c48ccce1a7..19698ab117a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -61,68 +61,6 @@
>  #define i915_gem_stolen_node_offset(node) ((node)->start)
>  #define i915_gem_stolen_node_size(node) ((node)->size)
>  
> -#else
> -
> -#include "xe_ttm_stolen_mgr.h"
> -#include "xe_res_cursor.h"
> -
> -static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
> -						       struct i915_stolen_fb *fb,
> -						       u32 size, u32 align,
> -						       u32 start, u32 end)
> -{
> -	struct xe_bo *bo;
> -	int err;
> -	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
> -
> -	bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
> -					ttm_bo_type_kernel, flags);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		bo = NULL;
> -		return err;
> -	}
> -	err = xe_bo_pin(bo);
> -	xe_bo_unlock_vm_held(bo);
> -
> -	if (err) {
> -		xe_bo_put(bo);
> -		bo = NULL;
> -	}
> -
> -	fb->bo = bo;
> -
> -	return err;
> -}
> -
> -static int i915_gem_stolen_insert_node(struct xe_device *xe,
> -				       struct i915_stolen_fb *fb, u32 size,
> -				       u32 align)
> -{
> -	/* Not used on xe */
> -	BUG_ON(1);
> -	return -ENODEV;
> -}
> -
> -static void i915_gem_stolen_remove_node(struct xe_device *xe,
> -					struct i915_stolen_fb *fb)
> -{
> -	xe_bo_unpin_map_no_vm(fb->bo);
> -	fb->bo = NULL;
> -}
> -
> -#define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
> -#define i915_gem_stolen_node_allocated(fb) (!!(fb.bo))
> -
> -static inline u32 i915_gem_stolen_node_offset(struct i915_stolen_fb *fb)
> -{
> -	struct xe_res_cursor res;
> -
> -	xe_res_first(fb->bo->ttm.resource, 0, 4096, &res);
> -	return res.start;
> -}
> -
> -#define i915_gem_stolen_node_size(fb) ((u64)((fb)->bo->ttm.base.size))
>  #endif
>  
>  #define for_each_fbc_id(__dev_priv, __fbc_id) \
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> index b6eeeba1087b..a9020d408407 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
> @@ -1,10 +1,76 @@
>  #ifndef _I915_GEM_OBJECT_H_
>  #define _I915_GEM_OBJECT_H_
>  
> +#include "xe_ttm_stolen_mgr.h"
> +#include "xe_res_cursor.h"
> +
>  struct xe_bo;
>  
>  struct i915_stolen_fb {
>  	struct xe_bo *bo;
>  };
>  
> +static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
> +						       struct i915_stolen_fb *fb,
> +						       u32 size, u32 align,
> +						       u32 start, u32 end)
> +{
> +	struct xe_bo *bo;
> +	int err;
> +	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
> +
> +	bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
> +					ttm_bo_type_kernel, flags);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		bo = NULL;
> +		return err;
> +	}
> +	err = xe_bo_pin(bo);
> +	xe_bo_unlock_vm_held(bo);
> +
> +	if (err) {
> +		xe_bo_put(fb->bo);
> +		bo = NULL;
> +	}
> +
> +	fb->bo = bo;
> +
> +	return err;
> +}
> +
> +static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
> +					      struct i915_stolen_fb *fb,
> +					      u32 size, u32 align)
> +{
> +	/* Not used on xe */
> +	BUG_ON(1);
> +	return -ENODEV;
> +}
> +
> +static inline void i915_gem_stolen_remove_node(struct xe_device *xe,
> +					       struct i915_stolen_fb *fb)
> +{
> +	xe_bo_unpin_map_no_vm(fb->bo);
> +	fb->bo = NULL;
> +}
> +
> +#define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
> +#define i915_gem_stolen_node_allocated(fb) (!!(fb.bo))
> +
> +static inline u32 i915_gem_stolen_node_offset(struct i915_stolen_fb *fb)
> +{
> +	struct xe_res_cursor res;
> +
> +	xe_res_first(fb->bo->ttm.resource, 0, 4096, &res);
> +	return res.start;
> +}
> +
> +#define i915_gem_stolen_area_address(xe) (xe_ttm_stolen_gpu_offset(xe))
> +#define i915_gem_stolen_area_size(xe) (xe_ttm_stolen_size(xe))

area_size is used for a workaround that's gen9 specific, no point in adding it for xe. Could be (!WARN_ON(1)) instead.

Similarly, the check for area_address is pointless in Xe, as it's used for programming gen4-.

That's why it was ifdeffed out. If it's not expected to be used, it's better not to implement.

~Maarten

