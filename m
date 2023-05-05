Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC761C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FED10E5B2;
	Fri,  5 May 2023 08:50:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B21A10E0D3
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683276617; x=1714812617;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=51iY4p0Buz5TbD9pKaDy8av1veZzZeZAKtsk8jQTxh8=;
 b=XtMM15gdgjr52ETOmcXWwky9LYBnMjGATKUd2l1h3oPD2sfJS5ZbefKk
 cSWe3fXoWLz3u0sdNWWn+gvkeJVgyxjwQHRZ0YCr1vTfJhj4RSBWetMJ4
 TAtZex8labqJlI6ODmqjSCIHe21do9hgOi6T8s4E1Oqy07WN1+gOz0XLj
 qkm3m0CSoNivu7YziR37fsMGAltqimwoCmcNGpKdjtM93MbPLQHvtv5Nz
 LZieTaReAni6CFxBKudUhq4Egm+pvCS9AWpqV/ez9jI7OnJvMYljLpoQT
 HZIMimjiGgBOg1c3apYNgEGG2G8/yaukr0nEouHMPuzccwEMF08obUbRH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="349202058"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="349202058"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="730241123"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="730241123"
Received: from smorozov-mobl1.ger.corp.intel.com (HELO [10.252.35.96])
 ([10.252.35.96])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:50:14 -0700
Message-ID: <fe8a4f66-4b29-205b-fb05-45a7784d9902@linux.intel.com>
Date: Fri, 5 May 2023 10:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
 <20230505082956.2247875-18-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230505082956.2247875-18-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC PATCH 17/20] drm/xe/display: Use frontbuffer
 tracking for Xe as well
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
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 2023-05-05 10:29, Jouni Högander wrote:
> Use frontbuffer tracking for Xe as well as needed. We still need to
> perform flush for PSR, FBC and DRRS. For this purpose use frontbuffer
> tracking for Xe as well.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_drrs.c          | 1 +
>   drivers/gpu/drm/i915/display/intel_fb.c            | 3 +++
>   drivers/gpu/drm/i915/display/intel_psr.c           | 1 +
>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 +
>   drivers/gpu/drm/xe/xe_bo_types.h                   | 2 ++
>   5 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
> index 760e63cdc0c8..59527a4667f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_drrs.c
> +++ b/drivers/gpu/drm/i915/display/intel_drrs.c
> @@ -9,6 +9,7 @@
>   #include "intel_de.h"
>   #include "intel_display_types.h"
>   #include "intel_drrs.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_panel.h"
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index e62e1e12758d..fa4464d433b7 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -13,6 +13,7 @@
>   #include "intel_display_types.h"
>   #include "intel_dpt.h"
>   #include "intel_fb.h"
> +#include "intel_frontbuffer.h"
>   
>   #ifdef I915
>   /*
> @@ -1923,11 +1924,13 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>   	int i;
>   #ifdef I915
>   	unsigned tiling, stride;
> +#endif
>   
>   	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
>   	if (!intel_fb->frontbuffer)
>   		return -ENOMEM;
>   
> +#ifdef I915
>   	i915_gem_object_lock(obj, NULL);
>   	tiling = i915_gem_object_get_tiling(obj);
>   	stride = i915_gem_object_get_stride(obj);
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index ea0389c5f656..2ecc902a85a2 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -32,6 +32,7 @@
>   #include "intel_display_types.h"
>   #include "intel_dp.h"
>   #include "intel_dp_aux.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_hdmi.h"
>   #include "intel_psr.h"
>   #include "intel_psr_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 71ba544eda71..0f1e4e61d32e 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -16,6 +16,7 @@
>   #include "intel_display_types.h"
>   #include "intel_fb.h"
>   #include "intel_fbc.h"
> +#include "intel_frontbuffer.h"
>   #include "intel_psr.h"
>   #include "skl_scaler.h"
>   #include "skl_universal_plane.h"
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 229fedc8ea72..df5be030991a 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -68,6 +68,8 @@ struct xe_bo {
>   	struct llist_node freed;
>   	/** @created: Whether the bo has passed initial creation */
>   	bool created;
> +
> +	struct intel_frontbuffer *frontbuffer;

Instead of putting this in xe_bo, could this be put inside intel_fb as 
well? In that case, for Xe each framebuffer could have its own 
frontbuffer tracking, and an invalidate on 1 fb would not invalidate 
another FB

I think we don't want to copy i915 semantics here 1:1.

>   };
>   
>   #define intel_bo_to_drm_bo(bo) ((bo)->ttm.base)
