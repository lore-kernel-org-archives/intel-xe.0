Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280C5D1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 09:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8A010E4F1;
	Tue,  9 Dec 2025 09:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhyOJZB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B6A10E4F1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765274063; x=1796810063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vdfyB29kdZMes9rMJ3sjU6fYyyWPkH+e+c6LotzEHDk=;
 b=ZhyOJZB2tkGYXCjibetLGAYHGmGIQP+C/FLUwdK16N1FTrP2zrDVGhPQ
 gdE2SxW2HWb7lJupsgaTEvvKnOE9TG6R3keg6pCubFEVBnpsND14O8D27
 xLG6hJmEGW2l7+3krnrK5Zsqd+nxgcFJN01B3v2/jkYLViQy66dPuDEPI
 n1c5jjVpP+yHHBwR3DZQwxEejZHW8qmIzRqIS2oSqrpLzO17glG1dW2m3
 2nTUIksdhijQpKMqcUhORJKSzCs9YMIJ7yFh2D6/4IGk/PwxAYcQDlJYU
 ZD//j3dQTRS6yCV79vDkeDfbgJ+rLwA9uyuCPraYZAKU2ithpvdwcRhJx Q==;
X-CSE-ConnectionGUID: VYqixrGxRMKIzgqwbrX1IQ==
X-CSE-MsgGUID: XD/LA2ftSpSVEO8/1/b9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="92701664"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="92701664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 01:54:23 -0800
X-CSE-ConnectionGUID: m0Hi1ZK5S02CYKjXELQ01w==
X-CSE-MsgGUID: ixMCZOiOQ96JcC4o5SDVnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="226852446"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.194])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 01:54:20 -0800
Date: Tue, 9 Dec 2025 11:54:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Message-ID: <aTfxySrZ-O1Bplcm@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-7-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208191722.7194-7-tursulin@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Dec 08, 2025 at 08:17:17PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> If DPT is allocated from system memory it will be created in the default
> write-back cached mode. This means we need to flush it after populating
> otherwise nothing works.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index a22a9182dadb..89ee68c40329 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2021 Intel Corporation
>   */
>  
> +#include <drm/drm_cache.h>
>  #include <drm/ttm/ttm_bo.h>
>  
>  #include "i915_vma.h"
> @@ -162,6 +163,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  					  rot_info->plane[i].dst_stride);
>  	}
>  
> +	if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
> +		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);

How is anything working currently if the DPT is being
created with the wrong caching mode?

Sounds like someone should fix the DPT creation to correctly
ask for UC/WC. But I suppose someone should measure if WB+flush
is actually faster...

> +
>  	vma->dpt = dpt;
>  	vma->node = dpt->ggtt_node[tile0->id];
>  
> -- 
> 2.52.0

-- 
Ville Syrjälä
Intel
